`timescale 1ns / 1ps
module Adder8_tb();

reg [7:0] a, b;
reg ci;
wire [7:0] s, ans_s;
wire co, ans_co, is_correct;

Adder8 m(.a(a), .b(b), .ci(ci), .s(s), .co(co));
assign {ans_co, ans_s} = a + b + ci;
assign is_correct = (s == ans_s) && (co == ans_co);

initial begin
    a = 8'h2f; b = 8'h14; ci = 1; 
    #5; 

    a = 8'h96; b = 8'hf8; ci = 0; 
    #5;

    a = 8'hf2; b = 8'he8; ci = 1; 
    #5;

    $finish;
end

endmodule
