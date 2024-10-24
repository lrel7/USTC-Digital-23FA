module UART_Decode (
    input       clk, rst,
    input       din_vld,
    input [7:0] din_data,
    output      print_answer,  // 用户输入"a;", 串口输出答案
    output      new_game,  // 用户输入"n;", 开始新一局
    output      pause  // 用户输入"p;", 计时器暂停
);

localparam IDLE = 3'b000;
localparam A = 3'b001;
localparam A_END = 3'b010;
localparam N = 3'b011;
localparam N_END = 3'b100;
localparam P = 3'b101;
localparam P_END = 3'b110;
reg [2:0] current_state = IDLE, next_state = IDLE;

// 1. 状态更新
always @(posedge clk) begin
    if (rst)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

// 2. 状态转移逻辑
always @(*) begin
    next_state = current_state;
    case (current_state)
        IDLE: next_state = (din_vld && din_data == "a") ? A : 
                           (din_vld && din_data == "n") ? N :
                           (din_vld && din_data == "p") ? P : 
                           IDLE; 
        A: next_state = (~din_vld) ? A : din_data == ";" ? A_END : IDLE;
        A_END: next_state = IDLE;
        N: next_state = (~din_vld) ? N : din_data == ";" ? N_END : IDLE;
        N_END: next_state = IDLE;
        P: next_state = (~din_vld) ? P : din_data == ";" ? P_END : IDLE;
        P_END: next_state = IDLE;
    endcase
end

// 3. 输出
assign print_answer = (current_state == A_END);
assign new_game = (current_state == N_END);
assign pause = (current_state == P_END);
    
endmodule