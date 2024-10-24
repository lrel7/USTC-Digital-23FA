module Segment (
    input             clk,
    input             rst,
    input      [31:0] output_data,
    output reg [2:0]  seg_an,
    output reg [3:0]  seg_data
);

reg [31:0] count;

// 计数器, 每0.0025秒复位一次
always@ (posedge clk) begin
    if (rst) begin
        count <= 1;
    end
    else begin
        if (count != 250000)  // 0.0025s
            count <= count + 1;
        else begin
            count <= 1;
        end
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
        seg_an <= (seg_an + 1) % 8;
    end
end

// 根据seg_an设置seg_data
always @(posedge clk) begin
    case (seg_an)  
        0: seg_data <= output_data[3:0];
        1: seg_data <= output_data[7:4];
        2: seg_data <= output_data[11:8];
        3: seg_data <= output_data[15:12];
        4: seg_data <= output_data[19:16];
        5: seg_data <= output_data[23:20];
        6: seg_data <= output_data[27:24];
        7: seg_data <= output_data[31:28];
    endcase
end
    
endmodule