module IF(
  input         clock,
  input         reset,
  output [31:0] io_inst,
  input  [31:0] io_nPC
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] IMem [0:4095]; // @[IFstage.scala 54:17]
  wire  IMem_io_inst_MPORT_en; // @[IFstage.scala 54:17]
  wire [11:0] IMem_io_inst_MPORT_addr; // @[IFstage.scala 54:17]
  wire [31:0] IMem_io_inst_MPORT_data; // @[IFstage.scala 54:17]
  reg [31:0] PC; // @[IFstage.scala 58:21]
  wire [29:0] addr = PC[31:2]; // @[IFstage.scala 59:19]
  assign IMem_io_inst_MPORT_en = 1'h1;
  assign IMem_io_inst_MPORT_addr = addr[11:0];
  assign IMem_io_inst_MPORT_data = IMem[IMem_io_inst_MPORT_addr]; // @[IFstage.scala 54:17]
  assign io_inst = IMem_io_inst_MPORT_data; // @[IFstage.scala 69:11]
  always @(posedge clock) begin
    if (reset) begin // @[IFstage.scala 58:21]
      PC <= 32'h0; // @[IFstage.scala 58:21]
    end else begin
      PC <= io_nPC; // @[IFstage.scala 65:6]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4096; initvar = initvar+1)
    IMem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  PC = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IFBarrier(
  input         clock,
  input         reset,
  input         io_flush,
  input  [31:0] io_inInstr,
  output [31:0] io_outInstr
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] instrReg; // @[IFbarrier.scala 41:25]
  assign io_outInstr = instrReg; // @[IFbarrier.scala 52:17]
  always @(posedge clock) begin
    if (reset) begin // @[IFbarrier.scala 41:25]
      instrReg <= 32'h0; // @[IFbarrier.scala 41:25]
    end else if (~io_flush) begin // @[IFbarrier.scala 44:30]
      instrReg <= io_inInstr; // @[IFbarrier.scala 45:17]
    end else begin
      instrReg <= 32'h0; // @[IFbarrier.scala 48:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  instrReg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module regFile(
  input         clock,
  input         reset,
  input  [4:0]  io_req_1_addr,
  input  [4:0]  io_req_2_addr,
  input  [4:0]  io_req_3_addr,
  input  [31:0] io_req_3_data,
  input         io_req_3_w_en,
  output [31:0] io_resp_1_data,
  output [31:0] io_resp_2_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regFile_0; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_1; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_2; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_3; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_4; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_5; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_6; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_7; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_8; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_9; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_10; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_11; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_12; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_13; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_14; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_15; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_16; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_17; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_18; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_19; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_20; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_21; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_22; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_23; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_24; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_25; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_26; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_27; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_28; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_29; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_30; // @[RegisterFile.scala 63:26]
  reg [31:0] regFile_31; // @[RegisterFile.scala 63:26]
  wire [31:0] _GEN_1 = 5'h1 == io_req_1_addr ? regFile_1 : regFile_0; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_2 = 5'h2 == io_req_1_addr ? regFile_2 : _GEN_1; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_3 = 5'h3 == io_req_1_addr ? regFile_3 : _GEN_2; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_4 = 5'h4 == io_req_1_addr ? regFile_4 : _GEN_3; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_5 = 5'h5 == io_req_1_addr ? regFile_5 : _GEN_4; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_6 = 5'h6 == io_req_1_addr ? regFile_6 : _GEN_5; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_7 = 5'h7 == io_req_1_addr ? regFile_7 : _GEN_6; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_8 = 5'h8 == io_req_1_addr ? regFile_8 : _GEN_7; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_9 = 5'h9 == io_req_1_addr ? regFile_9 : _GEN_8; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_10 = 5'ha == io_req_1_addr ? regFile_10 : _GEN_9; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_11 = 5'hb == io_req_1_addr ? regFile_11 : _GEN_10; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_12 = 5'hc == io_req_1_addr ? regFile_12 : _GEN_11; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_13 = 5'hd == io_req_1_addr ? regFile_13 : _GEN_12; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_14 = 5'he == io_req_1_addr ? regFile_14 : _GEN_13; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_15 = 5'hf == io_req_1_addr ? regFile_15 : _GEN_14; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_16 = 5'h10 == io_req_1_addr ? regFile_16 : _GEN_15; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_17 = 5'h11 == io_req_1_addr ? regFile_17 : _GEN_16; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_18 = 5'h12 == io_req_1_addr ? regFile_18 : _GEN_17; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_19 = 5'h13 == io_req_1_addr ? regFile_19 : _GEN_18; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_20 = 5'h14 == io_req_1_addr ? regFile_20 : _GEN_19; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_21 = 5'h15 == io_req_1_addr ? regFile_21 : _GEN_20; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_22 = 5'h16 == io_req_1_addr ? regFile_22 : _GEN_21; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_23 = 5'h17 == io_req_1_addr ? regFile_23 : _GEN_22; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_24 = 5'h18 == io_req_1_addr ? regFile_24 : _GEN_23; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_25 = 5'h19 == io_req_1_addr ? regFile_25 : _GEN_24; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_26 = 5'h1a == io_req_1_addr ? regFile_26 : _GEN_25; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_27 = 5'h1b == io_req_1_addr ? regFile_27 : _GEN_26; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_28 = 5'h1c == io_req_1_addr ? regFile_28 : _GEN_27; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_29 = 5'h1d == io_req_1_addr ? regFile_29 : _GEN_28; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_30 = 5'h1e == io_req_1_addr ? regFile_30 : _GEN_29; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_31 = 5'h1f == io_req_1_addr ? regFile_31 : _GEN_30; // @[RegisterFile.scala 65:{26,26}]
  wire [31:0] _GEN_33 = 5'h1 == io_req_2_addr ? regFile_1 : regFile_0; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_34 = 5'h2 == io_req_2_addr ? regFile_2 : _GEN_33; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_35 = 5'h3 == io_req_2_addr ? regFile_3 : _GEN_34; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_36 = 5'h4 == io_req_2_addr ? regFile_4 : _GEN_35; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_37 = 5'h5 == io_req_2_addr ? regFile_5 : _GEN_36; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_38 = 5'h6 == io_req_2_addr ? regFile_6 : _GEN_37; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_39 = 5'h7 == io_req_2_addr ? regFile_7 : _GEN_38; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_40 = 5'h8 == io_req_2_addr ? regFile_8 : _GEN_39; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_41 = 5'h9 == io_req_2_addr ? regFile_9 : _GEN_40; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_42 = 5'ha == io_req_2_addr ? regFile_10 : _GEN_41; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_43 = 5'hb == io_req_2_addr ? regFile_11 : _GEN_42; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_44 = 5'hc == io_req_2_addr ? regFile_12 : _GEN_43; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_45 = 5'hd == io_req_2_addr ? regFile_13 : _GEN_44; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_46 = 5'he == io_req_2_addr ? regFile_14 : _GEN_45; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_47 = 5'hf == io_req_2_addr ? regFile_15 : _GEN_46; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_48 = 5'h10 == io_req_2_addr ? regFile_16 : _GEN_47; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_49 = 5'h11 == io_req_2_addr ? regFile_17 : _GEN_48; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_50 = 5'h12 == io_req_2_addr ? regFile_18 : _GEN_49; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_51 = 5'h13 == io_req_2_addr ? regFile_19 : _GEN_50; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_52 = 5'h14 == io_req_2_addr ? regFile_20 : _GEN_51; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_53 = 5'h15 == io_req_2_addr ? regFile_21 : _GEN_52; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_54 = 5'h16 == io_req_2_addr ? regFile_22 : _GEN_53; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_55 = 5'h17 == io_req_2_addr ? regFile_23 : _GEN_54; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_56 = 5'h18 == io_req_2_addr ? regFile_24 : _GEN_55; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_57 = 5'h19 == io_req_2_addr ? regFile_25 : _GEN_56; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_58 = 5'h1a == io_req_2_addr ? regFile_26 : _GEN_57; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_59 = 5'h1b == io_req_2_addr ? regFile_27 : _GEN_58; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_60 = 5'h1c == io_req_2_addr ? regFile_28 : _GEN_59; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_61 = 5'h1d == io_req_2_addr ? regFile_29 : _GEN_60; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_62 = 5'h1e == io_req_2_addr ? regFile_30 : _GEN_61; // @[RegisterFile.scala 66:{26,26}]
  wire [31:0] _GEN_63 = 5'h1f == io_req_2_addr ? regFile_31 : _GEN_62; // @[RegisterFile.scala 66:{26,26}]
  assign io_resp_1_data = io_req_1_addr == 5'h0 ? 32'h0 : _GEN_31; // @[RegisterFile.scala 65:26]
  assign io_resp_2_data = io_req_2_addr == 5'h0 ? 32'h0 : _GEN_63; // @[RegisterFile.scala 66:26]
  always @(posedge clock) begin
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_0 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h0 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_0 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_1 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_1 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_2 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h2 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_2 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_3 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h3 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_3 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_4 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h4 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_4 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_5 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h5 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_5 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_6 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h6 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_6 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_7 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h7 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_7 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_8 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h8 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_8 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_9 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h9 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_9 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_10 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'ha == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_10 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_11 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'hb == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_11 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_12 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'hc == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_12 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_13 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'hd == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_13 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_14 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'he == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_14 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_15 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'hf == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_15 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_16 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h10 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_16 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_17 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h11 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_17 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_18 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h12 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_18 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_19 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h13 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_19 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_20 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h14 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_20 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_21 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h15 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_21 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_22 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h16 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_22 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_23 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h17 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_23 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_24 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h18 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_24 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_25 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h19 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_25 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_26 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1a == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_26 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_27 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1b == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_27 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_28 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1c == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_28 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_29 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1d == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_29 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_30 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1e == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_30 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_31 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_w_en & io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1f == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_31 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regFile_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regFile_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regFile_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regFile_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regFile_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regFile_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regFile_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regFile_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regFile_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  regFile_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  regFile_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  regFile_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  regFile_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  regFile_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  regFile_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  regFile_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  regFile_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  regFile_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  regFile_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  regFile_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  regFile_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  regFile_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  regFile_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  regFile_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  regFile_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  regFile_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  regFile_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  regFile_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  regFile_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  regFile_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  regFile_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  regFile_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ControlUnit(
  input  [6:0] io_opcode,
  input  [2:0] io_funct3,
  input  [6:0] io_funct7,
  input        io_taken,
  output [4:0] io_uop,
  output [2:0] io_bop,
  output       io_ALUsrc,
  output [1:0] io_immSel,
  output       io_flush,
  output       io_XcptInvalid
);
  wire  _T_1 = io_funct7 == 7'h0; // @[IDstage.scala 82:28]
  wire  _T_2 = 3'h0 == io_funct3; // @[IDstage.scala 83:34]
  wire  _T_3 = 3'h1 == io_funct3; // @[IDstage.scala 83:34]
  wire  _T_4 = 3'h2 == io_funct3; // @[IDstage.scala 83:34]
  wire  _T_5 = 3'h3 == io_funct3; // @[IDstage.scala 83:34]
  wire  _T_6 = 3'h4 == io_funct3; // @[IDstage.scala 83:34]
  wire  _T_7 = 3'h5 == io_funct3; // @[IDstage.scala 83:34]
  wire  _T_8 = 3'h6 == io_funct3; // @[IDstage.scala 83:34]
  wire  _T_9 = 3'h7 == io_funct3; // @[IDstage.scala 83:34]
  wire [4:0] _GEN_0 = 3'h7 == io_funct3 ? 5'h2 : 5'h14; // @[IDstage.scala 72:20 83:34 91:42]
  wire  _GEN_1 = 3'h7 == io_funct3 ? 1'h0 : 1'h1; // @[IDstage.scala 78:20 83:34 91:71]
  wire [4:0] _GEN_2 = 3'h6 == io_funct3 ? 5'h3 : _GEN_0; // @[IDstage.scala 83:34 90:42]
  wire  _GEN_3 = 3'h6 == io_funct3 ? 1'h0 : _GEN_1; // @[IDstage.scala 83:34 90:71]
  wire [4:0] _GEN_4 = 3'h5 == io_funct3 ? 5'h6 : _GEN_2; // @[IDstage.scala 83:34 89:42]
  wire  _GEN_5 = 3'h5 == io_funct3 ? 1'h0 : _GEN_3; // @[IDstage.scala 83:34 89:71]
  wire [4:0] _GEN_6 = 3'h4 == io_funct3 ? 5'h4 : _GEN_4; // @[IDstage.scala 83:34 88:42]
  wire  _GEN_7 = 3'h4 == io_funct3 ? 1'h0 : _GEN_5; // @[IDstage.scala 83:34 88:71]
  wire [4:0] _GEN_8 = 3'h3 == io_funct3 ? 5'h9 : _GEN_6; // @[IDstage.scala 83:34 87:42]
  wire  _GEN_9 = 3'h3 == io_funct3 ? 1'h0 : _GEN_7; // @[IDstage.scala 83:34 87:71]
  wire [4:0] _GEN_10 = 3'h2 == io_funct3 ? 5'h8 : _GEN_8; // @[IDstage.scala 83:34 86:42]
  wire  _GEN_11 = 3'h2 == io_funct3 ? 1'h0 : _GEN_9; // @[IDstage.scala 83:34 86:71]
  wire [4:0] _GEN_12 = 3'h1 == io_funct3 ? 5'h5 : _GEN_10; // @[IDstage.scala 83:34 85:42]
  wire  _GEN_13 = 3'h1 == io_funct3 ? 1'h0 : _GEN_11; // @[IDstage.scala 83:34 85:71]
  wire [4:0] _GEN_14 = 3'h0 == io_funct3 ? 5'h0 : _GEN_12; // @[IDstage.scala 83:34 84:42]
  wire  _GEN_15 = 3'h0 == io_funct3 ? 1'h0 : _GEN_13; // @[IDstage.scala 83:34 84:71]
  wire  _T_10 = io_funct7 == 7'h20; // @[IDstage.scala 93:34]
  wire [4:0] _GEN_16 = _T_7 ? 5'h7 : 5'h14; // @[IDstage.scala 72:20 94:34 96:42]
  wire  _GEN_17 = _T_7 ? 1'h0 : 1'h1; // @[IDstage.scala 78:20 94:34 96:70]
  wire [4:0] _GEN_18 = _T_2 ? 5'h1 : _GEN_16; // @[IDstage.scala 94:34 95:42]
  wire  _GEN_19 = _T_2 ? 1'h0 : _GEN_17; // @[IDstage.scala 94:34 95:70]
  wire [4:0] _GEN_20 = io_funct7 == 7'h20 ? _GEN_18 : 5'h14; // @[IDstage.scala 72:20 93:51]
  wire  _GEN_21 = io_funct7 == 7'h20 ? _GEN_19 : 1'h1; // @[IDstage.scala 78:20 93:51]
  wire [4:0] _GEN_22 = io_funct7 == 7'h0 ? _GEN_14 : _GEN_20; // @[IDstage.scala 82:45]
  wire  _GEN_23 = io_funct7 == 7'h0 ? _GEN_15 : _GEN_21; // @[IDstage.scala 82:45]
  wire [4:0] _GEN_24 = _T_1 ? 5'hf : 5'h14; // @[IDstage.scala 110:53 111:32 72:20]
  wire  _GEN_26 = _T_1 ? 1'h0 : 1'h1; // @[IDstage.scala 110:53 111:79 78:20]
  wire [4:0] _GEN_27 = _T_10 ? 5'h12 : 5'h14; // @[IDstage.scala 117:59 118:32 72:20]
  wire  _GEN_29 = _T_10 ? 1'h0 : 1'h1; // @[IDstage.scala 117:59 118:79 78:20]
  wire [4:0] _GEN_30 = _T_1 ? 5'h11 : _GEN_27; // @[IDstage.scala 115:53 116:32]
  wire  _GEN_31 = _T_1 | _T_10; // @[IDstage.scala 115:53 116:56]
  wire  _GEN_32 = _T_1 ? 1'h0 : _GEN_29; // @[IDstage.scala 115:53 116:79]
  wire [4:0] _GEN_33 = _T_7 ? _GEN_30 : 5'h14; // @[IDstage.scala 102:30 72:20]
  wire  _GEN_34 = _T_7 & _GEN_31; // @[IDstage.scala 102:30 75:20]
  wire  _GEN_35 = _T_7 ? _GEN_32 : 1'h1; // @[IDstage.scala 102:30 78:20]
  wire [4:0] _GEN_36 = _T_3 ? _GEN_24 : _GEN_33; // @[IDstage.scala 102:30]
  wire  _GEN_37 = _T_3 ? _T_1 : _GEN_34; // @[IDstage.scala 102:30]
  wire  _GEN_38 = _T_3 ? _GEN_26 : _GEN_35; // @[IDstage.scala 102:30]
  wire [4:0] _GEN_39 = _T_9 ? 5'he : _GEN_36; // @[IDstage.scala 102:30 108:38]
  wire  _GEN_40 = _T_9 ? 1'h0 : _GEN_38; // @[IDstage.scala 102:30 108:68]
  wire  _GEN_41 = _T_9 ? 1'h0 : _GEN_37; // @[IDstage.scala 102:30 75:20]
  wire [4:0] _GEN_42 = _T_8 ? 5'hd : _GEN_39; // @[IDstage.scala 102:30 107:38]
  wire  _GEN_43 = _T_8 ? 1'h0 : _GEN_40; // @[IDstage.scala 102:30 107:68]
  wire  _GEN_44 = _T_8 ? 1'h0 : _GEN_41; // @[IDstage.scala 102:30 75:20]
  wire [4:0] _GEN_45 = _T_6 ? 5'hc : _GEN_42; // @[IDstage.scala 102:30 106:38]
  wire  _GEN_46 = _T_6 ? 1'h0 : _GEN_43; // @[IDstage.scala 102:30 106:68]
  wire  _GEN_47 = _T_6 ? 1'h0 : _GEN_44; // @[IDstage.scala 102:30 75:20]
  wire [4:0] _GEN_48 = _T_5 ? 5'h10 : _GEN_45; // @[IDstage.scala 102:30 105:38]
  wire  _GEN_49 = _T_5 ? 1'h0 : _GEN_46; // @[IDstage.scala 102:30 105:68]
  wire  _GEN_50 = _T_5 ? 1'h0 : _GEN_47; // @[IDstage.scala 102:30 75:20]
  wire [4:0] _GEN_51 = _T_4 ? 5'ha : _GEN_48; // @[IDstage.scala 102:30 104:38]
  wire  _GEN_52 = _T_4 ? 1'h0 : _GEN_49; // @[IDstage.scala 102:30 104:68]
  wire  _GEN_53 = _T_4 ? 1'h0 : _GEN_50; // @[IDstage.scala 102:30 75:20]
  wire [4:0] _GEN_54 = _T_2 ? 5'hb : _GEN_51; // @[IDstage.scala 102:30 103:38]
  wire  _GEN_55 = _T_2 ? 1'h0 : _GEN_52; // @[IDstage.scala 102:30 103:68]
  wire  _GEN_56 = _T_2 ? 1'h0 : _GEN_53; // @[IDstage.scala 102:30 75:20]
  wire [2:0] _GEN_57 = _T_9 ? 3'h7 : 3'h0; // @[IDstage.scala 125:30 131:38 73:20]
  wire [2:0] _GEN_59 = _T_8 ? 3'h6 : _GEN_57; // @[IDstage.scala 125:30 130:38]
  wire [2:0] _GEN_61 = _T_7 ? 3'h5 : _GEN_59; // @[IDstage.scala 125:30 129:38]
  wire [2:0] _GEN_63 = _T_6 ? 3'h4 : _GEN_61; // @[IDstage.scala 125:30 128:38]
  wire [2:0] _GEN_65 = _T_3 ? 3'h1 : _GEN_63; // @[IDstage.scala 125:30 127:38]
  wire  _GEN_66 = _T_3 ? 1'h0 : _GEN_7; // @[IDstage.scala 125:30 127:66]
  wire [2:0] _GEN_67 = _T_2 ? 3'h0 : _GEN_65; // @[IDstage.scala 125:30 126:38]
  wire  _GEN_68 = _T_2 ? 1'h0 : _GEN_66; // @[IDstage.scala 125:30 126:66]
  wire  _GEN_70 = 7'h67 == io_opcode ? 1'h0 : 1'h1; // @[IDstage.scala 80:22 146:28 78:20]
  wire [1:0] _GEN_72 = 7'h6f == io_opcode ? 2'h2 : 2'h0; // @[IDstage.scala 80:22 139:23 75:20]
  wire  _GEN_73 = 7'h6f == io_opcode ? 1'h0 : _GEN_70; // @[IDstage.scala 80:22 140:28]
  wire [1:0] _GEN_75 = 7'h63 == io_opcode ? 2'h3 : _GEN_72; // @[IDstage.scala 80:22 124:23]
  wire [2:0] _GEN_76 = 7'h63 == io_opcode ? _GEN_67 : 3'h0; // @[IDstage.scala 73:20 80:22]
  wire  _GEN_77 = 7'h63 == io_opcode ? _GEN_68 : _GEN_73; // @[IDstage.scala 80:22]
  wire [4:0] _GEN_81 = 7'h13 == io_opcode ? _GEN_54 : 5'h14; // @[IDstage.scala 72:20 80:22]
  wire  _GEN_82 = 7'h13 == io_opcode ? _GEN_55 : _GEN_77; // @[IDstage.scala 80:22]
  wire [1:0] _GEN_83 = 7'h13 == io_opcode ? {{1'd0}, _GEN_56} : _GEN_75; // @[IDstage.scala 80:22]
  wire [2:0] _GEN_84 = 7'h13 == io_opcode ? 3'h0 : _GEN_76; // @[IDstage.scala 73:20 80:22]
  wire  _GEN_85 = 7'h13 == io_opcode ? 1'h0 : 7'h63 == io_opcode & io_taken; // @[IDstage.scala 76:20 80:22]
  assign io_uop = 7'h33 == io_opcode ? _GEN_22 : _GEN_81; // @[IDstage.scala 80:22]
  assign io_bop = 7'h33 == io_opcode ? 3'h0 : _GEN_84; // @[IDstage.scala 73:20 80:22]
  assign io_ALUsrc = 7'h33 == io_opcode ? 1'h0 : 7'h13 == io_opcode; // @[IDstage.scala 74:20 80:22]
  assign io_immSel = 7'h33 == io_opcode ? 2'h0 : _GEN_83; // @[IDstage.scala 75:20 80:22]
  assign io_flush = 7'h33 == io_opcode ? 1'h0 : _GEN_85; // @[IDstage.scala 76:20 80:22]
  assign io_XcptInvalid = 7'h33 == io_opcode ? _GEN_23 : _GEN_82; // @[IDstage.scala 80:22]
