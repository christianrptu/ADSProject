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

    val jmpAdd  = Input(UInt(32.W))
    val brcAdd  = Input(UInt(32.W))
    val nPcSel  = Input(UInt(32.W))

  })

//ToDo: Add your implementation according to the specification above here
  val IMem = Mem(4096, UInt(32.W))
  loadMemoryFromFile(IMem, BinaryFile)

  // Fetch
    val PC = RegInit(0.U(32.W))
    val addr = PC >> 2

  //next PC
  val nPC = PC + 4.U

  //Next PC soruce Selection
  PC := nPC // b00 default
  switch(io.nPcSel) {
    is("b10".U) { PC := io.brcAdd }
    is("b01".U) { PC := io.jmpAdd }
  }

  // next stage
  io.pc4 := nPC
  io.inst := IMem(addr(11,0))

}
