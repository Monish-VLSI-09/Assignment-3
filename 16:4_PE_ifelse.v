// Design 16:4 Priority Encoder using if-else Statement.


module priority_encoder(D,Y);
  input [15:0] D;        // 16-bit input 
  output reg [3:0] Y;    // 4-bit output
 
 always @*
 begin
 if (D[15])
   Y = 4'b1111;
	
 else if (D[14])
   Y = 4'b1110;
	
 else if (D[13])
   Y = 4'b1101;
	
 else if (D[12])
   Y = 4'b1100;
	
 else if (D[11])
   Y = 4'b1011;
	
 else if (D[10])
   Y = 4'b1010;
	
 else if (D[9])
   Y = 4'b1001;
	
 else if (D[8])
   Y = 4'b1000;
	
 else if (D[7])
   Y = 4'b0111;
	
 else if (D[6])
   Y = 4'b0110;
	
 else if (D[5])
   Y = 4'b0101;
	
 else if (D[4])
   Y = 4'b0100;	
		
 else if (D[3])
   Y = 4'b0011;
	
 else if (D[2])
   Y = 4'b0010;
	
 else if (D[1])
   Y = 4'b0001;
	
 else if (D[0])
   Y = 4'b0000;
 else 
   Y = 4'bxxxx;
 end
endmodule
