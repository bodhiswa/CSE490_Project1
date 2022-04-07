/* ***************************************************************\
| Name of program :
| Author: 
| Date Created:
| Date last updated:
| Function:
| Modules:
\****************************************************************/

`timescale 1ns / 1ps

module register_file(rd_data, rs_data, storeData, rd, rs, regSelect, immSelect, imm, write_data, CLK);
  
  input [7:0] write_data;
  input rs;
  input rd;
  input regSelect;
  input immSelect;
  input CLK;
  input [2:0] imm;
  output reg [7:0] rs_data;
  output reg [7:0] rd_data;
  output reg [7:0] storeData;
  
  reg [7:0] RAM [0:1];
  
  always @(CLK) begin
    $readmemh("registers.mem", RAM);
    rd_data = RAM[rd];
    rs_data = RAM[rs];
    
    if (immSelect == 1) begin
        storeData = rd_data;
        rd_data = 0; 
        rd_data[2:0] = imm;
    end
  end
  
  always @(posedge CLK) begin
  // if regSelect == 1, write to memory.
    if(regSelect == 1) begin
      RAM[rd] = write_data;
      $writememh("registers.mem", RAM);
      end
    end
endmodule
  
