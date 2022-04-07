/* ***************************************************************\
| Name of program :
| Author: 
| Date Created:
| Date last updated:
| Function:
| Modules:
\****************************************************************/

`timescale 1ns / 1ps
module data_memory(dataOut, select, address, storeData, CLK);
  input [7:0] storeData; 
  input [7:0] address;
  input CLK;
  input select;                // select = 0 means read. select = 1 means write.
  output reg [7:0] dataOut;

  
  reg [7:0] RAM [255:0];
    
    always @(*) begin
        $readmemh("data.mem", RAM);
        case(select)
            0: dataOut = RAM[address];
            1: begin
                RAM[address] = storeData;
                $writememh("data.mem", RAM);
            end
        endcase
    end
endmodule