endmodule
module SignExtend(
  input  [24:0] io_imm_in,
  input  [1:0]  io_sel,
  output [31:0] io_imm_out
);
  wire [19:0] _full_T_2 = io_imm_in[24] ? 20'hfffff : 20'h0; // @[Bitwise.scala 74:12]
  wire [31:0] full = {_full_T_2,io_imm_in[24:13]}; // @[Cat.scala 31:58]
  wire [31:0] shamt = {27'h0,io_imm_in[17:13]}; // @[Cat.scala 31:58]
  wire [19:0] jump_cat = {io_imm_in[24],io_imm_in[12:5],io_imm_in[13],io_imm_in[23:14]}; // @[Cat.scala 31:58]
  wire [10:0] _jump_imm_T_2 = jump_cat[19] ? 11'h7ff : 11'h0; // @[Bitwise.scala 74:12]
  wire [31:0] jump_imm = {_jump_imm_T_2,io_imm_in[24],io_imm_in[12:5],io_imm_in[13],io_imm_in[23:14],1'h0}; // @[Cat.scala 31:58]
  wire [18:0] _branch_imm_T_2 = io_imm_in[24] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 74:12]
  wire [31:0] branch_imm = {_branch_imm_T_2,io_imm_in[24],io_imm_in[0],io_imm_in[23:18],io_imm_in[4:1],1'h0}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_0 = 2'h3 == io_sel ? branch_imm : full; // @[IDstage.scala 189:16 190:19 201:24]
  wire [31:0] _GEN_1 = 2'h2 == io_sel ? jump_imm : _GEN_0; // @[IDstage.scala 190:19 198:24]
  wire [31:0] _GEN_2 = 2'h1 == io_sel ? shamt : _GEN_1; // @[IDstage.scala 190:19 195:24]
  assign io_imm_out = 2'h0 == io_sel ? full : _GEN_2; // @[IDstage.scala 190:19 192:24]
endmodule
module Comparator(
  input  [31:0] io_a,
  input  [31:0] io_b,
  input  [2:0]  io_sel,
  output        io_taken
);
  wire  _GEN_0 = 3'h7 == io_sel & io_a >= io_b; // @[IDstage.scala 214:14 216:20 222:33]
  wire  _GEN_1 = 3'h6 == io_sel ? io_a < io_b : _GEN_0; // @[IDstage.scala 216:20 221:33]
  wire  _GEN_2 = 3'h5 == io_sel ? $signed(io_a) >= $signed(io_b) : _GEN_1; // @[IDstage.scala 216:20 220:33]
  wire  _GEN_3 = 3'h4 == io_sel ? $signed(io_a) < $signed(io_b) : _GEN_2; // @[IDstage.scala 216:20 219:33]
  wire  _GEN_4 = 3'h1 == io_sel ? io_a != io_b : _GEN_3; // @[IDstage.scala 216:20 218:33]
  assign io_taken = 3'h0 == io_sel ? io_a == io_b : _GEN_4; // @[IDstage.scala 216:20 217:33]
endmodule
module ID(
  input         clock,
  input         reset,
  input  [31:0] io_inst,
  input         io_w_en,
  input  [4:0]  io_rd_in,
  input  [31:0] io_write_data,
  output [31:0] io_nPC,
  output [4:0]  io_uop,
  output        io_ALUsrc,
  output [31:0] io_immExtnd,
  output        io_XcptInvalid,
  output        io_flush,
  output [4:0]  io_rd_out,
  output [31:0] io_operandA,
  output [31:0] io_operandB
);
  wire  rf_clock; // @[IDstage.scala 258:23]
  wire  rf_reset; // @[IDstage.scala 258:23]
  wire [4:0] rf_io_req_1_addr; // @[IDstage.scala 258:23]
  wire [4:0] rf_io_req_2_addr; // @[IDstage.scala 258:23]
  wire [4:0] rf_io_req_3_addr; // @[IDstage.scala 258:23]
  wire [31:0] rf_io_req_3_data; // @[IDstage.scala 258:23]
  wire  rf_io_req_3_w_en; // @[IDstage.scala 258:23]
  wire [31:0] rf_io_resp_1_data; // @[IDstage.scala 258:23]
  wire [31:0] rf_io_resp_2_data; // @[IDstage.scala 258:23]
  wire [6:0] cu_io_opcode; // @[IDstage.scala 259:23]
  wire [2:0] cu_io_funct3; // @[IDstage.scala 259:23]
  wire [6:0] cu_io_funct7; // @[IDstage.scala 259:23]
  wire  cu_io_taken; // @[IDstage.scala 259:23]
  wire [4:0] cu_io_uop; // @[IDstage.scala 259:23]
  wire [2:0] cu_io_bop; // @[IDstage.scala 259:23]
  wire  cu_io_ALUsrc; // @[IDstage.scala 259:23]
  wire [1:0] cu_io_immSel; // @[IDstage.scala 259:23]
  wire  cu_io_flush; // @[IDstage.scala 259:23]
  wire  cu_io_XcptInvalid; // @[IDstage.scala 259:23]
  wire [24:0] sigex_io_imm_in; // @[IDstage.scala 260:23]
  wire [1:0] sigex_io_sel; // @[IDstage.scala 260:23]
  wire [31:0] sigex_io_imm_out; // @[IDstage.scala 260:23]
  wire [31:0] compr_io_a; // @[IDstage.scala 261:23]
  wire [31:0] compr_io_b; // @[IDstage.scala 261:23]
  wire [2:0] compr_io_sel; // @[IDstage.scala 261:23]
  wire  compr_io_taken; // @[IDstage.scala 261:23]
  regFile rf ( // @[IDstage.scala 258:23]
    .clock(rf_clock),
    .reset(rf_reset),
    .io_req_1_addr(rf_io_req_1_addr),
    .io_req_2_addr(rf_io_req_2_addr),
    .io_req_3_addr(rf_io_req_3_addr),
    .io_req_3_data(rf_io_req_3_data),
    .io_req_3_w_en(rf_io_req_3_w_en),
    .io_resp_1_data(rf_io_resp_1_data),
    .io_resp_2_data(rf_io_resp_2_data)
  );
  ControlUnit cu ( // @[IDstage.scala 259:23]
    .io_opcode(cu_io_opcode),
    .io_funct3(cu_io_funct3),
    .io_funct7(cu_io_funct7),
    .io_taken(cu_io_taken),
    .io_uop(cu_io_uop),
    .io_bop(cu_io_bop),
    .io_ALUsrc(cu_io_ALUsrc),
    .io_immSel(cu_io_immSel),
    .io_flush(cu_io_flush),
    .io_XcptInvalid(cu_io_XcptInvalid)
  );
  SignExtend sigex ( // @[IDstage.scala 260:23]
    .io_imm_in(sigex_io_imm_in),
    .io_sel(sigex_io_sel),
    .io_imm_out(sigex_io_imm_out)
  );
  Comparator compr ( // @[IDstage.scala 261:23]
    .io_a(compr_io_a),
    .io_b(compr_io_b),
    .io_sel(compr_io_sel),
    .io_taken(compr_io_taken)
  );
  assign io_nPC = sigex_io_imm_out; // @[IDstage.scala 287:12]
  assign io_uop = cu_io_uop; // @[IDstage.scala 293:20]
  assign io_ALUsrc = cu_io_ALUsrc; // @[IDstage.scala 297:20]
  assign io_immExtnd = sigex_io_imm_out; // @[IDstage.scala 295:20]
  assign io_XcptInvalid = cu_io_XcptInvalid; // @[IDstage.scala 294:20]
  assign io_flush = cu_io_flush; // @[IDstage.scala 300:20]
  assign io_rd_out = io_inst[11:7]; // @[IDstage.scala 255:25]
  assign io_operandA = rf_io_resp_1_data; // @[IDstage.scala 290:20]
  assign io_operandB = rf_io_resp_2_data; // @[IDstage.scala 291:20]
  assign rf_clock = clock;
  assign rf_reset = reset;
  assign rf_io_req_1_addr = io_inst[19:15]; // @[IDstage.scala 253:25]
  assign rf_io_req_2_addr = io_inst[24:20]; // @[IDstage.scala 254:25]
  assign rf_io_req_3_addr = io_rd_in; // @[IDstage.scala 276:22]
  assign rf_io_req_3_data = io_write_data; // @[IDstage.scala 278:22]
  assign rf_io_req_3_w_en = io_w_en; // @[IDstage.scala 277:22]
  assign cu_io_opcode = io_inst[6:0]; // @[IDstage.scala 250:25]
  assign cu_io_funct3 = io_inst[14:12]; // @[IDstage.scala 251:25]
  assign cu_io_funct7 = io_inst[31:25]; // @[IDstage.scala 252:25]
  assign cu_io_taken = compr_io_taken; // @[IDstage.scala 267:19]
  assign sigex_io_imm_in = io_inst[31:7]; // @[IDstage.scala 256:25]
  assign sigex_io_sel = cu_io_immSel; // @[IDstage.scala 271:21]
  assign compr_io_a = rf_io_resp_1_data; // @[IDstage.scala 281:18]
  assign compr_io_b = rf_io_resp_2_data; // @[IDstage.scala 282:18]
  assign compr_io_sel = cu_io_bop; // @[IDstage.scala 283:18]
endmodule
module IDBarrier(
  input         clock,
  input         reset,
  input  [4:0]  io_inUOP,
  input  [4:0]  io_inRD,
  input  [31:0] io_inOperandA,
  input  [31:0] io_inOperandB,
  input         io_inXcptInvalid,
  input         io_inALUsrc,
  input  [31:0] io_inImmExtnd,
  input  [4:0]  io_rs1_ID,
  input  [4:0]  io_rs2_ID,
  output [4:0]  io_rs1_EX,
  output [4:0]  io_rs2_EX,
  output [4:0]  io_outUOP,
  output [4:0]  io_outRD,
  output [31:0] io_outOperandA,
  output [31:0] io_outOperandB,
  output        io_outXcptInvalid,
  output        io_outWrten,
  output        io_outALUsrc,
  output [31:0] io_outImmExtnd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] uop; // @[IDbarrier.scala 73:30]
  reg  XcptInvalid; // @[IDbarrier.scala 74:30]
  reg [4:0] rd; // @[IDbarrier.scala 75:30]
  reg [31:0] operandA; // @[IDbarrier.scala 76:30]
  reg [31:0] operandB; // @[IDbarrier.scala 77:30]
  reg  wrten; // @[IDbarrier.scala 78:30]
  reg  ALUsrc; // @[IDbarrier.scala 79:30]
  reg [31:0] immExtnd; // @[IDbarrier.scala 80:30]
  reg [4:0] rs1Addr; // @[IDbarrier.scala 81:30]
  reg [4:0] rs2Addr; // @[IDbarrier.scala 82:30]
  assign io_rs1_EX = rs1Addr; // @[IDbarrier.scala 107:24]
  assign io_rs2_EX = rs2Addr; // @[IDbarrier.scala 108:24]
  assign io_outUOP = uop; // @[IDbarrier.scala 99:24]
  assign io_outRD = rd; // @[IDbarrier.scala 101:24]
  assign io_outOperandA = operandA; // @[IDbarrier.scala 102:24]
  assign io_outOperandB = operandB; // @[IDbarrier.scala 103:24]
  assign io_outXcptInvalid = XcptInvalid; // @[IDbarrier.scala 100:24]
  assign io_outWrten = wrten; // @[IDbarrier.scala 104:24]
  assign io_outALUsrc = ALUsrc; // @[IDbarrier.scala 105:24]
  assign io_outImmExtnd = immExtnd; // @[IDbarrier.scala 106:24]
  always @(posedge clock) begin
    if (reset) begin // @[IDbarrier.scala 73:30]
      uop <= 5'h14; // @[IDbarrier.scala 73:30]
    end else begin
      uop <= io_inUOP; // @[IDbarrier.scala 86:17]
    end
    if (reset) begin // @[IDbarrier.scala 74:30]
      XcptInvalid <= 1'h0; // @[IDbarrier.scala 74:30]
    end else begin
      XcptInvalid <= io_inXcptInvalid; // @[IDbarrier.scala 90:17]
    end
    if (reset) begin // @[IDbarrier.scala 75:30]
      rd <= 5'h0; // @[IDbarrier.scala 75:30]
    end else begin
      rd <= io_inRD; // @[IDbarrier.scala 87:17]
    end
    if (reset) begin // @[IDbarrier.scala 76:30]
      operandA <= 32'h0; // @[IDbarrier.scala 76:30]
    end else begin
      operandA <= io_inOperandA; // @[IDbarrier.scala 88:17]
    end
    if (reset) begin // @[IDbarrier.scala 77:30]
      operandB <= 32'h0; // @[IDbarrier.scala 77:30]
    end else begin
      operandB <= io_inOperandB; // @[IDbarrier.scala 89:17]
    end
    if (reset) begin // @[IDbarrier.scala 78:30]
      wrten <= 1'h0; // @[IDbarrier.scala 78:30]
    end else begin
      wrten <= 1'h1; // @[IDbarrier.scala 91:17]
    end
    if (reset) begin // @[IDbarrier.scala 79:30]
      ALUsrc <= 1'h0; // @[IDbarrier.scala 79:30]
    end else begin
      ALUsrc <= io_inALUsrc; // @[IDbarrier.scala 92:17]
    end
    if (reset) begin // @[IDbarrier.scala 80:30]
      immExtnd <= 32'h0; // @[IDbarrier.scala 80:30]
    end else begin
      immExtnd <= io_inImmExtnd; // @[IDbarrier.scala 93:17]
    end
    if (reset) begin // @[IDbarrier.scala 81:30]
      rs1Addr <= 5'h0; // @[IDbarrier.scala 81:30]
    end else begin
      rs1Addr <= io_rs1_ID; // @[IDbarrier.scala 94:17]
    end
    if (reset) begin // @[IDbarrier.scala 82:30]
      rs2Addr <= 5'h0; // @[IDbarrier.scala 82:30]
    end else begin
      rs2Addr <= io_rs2_ID; // @[IDbarrier.scala 95:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  uop = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  XcptInvalid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  rd = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  operandA = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  operandB = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  wrten = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ALUsrc = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  immExtnd = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  rs1Addr = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  rs2Addr = _RAND_9[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALU(
  input  [31:0] io_operandA,
  input  [31:0] io_operandB,
  input  [3:0]  io_operation,
  output [31:0] io_aluResult
);
  wire [4:0] shift_amount = io_operandB[4:0]; // @[ALU.scala 44:33]
  wire [31:0] _io_aluResult_T_1 = io_operandA + io_operandB; // @[ALU.scala 54:35]
  wire [31:0] _io_aluResult_T_3 = io_operandA - io_operandB; // @[ALU.scala 61:36]
  wire [31:0] _io_aluResult_T_4 = io_operandA & io_operandB; // @[ALU.scala 66:35]
  wire [31:0] _io_aluResult_T_5 = io_operandA | io_operandB; // @[ALU.scala 71:35]
  wire [31:0] _io_aluResult_T_6 = io_operandA ^ io_operandB; // @[ALU.scala 76:35]
  wire [62:0] _GEN_10 = {{31'd0}, io_operandA}; // @[ALU.scala 81:36]
  wire [62:0] _io_aluResult_T_7 = _GEN_10 << shift_amount; // @[ALU.scala 81:36]
  wire [31:0] _io_aluResult_T_8 = io_operandA >> shift_amount; // @[ALU.scala 86:35]
  wire [31:0] _io_aluResult_T_11 = $signed(io_operandA) >>> shift_amount; // @[ALU.scala 91:60]
  wire  _GEN_0 = 4'h9 == io_operation & io_operandA < io_operandB; // @[ALU.scala 101:20 46:16 50:24]
  wire  _GEN_1 = 4'h8 == io_operation ? $signed(io_operandA) < $signed(io_operandB) : _GEN_0; // @[ALU.scala 50:24 96:20]
  wire [31:0] _GEN_2 = 4'h7 == io_operation ? _io_aluResult_T_11 : {{31'd0}, _GEN_1}; // @[ALU.scala 50:24 91:20]
  wire [31:0] _GEN_3 = 4'h6 == io_operation ? _io_aluResult_T_8 : _GEN_2; // @[ALU.scala 50:24 86:20]
  wire [62:0] _GEN_4 = 4'h5 == io_operation ? _io_aluResult_T_7 : {{31'd0}, _GEN_3}; // @[ALU.scala 50:24 81:20]
  wire [62:0] _GEN_5 = 4'h4 == io_operation ? {{31'd0}, _io_aluResult_T_6} : _GEN_4; // @[ALU.scala 50:24 76:20]
  wire [62:0] _GEN_6 = 4'h3 == io_operation ? {{31'd0}, _io_aluResult_T_5} : _GEN_5; // @[ALU.scala 50:24 71:20]
  wire [62:0] _GEN_7 = 4'h2 == io_operation ? {{31'd0}, _io_aluResult_T_4} : _GEN_6; // @[ALU.scala 50:24 66:20]
  wire [62:0] _GEN_8 = 4'h1 == io_operation ? {{31'd0}, _io_aluResult_T_3} : _GEN_7; // @[ALU.scala 50:24 61:20]
  wire [62:0] _GEN_9 = 4'h0 == io_operation ? {{31'd0}, _io_aluResult_T_1} : _GEN_8; // @[ALU.scala 50:24 54:20]
  assign io_aluResult = _GEN_9[31:0];
