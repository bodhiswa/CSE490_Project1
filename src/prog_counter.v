 /* ***************************************************************\
| Name of program : 
| Author: Jesse Both, Andrew Zhou, Ben Miller & Bodhiswattwa Basu
| Date Created:
| Date last updated:
| Function:
| Modules:
\****************************************************************/



// Code your design here

module pc_inc(next, current);
  input [7:0] next;
  output [7:0] current;
  assign next = current + 4;
endmodule