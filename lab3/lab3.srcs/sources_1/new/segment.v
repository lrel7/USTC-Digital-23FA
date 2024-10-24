module Segment (
    input             clk,
    input             rst,
    input      [31:0] output_data,
    output reg [2:0]  seg_an,
    output reg [3:0]  seg_data
);

reg [31:0] counter;
reg [2:0] seg_id;
wire seg_clk;

// 每0.0025s, seg_clk跃升一次
Counter #(
    .MAX_VALUE(2500)
) c (
    .clk(clk),
    .rst(rst),
    .out(seg_clk)
);

// 初始化seg_id
initial begin
    seg_id <= 0;
end

always @(posedge seg_clk) begin
    // 更新seg_id    
    seg_id <= (seg_id + 1) % 8;
end

always @(*) begin
    seg_data = 0;
    seg_an = seg_id;
    case (seg_id)
        0: seg_data = output_data[3:0];
        1: seg_data = output_data[7:4];
        2: seg_data = output_data[11:8];
        3: seg_data = output_data[15:12];
        4: seg_data = output_data[19:16];
        5: seg_data = output_data[23:20];
        6: seg_data = output_data[27:24];
        7: seg_data = output_data[31:28];
    endcase
end
    
endmodule