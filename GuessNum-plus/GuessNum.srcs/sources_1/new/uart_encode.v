module UART_Encode (
    input         clk, rst,
    input  [11:0] target_number,  // 待输出的游戏答案
    input         print_answer,
    output        dout_vld,
    output [7:0]  dout_data
);

localparam IDLE = 2'b00;
localparam PRINT = 2'b01;  // 输出当前待输出的内容
localparam LOAD = 2'b10;  // 向输出缓冲区载入待输出的字符串
reg [1:0] current_state = IDLE, next_state = IDLE;

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
        IDLE: next_state = print_answer ? LOAD : IDLE;
        LOAD: next_state = PRINT;
        PRINT: next_state = (r1 == 0) ? IDLE : PRINT;
    endcase
end

// 3. 输出
localparam N = 10;  // "\n"
localparam R = 13;  // "\r"
reg [7:0] r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13;  // 输出缓冲区
always @(posedge clk) begin
    if (rst) begin
        r1 <= 0;
        r2 <= 0;
        r3 <= 0;
        r4 <= 0;
        r5 <= 0;
        r6 <= 0;
        r7 <= 0;
        r8 <= 0;
        r9 <= 0;
        r10 <= 0;
        r11 <= 0;
        r12 <= 0;
        r13 <= 0;
    end
    else if (current_state == LOAD) begin  // 载入待输出字符串
        r1 <= "T";
        r2 <= "a";
        r3 <= "r";
        r4 <= "g";
        r5 <= "e";
        r6 <= "t";
        r7 <= ":";
        r8 <= " ";
        r9 <= target_number[11:8] + 8'h30;
        r10 <= target_number[7:4] + 8'h30;
        r11 <= target_number[3:0] + 8'h30;
        r12 <= N;
        r13 <= R;
    end
    else if (current_state == PRINT && buf_refresh) begin  // 寄存器向前传递
        r1 <= r2;
        r2 <= r3;
        r3 <= r4;
        r4 <= r5;
        r5 <= r6;
        r6 <= r7;
        r7 <= r8;
        r8 <= r9;
        r9 <= r10;
        r10 <= r11;
        r11 <= r12;
        r12 <= r13;
        r13 <= 0;
    end
end

assign dout_data = r1;  // 输出缓冲区最前面的字符
assign dout_vld = (current_state == PRINT) && out;

// 分频计数器
reg [19:0] div_cnt;
parameter INTERVAL = 12_000;  // 输出间隔
wire buf_refresh = (div_cnt == 11_000);  // 向前传递缓冲区寄存器
wire out = (div_cnt == 100);  // 串口输出当前缓冲区最前面的字符
always @(posedge clk) begin
    if (rst)
        div_cnt <= 0;
    else if (current_state == PRINT)
        div_cnt <= (div_cnt == INTERVAL) ? 0 : div_cnt + 1; 
    else
        div_cnt <= 0;
end
    
endmodule