endmodule
module ALUcontrol(
  input  [4:0] io_uop,
  output [3:0] io_mapped
);
  wire [3:0] _GEN_0 = 5'h9 == io_uop | 5'h10 == io_uop ? 4'h9 : 4'h0; // @[EXstage.scala 50:15 52:18 62:43]
  wire [3:0] _GEN_1 = 5'h8 == io_uop | 5'ha == io_uop ? 4'h8 : _GEN_0; // @[EXstage.scala 52:18 61:43]
  wire [3:0] _GEN_2 = 5'h7 == io_uop | 5'h12 == io_uop ? 4'h7 : _GEN_1; // @[EXstage.scala 52:18 60:43]
  wire [3:0] _GEN_3 = 5'h6 == io_uop | 5'h11 == io_uop ? 4'h6 : _GEN_2; // @[EXstage.scala 52:18 59:43]
  wire [3:0] _GEN_4 = 5'h5 == io_uop | 5'hf == io_uop ? 4'h5 : _GEN_3; // @[EXstage.scala 52:18 58:43]
  wire [3:0] _GEN_5 = 5'h4 == io_uop | 5'hc == io_uop ? 4'h4 : _GEN_4; // @[EXstage.scala 52:18 57:43]
  wire [3:0] _GEN_6 = 5'h3 == io_uop | 5'hd == io_uop ? 4'h3 : _GEN_5; // @[EXstage.scala 52:18 56:43]
  wire [3:0] _GEN_7 = 5'h2 == io_uop | 5'he == io_uop ? 4'h2 : _GEN_6; // @[EXstage.scala 52:18 55:43]
  wire [3:0] _GEN_8 = 5'h1 == io_uop ? 4'h1 : _GEN_7; // @[EXstage.scala 52:18 54:43]
  assign io_mapped = 5'h0 == io_uop | 5'hb == io_uop ? 4'h0 : _GEN_8; // @[EXstage.scala 52:18 53:43]
