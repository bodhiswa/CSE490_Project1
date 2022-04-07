`timescale 1ns / 1ps
module ALU_tb;
  
  reg [7:0] rdd_tb;
  reg [7:0] rsd_tb;
  reg select_tb;

  wire [7:0] out_tb;


  
  ALU alu(.out(out_tb), .rd_data(rdd_tb), .rs_data(rsd_tb), .select(select_tb));    
     
  	always 
    	begin
          #20 
          rdd_tb = 8'b00000001;
          rsd_tb = 8'b00000001;
          select_tb = 1'b0;
          #20
          rdd_tb = 8'b00000011;
          rsd_tb = 8'b00000010;
          select_tb = 1'b1;
    	end
   	initial
    	begin
   
          $display("Time\t rs_data\t rd_data\t select\t out"); 			
          $display("----------------------------------------------------");
          $monitor("%4h %8b %8b %1b %8b", 
               		$time, rsd_tb, rdd_tb, select_tb, out_tb);
    
    	end	
  
  initial #120 $finish;

endmodule


