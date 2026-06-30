import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

import Bop._

class comparator extends Module {
    val io = IO(new Bundle {
        val a  : Input(UInt(32.W))
        val b  : Input(UInt(32.W))
        val opc: Input(Bop())

        val taken  : Output(Bool())
    })

    io.taken = false.B

    switch(io.opc) {
    is(Bop.BEQ)  { io.taken := io.a === io.b }
    is(Bop.BNE)  { io.taken := io.a =/= io.b }
    is(Bop.BLT)  { io.taken := io.a.asSInt < io.b.asSInt }
    is(Bop.BGE)  { io.taken := io.a.asSInt >= io.b.asSInt }
    is(Bop.BLTU) { io.taken := io.a < io.b  }
    is(Bop.BGEU) { io.taken := io.a >= io.b }
    }
}