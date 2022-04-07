`timescale 1ns / 1ps

module main(rs, rd, aluSelect, regSelect, immSelect, dataSelect, mux_select, jumpSelect, opcode, CLK);
  input CLK;
  
  // prog_counter
  wire [7:0] PC;
  wire [7:0] nextPC;
  
  // instruction_memory 
  output [2:0] opcode;
  output rs;
  output rd;
  wire [4:0] address;
  wire [2:0] imm;
  
  // control_unit
  output aluSelect;
  output regSelect;
  output immSelect;
  output dataSelect;
  output jumpSelect;
  output mux_select;
  
  // register_file
  wire [7:0] rs_data;
  wire [7:0] rd_data;
  wire [7:0] storeData;
  
  // ALU
  wire [7:0] alu_out;
  
  // data_memory
  wire [7:0] data_out;
  
  // muxes
  wire [7:0] write_data;
  
  pc_inc pc(nextPC, PC, jumpSelect, address, CLK);
  ALU pc_adder(PC, 8'b00000001, nextPC, 0); // update pc  
  instruction_mem im(opcode, rd, rs, imm, address, nextPC);
  control_unit cu(aluSelect, regSelect, immSelect, dataSelect, mux_select, jumpSelect, opcode);
  register_file rf(rd_data, rs_data, storeData, rd, rs, regSelect, immSelect, imm, write_data, CLK);
  ALU alu(alu_out, rd_data, rs_data, aluSelect);
  data_memory dm(data_out, dataSelect, alu_out, storeData, CLK);  
  mux16to8 mux(alu_out, data_out, mux_select, write_data);

endmodule
