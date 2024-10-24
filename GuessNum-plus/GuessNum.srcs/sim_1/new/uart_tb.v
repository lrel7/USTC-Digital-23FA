module UART_tb ();

reg clk = 0;
always #5 clk = ~clk;

reg rst = 1, din = 1;
reg [7:0] user_input;
wire [7:0] din_data;
wire din_vld;
wire print_answer, new_game, pause;
parameter A = "a;", N = "n;", P = "p;";

Receive receive (
    .clk(clk),
    .rst(rst),
    .din(din),
    .din_vld(din_vld),
    .din_data(din_data)
);

UART_Decode uart_decode (
    .clk(clk),
    .rst(rst),
    .din_vld(din_vld),
    .din_data(din_data),
    .print_answer(print_answer),
    .new_game(new_game),
    .pause(pause)
);

initial begin
    #15;
    rst = 0;
    din = 0;
    #8670;
    user_input = "p";  // 输入"p"
    repeat(8) begin
        din = user_input[0];
        user_input = user_input >> 1;
        #8670;
    end
    din = 1;
    #8670;
    din = 0;
    #8670;
    user_input = ";";  // 输入";"
    repeat(8) begin
        din = user_input[0];
        user_input = user_input >> 1;
        #8670;
    end
    din = 1;
    #8670;
    #8670;
    $finish;
end
    
endmodule