// ADS I Class Project
// Pipelined RISC-V Core
//
// Chair of Electronic Design Automation, RPTU in Kaiserslautern
// File created on 01/15/2023 by Tobias Jauch (@tojauch)

package PipelinedRV32I_Tester

import chisel3._
import chiseltest._
import PipelinedRV32I._
import org.scalatest.flatspec.AnyFlatSpec

class BranchJumpTest extends AnyFlatSpec with ChiselScalatestTester {

  "BranchJump_Tester" should "work" in {
    test(new PipelinedRV32I("src/test/programs/BinaryFile_pipelined")).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      dut.clock.setTimeout(0)

      def dump(label: String): Unit = {
        println(f"$label%-10s " +
          f"PCF=0x${dut.io.PCdebug.peek().litValue}%03X  " +
          f"InstrD=0x${dut.io.InstrDdebug.peek().litValue}%08X  " +
          f"PCE=0x${dut.io.PCEdebug.peek().litValue}%03X  " +
          f"BranchE=${dut.io.BranchEdebug.peek().litToBoolean}  " +
          f"JumpE=${dut.io.JumpEdebug.peek().litToBoolean}  " +
          f"PCSrcE=${dut.io.PCSrcEdebug.peek().litToBoolean}  " +
          f"PCTargetE=0x${dut.io.PCTargetEdebug.peek().litValue}%03X  " +
          f"check_res=${dut.io.result.peek().litValue}%-6d " +
          f"RegWriteW=${dut.io.RegWriteWdebug.peek().litToBoolean}  " +
          f"rdW=${dut.io.rdWdebug.peek().litValue}")
      }

      // --- setup (idx0-5), same cadence as your proven working test ---
      dut.clock.step(5)
      dut.io.result.expect(5.U)   // idx0: addi x1,x0,5
      dut.clock.step(1)
      dut.io.result.expect(5.U)   // idx1: addi x2,x0,5
      dut.clock.step(1)
      dut.io.result.expect(10.U)  // idx2: addi x3,x0,10
      dut.clock.step(1); dut.clock.step(1); dut.clock.step(1) // 3 nops

      // === TEST 1: BEQ taken ===
      println("=== TEST 1: BEQ x1,x2 (taken, 5==5) ===")
      dump("branch")
      dut.io.result.expect(0.U)   // branch itself never writes, aluResult unused=0
      for (i <- 1 to 6) { dut.clock.step(1); dump(s"+$i") }
      // watch for: check_res=401 should NEVER appear (squashed)
      //            check_res=402 should appear exactly once (landing, idx8)

      // === TEST 2: BEQ not taken ===
      println("=== TEST 2: BEQ x1,x3 (not taken, 5!=10) ===")
      dump("branch")
      for (i <- 1 to 4) { dut.clock.step(1); dump(s"+$i") }
      // expect check_res=403 then 404, both appear, no bubbles/skip

      // === TEST 3: BNE taken ===
      println("=== TEST 3: BNE x1,x3 (taken) ===")
      dump("branch")
      for (i <- 1 to 6) { dut.clock.step(1); dump(s"+$i") }
      // 405 must NOT appear, 406 must appear (landing)

      // === TEST 4: BNE not taken ===
      println("=== TEST 4: BNE x1,x2 (not taken) ===")
      dump("branch")
      for (i <- 1 to 4) { dut.clock.step(1); dump(s"+$i") }

      // === TEST 5: BLT taken (signed, forwarded operands) ===
      println("=== TEST 5: BLT x12,x13 (taken, -5<3, forwarded) ===")
      dump("branch")
      for (i <- 1 to 6) { dut.clock.step(1); dump(s"+$i") }

      // === TEST 6: BLT not taken ===
      println("=== TEST 6: BLT x13,x12 (not taken) ===")
      dump("branch")
      for (i <- 1 to 4) { dut.clock.step(1); dump(s"+$i") }

      // === TEST 7: BGE taken ===
      println("=== TEST 7: BGE x13,x12 (taken) ===")
      dump("branch")
      for (i <- 1 to 6) { dut.clock.step(1); dump(s"+$i") }

      // === TEST 8: BGE not taken ===
      println("=== TEST 8: BGE x12,x13 (not taken) ===")
      dump("branch")
      for (i <- 1 to 4) { dut.clock.step(1); dump(s"+$i") }

      // === TEST 9: BLTU taken (unsigned, forwarded) ===
      println("=== TEST 9: BLTU x22,x23 (taken, 1 <u huge) ===")
      dump("branch")
      for (i <- 1 to 6) { dut.clock.step(1); dump(s"+$i") }

      // === TEST 10: BLTU not taken ===
      println("=== TEST 10: BLTU x23,x22 (not taken) ===")
      dump("branch")
      for (i <- 1 to 4) { dut.clock.step(1); dump(s"+$i") }

      // === TEST 11: BGEU taken ===
      println("=== TEST 11: BGEU x23,x22 (taken) ===")
      dump("branch")
      for (i <- 1 to 6) { dut.clock.step(1); dump(s"+$i") }

      // === TEST 12: BGEU not taken ===
      println("=== TEST 12: BGEU x22,x23 (not taken) ===")
      dump("branch")
      for (i <- 1 to 4) { dut.clock.step(1); dump(s"+$i") }

      // === TEST 13: JAL ===
      println("=== TEST 13: JAL x1,8 (x1 should = pc+4 = 188) ===")
      dump("jal")
      for (i <- 1 to 6) { dut.clock.step(1); dump(s"+$i") }
      // expect: check_res=188 for the JAL instruction itself (RegWriteW=true, rdW=1)
      // 425 must NOT appear, 426 must appear

      // === TEST 14: JALR ===
      println("=== TEST 14: JALR x7,204(x0) (x7 should = pc+4 = 200) ===")
      dump("jalr")
      for (i <- 1 to 6) { dut.clock.step(1); dump(s"+$i") }
      // expect: check_res=200 for the JALR instruction itself (RegWriteW=true, rdW=7)
      // 427 must NOT appear, 428 must appear
    }
  }
}