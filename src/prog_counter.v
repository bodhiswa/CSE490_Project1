/* ***************************************************************\
| Name of program : 
| Author: 
| Date Created:
| Date last updated:
| Function:
| Modules:
\****************************************************************/

`timescale 1ns / 1ps

module pc_inc(next, current, jumpSelect, address, CLK);
  output reg [7:0] next;
  input [7:0] current;
  input [4:0] address;
  input jumpSelect;
  input CLK;
  
  initial
    begin
      next = 8'b11111111;
    end
  
  always @(posedge CLK) begin
  	case(jumpSelect)
  	1'b0: next = current;
  	1'b1: 
  	   begin
  	      next = 0;
          next[4:0] = address-1;
       end
    endcase
  end
endmodule
