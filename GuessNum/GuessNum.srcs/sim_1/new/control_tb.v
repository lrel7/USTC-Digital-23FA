module Control_tb ();

reg clk = 0;
always #5 clk = ~clk;

reg rst = 1, btn = 0;
reg [5:0] check_result = 0;
reg timer_finish = 0;
wire check_start, timer_en, timer_set;
wire [1:0] led_sel, seg_sel;

Control control (
    .clk(clk),
    .rst(rst),
    .btn(btn),
    .check_result(check_result),
    .timer_finish(timer_finish),
    .check_start(check_start),
    .timer_en(timer_en),
    .timer_set(timer_set),
    .led_sel(led_sel),
    .seg_sel(seg_sel)
);

initial begin
    #15;  // INIT
    rst = 0;  // INIT -> GUESS
    #20;
    btn = 1;  // GUESS -> CHECK
    #10;
    btn = 0;
    check_result = 6'b010_000;
    #20;
    btn = 1;  // CHECK -> GUESS
    #10;
    btn = 0;
    #20;
    btn = 1;  // GUESS -> CHECK
    #10;
    btn = 0;
    check_result = 6'b100_000;  // CHECK -> SUCCESS
    #30;
    $finish;
end
    
endmodule