endmodule
module EXstage(
  input  [31:0] io_operandA,
  input  [31:0] io_operandB,
  input  [31:0] io_immExtnd,
  input         io_ALUsrc,
  input  [4:0]  io_rd_in,
  input  [4:0]  io_uop,
  input         io_wrten_in,
  input         io_XcptInvalid,
  input  [1:0]  io_forwardSelA,
  input  [1:0]  io_forwardSelB,
  input  [31:0] io_aluResultWB,
  input  [31:0] io_aluResultMEM,
  output [31:0] io_aluResult,
  output        io_exception,
  output [4:0]  io_rd,
  output        io_wrten
);
  wire [31:0] ALU_io_operandA; // @[EXstage.scala 91:26]
  wire [31:0] ALU_io_operandB; // @[EXstage.scala 91:26]
  wire [3:0] ALU_io_operation; // @[EXstage.scala 91:26]
  wire [31:0] ALU_io_aluResult; // @[EXstage.scala 91:26]
  wire [4:0] ALUcontrol_io_uop; // @[EXstage.scala 92:26]
  wire [3:0] ALUcontrol_io_mapped; // @[EXstage.scala 92:26]
  wire [31:0] _GEN_0 = 2'h1 == io_forwardSelA ? io_aluResultWB : io_operandA; // @[EXstage.scala 100:26 102:24 99:8]
  wire [31:0] _GEN_2 = 2'h1 == io_forwardSelB ? io_aluResultWB : io_operandB; // @[EXstage.scala 106:26 108:24 105:8]
  wire [31:0] srcB = 2'h2 == io_forwardSelB ? io_aluResultMEM : _GEN_2; // @[EXstage.scala 106:26 107:24]
  ALU ALU ( // @[EXstage.scala 91:26]
    .io_operandA(ALU_io_operandA),
    .io_operandB(ALU_io_operandB),
    .io_operation(ALU_io_operation),
    .io_aluResult(ALU_io_aluResult)
  );
  ALUcontrol ALUcontrol ( // @[EXstage.scala 92:26]
    .io_uop(ALUcontrol_io_uop),
    .io_mapped(ALUcontrol_io_mapped)
  );
  assign io_aluResult = ALU_io_aluResult; // @[EXstage.scala 115:16]
  assign io_exception = io_XcptInvalid; // @[EXstage.scala 116:16]
  assign io_rd = io_rd_in; // @[EXstage.scala 117:16]
  assign io_wrten = io_wrten_in; // @[EXstage.scala 118:16]
  assign ALU_io_operandA = 2'h2 == io_forwardSelA ? io_aluResultMEM : _GEN_0; // @[EXstage.scala 100:26 101:24]
  assign ALU_io_operandB = io_ALUsrc ? io_immExtnd : srcB; // @[EXstage.scala 112:26]
  assign ALU_io_operation = ALUcontrol_io_mapped; // @[EXstage.scala 113:20]
  assign ALUcontrol_io_uop = io_uop; // @[EXstage.scala 94:21]
