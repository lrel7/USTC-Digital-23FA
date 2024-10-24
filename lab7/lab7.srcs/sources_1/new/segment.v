module Segment (
    input            clk,
    input      [7:0] output_data,
    output reg       seg_an,
    output reg [3:0] seg_data
);

reg [31:0] count;

// 计数器, 每0.0025秒复位一次
always@ (posedge clk) begin
    if (count != 250000)  // 0.0025s
            count <= count + 1;
        else begin
            count <= 1;
        end
end

// 初始化seg_data, seg_an
initial begin
    seg_data <= 0;
    seg_an <= 0;
end

// 更新seg_an
always @(posedge clk) begin
    if (count == 250000) begin
        seg_an <= (seg_an + 1) % 2;
    end
end

// 根据seg_an设置seg_data
always @(posedge clk) begin
    case (seg_an)  
        0: seg_data <= output_data[3:0];
        1: seg_data <= output_data[7:4];
    endcase
end
    
endmodule