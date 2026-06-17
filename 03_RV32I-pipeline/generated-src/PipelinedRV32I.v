module IF(
  input         clock,
  input         reset,
  output [31:0] io_inst
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] IMem [0:4095]; // @[IFstage.scala 48:19]
  wire  IMem_io_inst_MPORT_en; // @[IFstage.scala 48:19]
  wire [11:0] IMem_io_inst_MPORT_addr; // @[IFstage.scala 48:19]
  wire [31:0] IMem_io_inst_MPORT_data; // @[IFstage.scala 48:19]
  reg [31:0] PC; // @[IFstage.scala 51:21]
  wire [29:0] addr = PC[31:2]; // @[IFstage.scala 53:19]
  wire [31:0] _PC_T_1 = PC + 32'h4; // @[IFstage.scala 57:14]
  assign IMem_io_inst_MPORT_en = 1'h1;
  assign IMem_io_inst_MPORT_addr = addr[11:0];
  assign IMem_io_inst_MPORT_data = IMem[IMem_io_inst_MPORT_addr]; // @[IFstage.scala 48:19]
  assign io_inst = IMem_io_inst_MPORT_data; // @[IFstage.scala 55:13]
  always @(posedge clock) begin
    if (reset) begin // @[IFstage.scala 51:21]
      PC <= 32'h0; // @[IFstage.scala 51:21]
    end else begin
      PC <= _PC_T_1; // @[IFstage.scala 57:8]
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
  input  [31:0] io_inInstr,
  output [31:0] io_outInstr
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] instrReg; // @[IFbarrier.scala 38:25]
  assign io_outInstr = instrReg; // @[IFbarrier.scala 42:15]
  always @(posedge clock) begin
    if (reset) begin // @[IFbarrier.scala 38:25]
      instrReg <= 32'h0; // @[IFbarrier.scala 38:25]
    end else begin
      instrReg <= io_inInstr; // @[IFbarrier.scala 40:15]
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
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h0 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_0 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_1 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_1 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_2 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h2 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_2 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_3 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h3 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_3 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_4 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h4 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_4 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_5 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h5 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_5 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_6 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h6 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_6 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_7 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h7 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_7 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_8 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h8 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_8 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_9 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h9 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_9 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_10 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'ha == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_10 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_11 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'hb == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_11 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_12 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'hc == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_12 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_13 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'hd == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_13 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_14 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'he == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_14 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_15 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'hf == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_15 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_16 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h10 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_16 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_17 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h11 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_17 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_18 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h12 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_18 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_19 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h13 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_19 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_20 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h14 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_20 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_21 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h15 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_21 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_22 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h16 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_22 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_23 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h17 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_23 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_24 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h18 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_24 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_25 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h19 == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_25 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_26 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1a == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_26 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_27 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1b == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_27 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_28 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1c == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_28 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_29 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1d == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_29 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_30 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
      if (5'h1e == io_req_3_addr) begin // @[RegisterFile.scala 69:32]
        regFile_30 <= io_req_3_data; // @[RegisterFile.scala 69:32]
      end
    end
    if (reset) begin // @[RegisterFile.scala 63:26]
      regFile_31 <= 32'h0; // @[RegisterFile.scala 63:26]
    end else if (io_req_3_addr != 5'h0) begin // @[RegisterFile.scala 68:50]
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
module ID(
  input         clock,
  input         reset,
  input  [31:0] io_inst,
  input  [4:0]  io_rd_in,
  input  [31:0] io_write_data,
  output [4:0]  io_uop,
  output [4:0]  io_rd_out,
  output [31:0] io_operandA,
  output [31:0] io_operandB,
  output        io_XcptInvalid
);
  wire  rf_clock; // @[IDstage.scala 73:20]
  wire  rf_reset; // @[IDstage.scala 73:20]
  wire [4:0] rf_io_req_1_addr; // @[IDstage.scala 73:20]
  wire [4:0] rf_io_req_2_addr; // @[IDstage.scala 73:20]
  wire [4:0] rf_io_req_3_addr; // @[IDstage.scala 73:20]
  wire [31:0] rf_io_req_3_data; // @[IDstage.scala 73:20]
  wire [31:0] rf_io_resp_1_data; // @[IDstage.scala 73:20]
  wire [31:0] rf_io_resp_2_data; // @[IDstage.scala 73:20]
  wire [6:0] opcode = io_inst[6:0]; // @[IDstage.scala 63:26]
  wire [2:0] funct3 = io_inst[14:12]; // @[IDstage.scala 64:26]
  wire [6:0] funct7 = io_inst[31:25]; // @[IDstage.scala 65:26]
  wire [19:0] _i_imm_T_2 = io_inst[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 74:12]
  wire [31:0] i_imm = {_i_imm_T_2,io_inst[31:20]}; // @[Cat.scala 31:58]
  wire  _T_1 = funct7 == 7'h0; // @[IDstage.scala 83:25]
  wire  _T_2 = 3'h0 == funct3; // @[IDstage.scala 84:31]
  wire  _T_3 = 3'h1 == funct3; // @[IDstage.scala 84:31]
  wire  _T_4 = 3'h2 == funct3; // @[IDstage.scala 84:31]
  wire  _T_5 = 3'h3 == funct3; // @[IDstage.scala 84:31]
  wire  _T_6 = 3'h4 == funct3; // @[IDstage.scala 84:31]
  wire  _T_7 = 3'h5 == funct3; // @[IDstage.scala 84:31]
  wire  _T_8 = 3'h6 == funct3; // @[IDstage.scala 84:31]
  wire  _T_9 = 3'h7 == funct3; // @[IDstage.scala 84:31]
  wire [4:0] _GEN_0 = 3'h7 == funct3 ? 5'h2 : 5'h14; // @[IDstage.scala 84:31 92:39]
  wire  _GEN_1 = 3'h7 == funct3 ? 1'h0 : 1'h1; // @[IDstage.scala 84:31 92:65]
  wire [4:0] _GEN_2 = 3'h6 == funct3 ? 5'h3 : _GEN_0; // @[IDstage.scala 84:31 91:39]
  wire  _GEN_3 = 3'h6 == funct3 ? 1'h0 : _GEN_1; // @[IDstage.scala 84:31 91:65]
  wire [4:0] _GEN_4 = 3'h5 == funct3 ? 5'h6 : _GEN_2; // @[IDstage.scala 84:31 90:39]
  wire  _GEN_5 = 3'h5 == funct3 ? 1'h0 : _GEN_3; // @[IDstage.scala 84:31 90:65]
  wire [4:0] _GEN_6 = 3'h4 == funct3 ? 5'h4 : _GEN_4; // @[IDstage.scala 84:31 89:39]
  wire  _GEN_7 = 3'h4 == funct3 ? 1'h0 : _GEN_5; // @[IDstage.scala 84:31 89:65]
  wire [4:0] _GEN_8 = 3'h3 == funct3 ? 5'h9 : _GEN_6; // @[IDstage.scala 84:31 88:39]
  wire  _GEN_9 = 3'h3 == funct3 ? 1'h0 : _GEN_7; // @[IDstage.scala 84:31 88:65]
  wire [4:0] _GEN_10 = 3'h2 == funct3 ? 5'h8 : _GEN_8; // @[IDstage.scala 84:31 87:39]
  wire  _GEN_11 = 3'h2 == funct3 ? 1'h0 : _GEN_9; // @[IDstage.scala 84:31 87:65]
  wire [4:0] _GEN_12 = 3'h1 == funct3 ? 5'h5 : _GEN_10; // @[IDstage.scala 84:31 86:39]
  wire  _GEN_13 = 3'h1 == funct3 ? 1'h0 : _GEN_11; // @[IDstage.scala 84:31 86:65]
  wire [4:0] _GEN_14 = 3'h0 == funct3 ? 5'h0 : _GEN_12; // @[IDstage.scala 84:31 85:39]
  wire  _GEN_15 = 3'h0 == funct3 ? 1'h0 : _GEN_13; // @[IDstage.scala 84:31 85:65]
  wire  _T_10 = funct7 == 7'h20; // @[IDstage.scala 94:31]
  wire [4:0] _GEN_16 = _T_7 ? 5'h7 : 5'h14; // @[IDstage.scala 95:33 97:41]
  wire  _GEN_17 = _T_7 ? 1'h0 : 1'h1; // @[IDstage.scala 95:33 97:66]
  wire [4:0] _GEN_18 = _T_2 ? 5'h1 : _GEN_16; // @[IDstage.scala 95:33 96:41]
  wire  _GEN_19 = _T_2 ? 1'h0 : _GEN_17; // @[IDstage.scala 95:33 96:66]
  wire [4:0] _GEN_20 = funct7 == 7'h20 ? _GEN_18 : 5'h14; // @[IDstage.scala 94:48]
  wire  _GEN_21 = funct7 == 7'h20 ? _GEN_19 : 1'h1; // @[IDstage.scala 94:48]
  wire [4:0] _GEN_22 = funct7 == 7'h0 ? _GEN_14 : _GEN_20; // @[IDstage.scala 83:42]
  wire  _GEN_23 = funct7 == 7'h0 ? _GEN_15 : _GEN_21; // @[IDstage.scala 83:42]
  wire [4:0] _GEN_24 = _T_1 ? 5'hf : 5'h14; // @[IDstage.scala 109:{60,66}]
  wire  _GEN_25 = _T_1 ? 1'h0 : 1'h1; // @[IDstage.scala 109:{60,92}]
  wire [4:0] _GEN_26 = _T_10 ? 5'h12 : 5'h14; // @[IDstage.scala 112:{57,63}]
  wire  _GEN_27 = _T_10 ? 1'h0 : 1'h1; // @[IDstage.scala 112:{57,89}]
  wire [4:0] _GEN_28 = _T_1 ? 5'h11 : _GEN_26; // @[IDstage.scala 111:{50,56}]
  wire  _GEN_29 = _T_1 ? 1'h0 : _GEN_27; // @[IDstage.scala 111:{50,82}]
  wire [4:0] _GEN_30 = _T_7 ? _GEN_28 : 5'h14; // @[IDstage.scala 102:27]
  wire  _GEN_31 = _T_7 ? _GEN_29 : 1'h1; // @[IDstage.scala 102:27]
  wire [4:0] _GEN_32 = _T_3 ? _GEN_24 : _GEN_30; // @[IDstage.scala 102:27]
  wire  _GEN_33 = _T_3 ? _GEN_25 : _GEN_31; // @[IDstage.scala 102:27]
  wire [4:0] _GEN_34 = _T_9 ? 5'he : _GEN_32; // @[IDstage.scala 102:27 108:35]
  wire  _GEN_35 = _T_9 ? 1'h0 : _GEN_33; // @[IDstage.scala 102:27 108:62]
  wire [4:0] _GEN_36 = _T_8 ? 5'hd : _GEN_34; // @[IDstage.scala 102:27 107:35]
  wire  _GEN_37 = _T_8 ? 1'h0 : _GEN_35; // @[IDstage.scala 102:27 107:62]
  wire [4:0] _GEN_38 = _T_6 ? 5'hc : _GEN_36; // @[IDstage.scala 102:27 106:35]
  wire  _GEN_39 = _T_6 ? 1'h0 : _GEN_37; // @[IDstage.scala 102:27 106:62]
  wire [4:0] _GEN_40 = _T_5 ? 5'h10 : _GEN_38; // @[IDstage.scala 102:27 105:35]
  wire  _GEN_41 = _T_5 ? 1'h0 : _GEN_39; // @[IDstage.scala 102:27 105:62]
  wire [4:0] _GEN_42 = _T_4 ? 5'ha : _GEN_40; // @[IDstage.scala 102:27 104:35]
  wire  _GEN_43 = _T_4 ? 1'h0 : _GEN_41; // @[IDstage.scala 102:27 104:62]
  wire [4:0] _GEN_44 = _T_2 ? 5'hb : _GEN_42; // @[IDstage.scala 102:27 103:35]
  wire  _GEN_45 = _T_2 ? 1'h0 : _GEN_43; // @[IDstage.scala 102:27 103:62]
  wire [4:0] _GEN_46 = 7'h13 == opcode ? _GEN_44 : 5'h14; // @[IDstage.scala 81:19]
  wire  _GEN_47 = 7'h13 == opcode ? _GEN_45 : 1'h1; // @[IDstage.scala 81:19]
  regFile rf ( // @[IDstage.scala 73:20]
    .clock(rf_clock),
    .reset(rf_reset),
    .io_req_1_addr(rf_io_req_1_addr),
    .io_req_2_addr(rf_io_req_2_addr),
    .io_req_3_addr(rf_io_req_3_addr),
    .io_req_3_data(rf_io_req_3_data),
    .io_resp_1_data(rf_io_resp_1_data),
    .io_resp_2_data(rf_io_resp_2_data)
  );
  assign io_uop = 7'h33 == opcode ? _GEN_22 : _GEN_46; // @[IDstage.scala 81:19]
  assign io_rd_out = io_inst[11:7]; // @[IDstage.scala 68:26]
  assign io_operandA = rf_io_resp_1_data; // @[IDstage.scala 124:17]
  assign io_operandB = opcode == 7'h13 ? i_imm : rf_io_resp_2_data; // @[IDstage.scala 126:28 127:21 130:21]
  assign io_XcptInvalid = 7'h33 == opcode ? _GEN_23 : _GEN_47; // @[IDstage.scala 81:19]
  assign rf_clock = clock;
  assign rf_reset = reset;
  assign rf_io_req_1_addr = io_inst[19:15]; // @[IDstage.scala 66:26]
  assign rf_io_req_2_addr = io_inst[24:20]; // @[IDstage.scala 67:26]
  assign rf_io_req_3_addr = io_rd_in; // @[IDstage.scala 120:22]
  assign rf_io_req_3_data = io_write_data; // @[IDstage.scala 122:22]
endmodule
module IDBarrier(
  input         clock,
  input         reset,
  input  [4:0]  io_inUOP,
  input  [4:0]  io_inRD,
  input  [31:0] io_inOperandA,
  input  [31:0] io_inOperandB,
  input         io_inXcptInvalid,
  output [4:0]  io_outUOP,
  output [4:0]  io_outRD,
  output [31:0] io_outOperandA,
  output [31:0] io_outOperandB,
  output        io_outXcptInvalid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] uop; // @[IDbarrier.scala 59:27]
  reg  XcptInvalid; // @[IDbarrier.scala 60:31]
  reg [4:0] rd; // @[IDbarrier.scala 61:27]
  reg [31:0] operandA; // @[IDbarrier.scala 62:27]
  reg [31:0] operandB; // @[IDbarrier.scala 63:27]
  assign io_outUOP = uop; // @[IDbarrier.scala 71:24]
  assign io_outRD = rd; // @[IDbarrier.scala 73:24]
  assign io_outOperandA = operandA; // @[IDbarrier.scala 74:24]
  assign io_outOperandB = operandB; // @[IDbarrier.scala 75:24]
  assign io_outXcptInvalid = XcptInvalid; // @[IDbarrier.scala 72:24]
  always @(posedge clock) begin
    if (reset) begin // @[IDbarrier.scala 59:27]
      uop <= 5'h14; // @[IDbarrier.scala 59:27]
    end else begin
      uop <= io_inUOP; // @[IDbarrier.scala 65:17]
    end
    if (reset) begin // @[IDbarrier.scala 60:31]
      XcptInvalid <= 1'h0; // @[IDbarrier.scala 60:31]
    end else begin
      XcptInvalid <= io_inXcptInvalid; // @[IDbarrier.scala 69:17]
    end
    if (reset) begin // @[IDbarrier.scala 61:27]
      rd <= 5'h0; // @[IDbarrier.scala 61:27]
    end else begin
      rd <= io_inRD; // @[IDbarrier.scala 66:17]
    end
    if (reset) begin // @[IDbarrier.scala 62:27]
      operandA <= 32'h0; // @[IDbarrier.scala 62:27]
    end else begin
      operandA <= io_inOperandA; // @[IDbarrier.scala 67:17]
    end
    if (reset) begin // @[IDbarrier.scala 63:27]
      operandB <= 32'h0; // @[IDbarrier.scala 63:27]
    end else begin
      operandB <= io_inOperandB; // @[IDbarrier.scala 68:17]
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
  wire [4:0] shift_amount = io_operandB[4:0]; // @[ALU.scala 42:33]
  wire [31:0] _io_aluResult_T_1 = io_operandA + io_operandB; // @[ALU.scala 52:35]
  wire [31:0] _io_aluResult_T_3 = io_operandA - io_operandB; // @[ALU.scala 59:36]
  wire [31:0] _io_aluResult_T_4 = io_operandA & io_operandB; // @[ALU.scala 64:35]
  wire [31:0] _io_aluResult_T_5 = io_operandA | io_operandB; // @[ALU.scala 69:35]
  wire [31:0] _io_aluResult_T_6 = io_operandA ^ io_operandB; // @[ALU.scala 74:35]
  wire [62:0] _GEN_10 = {{31'd0}, io_operandA}; // @[ALU.scala 79:36]
  wire [62:0] _io_aluResult_T_7 = _GEN_10 << shift_amount; // @[ALU.scala 79:36]
  wire [31:0] _io_aluResult_T_8 = io_operandA >> shift_amount; // @[ALU.scala 84:35]
  wire [31:0] _io_aluResult_T_11 = $signed(io_operandA) >>> shift_amount; // @[ALU.scala 89:60]
  wire  _GEN_0 = 4'h9 == io_operation & io_operandA < io_operandB; // @[ALU.scala 44:16 48:24 99:20]
  wire  _GEN_1 = 4'h8 == io_operation ? $signed(io_operandA) < $signed(io_operandB) : _GEN_0; // @[ALU.scala 48:24 94:20]
  wire [31:0] _GEN_2 = 4'h7 == io_operation ? _io_aluResult_T_11 : {{31'd0}, _GEN_1}; // @[ALU.scala 48:24 89:20]
  wire [31:0] _GEN_3 = 4'h6 == io_operation ? _io_aluResult_T_8 : _GEN_2; // @[ALU.scala 48:24 84:20]
  wire [62:0] _GEN_4 = 4'h5 == io_operation ? _io_aluResult_T_7 : {{31'd0}, _GEN_3}; // @[ALU.scala 48:24 79:20]
  wire [62:0] _GEN_5 = 4'h4 == io_operation ? {{31'd0}, _io_aluResult_T_6} : _GEN_4; // @[ALU.scala 48:24 74:20]
  wire [62:0] _GEN_6 = 4'h3 == io_operation ? {{31'd0}, _io_aluResult_T_5} : _GEN_5; // @[ALU.scala 48:24 69:20]
  wire [62:0] _GEN_7 = 4'h2 == io_operation ? {{31'd0}, _io_aluResult_T_4} : _GEN_6; // @[ALU.scala 48:24 64:20]
  wire [62:0] _GEN_8 = 4'h1 == io_operation ? {{31'd0}, _io_aluResult_T_3} : _GEN_7; // @[ALU.scala 48:24 59:20]
  wire [62:0] _GEN_9 = 4'h0 == io_operation ? {{31'd0}, _io_aluResult_T_1} : _GEN_8; // @[ALU.scala 48:24 52:20]
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
  input  [4:0]  io_rd_in,
  input  [4:0]  io_uop,
  input         io_XcptInvalid,
  output [31:0] io_aluResult,
  output        io_exception,
  output [4:0]  io_rd
);
  wire [31:0] ALU_io_operandA; // @[EXstage.scala 78:26]
  wire [31:0] ALU_io_operandB; // @[EXstage.scala 78:26]
  wire [3:0] ALU_io_operation; // @[EXstage.scala 78:26]
  wire [31:0] ALU_io_aluResult; // @[EXstage.scala 78:26]
  wire [4:0] ALUcontrol_io_uop; // @[EXstage.scala 79:26]
  wire [3:0] ALUcontrol_io_mapped; // @[EXstage.scala 79:26]
  ALU ALU ( // @[EXstage.scala 78:26]
    .io_operandA(ALU_io_operandA),
    .io_operandB(ALU_io_operandB),
    .io_operation(ALU_io_operation),
    .io_aluResult(ALU_io_aluResult)
  );
  ALUcontrol ALUcontrol ( // @[EXstage.scala 79:26]
    .io_uop(ALUcontrol_io_uop),
    .io_mapped(ALUcontrol_io_mapped)
  );
  assign io_aluResult = ALU_io_aluResult; // @[EXstage.scala 86:16]
  assign io_exception = io_XcptInvalid; // @[EXstage.scala 87:16]
  assign io_rd = io_rd_in; // @[EXstage.scala 88:16]
  assign ALU_io_operandA = io_operandA; // @[EXstage.scala 82:21]
  assign ALU_io_operandB = io_operandB; // @[EXstage.scala 83:21]
  assign ALU_io_operation = ALUcontrol_io_mapped; // @[EXstage.scala 84:21]
  assign ALUcontrol_io_uop = io_uop; // @[EXstage.scala 81:21]