endmodule
module EXBarrier(
  input         clock,
  input         reset,
  input  [31:0] io_inAluResult,
  input  [4:0]  io_inRD,
  input         io_inXcptInvalid,
  input         io_inWrten,
  output [31:0] io_outAluResult,
  output [4:0]  io_outRD,
  output        io_outXcptInvalid,
  output        io_outWrten
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] aluResult; // @[EXbarrier.scala 54:30]
  reg [4:0] RD; // @[EXbarrier.scala 55:30]
  reg  XcptInvalid; // @[EXbarrier.scala 56:30]
  reg  wrten; // @[EXbarrier.scala 57:30]
  assign io_outAluResult = aluResult; // @[EXbarrier.scala 68:25]
  assign io_outRD = RD; // @[EXbarrier.scala 69:25]
  assign io_outXcptInvalid = XcptInvalid; // @[EXbarrier.scala 70:25]
  assign io_outWrten = wrten; // @[EXbarrier.scala 71:25]
  always @(posedge clock) begin
    if (reset) begin // @[EXbarrier.scala 54:30]
      aluResult <= 32'h0; // @[EXbarrier.scala 54:30]
    end else begin
      aluResult <= io_inAluResult; // @[EXbarrier.scala 61:17]
    end
    if (reset) begin // @[EXbarrier.scala 55:30]
      RD <= 5'h0; // @[EXbarrier.scala 55:30]
    end else begin
      RD <= io_inRD; // @[EXbarrier.scala 62:17]
    end
    if (reset) begin // @[EXbarrier.scala 56:30]
      XcptInvalid <= 1'h0; // @[EXbarrier.scala 56:30]
    end else begin
      XcptInvalid <= io_inXcptInvalid; // @[EXbarrier.scala 63:17]
    end
    if (reset) begin // @[EXbarrier.scala 57:30]
      wrten <= 1'h0; // @[EXbarrier.scala 57:30]
    end else begin
      wrten <= io_inWrten; // @[EXbarrier.scala 64:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  aluResult = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  RD = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  XcptInvalid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  wrten = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WBstage(
  input  [31:0] io_aluResult,
  input  [4:0]  io_rd,
  input         io_wrten,
  output [4:0]  io_regFileReq_addr,
  output [31:0] io_regFileReq_data,
  output        io_regFileReq_w_en
);
  assign io_regFileReq_addr = io_rd; // @[WBstage.scala 70:24]
  assign io_regFileReq_data = io_aluResult; // @[WBstage.scala 71:24]
  assign io_regFileReq_w_en = io_wrten; // @[WBstage.scala 72:24]
