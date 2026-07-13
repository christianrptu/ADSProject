// ADS I Class Project
// Pipelined RISC-V Core - Branch Target Buffer
//
// Chair of Electronic Design Automation, RPTU in Kaiserslautern
// File created on 05/12/2026 by Tobias Jauch (@tojauch)

/*
Branch Target Buffer (BTB): a hardware component that predicts the target address of conditional branch instructions to improve pipeline performance

Functionality (cf. slide 6-48 of the lecture slides):
    Stores target addresses and prediction information for conditional branch instructions
    On a branch instruction, checks if the instruction is in the BTB and retrieves the predicted target address and prediction state
    If the prediction is taken, the processor fetches the instruction from the predicted target address; if not taken, it continues sequentially
    Updates the BTB entry based on the actual outcome of the branch instruction (taken or not taken) and updates the prediction state accordingly

Inputs:
    PC: A 32-bit program counter representing the address of the branch instruction being fetched or executed.
    update: A 1-bit signal indicating whether the BTB should be updated with new information.
    updatePC: A 32-bit program counter associated with the branch instruction being updated.
    updateTarget: A 32-bit branch target address to be stored in the BTB.
    mispredicted: A 1-bit signal indicating whether the prediction turned out to be incorrect during execution (used to update the predictor).

Outputs:
    valid: A 1-bit signal indicating whether the BTB has a valid prediction for the provided program counter.
    target: A 32-bit signal representing the predicted branch target address when a valid prediction exists.
    predictTaken: A 1-bit signal indicating whether the branch is predicted to be taken or not.

*/

package core_tile

import chisel3._
import chisel3.util._
import uopc._

// -----------------------------------------
// Branch Target Buffer
// -----------------------------------------

//THIS IS A WAY FOR THE 8 SETS TIMES 2 WAYS
class BTBway extends Bundle {
  val valid   = Bool()
  val tag     = UInt(27.W) //THIS IS FOR THE PC[31:5]
  val target  = UInt(32.W)
  val counter = UInt(2.W)  //00 Strongly Not Taken, 11 Strongly Taken
}

class BTB extends Module {
  val io = IO(new Bundle {
    // Add I/O ports according to the specification above here
    val PC              = Input(UInt(32.W))
    val update          = Input(Bool())
    val updatePC        = Input(UInt(32.W))
    val updateTarget    = Input(UInt(32.W))
    val mispredicted    = Input(Bool())

    val valid           = Output(Bool())
    val target          = Output(UInt(32.W))
    val predictTaken    = Output(Bool())
  })

  //ToDo: Add your implementation according to the specification in assignment 6 here. 
  val numSets = 8
  val numWays = 2

  // 8 SETS WITH 2 WAYS REGISTERS
  val table = RegInit(VecInit(Seq.fill(numSets)(VecInit(Seq.fill(numWays)(0.U.asTypeOf(new BTBway))))))
  // 1 LRU BIT TO POINT TO THE REWRITEABLE REGISTERS
  val lru   = RegInit(VecInit(Seq.fill(numSets)(0.U(1.W))))

  //COMBINATIONAL LOOKUP
  val lookupIdx = io.PC(4,2)
  val lookupTag = io.PC(31,5)

  val lWay0 = table(lookupIdx)(0)
  val lWay1 = table(lookupIdx)(1)
  val lHit0 = lWay0.valid && lWay0.tag === lookupTag
  val lHit1 = lWay1.valid && lWay1.tag === lookupTag
  val lHit  = lHit0 || lHit1
  val lEntry = Mux(lHit0, lWay0, lWay1)

  io.valid        := lHit
  io.target       := lEntry.target
  io.predictTaken := lHit && lEntry.counter(1)

  //UPDATE FROM EX STAGE
  val updIdx = io.updatePC(4, 2)
  val updTag = io.updatePC(31, 5)

  val uWay0 = table(updIdx)(0)
  val uWay1 = table(updIdx)(1)
  val uHit0 = uWay0.valid && uWay0.tag === updTag
  val uHit1 = uWay1.valid && uWay1.tag === updTag
  val uHit  = uHit0 || uHit1

  //THIS PART WAS CHEATING SO I AM UNSURE ABOUT THIS:
  //The interface only gives us "mispredicted", not the actual outcome directly.
  // Reconstruct actualTaken from the prediction that was made and whether it was wrong.
  // On a miss, there was no entry, so the implicit prediction was "not taken".
  val oldPredictTaken = Mux(uHit, Mux(uHit0, uWay0.counter(1), uWay1.counter(1)), false.B)
  val actualTaken     = oldPredictTaken =/= io.mispredicted

  val oldCounter = Mux(uHit0, uWay0.counter, uWay1.counter)

  val newCounterOnHit = Mux(actualTaken,
    Mux(oldCounter === 3.U, 3.U, oldCounter + 1.U),
    Mux(oldCounter === 0.U, 0.U, oldCounter - 1.U)
  )
  // THE NEW ALLOCATION STARTS IN WEAK BUT IN THE DIRECTION OF THE LAST OUTCOME
  // THIS IS THE BEST WAY TO START ALLOCATIONS OF THE STATE (see 6.1 answer 2)
  val newCounterOnAlloc = Mux(actualTaken, 2.U, 1.U)

  val finalCounter = Mux(uHit, newCounterOnHit, newCounterOnAlloc)

  //IF HIT OVERWRITE THE MATCHING WAY. IF MISS REWRITE THE LRU IN THAT SET
  val writeWay = Mux(uHit, Mux(uHit0, 0.U, 1.U), lru(updIdx))

  when(io.update) {
    table(updIdx)(writeWay).valid   := true.B
    table(updIdx)(writeWay).tag     := updTag
    table(updIdx)(writeWay).target  := io.updateTarget
    table(updIdx)(writeWay).counter := finalCounter
    //CHEATING ALERT BELOW
    lru(updIdx) := ~writeWay  // the way just touched becomes MRU, the other becomes LRU
  }
}