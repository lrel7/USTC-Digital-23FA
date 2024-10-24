`timescale 1ns / 1ps
module Check_tb();

reg clk = 0, rst = 1, start_check = 0;
reg [11:0] input_number, target_number;
wire [5:0] check_result;

always #5 clk = ~clk;

Check check (
    .clk(clk),
    .rst(rst),
    .start_check(start_check),
    .input_number(input_number),
    .target_number(target_number),
    .check_result(check_result)
);

initial begin
    target_number = 12'h520;
    #5;
    rst = 0;
    start_check = 1;
    input_number = 12'h023;
    #10;
    input_number = 12'h052;
    #10;
    input_number = 12'h520;
    #10;
    $finish;
end

endmodule
