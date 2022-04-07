`timescale 1ns / 1ps
module test_main;
  reg CLK;
    
  wire [2:0] opcode;
  wire rs;
  wire rd;

  
  // control_unit
  wire aluSelect;
  wire regSelect;
  wire immSelect;
  wire dataSelect;
  wire jumpSelect;
  wire mux_select;
  
  main dut(.rs(rs), .rd(rd), .aluSelect(aluSelect), .regSelect(regSelect), .immSelect(immSelect), .dataSelect(dataSelect), .mux_select(mux_select), .jumpSelect(jumpSelect), .opcode(opcode), .CLK(CLK));
  
  initial
    begin
      CLK = 0;
    end
  
  always
    begin
      #20 CLK = 1;
      #20 CLK = 0;
    end
 
   	initial
    	begin
   
          $display("Time\t rs\t rd\t aluSelect\t regSelect\t immSelect\t dataSelect\t mux_select\t jumpSelect\t opcode\t CLK"); 			
          $display("----------------------------------------------------");
          $monitor("%4h %1b %1b %1b %1b %1b %1b %1b %1b %3b %1b", 
               		$time,rs, rd, aluSelect, regSelect, immSelect, dataSelect, mux_select, jumpSelect, opcode, CLK);
    
    	end	
  
  initial #300 $finish;

endmodule

