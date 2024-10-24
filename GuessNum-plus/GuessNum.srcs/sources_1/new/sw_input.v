module Input (
    input            clk, rst, 
    input      [5:0] sw,  // 来自开发板的开关输入
    output reg [3:0] hex,  // 指示当前拨动的开关编号
    output           pulse  // 某开关被拨上时, 发出一个时钟周期的高电平
);
    
reg [5:0] sw_r1 = 0, sw_r2 = 0, sw_r3 = 0;  // 三级寄存器边沿检测
wire [5:0] sw_pull_up;  // 检测开关上升沿
always @(posedge clk) begin
    if (rst) begin
        sw_r1 <= 0;
        sw_r2 <= 0;
        sw_r3 <= 0;
    end
    else begin
        sw_r1 <= sw;
        sw_r2 <= sw_r1;
        sw_r3 <= sw_r2;        
    end
end

assign sw_pull_up = sw_r2 & (~sw_r3);
always @(*) begin
    hex = 0;
    if (sw_pull_up[1])
        hex = 1; 
    if (sw_pull_up[2])
        hex = 2;
    if (sw_pull_up[3])
        hex = 3;
    if (sw_pull_up[4])
        hex = 4;
    if (sw_pull_up[5])
        hex = 5;
end
assign pulse = (sw_pull_up != 0);

endmodule