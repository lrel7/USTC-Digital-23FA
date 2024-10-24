module Top (
    input        clk, btn,
    input  [7:0] sw,
    output [3:0] seg_data,
    output [2:0] seg_an,
    output       uart_dout
);

wire rst = sw[7];
wire dout_vld;
wire [7:0] dout_data;
reg [31:0] output_data;

Send send (
    .clk(clk),
    .rst(rst),
    .dout(uart_dout),
    .dout_vld(dout_vld),
    .dout_data(dout_data)
);

// 数码管实时显示sw[6:0]的输入内容
Segment segment (
    .clk(clk),
    .rst(rst),
    .output_data(output_data),
    .seg_data(seg_data),
    .seg_an(seg_an)
);

// 对`btn`信号作上升沿检测
EdgeCapture edge_capture (
    .clk(clk),
    .rst(rst),
    .sig_in(btn),
    .pos_edge(dout_vld)
);

// 通过sw[6:0]输入数据
always @(posedge clk) begin
    if (rst)  // 复位
        output_data <= 0;
    else 
        output_data <= {25'b0, sw[6:0]};
end

assign dout_data = output_data[7:0];
    
endmodule