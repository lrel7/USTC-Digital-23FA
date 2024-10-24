module FindMode (
    input            clk, rst, next,
    input      [7:0] number,
    output reg [7:0] out
);

reg [7:0] nums[0:99];  // 当前输入的所有不同数字
reg [7:0] num_count[0:99];  // 当前输入的每个不同数字出现的次数
integer input_diff_count;  // 当前输入的不同的数字个数
integer mode_count;  // 当前众数的个数
integer i;  // 循环变量

// 初始化变量
initial begin
    for (i = 0; i < 100; i = i + 1) begin
        num_count[i] <= 0;
    end
    input_diff_count <= 0;
    mode_count <= 0;
    out <= 8'bxxxxxxxx;
end

// 清除记录
always @(posedge rst) begin
    for (i = 0; i < 100; i = i + 1) begin
        num_count[i] <= 0;
    end
    input_diff_count <= 0;
    mode_count <= 0;
    out <= 8'bxxxxxxxx;  // 将输出值设为不确定
end

// 处理输入数据
always @(posedge clk) begin
    if (~rst && next) begin  // 有新的数字输入
        for (i = 0; i < input_diff_count; i = i + 1) begin
            if (nums[i] == number) begin  // 该数字之前出现过
                num_count[i] <= num_count[i] + 1;
                if (mode_count < num_count[i] + 1) begin
                    mode_count <= num_count[i] + 1;
                    out <= number;
                end
                i <= 100;  // 跳出循环
            end
        end

        if (i == input_diff_count) begin  // 该数字之前没有出现过
            nums[i] <= number;
            num_count[i] <= 1;
            input_diff_count <= input_diff_count + 1;
            if (mode_count < 1) begin
                mode_count <= 1;
                out <= number;
            end
        end
    end
end

endmodule