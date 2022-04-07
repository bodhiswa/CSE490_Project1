`timescale 1ns / 1ps
module mux_tb;
  
  reg [7:0] I0_tb;
  reg [7:0] I1_tb;
  reg s_tb;

  wire [7:0] m_tb;


  
  mux16to8 mux(.I0(I0_tb), .I1(I1_tb), .s(s_tb), .m(m_tb));    
     
  	always 
    	begin
          #20 
          I0_tb = 8'b00000001;
          I1_tb = 8'b00000011;
          s_tb = 1'b0;
          #20
          I0_tb = 8'b00000001;
          I1_tb = 8'b00000010;
          s_tb = 1'b1;
          #20 
          I0_tb = 8'b00000100;
          I1_tb = 8'b00000001;
          s_tb = 1'b0;
          #20
          I0_tb = 8'b00000001;
          I1_tb = 8'b00000100;
          s_tb = 1'b1;
    	end
   	initial
    	begin
   
          $display("Time\t I0\t I1\t s\t m"); 			
          $display("----------------------------------------------------");
          $monitor("%4h %8b %8b %1b %8b", 
               		$time, I0_tb, I1_tb, s_tb, m_tb);
    
    	end	
  
  initial #120 $finish;

endmodule
