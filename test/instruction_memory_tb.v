`timescale 1ns / 1ps
module instrucmem_tb;
  
  reg [7:0] pc_tb;

  wire [2:0] opcode_tb;
  wire rd_tb;
  wire rs_tb;
  wire [4:0] add_tb;
  wire [2:0] imm_tb;


  
  instruction_mem imem(.opcode(opcode_tb), .rd(rd_tb), .rs(rs_tb), .imm(imm_tb), .address(add_tb), .pc(pc_tb));    
     
  	always 
    	begin
          #20 pc_tb = 8'b00000000;
          #20 pc_tb = 8'b00000001;
          #20 pc_tb = 8'b00000010;
          #20 pc_tb = 8'b00000011;
          #20 pc_tb = 8'b00000100;
          #20 pc_tb = 8'b00000101;
    	end
   	initial
    	begin
   
          $display("Time\t pc\t opcode\t rd\t rs\t imm\t add"); 			
          $display("----------------------------------------------------");
          $monitor("%4h %8b %8b %1b %8b", 
               		$time, pc_tb, opcode_tb, rd_tb, rs_tb, imm_tb, add_tb);
    
    	end	
  
  initial #120 $finish;

endmodule



