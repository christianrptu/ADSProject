// ADS I Class Project
// Pipelined RISC-V Core - EX Barrier
//
// Chair of Electronic Design Automation, RPTU in Kaiserslautern
// File created on 01/09/2026 by Tobias Jauch (@tojauch)

/*
EX-Barrier: pipeline register between Execute and Memory stages

Internal Registers:
    aluResult: ALU computation result
    rd: destination register index
    exception: exception flag

Inputs:
    inAluResult: computation result from EX stage
    inRD: destination register from EX stage
    inXcptInvalid: exception flag from EX stage

Outputs:
    outAluResult: result to MEM stage
    outRD: destination register to MEM stage
    outXcptInvalid: exception flag to MEM stage

Functionality:
    Save all input signals to a register and output them in the following clock cycle
*/

package core_tile

import chisel3._

// -----------------------------------------
// EX-Barrier
// -----------------------------------------

class EXBarrier extends Module {
    val io = IO(new Bundle {
        val inAluResult     = Input(UInt(32.W))
        val inRD            = Input(UInt(5.W))
        val inXcptInvalid   = Input(Bool())
        val inWrten         = Input(Bool())
        val inJ             = Input(Bool())
        val inPC4           = Input(UInt(32.W))

        val outAluResult    = Output(UInt(32.W))
        val outRD           = Output(UInt(5.W))
        val outXcptInvalid  = Output(Bool())
        val outWrten        = Output(Bool())
        val outJ            = Output(Bool())
        val outPC4          = Output(UInt(32.W))
    })

    val aluResult   = RegInit(0.U(32.W))
    val RD          = RegInit(0.U(5.W))
    val XcptInvalid = RegInit(false.B)
    val wrten       = RegInit(false.B)
    val j           = RegInit(false.B)
    val PC4         = RegInit(0.U(32.W))

    aluResult   := io.inAluResult
    RD          := io.inRD
    XcptInvalid := io.inXcptInvalid
    wrten       := io.inWrten
    j           := io.inJ
    PC4         := io.inPC4

    io.outAluResult     := aluResult
    io.outRD            := RD
    io.outXcptInvalid   := XcptInvalid
    io.outWrten         := wrten
    io.outJ             := j
    io.outPC4           := PC4
}