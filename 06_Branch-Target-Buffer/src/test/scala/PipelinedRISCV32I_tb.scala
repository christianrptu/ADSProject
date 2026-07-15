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

class PipelinedRISCV32ITest extends AnyFlatSpec with ChiselScalatestTester {

"RV32I_BasicTester" should "work" in {
    test(new PipelinedRV32I("src/test/programs/BinaryFile_pipelined")).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.clock.setTimeout(0)
      dut.clock.step(5)

      dut.io.result.expect(5.U)
      dut.io.exception.expect(false.B)
      println("--addi x14,x0,5--")
      println(f"addi x14,x0,5: 0x${dut.io.result.peek().litValue}%08X")
      println("=================================================")
      dut.clock.step(1)

      dut.io.result.expect(5.U)
      dut.io.exception.expect(false.B)
      println("--addi x15,x0,5--")
      println(f"addi x15,x0,5: 0x${dut.io.result.peek().litValue}%08X")
      println("=================================================")
      dut.clock.step(1)

      dut.io.exception.expect(false.B)
      println("--beq x14,x15,8--")
      println(f"beq x14,x15,8: 0x${dut.io.result.peek().litValue}%08X")
      println("=================================================")
      dut.clock.step(1)

      dut.io.exception.expect(false.B)
      println("--SHOULD BE FLUSHED CYCLE--")
      println(f"addi x16,x0,99: 0x${dut.io.result.peek().litValue}%08X")
      println("=================================================")
      dut.clock.step(1)

      dut.io.exception.expect(false.B)
      println("--SHOULD BE FLUSHED CYCLE--")
      println(f"addi x17,x0,1: 0x${dut.io.result.peek().litValue}%08X")
      println("=================================================")
      dut.clock.step(1)

      dut.io.exception.expect(false.B)
      println("--SHOULD EXECUTE--")
      println(f"addi x17,x0,1: 0x${dut.io.result.peek().litValue}%08X")
      println("=================================================")
      dut.clock.step(1)
    }
  }
}

/*
      dut.io.exception.expect(false.B)
      println("-- DEBUG --")
      println(f"DEBUG: 0x${dut.io.result.peek().litValue}%08X")
      println(f"PCSrcE: 0x${dut.io.PCSrcE_debug.peek().litValue}%08X")
      println("=================================================")
      dut.clock.step(1)
 */