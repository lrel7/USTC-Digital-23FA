module Timer_tb ();

reg clk = 0;
always #5 clk = ~clk;

reg rst = 1, set = 0, en = 0;
wire [7:0] minute, second;
wire [11:0] micro_second;
wire finish;

Timer timer (
    .clk(clk),
    .rst(rst),
    .set(set),
    .en(en),
    .minute(minute),
    .second(second),
    .micro_second(micro_second),
    .finish(finish)
);

initial begin
    #15;
    rst = 0;
    en = 1;  // 开始倒计时
end
    
endmodule