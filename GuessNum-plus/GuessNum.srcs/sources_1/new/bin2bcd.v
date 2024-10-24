module BIN2BCD #(
    parameter BIN_WIDTH = 8,
    parameter BCD_WIDTH = 12 
) (
    input                      clk, rst, start,
    input      [BIN_WIDTH-1:0] bin,
    output reg [BCD_WIDTH-1:0] bcd,
    output                     done
);

localparam IDLE = 2'b00;
localparam SHIFT = 2'b01;
localparam ADD = 2'b10;
localparam DONE = 2'b11;
reg [1:0] current_state = IDLE, next_state = IDLE;
reg [BIN_WIDTH-1:0] bin_buf;
reg [BCD_WIDTH-1:0] bcd_buf;
integer count = 0;

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
        IDLE: next_state = start ? SHIFT : IDLE;
        SHIFT: next_state = (count == BIN_WIDTH - 1) ? DONE : ADD;
        ADD: next_state = SHIFT;
        DONE: next_state = IDLE;
    endcase
end

// 3. 输出
assign done = (current_state == DONE);

always @(posedge clk) begin
    if (rst) begin
        count <= 0;
        bin_buf <= 0;
        bcd_buf <= 0;
        bcd <= 0;
    end
    else if (current_state == IDLE && start) begin
        bin_buf <= bin;
        bcd_buf <= 0;
        count <= 0;
    end
    else if (current_state == SHIFT) begin
        {bcd_buf, bin_buf} <= ({bcd_buf, bin_buf} << 1);  // 左移一位
        count <= count + 1;
    end
    else if (current_state == ADD) begin  // 逐位检查是否大于4
        if (bcd_buf[11:8] > 4)
            bcd_buf[11:8] <= bcd_buf[11:8] + 3;
        if (bcd_buf[7:4] > 4)
            bcd_buf[7:4] <= bcd_buf[7:4] + 3;
        if (bcd_buf[3:0] > 4)
            bcd_buf[3:0] <= bcd_buf[3:0] + 3;
    end
    else if (current_state == DONE)
        bcd <= bcd_buf;
end
    
endmodule