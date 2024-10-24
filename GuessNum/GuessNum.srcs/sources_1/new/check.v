module Check (
    input         clk, rst, check_start,
    input  [11:0] input_number,  // 用户输入
    input  [11:0] target_number,  // 目标数字
    output [5:0]  check_result  // led信号
);

// 模块内部用寄存器暂存输入信号，从而避免外部信号突变带来的影响
reg [11:0] current_input_data, current_target_data;
always @(posedge clk) begin
    if (rst) begin
        current_input_data <= 0;
        current_target_data <= 0;
    end
    else if (check_start) begin 
        current_input_data <= input_number;
        current_target_data <= target_number;
    end
end

// 使用组合逻辑产生比较结果
wire [3:0] target_number_3, target_number_2, target_number_1;
wire [3:0] input_number_3, input_number_2, input_number_1;
assign input_number_1 = current_input_data[3:0];  // 输入1
assign input_number_2 = current_input_data[7:4];  // 输入2
assign input_number_3 = current_input_data[11:8];  // 输入3
assign target_number_1 = current_target_data[3:0];  // 目标1
assign target_number_2 = current_target_data[7:4];  // 目标2
assign target_number_3 = current_target_data[11:8];  // 目标3

reg [1:0] i1t1, i1t2, i1t3, i2t1, i2t2, i2t3, i3t1, i3t2, i3t3;  // ixty表示输入x与目标y相同
always @(*) begin
    i1t1 = (input_number_1 == target_number_1);
    i1t2 = (input_number_1 == target_number_2);
    i1t3 = (input_number_1 == target_number_3);
    i2t1 = (input_number_2 == target_number_1);
    i2t2 = (input_number_2 == target_number_2);
    i2t3 = (input_number_2 == target_number_3);
    i3t1 = (input_number_3 == target_number_1);
    i3t2 = (input_number_3 == target_number_2);
    i3t3 = (input_number_3 == target_number_3);
end

wire [1:0] pos_correct_cnt;  // 位置正确的数字个数
wire [1:0] pos_wrong_cnt;  // 数字正确但位置不正确的个数
assign pos_correct_cnt = i1t1 + i2t2 + i3t3;
assign pos_wrong_cnt = i1t2 + i1t3 + i2t1 + i2t3 + i3t1 + i3t2;
assign check_result[5] = (pos_correct_cnt == 3);
assign check_result[4] = (pos_correct_cnt == 2);
assign check_result[3] = (pos_correct_cnt == 1);
assign check_result[2] = (pos_wrong_cnt == 3);
assign check_result[1] = (pos_wrong_cnt == 2);
assign check_result[0] = (pos_wrong_cnt == 1);  
    
endmodule