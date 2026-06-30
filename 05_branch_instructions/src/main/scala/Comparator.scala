import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

object BOp extends ChiselEnum {
  //WE ARE MISSING THE CASE OF UNVALID OPCODE
  val BEQ  = Value(0.U)
  val BNE  = Value(1.U)
  val BLT  = Value(4.U)
  val BGE  = Value(5.U)
  val BLTU = Value(6.U)
  val BGEU = Value(7.U)
}

class comparator extends Module {
    val io = IO(new Bundle {
        val a  : Input(UInt(32.W))
        val b  : Input(UInt(32.W))
        val opc: Input(BOp())

        val taken  : Output(Bool())
    })

    io.taken = false.B

    switch(io.opc) {
    is(BOp.BEQ)  { io.taken := io.a === io.b }
    is(BOp.BNE)  { io.taken := io.a =/= io.b }
    is(BOp.BLT)  { io.taken := io.a.asSInt < io.b.asSInt }
    is(BOp.BGE)  { io.taken := io.a.asSInt >= io.b.asSInt }
    is(BOp.BLTU) { io.taken := io.a < io.b  }
    is(BOp.BGEU) { io.taken := io.a >= io.b }
    }
}