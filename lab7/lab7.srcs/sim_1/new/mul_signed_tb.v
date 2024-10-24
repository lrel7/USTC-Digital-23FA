`timescale 1ns / 1ps
module MUL_Signed_tb #(
    parameter WIDTH = 16
) ();

reg  [WIDTH-1:0]    a, b;
reg                 rst, clk, start;
wire [2*WIDTH-1:0]  res;
wire                finish;

initial begin
    clk = 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    rst = 1;
    start = 0;
    #20;
    rst = 0;
    #20;

    a = -5;
    b = 10;
    start = 1;
    #20 start = 0;
    #180;

    a = -190;
    b = -20;
    start = 1;
    #20 start = 0;
    #180;

    a = 65;
    b = -28;
    start = 1;
    #20 start = 0;
    #180;

    $finish;
end

MUL_Signed
#(.WIDTH(WIDTH)) mul (
    .clk        (clk),
    .rst        (rst),
    .start      (start),
    .a          (a),
    .b          (b),
    .res        (res),
    .finish     (finish)
);
endmodule

