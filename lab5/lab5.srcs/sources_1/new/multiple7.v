module Multiple7 (
    input            clk,  // 时钟信号
    input            rst,  // 复位信号
    input      [7:0] src,  // 输入数据
    input            src_valid,  // 输入是否有效
    output reg       res,  // 输出结果
    output reg       res_valid  // 输出结果是否有效
);

localparam S0 = 0;
localparam S1 = 1;
localparam S2 = 2;
localparam S3 = 3;
localparam S4 = 4;
localparam S5 = 5;
localparam S6 = 6;
reg [2:0] current_state = S0, next_state = S0;  // 用3bits编码7个状态
reg [7:0] num;
integer i = 8;  // src索引, 从7到0
reg has_input = 0;  // 是否已有输入数据
reg finished = 0;  // 是否已经算出答案
reg ans = 0;

// 处理输入数据
always @(posedge clk) begin
    if (!rst && !has_input && src_valid) begin  // 无复位信号, 且尚无输入数据而输入有效时
        num <= src; 
        has_input <= 1;
        i <= 8;
        finished <= 0;
    end 
end

// 第一段: 状态更新
always @(posedge clk) begin
    if (rst) begin  // 复位
        current_state <= S0;
        has_input <= 0;
    end
    else begin  // 转移到下一个状态
        current_state <= next_state;
        if (i > 0) begin  // 尚未遍历完i
            i <= i - 1;
        end
        else if (!finished) begin  // 已遍历完i, 但尚未置finished信号
            ans <= (next_state == S0) ? 1 : 0;
            finished <= 1;
        end
    end
end

// 第二段: 状态转移
always @(*) begin
    next_state = current_state;
    if (i <= 7 && !finished) begin  // 仅当i=7,6,...,1时才更新次态
        case (current_state)
            S0: next_state = num[i] ? S1 : S0;
            S1: next_state = num[i] ? S3 : S2;
            S2: next_state = num[i] ? S5 : S4;
            S3: next_state = num[i] ? S0 : S6;
            S4: next_state = num[i] ? S2 : S1;
            S5: next_state = num[i] ? S4 : S3;
            S6: next_state = num[i] ? S6 : S5;
        endcase    
    end
end

// 第三段: 输出
always @(*) begin
    res = ans;
    res_valid = (has_input && finished); // 有输入且已完成计算时, 输出才有效
end

endmodule