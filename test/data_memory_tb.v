`timescale 1ns / 1ps
module test_dataMemory;
  
  wire [7:0] dataOut_tb;
  reg select_tb;
  reg [7:0] address_tb;
  reg [7:0] storeData_tb;
  reg CLK_tb;
  
  data_memory dut(.dataOut(dataOut_tb), .select(select_tb), .address(address_tb), .storeData(storeData_tb), .CLK(CLK_tb));
  
  initial
    begin
      select_tb = 0; address_tb = 8'b00000000; storeData_tb = 8'h00;
    end
  
  always
    begin
      // Check reading first 6 values of data.mem
      #20 select_tb = 0; address_tb = 8'b00000000; storeData_tb = 8'h00;
      #20 select_tb = 0; address_tb = 8'b00000001; storeData_tb = 8'h00;
      #20 select_tb = 0; address_tb = 8'b00000010; storeData_tb = 8'h00;
      #20 select_tb = 0; address_tb = 8'b00000011; storeData_tb = 8'h00;
      #20 select_tb = 0; address_tb = 8'b00000100; storeData_tb = 8'h00;
      #20 select_tb = 0; address_tb = 8'b00000101; storeData_tb = 8'h00;
      
      // Write then read into a value
      #20 select_tb = 1; address_tb = 8'b00011111; storeData_tb = 8'h99;
      #20 select_tb = 0; address_tb = 8'b00011111; storeData_tb = 8'h00;
    end
 
   	initial
    	begin
   
          $display("Time\t dataOut\t select\t address\t storeData\t"); 			
          $display("----------------------------------------------------");
          $monitor("%4h %2h, %1b, %8b, %2h", 
               		$time, dataOut_tb, select_tb, address_tb, storeData_tb);
    
    	end	
  
  initial #300 $finish;
endmodule



