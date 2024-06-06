// Design a 16 bit parallel in parallel out universal Shift Register which performs following operations:
     a. Load, Shift_enable.  
     b. Left Shift. 
     c. Right Shift. 
     d. Rotational Left Shift. 
     e. Rotational Right Shift.
//



module PIPO(IN,LOAD,EN,shift_op,OUT);       //16 bit PIPO Universal register
 input [15:0] IN;
 input LOAD,EN;
 input [1:0] shift_op;
 output reg [15:0] OUT;
 
 always @*
 if (EN) begin
  if (LOAD)
    begin
	   case (shift_op)
		  2'b00 : OUT = IN << 1;
		  2'b01 : OUT = IN >> 1;
		  2'b10 : OUT = {IN[0],IN[15:1]};
		  2'b11 : OUT = {IN[14:0],IN[15]};
		  default : OUT = IN;
		endcase
	 end
   else
     OUT = 16'b0;	  //end of if-else of LOAD
 end else
  OUT = IN;         //end of if-else of EN
endmodule 

