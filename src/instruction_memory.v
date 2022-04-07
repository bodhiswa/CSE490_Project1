/* ***************************************************************\
| Name of program :
| Author: 
| Date Created:
| Date last updated:
| Function:
| Modules:
\****************************************************************/

`timescale 1ns / 1ps

module instruction_mem(opcode, rd, rs, imm, address, pc);
  input  [7:0] pc;
  reg [7:0] instruction;
  reg [7:0] RAM [255:0];
  output reg [2:0] opcode;
  output reg rd;
  output reg rs;
  output reg [4:0] address;
  output reg [2:0] imm;

  initial
    begin
      $readmemb("instruction.mem", RAM);	// initialize memory
    end
  
  always @(*) begin
  	instruction = RAM[pc]; 						// word aligned
    opcode = instruction[7:5];
    rd = instruction[4];
    rs = instruction[3];
    imm = instruction[2:0];
    address = instruction[4:0];
  
  end
endmodule
