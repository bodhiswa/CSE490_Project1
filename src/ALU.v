/****************************************************************\
| Name of program: ALU.sv
| Author: AZ, JB, BM, BB
| Date Created: 03/29/2022
| Date last updated:
| Function: ALU functionality
| Modules: 8bit_ALU
\****************************************************************/

`timescale 1ns / 1ps

module ALU(out, rd_data, rs_data, select);
  input [7:0] rd_data, rs_data;  				// ALU 8-bit Inputs
  input select;
  output reg [7:0] out;
  
  initial begin
    out = 0;
  end
  
  always @(*)
    begin
      case(select)
        1'b0: 					// Addition
           out = rs_data + rd_data ; 
        1'b1: 					// Subtraction
           out = rd_data - rs_data ;
        //default: out = 8'b0 ; 
        
        endcase
    end
endmodule
