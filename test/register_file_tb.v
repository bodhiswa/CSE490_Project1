`timescale 1ns / 1ps
module test_register_file;
  
  reg [7:0] write_data;
  reg rs;
  reg rd;
  reg regSelect;
  reg immSelect;
  reg CLK;
  reg [2:0] imm;
  wire [7:0] rs_data;
  wire [7:0] rd_data;
  wire [7:0] storeData;
  
    register_file dut(.rd_data(rd_data), .rs_data(rs_data), .storeData(storeData), .rd(rd), .rs(rs), .regSelect(regSelect), .immSelect(immSelect), .imm(imm), .write_data(write_data), .CLK(CLK));
  
  initial
    begin
        write_data = 0;
        rs = 0;
        rd = 0;
        regSelect = 0;
        immSelect = 0;
        CLK = 0;
        imm = 0;      
    end
  
  always
    begin
        #20 
    end
 
   	initial
    	begin
   
          $display("Time\t out\t in\t"); 			
          $display("----------------------------------------------------");
          $monitor("%4h %8b %1b", 
               		$time, out, in);
    
    	end	
  
  initial #100 $finish;

endmodule
