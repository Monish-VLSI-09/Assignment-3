// Design an 8-bit ALU. Features include:
    a. Two 8-bit inputs A and B. 
    b. One 8-bit output C. 
    c. Five 1-bit outputs Borrow, Carry, Equal, less (A<B) and more (A>B). 
    d. Supports Addition, Subtraction, XOR, AND, NOR, NAND and Comparison. Also Display Inputs, Outputs and Operation performed on transcript. Output(8-bit) will be zero for comparison 
       operation. Use case equality for comparison of A and B
//


module ALU_8_BIT(A,B,op_code,C,Borrow,Carry,Equal,Less,More);
    input [7:0] A;
    input [7:0] B;
    input [2:0] op_code; // 3-bit control signal to select operation
    output reg [7:0] C;
    output reg Borrow;
    output reg Carry;
    output reg Equal;
    output reg Less;
    output reg More;


// Operation codes
parameter ADD  = 3'b000, SUB  = 3'b001, XOR  = 3'b010, AND  = 3'b011, NOR  = 3'b100,
          NAND = 3'b101, CMP  = 3'b110;

always @* begin
    case (op_code)
        ADD: C = A + B;
        SUB: C = A - B;
        XOR: C = A ^ B;
        AND: C = A & B;
        NOR: C = ~(A | B);
        NAND: C = ~(A & B);
        CMP: C = 8'b00000000; // Comparison output is always zero
        default: C = 8'b00000000; // Default case
    endcase

    // Calculate Carry for Addition
    if (op_code == ADD)
        Carry = (A + B) > 8'b11111111 ? 1'b1 : 1'b0;
    else
        Carry = 1'b0;
    
    // Calculate Borrow for Subtraction
    if (op_code == SUB)
        Borrow = (A < B) ? 1'b1 : 1'b0;
    else
        Borrow = 1'b0;

    // Equal, Less, and More comparisons
    Equal = (A === B) ? 1'b1 : 1'b0;
    Less = (A < B) ? 1'b1 : 1'b0;
    More = (A > B) ? 1'b1 : 1'b0;
end

endmodule

