circuit PipelinedRV32I :
  module IF :
    input clock : Clock
    input reset : Reset
    output io : { inst : UInt<32>, pc4 : UInt<32>, flip nPC : UInt<32>, flip nPcSel : UInt<1>}

    cmem IMem : UInt<32> [4096] @[IFstage.scala 54:17]
    reg PC : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[IFstage.scala 58:21]
    node addr = shr(PC, 2) @[IFstage.scala 59:19]
    node _nPC_T = add(PC, UInt<3>("h4")) @[IFstage.scala 62:16]
    node nPC = tail(_nPC_T, 1) @[IFstage.scala 62:16]
    node _PC_T = mux(io.nPcSel, nPC, io.nPC) @[IFstage.scala 65:12]
    PC <= _PC_T @[IFstage.scala 65:6]
    io.pc4 <= nPC @[IFstage.scala 68:10]
    node _io_inst_T = bits(addr, 11, 0) @[IFstage.scala 69:23]
    infer mport io_inst_MPORT = IMem[_io_inst_T], clock @[IFstage.scala 69:18]
    io.inst <= io_inst_MPORT @[IFstage.scala 69:11]

  module IFBarrier :
    input clock : Clock
    input reset : Reset
    output io : { flip flush : UInt<1>, flip inInstr : UInt<32>, flip inPC : UInt<32>, outInstr : UInt<32>, outPC : UInt<32>}

    reg instrReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[IFbarrier.scala 41:25]
    reg pcReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[IFbarrier.scala 42:25]
    node _T = eq(io.flush, UInt<1>("h0")) @[IFbarrier.scala 44:18]
    when _T : @[IFbarrier.scala 44:30]
      instrReg <= io.inInstr @[IFbarrier.scala 45:17]
      pcReg <= io.inPC @[IFbarrier.scala 46:17]
    else :
      instrReg <= UInt<1>("h0") @[IFbarrier.scala 48:17]
      pcReg <= UInt<1>("h0") @[IFbarrier.scala 49:17]
    io.outInstr <= instrReg @[IFbarrier.scala 52:17]
    io.outPC <= pcReg @[IFbarrier.scala 53:17]

  module regFile :
    input clock : Clock
    input reset : Reset
    output io : { flip req_1 : { addr : UInt<5>}, flip req_2 : { addr : UInt<5>}, flip req_3 : { addr : UInt<5>, data : UInt<32>, w_en : UInt<1>}, resp_1 : { data : UInt<32>}, resp_2 : { data : UInt<32>}}

    wire _regFile_WIRE : UInt<32>[32] @[RegisterFile.scala 63:34]
    _regFile_WIRE[0] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[1] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[2] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[3] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[4] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[5] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[6] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[7] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[8] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[9] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[10] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[11] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[12] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[13] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[14] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[15] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[16] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[17] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[18] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[19] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[20] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[21] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[22] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[23] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[24] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[25] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[26] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[27] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[28] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[29] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[30] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    _regFile_WIRE[31] <= UInt<32>("h0") @[RegisterFile.scala 63:34]
    reg regFile : UInt<32>[32], clock with :
      reset => (reset, _regFile_WIRE) @[RegisterFile.scala 63:26]
    node _io_resp_1_data_T = eq(io.req_1.addr, UInt<1>("h0")) @[RegisterFile.scala 65:41]
    node _io_resp_1_data_T_1 = mux(_io_resp_1_data_T, UInt<1>("h0"), regFile[io.req_1.addr]) @[RegisterFile.scala 65:26]
    io.resp_1.data <= _io_resp_1_data_T_1 @[RegisterFile.scala 65:20]
    node _io_resp_2_data_T = eq(io.req_2.addr, UInt<1>("h0")) @[RegisterFile.scala 66:41]
    node _io_resp_2_data_T_1 = mux(_io_resp_2_data_T, UInt<1>("h0"), regFile[io.req_2.addr]) @[RegisterFile.scala 66:26]
    io.resp_2.data <= _io_resp_2_data_T_1 @[RegisterFile.scala 66:20]
    node _T = neq(io.req_3.addr, UInt<1>("h0")) @[RegisterFile.scala 68:41]
    node _T_1 = and(io.req_3.w_en, _T) @[RegisterFile.scala 68:24]
    when _T_1 : @[RegisterFile.scala 68:50]
      regFile[io.req_3.addr] <= io.req_3.data @[RegisterFile.scala 69:32]

  module ControlUnit :
    input clock : Clock
    input reset : Reset
    output io : { flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>, flip taken : UInt<1>, uop : UInt<5>, npcSrc : UInt<3>, bop : UInt<3>, ALUsrc : UInt<1>, immSel : UInt<2>, flush : UInt<1>, j : UInt<1>, XcptInvalid : UInt<1>}

    io.uop <= UInt<5>("h14") @[IDstage.scala 72:20]
    io.bop <= UInt<1>("h0") @[IDstage.scala 73:20]
    io.ALUsrc <= UInt<1>("h0") @[IDstage.scala 74:20]
    io.immSel <= UInt<1>("h0") @[IDstage.scala 75:20]
    io.flush <= UInt<1>("h0") @[IDstage.scala 76:20]
    io.j <= UInt<1>("h0") @[IDstage.scala 77:20]
    io.XcptInvalid <= UInt<1>("h1") @[IDstage.scala 78:20]
    node _T = eq(UInt<6>("h33"), io.opcode) @[IDstage.scala 80:22]
    when _T : @[IDstage.scala 80:22]
      node _T_1 = eq(io.funct7, UInt<1>("h0")) @[IDstage.scala 82:28]
      when _T_1 : @[IDstage.scala 82:45]
        node _T_2 = eq(UInt<1>("h0"), io.funct3) @[IDstage.scala 83:34]
        when _T_2 : @[IDstage.scala 83:34]
          io.uop <= UInt<1>("h0") @[IDstage.scala 84:42]
          io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 84:71]
        else :
          node _T_3 = eq(UInt<1>("h1"), io.funct3) @[IDstage.scala 83:34]
          when _T_3 : @[IDstage.scala 83:34]
            io.uop <= UInt<3>("h5") @[IDstage.scala 85:42]
            io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 85:71]
          else :
            node _T_4 = eq(UInt<2>("h2"), io.funct3) @[IDstage.scala 83:34]
            when _T_4 : @[IDstage.scala 83:34]
              io.uop <= UInt<4>("h8") @[IDstage.scala 86:42]
              io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 86:71]
            else :
              node _T_5 = eq(UInt<2>("h3"), io.funct3) @[IDstage.scala 83:34]
              when _T_5 : @[IDstage.scala 83:34]
                io.uop <= UInt<4>("h9") @[IDstage.scala 87:42]
                io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 87:71]
              else :
                node _T_6 = eq(UInt<3>("h4"), io.funct3) @[IDstage.scala 83:34]
                when _T_6 : @[IDstage.scala 83:34]
                  io.uop <= UInt<3>("h4") @[IDstage.scala 88:42]
                  io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 88:71]
                else :
                  node _T_7 = eq(UInt<3>("h5"), io.funct3) @[IDstage.scala 83:34]
                  when _T_7 : @[IDstage.scala 83:34]
                    io.uop <= UInt<3>("h6") @[IDstage.scala 89:42]
                    io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 89:71]
                  else :
                    node _T_8 = eq(UInt<3>("h6"), io.funct3) @[IDstage.scala 83:34]
                    when _T_8 : @[IDstage.scala 83:34]
                      io.uop <= UInt<2>("h3") @[IDstage.scala 90:42]
                      io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 90:71]
                    else :
                      node _T_9 = eq(UInt<3>("h7"), io.funct3) @[IDstage.scala 83:34]
                      when _T_9 : @[IDstage.scala 83:34]
                        io.uop <= UInt<2>("h2") @[IDstage.scala 91:42]
                        io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 91:71]
      else :
        node _T_10 = eq(io.funct7, UInt<6>("h20")) @[IDstage.scala 93:34]
        when _T_10 : @[IDstage.scala 93:51]
          node _T_11 = eq(UInt<1>("h0"), io.funct3) @[IDstage.scala 94:34]
          when _T_11 : @[IDstage.scala 94:34]
            io.uop <= UInt<1>("h1") @[IDstage.scala 95:42]
            io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 95:70]
          else :
            node _T_12 = eq(UInt<3>("h5"), io.funct3) @[IDstage.scala 94:34]
            when _T_12 : @[IDstage.scala 94:34]
              io.uop <= UInt<3>("h7") @[IDstage.scala 96:42]
              io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 96:70]
    else :
      node _T_13 = eq(UInt<5>("h13"), io.opcode) @[IDstage.scala 80:22]
      when _T_13 : @[IDstage.scala 80:22]
        io.ALUsrc <= UInt<1>("h1") @[IDstage.scala 101:23]
        node _T_14 = eq(UInt<1>("h0"), io.funct3) @[IDstage.scala 102:30]
        when _T_14 : @[IDstage.scala 102:30]
          io.uop <= UInt<4>("hb") @[IDstage.scala 103:38]
          io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 103:68]
        else :
          node _T_15 = eq(UInt<2>("h2"), io.funct3) @[IDstage.scala 102:30]
          when _T_15 : @[IDstage.scala 102:30]
            io.uop <= UInt<4>("ha") @[IDstage.scala 104:38]
            io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 104:68]
          else :
            node _T_16 = eq(UInt<2>("h3"), io.funct3) @[IDstage.scala 102:30]
            when _T_16 : @[IDstage.scala 102:30]
              io.uop <= UInt<5>("h10") @[IDstage.scala 105:38]
              io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 105:68]
            else :
              node _T_17 = eq(UInt<3>("h4"), io.funct3) @[IDstage.scala 102:30]
              when _T_17 : @[IDstage.scala 102:30]
                io.uop <= UInt<4>("hc") @[IDstage.scala 106:38]
                io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 106:68]
              else :
                node _T_18 = eq(UInt<3>("h6"), io.funct3) @[IDstage.scala 102:30]
                when _T_18 : @[IDstage.scala 102:30]
                  io.uop <= UInt<4>("hd") @[IDstage.scala 107:38]
                  io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 107:68]
                else :
                  node _T_19 = eq(UInt<3>("h7"), io.funct3) @[IDstage.scala 102:30]
                  when _T_19 : @[IDstage.scala 102:30]
                    io.uop <= UInt<4>("he") @[IDstage.scala 108:38]
                    io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 108:68]
                  else :
                    node _T_20 = eq(UInt<1>("h1"), io.funct3) @[IDstage.scala 102:30]
                    when _T_20 : @[IDstage.scala 102:30]
                      node _T_21 = eq(io.funct7, UInt<1>("h0")) @[IDstage.scala 110:36]
                      when _T_21 : @[IDstage.scala 110:53]
                        io.uop <= UInt<4>("hf") @[IDstage.scala 111:32]
                        io.immSel <= UInt<1>("h1") @[IDstage.scala 111:56]
                        io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 111:79]
                    else :
                      node _T_22 = eq(UInt<3>("h5"), io.funct3) @[IDstage.scala 102:30]
                      when _T_22 : @[IDstage.scala 102:30]
                        node _T_23 = eq(io.funct7, UInt<1>("h0")) @[IDstage.scala 115:36]
                        when _T_23 : @[IDstage.scala 115:53]
                          io.uop <= UInt<5>("h11") @[IDstage.scala 116:32]
                          io.immSel <= UInt<1>("h1") @[IDstage.scala 116:56]
                          io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 116:79]
                        else :
                          node _T_24 = eq(io.funct7, UInt<6>("h20")) @[IDstage.scala 117:42]
                          when _T_24 : @[IDstage.scala 117:59]
                            io.uop <= UInt<5>("h12") @[IDstage.scala 118:32]
                            io.immSel <= UInt<1>("h1") @[IDstage.scala 118:56]
                            io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 118:79]
      else :
        node _T_25 = eq(UInt<7>("h63"), io.opcode) @[IDstage.scala 80:22]
        when _T_25 : @[IDstage.scala 80:22]
          io.immSel <= UInt<2>("h3") @[IDstage.scala 124:23]
          node _T_26 = eq(UInt<1>("h0"), io.funct3) @[IDstage.scala 125:30]
          when _T_26 : @[IDstage.scala 125:30]
            io.bop <= UInt<1>("h0") @[IDstage.scala 126:38]
            io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 126:66]
          else :
            node _T_27 = eq(UInt<1>("h1"), io.funct3) @[IDstage.scala 125:30]
            when _T_27 : @[IDstage.scala 125:30]
              io.bop <= UInt<1>("h1") @[IDstage.scala 127:38]
              io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 127:66]
            else :
              node _T_28 = eq(UInt<3>("h4"), io.funct3) @[IDstage.scala 125:30]
              when _T_28 : @[IDstage.scala 125:30]
                io.bop <= UInt<3>("h4") @[IDstage.scala 128:38]
                io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 128:66]
              else :
                node _T_29 = eq(UInt<3>("h5"), io.funct3) @[IDstage.scala 125:30]
                when _T_29 : @[IDstage.scala 125:30]
                  io.bop <= UInt<3>("h5") @[IDstage.scala 129:38]
                  io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 129:66]
                else :
                  node _T_30 = eq(UInt<3>("h6"), io.funct3) @[IDstage.scala 125:30]
                  when _T_30 : @[IDstage.scala 125:30]
                    io.bop <= UInt<3>("h6") @[IDstage.scala 130:38]
                    io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 130:66]
                  else :
                    node _T_31 = eq(UInt<3>("h7"), io.funct3) @[IDstage.scala 125:30]
                    when _T_31 : @[IDstage.scala 125:30]
                      io.bop <= UInt<3>("h7") @[IDstage.scala 131:38]
                      io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 131:66]
          node _T_32 = eq(io.taken, UInt<1>("h1")) @[IDstage.scala 133:27]
          when _T_32 : @[IDstage.scala 133:38]
            io.npcSrc <= UInt<2>("h2") @[IDstage.scala 134:27]
            io.flush <= UInt<1>("h1") @[IDstage.scala 135:27]
        else :
          node _T_33 = eq(UInt<7>("h6f"), io.opcode) @[IDstage.scala 80:22]
          when _T_33 : @[IDstage.scala 80:22]
            io.immSel <= UInt<2>("h2") @[IDstage.scala 139:23]
            io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 140:28]
            io.npcSrc <= UInt<1>("h1") @[IDstage.scala 141:23]
            io.j <= UInt<1>("h1") @[IDstage.scala 142:23]
          else :
            node _T_34 = eq(UInt<7>("h67"), io.opcode) @[IDstage.scala 80:22]
            when _T_34 : @[IDstage.scala 80:22]
              io.XcptInvalid <= UInt<1>("h0") @[IDstage.scala 146:28]
              io.npcSrc <= UInt<1>("h1") @[IDstage.scala 147:23]
              io.j <= UInt<1>("h1") @[IDstage.scala 148:23]
    io.npcSrc <= UInt<1>("h0") @[IDstage.scala 153:15]

  module SignExtend :
    input clock : Clock
    input reset : Reset
    output io : { flip imm_in : UInt<25>, flip sel : UInt<2>, imm_out : UInt<32>}

    node _full_T = bits(io.imm_in, 24, 24) @[IDstage.scala 175:44]
    node _full_T_1 = bits(_full_T, 0, 0) @[Bitwise.scala 74:15]
    node _full_T_2 = mux(_full_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 74:12]
    node _full_T_3 = bits(io.imm_in, 24, 13) @[IDstage.scala 175:60]
    node full = cat(_full_T_2, _full_T_3) @[Cat.scala 31:58]
    node _shamt_T = bits(io.imm_in, 17, 13) @[IDstage.scala 176:46]
    node shamt = cat(UInt<27>("h0"), _shamt_T) @[Cat.scala 31:58]
    node _jump_cat_T = bits(io.imm_in, 24, 24) @[IDstage.scala 177:35]
    node _jump_cat_T_1 = bits(io.imm_in, 12, 5) @[IDstage.scala 178:31]
    node _jump_cat_T_2 = bits(io.imm_in, 13, 13) @[IDstage.scala 179:31]
    node _jump_cat_T_3 = bits(io.imm_in, 23, 14) @[IDstage.scala 180:31]
    node jump_cat_lo = cat(_jump_cat_T_2, _jump_cat_T_3) @[Cat.scala 31:58]
    node jump_cat_hi = cat(_jump_cat_T, _jump_cat_T_1) @[Cat.scala 31:58]
    node jump_cat = cat(jump_cat_hi, jump_cat_lo) @[Cat.scala 31:58]
    node _jump_imm_T = bits(jump_cat, 19, 19) @[IDstage.scala 181:43]
    node _jump_imm_T_1 = bits(_jump_imm_T, 0, 0) @[Bitwise.scala 74:15]
    node _jump_imm_T_2 = mux(_jump_imm_T_1, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 74:12]
    node jump_imm_hi = cat(_jump_imm_T_2, jump_cat) @[Cat.scala 31:58]
    node jump_imm = cat(jump_imm_hi, UInt<1>("h0")) @[Cat.scala 31:58]
    node _branch_imm_T = bits(io.imm_in, 24, 24) @[IDstage.scala 182:44]
    node _branch_imm_T_1 = bits(_branch_imm_T, 0, 0) @[Bitwise.scala 74:15]
    node _branch_imm_T_2 = mux(_branch_imm_T_1, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 74:12]
    node _branch_imm_T_3 = bits(io.imm_in, 24, 24) @[IDstage.scala 183:31]
    node _branch_imm_T_4 = bits(io.imm_in, 0, 0) @[IDstage.scala 184:31]
    node _branch_imm_T_5 = bits(io.imm_in, 23, 18) @[IDstage.scala 185:31]
    node _branch_imm_T_6 = bits(io.imm_in, 4, 1) @[IDstage.scala 186:31]
    node branch_imm_lo_hi = cat(_branch_imm_T_5, _branch_imm_T_6) @[Cat.scala 31:58]
    node branch_imm_lo = cat(branch_imm_lo_hi, UInt<1>("h0")) @[Cat.scala 31:58]
    node branch_imm_hi_hi = cat(_branch_imm_T_2, _branch_imm_T_3) @[Cat.scala 31:58]
    node branch_imm_hi = cat(branch_imm_hi_hi, _branch_imm_T_4) @[Cat.scala 31:58]
    node branch_imm = cat(branch_imm_hi, branch_imm_lo) @[Cat.scala 31:58]
    io.imm_out <= full @[IDstage.scala 189:16]
    node _T = eq(UInt<1>("h0"), io.sel) @[IDstage.scala 190:19]
    when _T : @[IDstage.scala 190:19]
      io.imm_out <= full @[IDstage.scala 192:24]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.sel) @[IDstage.scala 190:19]
      when _T_1 : @[IDstage.scala 190:19]
        io.imm_out <= shamt @[IDstage.scala 195:24]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.sel) @[IDstage.scala 190:19]
        when _T_2 : @[IDstage.scala 190:19]
          io.imm_out <= jump_imm @[IDstage.scala 198:24]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.sel) @[IDstage.scala 190:19]
          when _T_3 : @[IDstage.scala 190:19]
            io.imm_out <= branch_imm @[IDstage.scala 201:24]

  module Comparator :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<32>, flip b : UInt<32>, flip sel : UInt<3>, taken : UInt<1>}

    io.taken <= UInt<1>("h0") @[IDstage.scala 214:14]
    node _T = asUInt(UInt<1>("h0")) @[IDstage.scala 216:20]
    node _T_1 = asUInt(io.sel) @[IDstage.scala 216:20]
    node _T_2 = eq(_T, _T_1) @[IDstage.scala 216:20]
    when _T_2 : @[IDstage.scala 216:20]
      node _io_taken_T = eq(io.a, io.b) @[IDstage.scala 217:41]
      io.taken <= _io_taken_T @[IDstage.scala 217:33]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[IDstage.scala 216:20]
      node _T_4 = asUInt(io.sel) @[IDstage.scala 216:20]
      node _T_5 = eq(_T_3, _T_4) @[IDstage.scala 216:20]
      when _T_5 : @[IDstage.scala 216:20]
        node _io_taken_T_1 = neq(io.a, io.b) @[IDstage.scala 218:41]
        io.taken <= _io_taken_T_1 @[IDstage.scala 218:33]
      else :
        node _T_6 = asUInt(UInt<3>("h4")) @[IDstage.scala 216:20]
        node _T_7 = asUInt(io.sel) @[IDstage.scala 216:20]
        node _T_8 = eq(_T_6, _T_7) @[IDstage.scala 216:20]
        when _T_8 : @[IDstage.scala 216:20]
          node _io_taken_T_2 = asSInt(io.a) @[IDstage.scala 219:41]
          node _io_taken_T_3 = asSInt(io.b) @[IDstage.scala 219:55]
          node _io_taken_T_4 = lt(_io_taken_T_2, _io_taken_T_3) @[IDstage.scala 219:48]
          io.taken <= _io_taken_T_4 @[IDstage.scala 219:33]
        else :
          node _T_9 = asUInt(UInt<3>("h5")) @[IDstage.scala 216:20]
          node _T_10 = asUInt(io.sel) @[IDstage.scala 216:20]
          node _T_11 = eq(_T_9, _T_10) @[IDstage.scala 216:20]
          when _T_11 : @[IDstage.scala 216:20]
            node _io_taken_T_5 = asSInt(io.a) @[IDstage.scala 220:41]
            node _io_taken_T_6 = asSInt(io.b) @[IDstage.scala 220:56]
            node _io_taken_T_7 = geq(_io_taken_T_5, _io_taken_T_6) @[IDstage.scala 220:48]
            io.taken <= _io_taken_T_7 @[IDstage.scala 220:33]
          else :
            node _T_12 = asUInt(UInt<3>("h6")) @[IDstage.scala 216:20]
            node _T_13 = asUInt(io.sel) @[IDstage.scala 216:20]
            node _T_14 = eq(_T_12, _T_13) @[IDstage.scala 216:20]
            when _T_14 : @[IDstage.scala 216:20]
              node _io_taken_T_8 = lt(io.a, io.b) @[IDstage.scala 221:41]
              io.taken <= _io_taken_T_8 @[IDstage.scala 221:33]
            else :
              node _T_15 = asUInt(UInt<3>("h7")) @[IDstage.scala 216:20]
              node _T_16 = asUInt(io.sel) @[IDstage.scala 216:20]
              node _T_17 = eq(_T_15, _T_16) @[IDstage.scala 216:20]
              when _T_17 : @[IDstage.scala 216:20]
                node _io_taken_T_9 = geq(io.a, io.b) @[IDstage.scala 222:41]
                io.taken <= _io_taken_T_9 @[IDstage.scala 222:33]

  module ID :
    input clock : Clock
    input reset : Reset
    output io : { flip inst : UInt<32>, flip w_en : UInt<1>, flip rd_in : UInt<5>, flip write_data : UInt<32>, flip pc4_in : UInt<32>, nPC : UInt<32>, npcSrc : UInt<1>, uop : UInt<5>, wrten : UInt<1>, ALUsrc : UInt<1>, immExtnd : UInt<32>, XcptInvalid : UInt<1>, flush : UInt<1>, j : UInt<1>, rd_out : UInt<5>, operandA : UInt<32>, operandB : UInt<32>, pc4_out : UInt<32>}

    node opcode = bits(io.inst, 6, 0) @[IDstage.scala 250:25]
    node funct3 = bits(io.inst, 14, 12) @[IDstage.scala 251:25]
    node funct7 = bits(io.inst, 31, 25) @[IDstage.scala 252:25]
    node rs1 = bits(io.inst, 19, 15) @[IDstage.scala 253:25]
    node rs2 = bits(io.inst, 24, 20) @[IDstage.scala 254:25]
    node rd = bits(io.inst, 11, 7) @[IDstage.scala 255:25]
    node imm25 = bits(io.inst, 31, 7) @[IDstage.scala 256:25]
    inst rf of regFile @[IDstage.scala 258:23]
    rf.clock <= clock
    rf.reset <= reset
    inst cu of ControlUnit @[IDstage.scala 259:23]
    cu.clock <= clock
    cu.reset <= reset
    inst sigex of SignExtend @[IDstage.scala 260:23]
    sigex.clock <= clock
    sigex.reset <= reset
    inst compr of Comparator @[IDstage.scala 261:23]
    compr.clock <= clock
    compr.reset <= reset
    cu.io.opcode <= opcode @[IDstage.scala 264:19]
    cu.io.funct3 <= funct3 @[IDstage.scala 265:19]
    cu.io.funct7 <= funct7 @[IDstage.scala 266:19]
    cu.io.taken <= compr.io.taken @[IDstage.scala 267:19]
    sigex.io.imm_in <= imm25 @[IDstage.scala 270:21]
    sigex.io.sel <= cu.io.immSel @[IDstage.scala 271:21]
    rf.io.req_1.addr <= rs1 @[IDstage.scala 274:22]
    rf.io.req_2.addr <= rs2 @[IDstage.scala 275:22]
    rf.io.req_3.addr <= io.rd_in @[IDstage.scala 276:22]
    rf.io.req_3.w_en <= io.w_en @[IDstage.scala 277:22]
    rf.io.req_3.data <= io.write_data @[IDstage.scala 278:22]
    compr.io.a <= rf.io.resp_1.data @[IDstage.scala 281:18]
    compr.io.b <= rf.io.resp_2.data @[IDstage.scala 282:18]
    compr.io.sel <= cu.io.bop @[IDstage.scala 283:18]
    io.npcSrc <= cu.io.npcSrc @[IDstage.scala 286:18]
    io.nPC <= sigex.io.imm_out @[IDstage.scala 287:12]
    io.operandA <= rf.io.resp_1.data @[IDstage.scala 290:20]
    io.operandB <= rf.io.resp_2.data @[IDstage.scala 291:20]
    io.rd_out <= rd @[IDstage.scala 292:20]
    io.uop <= cu.io.uop @[IDstage.scala 293:20]
    io.XcptInvalid <= cu.io.XcptInvalid @[IDstage.scala 294:20]
    io.immExtnd <= sigex.io.imm_out @[IDstage.scala 295:20]
    io.wrten <= UInt<1>("h1") @[IDstage.scala 296:20]
    io.ALUsrc <= cu.io.ALUsrc @[IDstage.scala 297:20]
    io.j <= cu.io.j @[IDstage.scala 299:20]
    io.flush <= cu.io.flush @[IDstage.scala 300:20]
    io.pc4_out <= io.pc4_in @[IDstage.scala 301:20]

  module IDBarrier :
    input clock : Clock
    input reset : Reset
    output io : { flip inUOP : UInt<5>, flip inRD : UInt<5>, flip inOperandA : UInt<32>, flip inOperandB : UInt<32>, flip inXcptInvalid : UInt<1>, flip inWrten : UInt<1>, flip inALUsrc : UInt<1>, flip inImmExtnd : UInt<32>, flip rs1_ID : UInt<5>, flip rs2_ID : UInt<5>, flip inJ : UInt<1>, flip inPC4 : UInt<32>, rs1_EX : UInt<5>, rs2_EX : UInt<5>, outUOP : UInt<5>, outRD : UInt<5>, outOperandA : UInt<32>, outOperandB : UInt<32>, outXcptInvalid : UInt<1>, outWrten : UInt<1>, outALUsrc : UInt<1>, outImmExtnd : UInt<32>, outJ : UInt<1>, outPC4 : UInt<32>}

    reg uop : UInt<5>, clock with :
      reset => (reset, UInt<5>("h14")) @[IDbarrier.scala 73:30]
    reg XcptInvalid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[IDbarrier.scala 74:30]
    reg rd : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[IDbarrier.scala 75:30]
    reg operandA : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[IDbarrier.scala 76:30]
    reg operandB : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[IDbarrier.scala 77:30]
    reg wrten : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[IDbarrier.scala 78:30]
    reg ALUsrc : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[IDbarrier.scala 79:30]
    reg immExtnd : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[IDbarrier.scala 80:30]
    reg rs1Addr : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[IDbarrier.scala 81:30]
    reg rs2Addr : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[IDbarrier.scala 82:30]
    reg j : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[IDbarrier.scala 83:30]
    reg PC4 : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[IDbarrier.scala 84:30]
    uop <= io.inUOP @[IDbarrier.scala 86:17]
    rd <= io.inRD @[IDbarrier.scala 87:17]
    operandA <= io.inOperandA @[IDbarrier.scala 88:17]
    operandB <= io.inOperandB @[IDbarrier.scala 89:17]
    XcptInvalid <= io.inXcptInvalid @[IDbarrier.scala 90:17]
    wrten <= io.inWrten @[IDbarrier.scala 91:17]
    ALUsrc <= io.inALUsrc @[IDbarrier.scala 92:17]
    immExtnd <= io.inImmExtnd @[IDbarrier.scala 93:17]
    rs1Addr <= io.rs1_ID @[IDbarrier.scala 94:17]
    rs2Addr <= io.rs2_ID @[IDbarrier.scala 95:17]
    j <= io.inJ @[IDbarrier.scala 96:17]
    PC4 <= io.inPC4 @[IDbarrier.scala 97:17]
    io.outUOP <= uop @[IDbarrier.scala 99:24]
    io.outXcptInvalid <= XcptInvalid @[IDbarrier.scala 100:24]
    io.outRD <= rd @[IDbarrier.scala 101:24]
    io.outOperandA <= operandA @[IDbarrier.scala 102:24]
    io.outOperandB <= operandB @[IDbarrier.scala 103:24]
    io.outWrten <= wrten @[IDbarrier.scala 104:24]
    io.outALUsrc <= ALUsrc @[IDbarrier.scala 105:24]
    io.outImmExtnd <= immExtnd @[IDbarrier.scala 106:24]
    io.rs1_EX <= rs1Addr @[IDbarrier.scala 107:24]
    io.rs2_EX <= rs2Addr @[IDbarrier.scala 108:24]
    io.outJ <= j @[IDbarrier.scala 109:24]
    io.outPC4 <= PC4 @[IDbarrier.scala 110:24]

  module ALU :
    input clock : Clock
    input reset : Reset
    output io : { flip operandA : UInt<32>, flip operandB : UInt<32>, flip operation : UInt<4>, aluResult : UInt<32>}

    node shift_amount = bits(io.operandB, 4, 0) @[ALU.scala 44:33]
    io.aluResult <= UInt<1>("h0") @[ALU.scala 46:16]
    node _T = asUInt(UInt<1>("h0")) @[ALU.scala 50:24]
    node _T_1 = asUInt(io.operation) @[ALU.scala 50:24]
    node _T_2 = eq(_T, _T_1) @[ALU.scala 50:24]
    when _T_2 : @[ALU.scala 50:24]
      node _io_aluResult_T = add(io.operandA, io.operandB) @[ALU.scala 54:35]
      node _io_aluResult_T_1 = tail(_io_aluResult_T, 1) @[ALU.scala 54:35]
      io.aluResult <= _io_aluResult_T_1 @[ALU.scala 54:20]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[ALU.scala 50:24]
      node _T_4 = asUInt(io.operation) @[ALU.scala 50:24]
      node _T_5 = eq(_T_3, _T_4) @[ALU.scala 50:24]
      when _T_5 : @[ALU.scala 50:24]
        node _io_aluResult_T_2 = sub(io.operandA, io.operandB) @[ALU.scala 61:36]
        node _io_aluResult_T_3 = tail(_io_aluResult_T_2, 1) @[ALU.scala 61:36]
        io.aluResult <= _io_aluResult_T_3 @[ALU.scala 61:20]
      else :
        node _T_6 = asUInt(UInt<2>("h2")) @[ALU.scala 50:24]
        node _T_7 = asUInt(io.operation) @[ALU.scala 50:24]
        node _T_8 = eq(_T_6, _T_7) @[ALU.scala 50:24]
        when _T_8 : @[ALU.scala 50:24]
          node _io_aluResult_T_4 = and(io.operandA, io.operandB) @[ALU.scala 66:35]
          io.aluResult <= _io_aluResult_T_4 @[ALU.scala 66:20]
        else :
          node _T_9 = asUInt(UInt<2>("h3")) @[ALU.scala 50:24]
          node _T_10 = asUInt(io.operation) @[ALU.scala 50:24]
          node _T_11 = eq(_T_9, _T_10) @[ALU.scala 50:24]
          when _T_11 : @[ALU.scala 50:24]
            node _io_aluResult_T_5 = or(io.operandA, io.operandB) @[ALU.scala 71:35]
            io.aluResult <= _io_aluResult_T_5 @[ALU.scala 71:20]
          else :
            node _T_12 = asUInt(UInt<3>("h4")) @[ALU.scala 50:24]
            node _T_13 = asUInt(io.operation) @[ALU.scala 50:24]
            node _T_14 = eq(_T_12, _T_13) @[ALU.scala 50:24]
            when _T_14 : @[ALU.scala 50:24]
              node _io_aluResult_T_6 = xor(io.operandA, io.operandB) @[ALU.scala 76:35]
              io.aluResult <= _io_aluResult_T_6 @[ALU.scala 76:20]
            else :
              node _T_15 = asUInt(UInt<3>("h5")) @[ALU.scala 50:24]
              node _T_16 = asUInt(io.operation) @[ALU.scala 50:24]
              node _T_17 = eq(_T_15, _T_16) @[ALU.scala 50:24]
              when _T_17 : @[ALU.scala 50:24]
                node _io_aluResult_T_7 = dshl(io.operandA, shift_amount) @[ALU.scala 81:36]
                io.aluResult <= _io_aluResult_T_7 @[ALU.scala 81:20]
              else :
                node _T_18 = asUInt(UInt<3>("h6")) @[ALU.scala 50:24]
                node _T_19 = asUInt(io.operation) @[ALU.scala 50:24]
                node _T_20 = eq(_T_18, _T_19) @[ALU.scala 50:24]
                when _T_20 : @[ALU.scala 50:24]
                  node _io_aluResult_T_8 = dshr(io.operandA, shift_amount) @[ALU.scala 86:35]
                  io.aluResult <= _io_aluResult_T_8 @[ALU.scala 86:20]
                else :
                  node _T_21 = asUInt(UInt<3>("h7")) @[ALU.scala 50:24]
                  node _T_22 = asUInt(io.operation) @[ALU.scala 50:24]
                  node _T_23 = eq(_T_21, _T_22) @[ALU.scala 50:24]
                  when _T_23 : @[ALU.scala 50:24]
                    node _io_aluResult_T_9 = asSInt(io.operandA) @[ALU.scala 91:36]
                    node _io_aluResult_T_10 = dshr(_io_aluResult_T_9, shift_amount) @[ALU.scala 91:43]
                    node _io_aluResult_T_11 = asUInt(_io_aluResult_T_10) @[ALU.scala 91:60]
                    io.aluResult <= _io_aluResult_T_11 @[ALU.scala 91:20]
                  else :
                    node _T_24 = asUInt(UInt<4>("h8")) @[ALU.scala 50:24]
                    node _T_25 = asUInt(io.operation) @[ALU.scala 50:24]
                    node _T_26 = eq(_T_24, _T_25) @[ALU.scala 50:24]
                    when _T_26 : @[ALU.scala 50:24]
                      node _io_aluResult_T_12 = asSInt(io.operandA) @[ALU.scala 96:36]
                      node _io_aluResult_T_13 = asSInt(io.operandB) @[ALU.scala 96:57]
                      node _io_aluResult_T_14 = lt(_io_aluResult_T_12, _io_aluResult_T_13) @[ALU.scala 96:43]
                      io.aluResult <= _io_aluResult_T_14 @[ALU.scala 96:20]
                    else :
                      node _T_27 = asUInt(UInt<4>("h9")) @[ALU.scala 50:24]
                      node _T_28 = asUInt(io.operation) @[ALU.scala 50:24]
                      node _T_29 = eq(_T_27, _T_28) @[ALU.scala 50:24]
                      when _T_29 : @[ALU.scala 50:24]
                        node _io_aluResult_T_15 = lt(io.operandA, io.operandB) @[ALU.scala 101:36]
                        io.aluResult <= _io_aluResult_T_15 @[ALU.scala 101:20]

  module ALUcontrol :
    input clock : Clock
    input reset : Reset
    output io : { flip uop : UInt<5>, mapped : UInt<4>}

    io.mapped <= UInt<1>("h0") @[EXstage.scala 50:15]
    node _T = asUInt(UInt<1>("h0")) @[EXstage.scala 52:18]
    node _T_1 = asUInt(io.uop) @[EXstage.scala 52:18]
    node _T_2 = eq(_T, _T_1) @[EXstage.scala 52:18]
    node _T_3 = asUInt(UInt<4>("hb")) @[EXstage.scala 52:18]
    node _T_4 = asUInt(io.uop) @[EXstage.scala 52:18]
    node _T_5 = eq(_T_3, _T_4) @[EXstage.scala 52:18]
    node _T_6 = or(_T_2, _T_5) @[EXstage.scala 52:18]
    when _T_6 : @[EXstage.scala 52:18]
      io.mapped <= UInt<1>("h0") @[EXstage.scala 53:43]
    else :
      node _T_7 = asUInt(UInt<1>("h1")) @[EXstage.scala 52:18]
      node _T_8 = asUInt(io.uop) @[EXstage.scala 52:18]
      node _T_9 = eq(_T_7, _T_8) @[EXstage.scala 52:18]
      when _T_9 : @[EXstage.scala 52:18]
        io.mapped <= UInt<1>("h1") @[EXstage.scala 54:43]
      else :
        node _T_10 = asUInt(UInt<2>("h2")) @[EXstage.scala 52:18]
        node _T_11 = asUInt(io.uop) @[EXstage.scala 52:18]
        node _T_12 = eq(_T_10, _T_11) @[EXstage.scala 52:18]
        node _T_13 = asUInt(UInt<4>("he")) @[EXstage.scala 52:18]
        node _T_14 = asUInt(io.uop) @[EXstage.scala 52:18]
        node _T_15 = eq(_T_13, _T_14) @[EXstage.scala 52:18]
        node _T_16 = or(_T_12, _T_15) @[EXstage.scala 52:18]
        when _T_16 : @[EXstage.scala 52:18]
          io.mapped <= UInt<2>("h2") @[EXstage.scala 55:43]
        else :
          node _T_17 = asUInt(UInt<2>("h3")) @[EXstage.scala 52:18]
          node _T_18 = asUInt(io.uop) @[EXstage.scala 52:18]
          node _T_19 = eq(_T_17, _T_18) @[EXstage.scala 52:18]
          node _T_20 = asUInt(UInt<4>("hd")) @[EXstage.scala 52:18]
          node _T_21 = asUInt(io.uop) @[EXstage.scala 52:18]
          node _T_22 = eq(_T_20, _T_21) @[EXstage.scala 52:18]
          node _T_23 = or(_T_19, _T_22) @[EXstage.scala 52:18]
          when _T_23 : @[EXstage.scala 52:18]
            io.mapped <= UInt<2>("h3") @[EXstage.scala 56:43]
          else :
            node _T_24 = asUInt(UInt<3>("h4")) @[EXstage.scala 52:18]
            node _T_25 = asUInt(io.uop) @[EXstage.scala 52:18]
            node _T_26 = eq(_T_24, _T_25) @[EXstage.scala 52:18]
            node _T_27 = asUInt(UInt<4>("hc")) @[EXstage.scala 52:18]
            node _T_28 = asUInt(io.uop) @[EXstage.scala 52:18]
            node _T_29 = eq(_T_27, _T_28) @[EXstage.scala 52:18]
            node _T_30 = or(_T_26, _T_29) @[EXstage.scala 52:18]
            when _T_30 : @[EXstage.scala 52:18]
              io.mapped <= UInt<3>("h4") @[EXstage.scala 57:43]
            else :
              node _T_31 = asUInt(UInt<3>("h5")) @[EXstage.scala 52:18]
              node _T_32 = asUInt(io.uop) @[EXstage.scala 52:18]
              node _T_33 = eq(_T_31, _T_32) @[EXstage.scala 52:18]
              node _T_34 = asUInt(UInt<4>("hf")) @[EXstage.scala 52:18]
              node _T_35 = asUInt(io.uop) @[EXstage.scala 52:18]
              node _T_36 = eq(_T_34, _T_35) @[EXstage.scala 52:18]
              node _T_37 = or(_T_33, _T_36) @[EXstage.scala 52:18]
              when _T_37 : @[EXstage.scala 52:18]
                io.mapped <= UInt<3>("h5") @[EXstage.scala 58:43]
              else :
                node _T_38 = asUInt(UInt<3>("h6")) @[EXstage.scala 52:18]
                node _T_39 = asUInt(io.uop) @[EXstage.scala 52:18]
                node _T_40 = eq(_T_38, _T_39) @[EXstage.scala 52:18]
                node _T_41 = asUInt(UInt<5>("h11")) @[EXstage.scala 52:18]
                node _T_42 = asUInt(io.uop) @[EXstage.scala 52:18]
                node _T_43 = eq(_T_41, _T_42) @[EXstage.scala 52:18]
                node _T_44 = or(_T_40, _T_43) @[EXstage.scala 52:18]
                when _T_44 : @[EXstage.scala 52:18]
                  io.mapped <= UInt<3>("h6") @[EXstage.scala 59:43]
                else :
                  node _T_45 = asUInt(UInt<3>("h7")) @[EXstage.scala 52:18]
                  node _T_46 = asUInt(io.uop) @[EXstage.scala 52:18]
                  node _T_47 = eq(_T_45, _T_46) @[EXstage.scala 52:18]
                  node _T_48 = asUInt(UInt<5>("h12")) @[EXstage.scala 52:18]
                  node _T_49 = asUInt(io.uop) @[EXstage.scala 52:18]
                  node _T_50 = eq(_T_48, _T_49) @[EXstage.scala 52:18]
                  node _T_51 = or(_T_47, _T_50) @[EXstage.scala 52:18]
                  when _T_51 : @[EXstage.scala 52:18]
                    io.mapped <= UInt<3>("h7") @[EXstage.scala 60:43]
                  else :
                    node _T_52 = asUInt(UInt<4>("h8")) @[EXstage.scala 52:18]
                    node _T_53 = asUInt(io.uop) @[EXstage.scala 52:18]
                    node _T_54 = eq(_T_52, _T_53) @[EXstage.scala 52:18]
                    node _T_55 = asUInt(UInt<4>("ha")) @[EXstage.scala 52:18]
                    node _T_56 = asUInt(io.uop) @[EXstage.scala 52:18]
                    node _T_57 = eq(_T_55, _T_56) @[EXstage.scala 52:18]
                    node _T_58 = or(_T_54, _T_57) @[EXstage.scala 52:18]
                    when _T_58 : @[EXstage.scala 52:18]
                      io.mapped <= UInt<4>("h8") @[EXstage.scala 61:43]
                    else :
                      node _T_59 = asUInt(UInt<4>("h9")) @[EXstage.scala 52:18]
                      node _T_60 = asUInt(io.uop) @[EXstage.scala 52:18]
                      node _T_61 = eq(_T_59, _T_60) @[EXstage.scala 52:18]
                      node _T_62 = asUInt(UInt<5>("h10")) @[EXstage.scala 52:18]
                      node _T_63 = asUInt(io.uop) @[EXstage.scala 52:18]
                      node _T_64 = eq(_T_62, _T_63) @[EXstage.scala 52:18]
                      node _T_65 = or(_T_61, _T_64) @[EXstage.scala 52:18]
                      when _T_65 : @[EXstage.scala 52:18]
                        io.mapped <= UInt<4>("h9") @[EXstage.scala 62:43]

  module EXstage :
    input clock : Clock
    input reset : Reset
    output io : { flip operandA : UInt<32>, flip operandB : UInt<32>, flip immExtnd : UInt<32>, flip ALUsrc : UInt<1>, flip rd_in : UInt<5>, flip uop : UInt<5>, flip wrten_in : UInt<1>, flip XcptInvalid : UInt<1>, flip forwardSelA : UInt<2>, flip forwardSelB : UInt<2>, flip aluResultWB : UInt<32>, flip aluResultMEM : UInt<32>, flip j_in : UInt<1>, flip pc4_in : UInt<32>, aluResult : UInt<32>, exception : UInt<1>, rd : UInt<5>, wrten : UInt<1>, j_out : UInt<1>, pc4_out : UInt<32>}

    inst ALU of ALU @[EXstage.scala 91:26]
    ALU.clock <= clock
    ALU.reset <= reset
    inst ALUcontrol of ALUcontrol @[EXstage.scala 92:26]
    ALUcontrol.clock <= clock
    ALUcontrol.reset <= reset
    ALUcontrol.io.uop <= io.uop @[EXstage.scala 94:21]
    wire srcA : UInt<32> @[EXstage.scala 96:18]
    wire srcB : UInt<32> @[EXstage.scala 97:18]
    srcA <= io.operandA @[EXstage.scala 99:8]
    node _T = eq(UInt<2>("h2"), io.forwardSelA) @[EXstage.scala 100:26]
    when _T : @[EXstage.scala 100:26]
      srcA <= io.aluResultMEM @[EXstage.scala 101:24]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.forwardSelA) @[EXstage.scala 100:26]
      when _T_1 : @[EXstage.scala 100:26]
        srcA <= io.aluResultWB @[EXstage.scala 102:24]
    srcB <= io.operandB @[EXstage.scala 105:8]
    node _T_2 = eq(UInt<2>("h2"), io.forwardSelB) @[EXstage.scala 106:26]
    when _T_2 : @[EXstage.scala 106:26]
      srcB <= io.aluResultMEM @[EXstage.scala 107:24]
    else :
      node _T_3 = eq(UInt<1>("h1"), io.forwardSelB) @[EXstage.scala 106:26]
      when _T_3 : @[EXstage.scala 106:26]
        srcB <= io.aluResultWB @[EXstage.scala 108:24]
    ALU.io.operandA <= srcA @[EXstage.scala 111:20]
    node _ALU_io_operandB_T = mux(io.ALUsrc, io.immExtnd, srcB) @[EXstage.scala 112:26]
    ALU.io.operandB <= _ALU_io_operandB_T @[EXstage.scala 112:20]
    ALU.io.operation <= ALUcontrol.io.mapped @[EXstage.scala 113:20]
    io.aluResult <= ALU.io.aluResult @[EXstage.scala 115:16]
    io.exception <= io.XcptInvalid @[EXstage.scala 116:16]
    io.rd <= io.rd_in @[EXstage.scala 117:16]
    io.wrten <= io.wrten_in @[EXstage.scala 118:16]
    io.j_out <= io.j_in @[EXstage.scala 119:16]
    io.pc4_out <= io.pc4_in @[EXstage.scala 120:16]

  module EXBarrier :
    input clock : Clock
    input reset : Reset
    output io : { flip inAluResult : UInt<32>, flip inRD : UInt<5>, flip inXcptInvalid : UInt<1>, flip inWrten : UInt<1>, flip inJ : UInt<1>, flip inPC4 : UInt<32>, outAluResult : UInt<32>, outRD : UInt<5>, outXcptInvalid : UInt<1>, outWrten : UInt<1>, outJ : UInt<1>, outPC4 : UInt<32>}

    reg aluResult : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[EXbarrier.scala 54:30]
    reg RD : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[EXbarrier.scala 55:30]
    reg XcptInvalid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[EXbarrier.scala 56:30]
    reg wrten : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[EXbarrier.scala 57:30]
    reg j : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[EXbarrier.scala 58:30]
    reg PC4 : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[EXbarrier.scala 59:30]
    aluResult <= io.inAluResult @[EXbarrier.scala 61:17]
    RD <= io.inRD @[EXbarrier.scala 62:17]
    XcptInvalid <= io.inXcptInvalid @[EXbarrier.scala 63:17]
    wrten <= io.inWrten @[EXbarrier.scala 64:17]
    j <= io.inJ @[EXbarrier.scala 65:17]
    PC4 <= io.inPC4 @[EXbarrier.scala 66:17]
    io.outAluResult <= aluResult @[EXbarrier.scala 68:25]
    io.outRD <= RD @[EXbarrier.scala 69:25]
    io.outXcptInvalid <= XcptInvalid @[EXbarrier.scala 70:25]
    io.outWrten <= wrten @[EXbarrier.scala 71:25]
    io.outJ <= j @[EXbarrier.scala 72:25]
    io.outPC4 <= PC4 @[EXbarrier.scala 73:25]

  module MEMBarrier :
    input clock : Clock
    input reset : Reset
    output io : { flip inALUResult : UInt<32>, flip inRD : UInt<5>, flip inException : UInt<1>, flip inWrten : UInt<1>, flip inJ : UInt<1>, flip inPC4 : UInt<32>, outALUResult : UInt<32>, outRD : UInt<5>, outException : UInt<1>, outWrten : UInt<1>, outJ : UInt<1>, outPC4 : UInt<32>}

    reg aluResult : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[MEMbarrier.scala 54:28]
    reg rd : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[MEMbarrier.scala 55:28]
    reg exception : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[MEMbarrier.scala 56:28]
    reg wrten : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[MEMbarrier.scala 57:28]
    reg j : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[MEMbarrier.scala 58:28]
    reg PC4 : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[MEMbarrier.scala 59:28]
    aluResult <= io.inALUResult @[MEMbarrier.scala 61:21]
    rd <= io.inRD @[MEMbarrier.scala 62:21]
    exception <= io.inException @[MEMbarrier.scala 63:21]
    wrten <= io.inWrten @[MEMbarrier.scala 64:21]
    j <= io.inJ @[MEMbarrier.scala 65:21]
    PC4 <= io.inPC4 @[MEMbarrier.scala 66:21]
    io.outALUResult <= aluResult @[MEMbarrier.scala 68:21]
    io.outRD <= rd @[MEMbarrier.scala 69:21]
    io.outException <= exception @[MEMbarrier.scala 70:21]
    io.outWrten <= wrten @[MEMbarrier.scala 71:21]
    io.outJ <= j @[MEMbarrier.scala 72:21]
    io.outPC4 <= PC4 @[MEMbarrier.scala 73:21]

  module WBstage :
    input clock : Clock
    input reset : Reset
    output io : { flip aluResult : UInt<32>, flip pc4 : UInt<32>, flip rd : UInt<5>, flip wrten : UInt<1>, flip j : UInt<1>, regFileReq : { addr : UInt<5>, data : UInt<32>, w_en : UInt<1>}, check_res : UInt<32>}

    reg mux_out : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[WBstage.scala 61:26]
    node _T = eq(io.j, UInt<1>("h1")) @[WBstage.scala 63:16]
    when _T : @[WBstage.scala 63:27]
      mux_out <= io.pc4 @[WBstage.scala 64:17]
    else :
      mux_out <= io.aluResult @[WBstage.scala 67:17]
    io.regFileReq.addr <= io.rd @[WBstage.scala 70:24]
    io.regFileReq.data <= io.aluResult @[WBstage.scala 71:24]
    io.regFileReq.w_en <= io.wrten @[WBstage.scala 72:24]
    io.check_res <= mux_out @[WBstage.scala 73:24]

  module WBBarrier :
    input clock : Clock
    input reset : Reset
    output io : { flip inCheckRes : UInt<32>, flip inXcptInvalid : UInt<1>, outCheckRes : UInt<32>, outXcptInvalid : UInt<1>}

    reg check_res : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[WBbarrier.scala 46:26]
    reg isInvalid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[WBbarrier.scala 47:26]
    check_res <= io.inCheckRes @[WBbarrier.scala 49:13]
    isInvalid <= io.inXcptInvalid @[WBbarrier.scala 50:13]
    io.outCheckRes <= check_res @[WBbarrier.scala 52:18]
    io.outXcptInvalid <= isInvalid @[WBbarrier.scala 53:21]

  module ForwardingUnit :
    input clock : Clock
    input reset : Reset
    output io : { flip rs1_EX : UInt<32>, flip rs2_EX : UInt<32>, flip rd_MEM : UInt<32>, flip rd_WB : UInt<32>, flip wrEn_MEM : UInt<1>, flip wrEn_WB : UInt<1>, forwardA : UInt<2>, forwardB : UInt<2>}

    node _T = eq(io.rs1_EX, io.rd_MEM) @[ForwardingUnit.scala 54:19]
    node _T_1 = and(_T, io.wrEn_MEM) @[ForwardingUnit.scala 54:34]
    node _T_2 = neq(io.rs1_EX, UInt<1>("h0")) @[ForwardingUnit.scala 54:63]
    node _T_3 = and(_T_1, _T_2) @[ForwardingUnit.scala 54:49]
    when _T_3 : @[ForwardingUnit.scala 54:73]
      io.forwardA <= UInt<2>("h2") @[ForwardingUnit.scala 55:17]
    else :
      node _T_4 = eq(io.rs1_EX, io.rd_WB) @[ForwardingUnit.scala 56:25]
      node _T_5 = and(_T_4, io.wrEn_WB) @[ForwardingUnit.scala 56:39]
      node _T_6 = neq(io.rs1_EX, UInt<1>("h0")) @[ForwardingUnit.scala 56:67]
      node _T_7 = and(_T_5, _T_6) @[ForwardingUnit.scala 56:53]
      when _T_7 : @[ForwardingUnit.scala 56:77]
        io.forwardA <= UInt<1>("h1") @[ForwardingUnit.scala 57:17]
      else :
        io.forwardA <= UInt<1>("h0") @[ForwardingUnit.scala 59:17]
    node _T_8 = eq(io.rs2_EX, io.rd_MEM) @[ForwardingUnit.scala 63:19]
    node _T_9 = and(_T_8, io.wrEn_MEM) @[ForwardingUnit.scala 63:34]
    node _T_10 = neq(io.rs2_EX, UInt<1>("h0")) @[ForwardingUnit.scala 63:63]
    node _T_11 = and(_T_9, _T_10) @[ForwardingUnit.scala 63:49]
    when _T_11 : @[ForwardingUnit.scala 63:73]
      io.forwardB <= UInt<2>("h2") @[ForwardingUnit.scala 64:17]
    else :
      node _T_12 = eq(io.rs2_EX, io.rd_WB) @[ForwardingUnit.scala 65:25]
      node _T_13 = and(_T_12, io.wrEn_WB) @[ForwardingUnit.scala 65:39]
      node _T_14 = neq(io.rs2_EX, UInt<1>("h0")) @[ForwardingUnit.scala 65:67]
      node _T_15 = and(_T_13, _T_14) @[ForwardingUnit.scala 65:53]
      when _T_15 : @[ForwardingUnit.scala 65:77]
        io.forwardB <= UInt<1>("h1") @[ForwardingUnit.scala 66:17]
      else :
        io.forwardB <= UInt<1>("h0") @[ForwardingUnit.scala 68:17]

  module PipelinedRV32Icore :
    input clock : Clock
    input reset : Reset
    output io : { check_res : UInt<32>, exception : UInt<1>}

    inst IFstage of IF @[core.scala 65:25]
    IFstage.clock <= clock
    IFstage.reset <= reset
    inst IFBarrier of IFBarrier @[core.scala 66:25]
    IFBarrier.clock <= clock
    IFBarrier.reset <= reset
    inst IDstage of ID @[core.scala 68:25]
    IDstage.clock <= clock
    IDstage.reset <= reset
    inst IDBarrier of IDBarrier @[core.scala 69:25]
    IDBarrier.clock <= clock
    IDBarrier.reset <= reset
    inst EXstage of EXstage @[core.scala 71:25]
    EXstage.clock <= clock
    EXstage.reset <= reset
    inst EXBarrier of EXBarrier @[core.scala 72:25]
    EXBarrier.clock <= clock
    EXBarrier.reset <= reset
    inst MEMBarrier of MEMBarrier @[core.scala 75:26]
    MEMBarrier.clock <= clock
    MEMBarrier.reset <= reset
    inst WBstage of WBstage @[core.scala 77:25]
    WBstage.clock <= clock
    WBstage.reset <= reset
    inst WBBarrier of WBBarrier @[core.scala 78:25]
    WBBarrier.clock <= clock
    WBBarrier.reset <= reset
    inst ForwardingUnit of ForwardingUnit @[core.scala 80:30]
    ForwardingUnit.clock <= clock
    ForwardingUnit.reset <= reset
    IFstage.io.nPC <= IDstage.io.nPC @[core.scala 83:24]
    IFstage.io.nPcSel <= IDstage.io.npcSrc @[core.scala 84:24]
    IFBarrier.io.inInstr <= IFstage.io.inst @[core.scala 87:27]
    IFBarrier.io.inPC <= IFstage.io.pc4 @[core.scala 88:27]
    IFBarrier.io.flush <= IDstage.io.flush @[core.scala 89:27]
    IDstage.io.inst <= IFBarrier.io.outInstr @[core.scala 92:27]
    IDstage.io.w_en <= WBstage.io.regFileReq.w_en @[core.scala 93:27]
    IDstage.io.rd_in <= WBstage.io.regFileReq.addr @[core.scala 94:27]
    IDstage.io.write_data <= WBstage.io.regFileReq.data @[core.scala 95:27]
    IDstage.io.pc4_in <= IFBarrier.io.inPC @[core.scala 96:27]
    IDBarrier.io.inUOP <= IDstage.io.uop @[core.scala 99:33]
    IDBarrier.io.inRD <= IDstage.io.rd_out @[core.scala 100:33]
    IDBarrier.io.inXcptInvalid <= IDstage.io.XcptInvalid @[core.scala 101:33]
    IDBarrier.io.inOperandA <= IDstage.io.operandA @[core.scala 102:33]
    IDBarrier.io.inOperandB <= IDstage.io.operandB @[core.scala 103:33]
    IDBarrier.io.inWrten <= IDstage.io.wrten @[core.scala 104:33]
    IDBarrier.io.inALUsrc <= IDstage.io.ALUsrc @[core.scala 105:33]
    IDBarrier.io.inImmExtnd <= IDstage.io.immExtnd @[core.scala 106:33]
    IDBarrier.io.inJ <= IDstage.io.j @[core.scala 107:33]
    IDBarrier.io.inPC4 <= IDstage.io.pc4_out @[core.scala 108:33]
    EXstage.io.uop <= IDBarrier.io.outUOP @[core.scala 111:27]
    EXstage.io.rd_in <= IDBarrier.io.outRD @[core.scala 112:27]
    EXstage.io.operandA <= IDBarrier.io.outOperandA @[core.scala 113:27]
    EXstage.io.operandB <= IDBarrier.io.outOperandB @[core.scala 114:27]
    EXstage.io.XcptInvalid <= IDBarrier.io.outXcptInvalid @[core.scala 115:27]
    EXstage.io.wrten_in <= IDBarrier.io.outWrten @[core.scala 116:27]
    EXstage.io.ALUsrc <= IDBarrier.io.outALUsrc @[core.scala 117:27]
    EXstage.io.immExtnd <= IDBarrier.io.outImmExtnd @[core.scala 118:27]
    EXstage.io.j_in <= IDBarrier.io.outJ @[core.scala 119:27]
    EXstage.io.pc4_in <= IDBarrier.io.outPC4 @[core.scala 120:27]
    EXBarrier.io.inAluResult <= EXstage.io.aluResult @[core.scala 123:31]
    EXBarrier.io.inRD <= EXstage.io.rd @[core.scala 124:31]
    EXBarrier.io.inXcptInvalid <= EXstage.io.exception @[core.scala 125:31]
    EXBarrier.io.inWrten <= EXstage.io.wrten @[core.scala 126:31]
    EXBarrier.io.inJ <= EXstage.io.j_out @[core.scala 127:31]
    EXBarrier.io.inPC4 <= EXstage.io.pc4_out @[core.scala 128:31]
    MEMBarrier.io.inALUResult <= EXBarrier.io.outAluResult @[core.scala 131:29]
    MEMBarrier.io.inRD <= EXBarrier.io.outRD @[core.scala 132:29]
    MEMBarrier.io.inException <= EXBarrier.io.outXcptInvalid @[core.scala 133:29]
    MEMBarrier.io.inWrten <= EXBarrier.io.outWrten @[core.scala 134:29]
    MEMBarrier.io.inJ <= EXBarrier.io.outJ @[core.scala 135:29]
    MEMBarrier.io.inPC4 <= EXBarrier.io.outPC4 @[core.scala 136:29]
    WBstage.io.aluResult <= MEMBarrier.io.outALUResult @[core.scala 139:24]
    WBstage.io.pc4 <= MEMBarrier.io.outPC4 @[core.scala 140:24]
    WBstage.io.rd <= MEMBarrier.io.outRD @[core.scala 141:24]
    WBstage.io.wrten <= MEMBarrier.io.outWrten @[core.scala 142:24]
    WBstage.io.j <= MEMBarrier.io.outJ @[core.scala 143:24]
    WBBarrier.io.inCheckRes <= WBstage.io.aluResult @[core.scala 146:31]
    WBBarrier.io.inXcptInvalid <= MEMBarrier.io.outException @[core.scala 147:31]
    ForwardingUnit.io.rs1_EX <= IDBarrier.io.rs1_EX @[core.scala 150:30]
    ForwardingUnit.io.rs2_EX <= IDBarrier.io.rs2_EX @[core.scala 151:30]
    ForwardingUnit.io.rd_MEM <= EXBarrier.io.outRD @[core.scala 153:30]
    ForwardingUnit.io.wrEn_MEM <= EXBarrier.io.outWrten @[core.scala 154:30]
    ForwardingUnit.io.rd_WB <= MEMBarrier.io.outRD @[core.scala 156:30]
    ForwardingUnit.io.wrEn_WB <= MEMBarrier.io.outWrten @[core.scala 157:30]
    EXstage.io.forwardSelA <= ForwardingUnit.io.forwardA @[core.scala 159:26]
    EXstage.io.forwardSelB <= ForwardingUnit.io.forwardB @[core.scala 160:26]
    EXstage.io.aluResultMEM <= EXBarrier.io.outAluResult @[core.scala 161:27]
    EXstage.io.aluResultWB <= MEMBarrier.io.outALUResult @[core.scala 162:27]
    node _IDBarrier_io_rs1_ID_T = bits(IDstage.io.inst, 19, 15) @[core.scala 164:41]
    IDBarrier.io.rs1_ID <= _IDBarrier_io_rs1_ID_T @[core.scala 164:23]
    node _IDBarrier_io_rs2_ID_T = bits(IDstage.io.inst, 24, 20) @[core.scala 165:41]
    IDBarrier.io.rs2_ID <= _IDBarrier_io_rs2_ID_T @[core.scala 165:23]
    io.check_res <= WBBarrier.io.outCheckRes @[core.scala 167:16]
    io.exception <= WBBarrier.io.outXcptInvalid @[core.scala 168:16]

  module PipelinedRV32I :
    input clock : Clock
    input reset : UInt<1>
    output io : { result : UInt<32>, exception : UInt<1>}

    inst core of PipelinedRV32Icore @[PipelinedRISCV32I.scala 25:20]
    core.clock <= clock
    core.reset <= reset
    io.result <= core.io.check_res @[PipelinedRISCV32I.scala 27:16]
    io.exception <= core.io.exception @[PipelinedRISCV32I.scala 28:16]

