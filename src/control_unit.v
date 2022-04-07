/* ***************************************************************\
| Name of program :
| Author: 
| Date Created:
| Date last updated:
| Function:
| Modules:
\****************************************************************/

`timescale 1ns / 1ps

module control_unit(aluSelect, regSelect, immSelect, dataSelect, muxSelect, jumpSelect, opcode);
  
  input [2:0] opcode;
  output reg aluSelect;
  output reg regSelect;
  output reg immSelect;
  output reg dataSelect;
  output reg muxSelect;
  output reg jumpSelect;
  
  initial begin
    aluSelect = 0;
    regSelect = 0;
    immSelect = 0;
    dataSelect = 0;
    muxSelect = 0;
    jumpSelect = 0;
  end
  
  //001 lw - 00 
  //010 sw - 0
  //011 jump
  //100 add
  //101 addi
  //110 sub
  always @(*)
    begin
    case(opcode)
      3'b001: begin // lw
        aluSelect = 1'b0;
        regSelect = 1'b1;
        immSelect = 1'b1;
        dataSelect = 1'b0;
        muxSelect = 1'b1; // if muxSelect is 1, use data_memory
        jumpSelect = 1'b0;
      end
      3'b010: begin // sw
        aluSelect = 1'b0;
        regSelect = 1'b0;
        immSelect = 1'b1;
        dataSelect = 1'b1;
        muxSelect = 1'b1;
        jumpSelect = 1'b0;
      end
      3'b011: begin // jump
        aluSelect = 1'b0;
        regSelect = 1'b0;
        immSelect = 1'b0;
        dataSelect = 1'b0;
        muxSelect = 1'b0;
        jumpSelect = 1'b1;
      end
      3'b100: begin // add
        aluSelect = 1'b0;
        regSelect = 1'b1;
        immSelect = 1'b0;
        dataSelect = 1'b0;
        muxSelect = 1'b0; // if muxSelect is 0, use alu_out
        jumpSelect = 1'b0;
      end
      3'b101: begin // addi
        aluSelect = 1'b0;
        regSelect = 1'b1;
        immSelect = 1'b1;
        dataSelect = 1'b0; 
        muxSelect = 1'b0; 
        jumpSelect = 1'b0;
      end
      3'b110: begin // sub
        aluSelect = 1'b1;
        regSelect = 1'b1;
        immSelect = 1'b0;
        dataSelect = 1'b0; 
        muxSelect = 1'b0;
        jumpSelect = 1'b0;
      end
    endcase
  end
endmodule
