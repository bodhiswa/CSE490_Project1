`timescale 1ns / 1ps
module test_main;
  
  wire rs_tb;
  wire rd_tb;
  wire [7:0] rsd_tb;
  wire [7:0] rdd_tb; 
  wire [7:0] aluout_tb; 
  wire [7:0] PC_tb;
  reg CLK_tb;
  
  main dut(.rs(rs_tb), .rd(rd_tb), .rs_data(rsd_tb), .rd_data(rdd_tb), .alu_out(aluout_tb), .CLK(CLK_tb), .PC(PC_tb));
  
  initial
    begin
      CLK_tb = 0;
    end
  
  always
    begin
      #20 CLK_tb = 0;
      #20 CLK_tb = 1;
    end
 
   	initial
    	begin
   
          $display("Time\t rs\t rd\t rs_data\t rd_data\t aluout\t CLK\t PC"); 			
          $display("----------------------------------------------------");
          $monitor("%4h %8b %8b %1h %1h %2h %1h %1h", 
               		$time, rs_tb, rd_tb, rsd_tb, rdd_tb, aluout_tb, CLK_tb, PC_tb);
    
    	end	
  
  initial #300 $finish;

endmodule



