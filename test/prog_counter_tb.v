`timescale 1ns / 1ps
module test_prog_counter;
  
  wire [7:0] next;
  reg [7:0] current;
  reg [4:0] address;
  reg jumpSelect;
  reg CLK;
 
  pc_inc dut(.next(next), .current(current), .jumpSelect(jumpSelect), .address(address), .CLK(CLK));
  
  initial
    begin
      current=0;
      address=0;
      jumpSelect=0;
      CLK=0;
    end
  
  always
    begin
        #20 current=8'b00000100; CLK=0;//output next = 00000101
        #20 CLK=1;
        #20 address=8'b10000; jumpSelect=1; CLK=0; // next = 0010000
        #20 CLK=1;
        #20 current = next; CLK=0; // next = 0010001
        #20 CLK =1;
    end
 
   //001 lw - 00 
  //010 sw - 0
  //011 jump
  //100 add
  //101 addi
  //110 sub
   	initial
    	begin
   
          $display("Time\t next\t current\t jumpSelect\t address\t CLK\t"); 			
          $display("----------------------------------------------------");
          $monitor("%4h %8b %8b %1b %5b %1b", 
               		$time, next, current, jumpSelect, address, CLK);
    
    	end	
  
  initial #120 $finish;

endmodule
