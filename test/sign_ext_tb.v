`timescale 1ns / 1ps
module test_sign_ext;
  
    
  reg in;
  wire [7:0] out;
  sign_ext dut(.out(out), .in(in));
  
  initial
    begin
        in=0;
    end
  
  always
    begin
        #20 in = 0;
        #20 in = 1;
        #20 in = 0;
        #20 in = 1;
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
