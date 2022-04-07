/* ***************************************************************\
| Name of program: muxes.sv
| Author: 
| Date Created:
| Date last updated:
| Function:
| Modules:
\****************************************************************/

`timescale 1ns / 1ps

module mux2to1(I0, I1, s, m);
  input I0, I1; //establishing x and y are representing the inputs to select from
  input s; //establishing s represents the input that is the selector for the mux
  output m; //establishing that the output of the mux will be connected to m
  
  wire s_not; //creating an internal connection element for the s_not signal
  
  not(s_not,s); //implementing the not gate that takes the input s and nots it
  
  wire p1, p2; //these are intermediates to represent the result of each and gate
  //the choice of p comes from the idea that and is a product operation, so these are product terms
  
  //implement the and gates in the diagram
  and(p1,I0,s_not);
  and(p2,I1,s);
  
  //produce the outcome m by implementing the or gate
  or(m, p1,p2);
  
endmodule

module mux16to8(I0, I1, s, m);
    input [7:0] I0;
    input [7:0] I1;
    input s;
    output [7:0] m; 
    
    mux2to1 mux1(I0[0], I1[0], s, m[0]);
    mux2to1 mux2(I0[1], I1[1], s, m[1]);
    mux2to1 mux3(I0[2], I1[2], s, m[2]);
    mux2to1 mux4(I0[3], I1[3], s, m[3]);
    mux2to1 mux5(I0[4], I1[4], s, m[4]);
    mux2to1 mux6(I0[5], I1[5], s, m[5]);
    mux2to1 mux7(I0[6], I1[6], s, m[6]);
    mux2to1 mux8(I0[7], I1[7], s, m[7]);
    
endmodule
    

module mux4to1(I0, I1, I2, I3, sel, y);
  input I0, I1, I2, I3;
  input [1:0] sel;
  output y;
  
  wire mux_1, mux_2;
  
  mux2to1 U_mux1 (I0, I1, sel[0], mux_1),
          U_mux2 (I2, I3, sel[0], mux_2),
          U_mux3 (mux_1, mux_2, sel[1], y);
  
endmodule
  
module mux8to1(I0, I1, I2, I3, I4, I5, I6, I7, sel, y);
  input I0, I1, I2, I3, I4, I5, I6, I7;
  input [2:0] sel;
  output y;
  
  wire mux_1, mux_2;
  
  mux4to1 U_mux1(I0, I1, I2, I3, sel[1:0], mux_1),
          U_mux2(I4, I5, I6, I7, sel[1:0], mux_2);
  
  mux2to1 U_mux3(mux_1, mux_2, sel[2], y);
  
endmodule
