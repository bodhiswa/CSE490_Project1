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
        write_data = 0; rd = 0; rs = 0; regSelect = 0; immSelect = 0; CLK = 0; imm = 3'b000;      
    end
  
  always
    begin
      // read s0 and s1
      #20 write_data = 8'b00000000; rd = 0; rs = 1; regSelect = 0; immSelect = 0; CLK = 0; imm = 3'b000;
      // write 'write_data' to s0
      #20 write_data = 8'b00000111; rd = 0; rs = 1; regSelect = 1; immSelect = 0; CLK = 1; imm = 3'b000;
      // read s0 and s1 again to make sure 'write_data' was written
      #20 write_data = 8'b00000000; rd = 0; rs = 1; regSelect = 0; immSelect = 0; CLK = 0; imm = 3'b000;
      // write 'write_data' to s1
      #20 write_data = 8'b00000011; rd = 1; rs = 1; regSelect = 1; immSelect = 0; CLK = 1; imm = 3'b000;
      // read s0 and s1 again to make sure 'write_data' was written
      #20 write_data = 8'b00000000; rd = 0; rs = 1; regSelect = 0; immSelect = 0; CLK = 0; imm = 3'b000;
      // make sure that immediate data is properly stored in rd_data
      #20 write_data = 8'b00000000; rd = 0; rs = 1; regSelect = 0; immSelect = 1; CLK = 0; imm = 3'b100;
      
    end
 
   	initial
    	begin
   
          $display("Time\t write_data\t rd\t rs\t rd_data\t rs_data\t CLK"); 			
          $display("----------------------------------------------------");
          $monitor("%4h %8b %1b %1b %8b %8b %1b", 
               		$time, write_data, rd, rs, rd_data, rs_data, CLK);
    
    	end	
  
  initial #100 $finish;

endmodule
