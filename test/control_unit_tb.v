`timescale 1ns / 1ps
module test_control_unit;
  
  wire aluSelect;
  wire regSelect;
  wire immSelect;
  wire dataSelect;
  wire muxSelect;
  wire jumpSelect;
  
  reg [2:0] opcode;
  
  control_unit dut(.aluSelect(aluSelect), .regSelect(regSelect), .immSelect(immSelect), .dataSelect(dataSelect), .muxSelect(muxSelect), .jumpSelect(jumpSelect), .opcode(opcode));
  
  initial
    begin
      opcode = 3'b001;
    end
  
  always
    begin
      #20 opcode = 3'b001;
      #20 opcode = 3'b010;
      #20 opcode = 3'b011;
      #20 opcode = 3'b100;
      #20 opcode = 3'b101;
      #20 opcode = 3'b110;
    end
 
   //001 lw - 00 
  //010 sw - 0
  //011 jump
  //100 add
  //101 addi
  //110 sub
   	initial
    	begin
   
          $display("Time\t aluSelect\t regSelect\t immSelect\t dataSelect\t muxSelect\t jumpSelect\t opcode\t"); 			
          $display("----------------------------------------------------");
          $monitor("%4h %1b %1b %1b %1b %1b %1b %3b", 
               		$time, aluSelect, regSelect, immSelect, dataSelect, muxSelect, jumpSelect, opcode);
    
    	end	
  
  initial #120 $finish;

endmodule