endmodule
module WBBarrier(
  input         clock,
  input         reset,
  input  [31:0] io_inCheckRes,
  input         io_inXcptInvalid,
  output [31:0] io_outCheckRes,
  output        io_outXcptInvalid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] check_res; // @[WBbarrier.scala 46:26]
  reg  isInvalid; // @[WBbarrier.scala 47:26]
  assign io_outCheckRes = check_res; // @[WBbarrier.scala 52:18]
  assign io_outXcptInvalid = isInvalid; // @[WBbarrier.scala 53:21]
  always @(posedge clock) begin
    if (reset) begin // @[WBbarrier.scala 46:26]
      check_res <= 32'h0; // @[WBbarrier.scala 46:26]
    end else begin
      check_res <= io_inCheckRes; // @[WBbarrier.scala 49:13]
    end
    if (reset) begin // @[WBbarrier.scala 47:26]
      isInvalid <= 1'h0; // @[WBbarrier.scala 47:26]
    end else begin
      isInvalid <= io_inXcptInvalid; // @[WBbarrier.scala 50:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  check_res = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  isInvalid = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ForwardingUnit(
  input  [31:0] io_rs1_EX,
  input  [31:0] io_rs2_EX,
  input  [31:0] io_rd_MEM,
  input  [31:0] io_rd_WB,
  input         io_wrEn_MEM,
  input         io_wrEn_WB,
  output [1:0]  io_forwardA,
  output [1:0]  io_forwardB
);
  wire  _T_2 = io_rs1_EX != 32'h0; // @[ForwardingUnit.scala 54:63]
  wire  _T_7 = io_rs1_EX == io_rd_WB & io_wrEn_WB & _T_2; // @[ForwardingUnit.scala 56:53]
  wire  _T_10 = io_rs2_EX != 32'h0; // @[ForwardingUnit.scala 63:63]
  wire  _T_15 = io_rs2_EX == io_rd_WB & io_wrEn_WB & _T_10; // @[ForwardingUnit.scala 65:53]
  assign io_forwardA = io_rs1_EX == io_rd_MEM & io_wrEn_MEM & io_rs1_EX != 32'h0 ? 2'h2 : {{1'd0}, _T_7}; // @[ForwardingUnit.scala 54:73 55:17]
  assign io_forwardB = io_rs2_EX == io_rd_MEM & io_wrEn_MEM & io_rs2_EX != 32'h0 ? 2'h2 : {{1'd0}, _T_15}; // @[ForwardingUnit.scala 63:73 64:17]
endmodule
module PipelinedRV32Icore(
  input         clock,
  input         reset,
  output [31:0] io_check_res,
  output        io_exception
);
  wire  IFstage_clock; // @[core.scala 65:25]
  wire  IFstage_reset; // @[core.scala 65:25]
  wire [31:0] IFstage_io_inst; // @[core.scala 65:25]
  wire [31:0] IFstage_io_nPC; // @[core.scala 65:25]
  wire  IFBarrier_clock; // @[core.scala 66:25]
  wire  IFBarrier_reset; // @[core.scala 66:25]
  wire  IFBarrier_io_flush; // @[core.scala 66:25]
  wire [31:0] IFBarrier_io_inInstr; // @[core.scala 66:25]
  wire [31:0] IFBarrier_io_outInstr; // @[core.scala 66:25]
  wire  IDstage_clock; // @[core.scala 68:25]
  wire  IDstage_reset; // @[core.scala 68:25]
  wire [31:0] IDstage_io_inst; // @[core.scala 68:25]
  wire  IDstage_io_w_en; // @[core.scala 68:25]
  wire [4:0] IDstage_io_rd_in; // @[core.scala 68:25]
  wire [31:0] IDstage_io_write_data; // @[core.scala 68:25]
  wire [31:0] IDstage_io_nPC; // @[core.scala 68:25]
  wire [4:0] IDstage_io_uop; // @[core.scala 68:25]
  wire  IDstage_io_ALUsrc; // @[core.scala 68:25]
  wire [31:0] IDstage_io_immExtnd; // @[core.scala 68:25]
  wire  IDstage_io_XcptInvalid; // @[core.scala 68:25]
  wire  IDstage_io_flush; // @[core.scala 68:25]
  wire [4:0] IDstage_io_rd_out; // @[core.scala 68:25]
  wire [31:0] IDstage_io_operandA; // @[core.scala 68:25]
  wire [31:0] IDstage_io_operandB; // @[core.scala 68:25]
  wire  IDBarrier_clock; // @[core.scala 69:25]
  wire  IDBarrier_reset; // @[core.scala 69:25]
  wire [4:0] IDBarrier_io_inUOP; // @[core.scala 69:25]
  wire [4:0] IDBarrier_io_inRD; // @[core.scala 69:25]
  wire [31:0] IDBarrier_io_inOperandA; // @[core.scala 69:25]
  wire [31:0] IDBarrier_io_inOperandB; // @[core.scala 69:25]
  wire  IDBarrier_io_inXcptInvalid; // @[core.scala 69:25]
  wire  IDBarrier_io_inALUsrc; // @[core.scala 69:25]
  wire [31:0] IDBarrier_io_inImmExtnd; // @[core.scala 69:25]
  wire [4:0] IDBarrier_io_rs1_ID; // @[core.scala 69:25]
  wire [4:0] IDBarrier_io_rs2_ID; // @[core.scala 69:25]
  wire [4:0] IDBarrier_io_rs1_EX; // @[core.scala 69:25]
  wire [4:0] IDBarrier_io_rs2_EX; // @[core.scala 69:25]
  wire [4:0] IDBarrier_io_outUOP; // @[core.scala 69:25]
  wire [4:0] IDBarrier_io_outRD; // @[core.scala 69:25]
  wire [31:0] IDBarrier_io_outOperandA; // @[core.scala 69:25]
  wire [31:0] IDBarrier_io_outOperandB; // @[core.scala 69:25]
  wire  IDBarrier_io_outXcptInvalid; // @[core.scala 69:25]
  wire  IDBarrier_io_outWrten; // @[core.scala 69:25]
  wire  IDBarrier_io_outALUsrc; // @[core.scala 69:25]
  wire [31:0] IDBarrier_io_outImmExtnd; // @[core.scala 69:25]
  wire [31:0] EXstage_io_operandA; // @[core.scala 71:25]
  wire [31:0] EXstage_io_operandB; // @[core.scala 71:25]
  wire [31:0] EXstage_io_immExtnd; // @[core.scala 71:25]
  wire  EXstage_io_ALUsrc; // @[core.scala 71:25]
  wire [4:0] EXstage_io_rd_in; // @[core.scala 71:25]
  wire [4:0] EXstage_io_uop; // @[core.scala 71:25]
  wire  EXstage_io_wrten_in; // @[core.scala 71:25]
  wire  EXstage_io_XcptInvalid; // @[core.scala 71:25]
  wire [1:0] EXstage_io_forwardSelA; // @[core.scala 71:25]
  wire [1:0] EXstage_io_forwardSelB; // @[core.scala 71:25]
  wire [31:0] EXstage_io_aluResultWB; // @[core.scala 71:25]
  wire [31:0] EXstage_io_aluResultMEM; // @[core.scala 71:25]
  wire [31:0] EXstage_io_aluResult; // @[core.scala 71:25]
  wire  EXstage_io_exception; // @[core.scala 71:25]
  wire [4:0] EXstage_io_rd; // @[core.scala 71:25]
  wire  EXstage_io_wrten; // @[core.scala 71:25]
  wire  EXBarrier_clock; // @[core.scala 72:25]
  wire  EXBarrier_reset; // @[core.scala 72:25]
  wire [31:0] EXBarrier_io_inAluResult; // @[core.scala 72:25]
  wire [4:0] EXBarrier_io_inRD; // @[core.scala 72:25]
  wire  EXBarrier_io_inXcptInvalid; // @[core.scala 72:25]
  wire  EXBarrier_io_inWrten; // @[core.scala 72:25]
  wire [31:0] EXBarrier_io_outAluResult; // @[core.scala 72:25]
  wire [4:0] EXBarrier_io_outRD; // @[core.scala 72:25]
  wire  EXBarrier_io_outXcptInvalid; // @[core.scala 72:25]
  wire  EXBarrier_io_outWrten; // @[core.scala 72:25]
  wire  MEMBarrier_clock; // @[core.scala 75:26]
  wire  MEMBarrier_reset; // @[core.scala 75:26]
  wire [31:0] MEMBarrier_io_inAluResult; // @[core.scala 75:26]
  wire [4:0] MEMBarrier_io_inRD; // @[core.scala 75:26]
  wire  MEMBarrier_io_inXcptInvalid; // @[core.scala 75:26]
  wire  MEMBarrier_io_inWrten; // @[core.scala 75:26]
  wire [31:0] MEMBarrier_io_outAluResult; // @[core.scala 75:26]
  wire [4:0] MEMBarrier_io_outRD; // @[core.scala 75:26]
  wire  MEMBarrier_io_outXcptInvalid; // @[core.scala 75:26]
  wire  MEMBarrier_io_outWrten; // @[core.scala 75:26]
  wire [31:0] WBstage_io_aluResult; // @[core.scala 77:25]
  wire [4:0] WBstage_io_rd; // @[core.scala 77:25]
  wire  WBstage_io_wrten; // @[core.scala 77:25]
  wire [4:0] WBstage_io_regFileReq_addr; // @[core.scala 77:25]
  wire [31:0] WBstage_io_regFileReq_data; // @[core.scala 77:25]
  wire  WBstage_io_regFileReq_w_en; // @[core.scala 77:25]
  wire  WBBarrier_clock; // @[core.scala 78:25]
  wire  WBBarrier_reset; // @[core.scala 78:25]
  wire [31:0] WBBarrier_io_inCheckRes; // @[core.scala 78:25]
  wire  WBBarrier_io_inXcptInvalid; // @[core.scala 78:25]
  wire [31:0] WBBarrier_io_outCheckRes; // @[core.scala 78:25]
  wire  WBBarrier_io_outXcptInvalid; // @[core.scala 78:25]
  wire [31:0] ForwardingUnit_io_rs1_EX; // @[core.scala 80:30]
  wire [31:0] ForwardingUnit_io_rs2_EX; // @[core.scala 80:30]
  wire [31:0] ForwardingUnit_io_rd_MEM; // @[core.scala 80:30]
  wire [31:0] ForwardingUnit_io_rd_WB; // @[core.scala 80:30]
  wire  ForwardingUnit_io_wrEn_MEM; // @[core.scala 80:30]
  wire  ForwardingUnit_io_wrEn_WB; // @[core.scala 80:30]
  wire [1:0] ForwardingUnit_io_forwardA; // @[core.scala 80:30]
  wire [1:0] ForwardingUnit_io_forwardB; // @[core.scala 80:30]
  IF IFstage ( // @[core.scala 65:25]
    .clock(IFstage_clock),
    .reset(IFstage_reset),
    .io_inst(IFstage_io_inst),
    .io_nPC(IFstage_io_nPC)
  );
  IFBarrier IFBarrier ( // @[core.scala 66:25]
    .clock(IFBarrier_clock),
    .reset(IFBarrier_reset),
    .io_flush(IFBarrier_io_flush),
    .io_inInstr(IFBarrier_io_inInstr),
    .io_outInstr(IFBarrier_io_outInstr)
  );
  ID IDstage ( // @[core.scala 68:25]
    .clock(IDstage_clock),
    .reset(IDstage_reset),
    .io_inst(IDstage_io_inst),
    .io_w_en(IDstage_io_w_en),
    .io_rd_in(IDstage_io_rd_in),
    .io_write_data(IDstage_io_write_data),
    .io_nPC(IDstage_io_nPC),
    .io_uop(IDstage_io_uop),
    .io_ALUsrc(IDstage_io_ALUsrc),
    .io_immExtnd(IDstage_io_immExtnd),
    .io_XcptInvalid(IDstage_io_XcptInvalid),
    .io_flush(IDstage_io_flush),
    .io_rd_out(IDstage_io_rd_out),
    .io_operandA(IDstage_io_operandA),
    .io_operandB(IDstage_io_operandB)
  );
  IDBarrier IDBarrier ( // @[core.scala 69:25]
    .clock(IDBarrier_clock),
    .reset(IDBarrier_reset),
    .io_inUOP(IDBarrier_io_inUOP),
    .io_inRD(IDBarrier_io_inRD),
    .io_inOperandA(IDBarrier_io_inOperandA),
    .io_inOperandB(IDBarrier_io_inOperandB),
    .io_inXcptInvalid(IDBarrier_io_inXcptInvalid),
    .io_inALUsrc(IDBarrier_io_inALUsrc),
    .io_inImmExtnd(IDBarrier_io_inImmExtnd),
    .io_rs1_ID(IDBarrier_io_rs1_ID),
    .io_rs2_ID(IDBarrier_io_rs2_ID),
    .io_rs1_EX(IDBarrier_io_rs1_EX),
    .io_rs2_EX(IDBarrier_io_rs2_EX),
    .io_outUOP(IDBarrier_io_outUOP),
    .io_outRD(IDBarrier_io_outRD),
    .io_outOperandA(IDBarrier_io_outOperandA),
    .io_outOperandB(IDBarrier_io_outOperandB),
    .io_outXcptInvalid(IDBarrier_io_outXcptInvalid),
    .io_outWrten(IDBarrier_io_outWrten),
    .io_outALUsrc(IDBarrier_io_outALUsrc),
    .io_outImmExtnd(IDBarrier_io_outImmExtnd)
  );
  EXstage EXstage ( // @[core.scala 71:25]
    .io_operandA(EXstage_io_operandA),
    .io_operandB(EXstage_io_operandB),
    .io_immExtnd(EXstage_io_immExtnd),
    .io_ALUsrc(EXstage_io_ALUsrc),
    .io_rd_in(EXstage_io_rd_in),
    .io_uop(EXstage_io_uop),
    .io_wrten_in(EXstage_io_wrten_in),
    .io_XcptInvalid(EXstage_io_XcptInvalid),
    .io_forwardSelA(EXstage_io_forwardSelA),
    .io_forwardSelB(EXstage_io_forwardSelB),
    .io_aluResultWB(EXstage_io_aluResultWB),
    .io_aluResultMEM(EXstage_io_aluResultMEM),
    .io_aluResult(EXstage_io_aluResult),
    .io_exception(EXstage_io_exception),
    .io_rd(EXstage_io_rd),
    .io_wrten(EXstage_io_wrten)
  );
  EXBarrier EXBarrier ( // @[core.scala 72:25]
    .clock(EXBarrier_clock),
    .reset(EXBarrier_reset),
    .io_inAluResult(EXBarrier_io_inAluResult),
    .io_inRD(EXBarrier_io_inRD),
    .io_inXcptInvalid(EXBarrier_io_inXcptInvalid),
    .io_inWrten(EXBarrier_io_inWrten),
    .io_outAluResult(EXBarrier_io_outAluResult),
    .io_outRD(EXBarrier_io_outRD),
    .io_outXcptInvalid(EXBarrier_io_outXcptInvalid),
    .io_outWrten(EXBarrier_io_outWrten)
  );
  EXBarrier MEMBarrier ( // @[core.scala 75:26]
    .clock(MEMBarrier_clock),
    .reset(MEMBarrier_reset),
    .io_inAluResult(MEMBarrier_io_inAluResult),
    .io_inRD(MEMBarrier_io_inRD),
    .io_inXcptInvalid(MEMBarrier_io_inXcptInvalid),
    .io_inWrten(MEMBarrier_io_inWrten),
    .io_outAluResult(MEMBarrier_io_outAluResult),
    .io_outRD(MEMBarrier_io_outRD),
    .io_outXcptInvalid(MEMBarrier_io_outXcptInvalid),
    .io_outWrten(MEMBarrier_io_outWrten)
  );
  WBstage WBstage ( // @[core.scala 77:25]
    .io_aluResult(WBstage_io_aluResult),
    .io_rd(WBstage_io_rd),
    .io_wrten(WBstage_io_wrten),
    .io_regFileReq_addr(WBstage_io_regFileReq_addr),
    .io_regFileReq_data(WBstage_io_regFileReq_data),
    .io_regFileReq_w_en(WBstage_io_regFileReq_w_en)
  );
  WBBarrier WBBarrier ( // @[core.scala 78:25]
    .clock(WBBarrier_clock),
    .reset(WBBarrier_reset),
    .io_inCheckRes(WBBarrier_io_inCheckRes),
    .io_inXcptInvalid(WBBarrier_io_inXcptInvalid),
    .io_outCheckRes(WBBarrier_io_outCheckRes),
    .io_outXcptInvalid(WBBarrier_io_outXcptInvalid)
  );
  ForwardingUnit ForwardingUnit ( // @[core.scala 80:30]
    .io_rs1_EX(ForwardingUnit_io_rs1_EX),
    .io_rs2_EX(ForwardingUnit_io_rs2_EX),
    .io_rd_MEM(ForwardingUnit_io_rd_MEM),
    .io_rd_WB(ForwardingUnit_io_rd_WB),
    .io_wrEn_MEM(ForwardingUnit_io_wrEn_MEM),
    .io_wrEn_WB(ForwardingUnit_io_wrEn_WB),
    .io_forwardA(ForwardingUnit_io_forwardA),
    .io_forwardB(ForwardingUnit_io_forwardB)
  );
  assign io_check_res = WBBarrier_io_outCheckRes; // @[core.scala 167:16]
  assign io_exception = WBBarrier_io_outXcptInvalid; // @[core.scala 168:16]
  assign IFstage_clock = clock;
  assign IFstage_reset = reset;
  assign IFstage_io_nPC = IDstage_io_nPC; // @[core.scala 83:24]
  assign IFBarrier_clock = clock;
  assign IFBarrier_reset = reset;
  assign IFBarrier_io_flush = IDstage_io_flush; // @[core.scala 89:27]
  assign IFBarrier_io_inInstr = IFstage_io_inst; // @[core.scala 87:27]
  assign IDstage_clock = clock;
  assign IDstage_reset = reset;
  assign IDstage_io_inst = IFBarrier_io_outInstr; // @[core.scala 92:27]
  assign IDstage_io_w_en = WBstage_io_regFileReq_w_en; // @[core.scala 93:27]
  assign IDstage_io_rd_in = WBstage_io_regFileReq_addr; // @[core.scala 94:27]
  assign IDstage_io_write_data = WBstage_io_regFileReq_data; // @[core.scala 95:27]
  assign IDBarrier_clock = clock;
  assign IDBarrier_reset = reset;
  assign IDBarrier_io_inUOP = IDstage_io_uop; // @[core.scala 99:33]
  assign IDBarrier_io_inRD = IDstage_io_rd_out; // @[core.scala 100:33]
  assign IDBarrier_io_inOperandA = IDstage_io_operandA; // @[core.scala 102:33]
  assign IDBarrier_io_inOperandB = IDstage_io_operandB; // @[core.scala 103:33]
  assign IDBarrier_io_inXcptInvalid = IDstage_io_XcptInvalid; // @[core.scala 101:33]
  assign IDBarrier_io_inALUsrc = IDstage_io_ALUsrc; // @[core.scala 105:33]
  assign IDBarrier_io_inImmExtnd = IDstage_io_immExtnd; // @[core.scala 106:33]
  assign IDBarrier_io_rs1_ID = IDstage_io_inst[19:15]; // @[core.scala 164:41]
  assign IDBarrier_io_rs2_ID = IDstage_io_inst[24:20]; // @[core.scala 165:41]
  assign EXstage_io_operandA = IDBarrier_io_outOperandA; // @[core.scala 113:27]
  assign EXstage_io_operandB = IDBarrier_io_outOperandB; // @[core.scala 114:27]
  assign EXstage_io_immExtnd = IDBarrier_io_outImmExtnd; // @[core.scala 118:27]
  assign EXstage_io_ALUsrc = IDBarrier_io_outALUsrc; // @[core.scala 117:27]
  assign EXstage_io_rd_in = IDBarrier_io_outRD; // @[core.scala 112:27]
  assign EXstage_io_uop = IDBarrier_io_outUOP; // @[core.scala 111:27]
  assign EXstage_io_wrten_in = IDBarrier_io_outWrten; // @[core.scala 116:27]
  assign EXstage_io_XcptInvalid = IDBarrier_io_outXcptInvalid; // @[core.scala 115:27]
  assign EXstage_io_forwardSelA = ForwardingUnit_io_forwardA; // @[core.scala 159:26]
  assign EXstage_io_forwardSelB = ForwardingUnit_io_forwardB; // @[core.scala 160:26]
  assign EXstage_io_aluResultWB = MEMBarrier_io_outAluResult; // @[core.scala 162:27]
  assign EXstage_io_aluResultMEM = EXBarrier_io_outAluResult; // @[core.scala 161:27]
  assign EXBarrier_clock = clock;
  assign EXBarrier_reset = reset;
  assign EXBarrier_io_inAluResult = EXstage_io_aluResult; // @[core.scala 123:31]
  assign EXBarrier_io_inRD = EXstage_io_rd; // @[core.scala 124:31]
  assign EXBarrier_io_inXcptInvalid = EXstage_io_exception; // @[core.scala 125:31]
  assign EXBarrier_io_inWrten = EXstage_io_wrten; // @[core.scala 126:31]
  assign MEMBarrier_clock = clock;
  assign MEMBarrier_reset = reset;
  assign MEMBarrier_io_inAluResult = EXBarrier_io_outAluResult; // @[core.scala 131:29]
  assign MEMBarrier_io_inRD = EXBarrier_io_outRD; // @[core.scala 132:29]
  assign MEMBarrier_io_inXcptInvalid = EXBarrier_io_outXcptInvalid; // @[core.scala 133:29]
  assign MEMBarrier_io_inWrten = EXBarrier_io_outWrten; // @[core.scala 134:29]
  assign WBstage_io_aluResult = MEMBarrier_io_outAluResult; // @[core.scala 139:24]
  assign WBstage_io_rd = MEMBarrier_io_outRD; // @[core.scala 141:24]
  assign WBstage_io_wrten = MEMBarrier_io_outWrten; // @[core.scala 142:24]
  assign WBBarrier_clock = clock;
  assign WBBarrier_reset = reset;
  assign WBBarrier_io_inCheckRes = WBstage_io_aluResult; // @[core.scala 146:31]
  assign WBBarrier_io_inXcptInvalid = MEMBarrier_io_outXcptInvalid; // @[core.scala 147:31]
  assign ForwardingUnit_io_rs1_EX = {{27'd0}, IDBarrier_io_rs1_EX}; // @[core.scala 150:30]
  assign ForwardingUnit_io_rs2_EX = {{27'd0}, IDBarrier_io_rs2_EX}; // @[core.scala 151:30]
  assign ForwardingUnit_io_rd_MEM = {{27'd0}, EXBarrier_io_outRD}; // @[core.scala 153:30]
  assign ForwardingUnit_io_rd_WB = {{27'd0}, MEMBarrier_io_outRD}; // @[core.scala 156:30]
  assign ForwardingUnit_io_wrEn_MEM = EXBarrier_io_outWrten; // @[core.scala 154:30]
  assign ForwardingUnit_io_wrEn_WB = MEMBarrier_io_outWrten; // @[core.scala 157:30]
endmodule
module PipelinedRV32I(
  input         clock,
  input         reset,
  output [31:0] io_result,
  output        io_exception
);
  wire  core_clock; // @[PipelinedRISCV32I.scala 25:20]
  wire  core_reset; // @[PipelinedRISCV32I.scala 25:20]
  wire [31:0] core_io_check_res; // @[PipelinedRISCV32I.scala 25:20]
  wire  core_io_exception; // @[PipelinedRISCV32I.scala 25:20]
  PipelinedRV32Icore core ( // @[PipelinedRISCV32I.scala 25:20]
    .clock(core_clock),
    .reset(core_reset),
    .io_check_res(core_io_check_res),
    .io_exception(core_io_exception)
  );
  assign io_result = core_io_check_res; // @[PipelinedRISCV32I.scala 27:16]
  assign io_exception = core_io_exception; // @[PipelinedRISCV32I.scala 28:16]
  assign core_clock = clock;
  assign core_reset = reset;
endmodule