endmodule
module EXBarrier(
  input         clock,
  input         reset,
  input  [31:0] io_inAluResult,
  input  [4:0]  io_inRD,
  input         io_inXcptInvalid,
  output [31:0] io_outAluResult,
  output [4:0]  io_outRD,
  output        io_outXcptInvalid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] aluResult; // @[EXbarrier.scala 51:30]
  reg [4:0] RD; // @[EXbarrier.scala 52:30]
  reg  XcptInvalid; // @[EXbarrier.scala 53:30]
  assign io_outAluResult = aluResult; // @[EXbarrier.scala 59:25]
  assign io_outRD = RD; // @[EXbarrier.scala 60:25]
  assign io_outXcptInvalid = XcptInvalid; // @[EXbarrier.scala 61:25]
  always @(posedge clock) begin
    if (reset) begin // @[EXbarrier.scala 51:30]
      aluResult <= 32'h0; // @[EXbarrier.scala 51:30]
    end else begin
      aluResult <= io_inAluResult; // @[EXbarrier.scala 55:17]
    end
    if (reset) begin // @[EXbarrier.scala 52:30]
      RD <= 5'h0; // @[EXbarrier.scala 52:30]
    end else begin
      RD <= io_inRD; // @[EXbarrier.scala 56:17]
    end
    if (reset) begin // @[EXbarrier.scala 53:30]
      XcptInvalid <= 1'h0; // @[EXbarrier.scala 53:30]
    end else begin
      XcptInvalid <= io_inXcptInvalid; // @[EXbarrier.scala 57:17]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MEMBarrier(
  input         clock,
  input         reset,
  input  [31:0] io_inALUResult,
  input  [31:0] io_inRD,
  input         io_inException,
  output [31:0] io_outALUResult,
  output [31:0] io_outRD,
  output        io_outException
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] aluResult; // @[MEMbarrier.scala 50:28]
  reg [31:0] rd; // @[MEMbarrier.scala 51:28]
  reg  exception; // @[MEMbarrier.scala 52:28]
  assign io_outALUResult = aluResult; // @[MEMbarrier.scala 58:21]
  assign io_outRD = rd; // @[MEMbarrier.scala 59:21]
  assign io_outException = exception; // @[MEMbarrier.scala 60:21]
  always @(posedge clock) begin
    if (reset) begin // @[MEMbarrier.scala 50:28]
      aluResult <= 32'h0; // @[MEMbarrier.scala 50:28]
    end else begin
      aluResult <= io_inALUResult; // @[MEMbarrier.scala 54:21]
    end
    if (reset) begin // @[MEMbarrier.scala 51:28]
      rd <= 32'h0; // @[MEMbarrier.scala 51:28]
    end else begin
      rd <= io_inRD; // @[MEMbarrier.scala 55:21]
    end
    if (reset) begin // @[MEMbarrier.scala 52:28]
      exception <= 1'h0; // @[MEMbarrier.scala 52:28]
    end else begin
      exception <= io_inException; // @[MEMbarrier.scala 56:21]
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
  rd = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  exception = _RAND_2[0:0];
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
  output [4:0]  io_regFileReq_addr,
  output [31:0] io_regFileReq_data
);
  assign io_regFileReq_addr = io_rd; // @[WBstage.scala 58:25]
  assign io_regFileReq_data = io_aluResult; // @[WBstage.scala 59:25]
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
module PipelinedRV32Icore(
  input         clock,
  input         reset,
  output [31:0] io_check_res,
  output        io_exception
);
  wire  IFstage_clock; // @[core.scala 66:25]
  wire  IFstage_reset; // @[core.scala 66:25]
  wire [31:0] IFstage_io_inst; // @[core.scala 66:25]
  wire  IFBarrier_clock; // @[core.scala 67:27]
  wire  IFBarrier_reset; // @[core.scala 67:27]
  wire [31:0] IFBarrier_io_inInstr; // @[core.scala 67:27]
  wire [31:0] IFBarrier_io_outInstr; // @[core.scala 67:27]
  wire  IDstage_clock; // @[core.scala 69:25]
  wire  IDstage_reset; // @[core.scala 69:25]
  wire [31:0] IDstage_io_inst; // @[core.scala 69:25]
  wire [4:0] IDstage_io_rd_in; // @[core.scala 69:25]
  wire [31:0] IDstage_io_write_data; // @[core.scala 69:25]
  wire [4:0] IDstage_io_uop; // @[core.scala 69:25]
  wire [4:0] IDstage_io_rd_out; // @[core.scala 69:25]
  wire [31:0] IDstage_io_operandA; // @[core.scala 69:25]
  wire [31:0] IDstage_io_operandB; // @[core.scala 69:25]
  wire  IDstage_io_XcptInvalid; // @[core.scala 69:25]
  wire  IDBarrier_clock; // @[core.scala 70:27]
  wire  IDBarrier_reset; // @[core.scala 70:27]
  wire [4:0] IDBarrier_io_inUOP; // @[core.scala 70:27]
  wire [4:0] IDBarrier_io_inRD; // @[core.scala 70:27]
  wire [31:0] IDBarrier_io_inOperandA; // @[core.scala 70:27]
  wire [31:0] IDBarrier_io_inOperandB; // @[core.scala 70:27]
  wire  IDBarrier_io_inXcptInvalid; // @[core.scala 70:27]
  wire [4:0] IDBarrier_io_outUOP; // @[core.scala 70:27]
  wire [4:0] IDBarrier_io_outRD; // @[core.scala 70:27]
  wire [31:0] IDBarrier_io_outOperandA; // @[core.scala 70:27]
  wire [31:0] IDBarrier_io_outOperandB; // @[core.scala 70:27]
  wire  IDBarrier_io_outXcptInvalid; // @[core.scala 70:27]
  wire [31:0] EXstage_io_operandA; // @[core.scala 72:25]
  wire [31:0] EXstage_io_operandB; // @[core.scala 72:25]
  wire [4:0] EXstage_io_rd_in; // @[core.scala 72:25]
  wire [4:0] EXstage_io_uop; // @[core.scala 72:25]
  wire  EXstage_io_XcptInvalid; // @[core.scala 72:25]
  wire [31:0] EXstage_io_aluResult; // @[core.scala 72:25]
  wire  EXstage_io_exception; // @[core.scala 72:25]
  wire [4:0] EXstage_io_rd; // @[core.scala 72:25]
  wire  EXBarrier_clock; // @[core.scala 73:27]
  wire  EXBarrier_reset; // @[core.scala 73:27]
  wire [31:0] EXBarrier_io_inAluResult; // @[core.scala 73:27]
  wire [4:0] EXBarrier_io_inRD; // @[core.scala 73:27]
  wire  EXBarrier_io_inXcptInvalid; // @[core.scala 73:27]
  wire [31:0] EXBarrier_io_outAluResult; // @[core.scala 73:27]
  wire [4:0] EXBarrier_io_outRD; // @[core.scala 73:27]
  wire  EXBarrier_io_outXcptInvalid; // @[core.scala 73:27]
  wire  MEMBarrier_clock; // @[core.scala 76:28]
  wire  MEMBarrier_reset; // @[core.scala 76:28]
  wire [31:0] MEMBarrier_io_inALUResult; // @[core.scala 76:28]
  wire [31:0] MEMBarrier_io_inRD; // @[core.scala 76:28]
  wire  MEMBarrier_io_inException; // @[core.scala 76:28]
  wire [31:0] MEMBarrier_io_outALUResult; // @[core.scala 76:28]
  wire [31:0] MEMBarrier_io_outRD; // @[core.scala 76:28]
  wire  MEMBarrier_io_outException; // @[core.scala 76:28]
  wire [31:0] WBstage_io_aluResult; // @[core.scala 78:27]
  wire [4:0] WBstage_io_rd; // @[core.scala 78:27]
  wire [4:0] WBstage_io_regFileReq_addr; // @[core.scala 78:27]
  wire [31:0] WBstage_io_regFileReq_data; // @[core.scala 78:27]
  wire  WBBarrier_clock; // @[core.scala 79:27]
  wire  WBBarrier_reset; // @[core.scala 79:27]
  wire [31:0] WBBarrier_io_inCheckRes; // @[core.scala 79:27]
  wire  WBBarrier_io_inXcptInvalid; // @[core.scala 79:27]
  wire [31:0] WBBarrier_io_outCheckRes; // @[core.scala 79:27]
  wire  WBBarrier_io_outXcptInvalid; // @[core.scala 79:27]
  IF IFstage ( // @[core.scala 66:25]
    .clock(IFstage_clock),
    .reset(IFstage_reset),
    .io_inst(IFstage_io_inst)
  );
  IFBarrier IFBarrier ( // @[core.scala 67:27]
    .clock(IFBarrier_clock),
    .reset(IFBarrier_reset),
    .io_inInstr(IFBarrier_io_inInstr),
    .io_outInstr(IFBarrier_io_outInstr)
  );
  ID IDstage ( // @[core.scala 69:25]
    .clock(IDstage_clock),
    .reset(IDstage_reset),
    .io_inst(IDstage_io_inst),
    .io_rd_in(IDstage_io_rd_in),
    .io_write_data(IDstage_io_write_data),
    .io_uop(IDstage_io_uop),
    .io_rd_out(IDstage_io_rd_out),
    .io_operandA(IDstage_io_operandA),
    .io_operandB(IDstage_io_operandB),
    .io_XcptInvalid(IDstage_io_XcptInvalid)
  );
  IDBarrier IDBarrier ( // @[core.scala 70:27]
    .clock(IDBarrier_clock),
    .reset(IDBarrier_reset),
    .io_inUOP(IDBarrier_io_inUOP),
    .io_inRD(IDBarrier_io_inRD),
    .io_inOperandA(IDBarrier_io_inOperandA),
    .io_inOperandB(IDBarrier_io_inOperandB),
    .io_inXcptInvalid(IDBarrier_io_inXcptInvalid),
    .io_outUOP(IDBarrier_io_outUOP),
    .io_outRD(IDBarrier_io_outRD),
    .io_outOperandA(IDBarrier_io_outOperandA),
    .io_outOperandB(IDBarrier_io_outOperandB),
    .io_outXcptInvalid(IDBarrier_io_outXcptInvalid)
  );
  EXstage EXstage ( // @[core.scala 72:25]
    .io_operandA(EXstage_io_operandA),
    .io_operandB(EXstage_io_operandB),
    .io_rd_in(EXstage_io_rd_in),
    .io_uop(EXstage_io_uop),
    .io_XcptInvalid(EXstage_io_XcptInvalid),
    .io_aluResult(EXstage_io_aluResult),
    .io_exception(EXstage_io_exception),
    .io_rd(EXstage_io_rd)
  );
  EXBarrier EXBarrier ( // @[core.scala 73:27]
    .clock(EXBarrier_clock),
    .reset(EXBarrier_reset),
    .io_inAluResult(EXBarrier_io_inAluResult),
    .io_inRD(EXBarrier_io_inRD),
    .io_inXcptInvalid(EXBarrier_io_inXcptInvalid),
    .io_outAluResult(EXBarrier_io_outAluResult),
    .io_outRD(EXBarrier_io_outRD),
    .io_outXcptInvalid(EXBarrier_io_outXcptInvalid)
  );
  MEMBarrier MEMBarrier ( // @[core.scala 76:28]
    .clock(MEMBarrier_clock),
    .reset(MEMBarrier_reset),
    .io_inALUResult(MEMBarrier_io_inALUResult),
    .io_inRD(MEMBarrier_io_inRD),
    .io_inException(MEMBarrier_io_inException),
    .io_outALUResult(MEMBarrier_io_outALUResult),
    .io_outRD(MEMBarrier_io_outRD),
    .io_outException(MEMBarrier_io_outException)
  );
  WBstage WBstage ( // @[core.scala 78:27]
    .io_aluResult(WBstage_io_aluResult),
    .io_rd(WBstage_io_rd),
    .io_regFileReq_addr(WBstage_io_regFileReq_addr),
    .io_regFileReq_data(WBstage_io_regFileReq_data)
  );
  WBBarrier WBBarrier ( // @[core.scala 79:27]
    .clock(WBBarrier_clock),
    .reset(WBBarrier_reset),
    .io_inCheckRes(WBBarrier_io_inCheckRes),
    .io_inXcptInvalid(WBBarrier_io_inXcptInvalid),
    .io_outCheckRes(WBBarrier_io_outCheckRes),
    .io_outXcptInvalid(WBBarrier_io_outXcptInvalid)
  );
  assign io_check_res = WBBarrier_io_outCheckRes; // @[core.scala 120:18]
  assign io_exception = WBBarrier_io_outXcptInvalid; // @[core.scala 121:18]
  assign IFstage_clock = clock;
  assign IFstage_reset = reset;
  assign IFBarrier_clock = clock;
  assign IFBarrier_reset = reset;
  assign IFBarrier_io_inInstr = IFstage_io_inst; // @[core.scala 82:29]
  assign IDstage_clock = clock;
  assign IDstage_reset = reset;
  assign IDstage_io_inst = IFBarrier_io_outInstr; // @[core.scala 85:29]
  assign IDstage_io_rd_in = WBstage_io_regFileReq_addr; // @[core.scala 87:29]
  assign IDstage_io_write_data = WBstage_io_regFileReq_data; // @[core.scala 88:29]
  assign IDBarrier_clock = clock;
  assign IDBarrier_reset = reset;
  assign IDBarrier_io_inUOP = IDstage_io_uop; // @[core.scala 91:33]
  assign IDBarrier_io_inRD = IDstage_io_rd_out; // @[core.scala 92:33]
  assign IDBarrier_io_inOperandA = IDstage_io_operandA; // @[core.scala 94:33]
  assign IDBarrier_io_inOperandB = IDstage_io_operandB; // @[core.scala 95:33]
  assign IDBarrier_io_inXcptInvalid = IDstage_io_XcptInvalid; // @[core.scala 93:33]
  assign EXstage_io_operandA = IDBarrier_io_outOperandA; // @[core.scala 100:29]
  assign EXstage_io_operandB = IDBarrier_io_outOperandB; // @[core.scala 101:29]
  assign EXstage_io_rd_in = IDBarrier_io_outRD; // @[core.scala 99:29]
  assign EXstage_io_uop = IDBarrier_io_outUOP; // @[core.scala 98:29]
  assign EXstage_io_XcptInvalid = IDBarrier_io_outXcptInvalid; // @[core.scala 102:29]
  assign EXBarrier_clock = clock;
  assign EXBarrier_reset = reset;
  assign EXBarrier_io_inAluResult = EXstage_io_aluResult; // @[core.scala 104:33]
  assign EXBarrier_io_inRD = EXstage_io_rd; // @[core.scala 105:33]
  assign EXBarrier_io_inXcptInvalid = EXstage_io_exception; // @[core.scala 106:33]
  assign MEMBarrier_clock = clock;
  assign MEMBarrier_reset = reset;
  assign MEMBarrier_io_inALUResult = EXBarrier_io_outAluResult; // @[core.scala 109:31]
  assign MEMBarrier_io_inRD = {{27'd0}, EXBarrier_io_outRD}; // @[core.scala 110:31]
  assign MEMBarrier_io_inException = EXBarrier_io_outXcptInvalid; // @[core.scala 111:31]
  assign WBstage_io_aluResult = MEMBarrier_io_outALUResult; // @[core.scala 114:26]
  assign WBstage_io_rd = MEMBarrier_io_outRD[4:0]; // @[core.scala 115:26]
  assign WBBarrier_clock = clock;
  assign WBBarrier_reset = reset;
  assign WBBarrier_io_inCheckRes = WBstage_io_aluResult; // @[core.scala 117:33]
  assign WBBarrier_io_inXcptInvalid = MEMBarrier_io_outException; // @[core.scala 118:33]
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
