module Top (
    input        clk, rst, uart_din,
    output [3:0] seg_data,
    output [2:0] seg_an
);

wire [7:0] din_data;
wire din_vld;
reg [31:0] output_data;

// 接收来自串口输入的数据
Receive receive (
    .clk(clk),
    .rst(rst),
    .din(uart_din),
    .din_vld(din_vld),
    .din_data(din_data)
);

Segment segment (
    .clk(clk),
    .rst(rst),
    .output_data(output_data),
    .seg_data(seg_data),
    .seg_an(seg_an)
);

// 将数据以十六进制显示在数码管，每进行一次输入就将先前数据左移8bit
always @(posedge clk) begin
    if (rst)
        output_data <= 0;
    else if (din_vld)
        output_data <= {output_data[23:0], din_data};
end
    
endmodule