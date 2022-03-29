/* ***************************************************************\
| Name of program : sign_ext.sv
| Author: Jesse Both, Andrew Zhou, Ben Miller & Bodhiswattwa Basu
| Date Created: 03/24/2022
| Date last updated: 03/24/2022
| Function: Sign extend unit
| Modules:
\****************************************************************/

module sign_ext(out, in):
  input in;
  output [7:0] out;
  
  buf(out[0], in);
  buf(out[1], in);
  buf(out[2], in);
  
  
endmodule
  