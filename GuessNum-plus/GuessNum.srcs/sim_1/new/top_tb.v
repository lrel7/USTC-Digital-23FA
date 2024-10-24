module Top_tb ();

reg clk = 0, btn = 0;
reg [7:0] sw = 0;
wire [7:0] led;
wire [2:0] seg_an;
wire [3:0] seg_data;
always #5 clk = ~clk;

Top top (
    .clk(clk),
    .btn(btn),
    .sw(sw),
    .led(led),
    .seg_an(seg_an),
    .seg_data(seg_data)
);

initial begin
    sw[7] = 1;  // 复位
    #15;
    sw[7] = 0;  // 开始游戏
    #10;
    sw[5] = 1;  // 拨上5
    #10;
    sw[2] = 1;  // 拨上2
    #10;
    sw[0] = 1;  // 拨上0
    #10;
    btn = 1;  // 按下按钮
    #50;
    btn = 0;
    #20;
    $finish;
end
    
endmodule