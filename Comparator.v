// Design a circuit which accepts two 3-bit inputs (A and B) and produces 5 1-bit outputs(gray, Excess-3, More, Less, no_relation). The outputs are set high when:
    a. Gray: A and B are gray codes to each other
    b. Excess-3: A and B differ by 3. 
    c. More: A is one more than B. 
    d. Less: A is one less than B. 
    e. no_relation: If none of the above relation is true. 
//


module prayas(A,B,G,E,M,L,N_R);
 input [2:0] A,B;     // 3-bit inputs A,B
 output reg G,E,M,L,N_R;   // G-gray, E-excess-3, M-more, L-less, N_R-no_relation
 parameter GRAY = 3'b000, EXCESS = 3'b001, MORE = 3'b010, LESS = 3'b011, NO_RELATION = 3'b100;
 wire G1,G2;
 
 assign G1 = A ^ (A << 1);     // Gray code for A
 assign G2 = B ^ (B << 1);     // Gray code for B
  
 always @*
  begin
   case ({A,B})
	 GRAY : begin          
	         G = (G1 == G2) ? 1 : 0;   // when gray codes of A and B are equal, output G will be 1 and all others zero
	         E = 1'b0;
		       M = 1'b0;
		       L = 1'b0;
           N_R = 1'b0;
		 end
			  
	 EXCESS : begin
	             E = ((A == B + 3 || B == A + 3)) ? 1 : 0;   // When A and B differ by 3, output E will be 1 and all others zero
					     G = 1'b0;
				    	 M = 1'b0;
			         L = 1'b0;
			         N_R = 1'b0;
			  end
			  
	 MORE : begin
	         M = (A == B + 1) ? 1 : 0;        // When A is one more than B, output M will be 1 and all others zero
			     G = 1'b0;
			   	 E = 1'b0;
			     L = 1'b0;
			     N_R = 1'b0;
			  end	
			  
	 LESS : begin 
	         L = (B == A - 1) ? 1 : 0;     // When A is one less than B, output L will be 1 and all others zero
			     G = 1'b0;
			     E = 1'b0;
			     M = 1'b0;
			     N_R = 1'b0;
			  end	
			  
	 NO_RELATION : begin
                    N_R = (~G && ~E && ~M && ~L) ? 1 : 0;    // If none of the above relation is true, output N_R will be 1 and all others zero
			              G = 1'b0;
				            E = 1'b0;
			              L = 1'b0;
			              M = 1'b0;
			  end
	 default : begin          // Default case, all the outpur are 0 
	             G = 1'b0;
			         E = 1'b0;
				       M = 1'b0;
			         L = 1'b0;
			         N_R = 1'b0;
			  end	
		endcase
    end		
endmodule 


