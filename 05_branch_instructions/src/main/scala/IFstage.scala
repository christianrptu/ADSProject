// ADS I Class Project
// Pipelined RISC-V Core - IF Stage
//
// Chair of Electronic Design Automation, RPTU in Kaiserslautern
// File created on 01/09/2026 by Tobias Jauch (@tojauch)

/*
The Instruction Fetch (IF) stage is the first stage of the pipeline and handles instruction retrieval from memory.

Memory:
    IMem: instruction memory with 4096 32-bit unsigned integer entires, loaded from a binary file at compile time

Internal Registers:
    PC: 32-bit unsigned integer register, initialized to 0 holding the current program counter address

Internal Signals:
    none

Functionality:
    Fetch the instruction at the current PC (word-aligned addressing)
    Increment the PC (word-aligned) each clock cycle to fetch the next sequential instruction

Parameters:
    BinaryFile: String - path to the binary file to load into instruction memory

Inputs:
    none

Outputs:
    instr: send the fetched instruction to IF Barrier
*/

package core_tile

import chisel3._
import chisel3.util.experimental.loadMemoryFromFile
import chisel3.util._

// -----------------------------------------
// Fetch Stage
// -----------------------------------------

class IF (BinaryFile: String) extends Module {
  val io = IO(new Bundle {
    val inst = Output(UInt(32.W))
    val pc4  = Output(UInt(32.W))

    val JumpAddr    = Input(UInt(32.W))
    val BranchAddr  = Input(UInt(32.W))
    val nPcSel      = Input(UInt(2.W))

  })


//ToDo: Add your implementation according to the specification above here
  val IMem = Mem(4096, UInt(32.W))
  loadMemoryFromFile(IMem, BinaryFile)

  // Fetch
  val PC   = RegInit(0.U(32.W))
  val addr = PC >> 2

  val pcP4 = PC + 4.U

  val nPC = Wire(UInt(32.W))
  nPC := pcP4

  // Next PC source mux
  switch (io.nPcSel) {
    is ("b01".U) { nPC := io.JumpAddr }
    is ("b10".U) { nPC := io.BranchAddr }
  }

  PC := nPC

  io.pc4 := pcP4
  io.inst := IMem(addr(11, 0))
}