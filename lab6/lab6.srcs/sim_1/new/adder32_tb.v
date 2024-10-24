`timescale 1ns / 1ps
module Adder32_tb();

reg [31:0] a, b;
reg ci;
wire [31:0] s, ans_s;
wire co, ans_co, is_correct;

Adder m(.a(a), .b(b), .ci(ci), .s(s), .co(co));
assign {ans_co, ans_s} = a + b + ci;
assign is_correct = (s == ans_s) && (co == ans_co);

initial begin
    a = 32'hf20345ef; b = 32'h00341214; ci = 1; 
    #5; 

    a = 32'h96010873; b = 32'hafefebd2; ci = 0; 
    #5;

    a = 32'h19581958; b = 32'h19581958; ci = 1; 
    #5;

    $finish;
end

endmodule

