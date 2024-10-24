module Top (
    input        clk, btn,
    input  [7:0] sw,
    input        uart_din,  // 用户串行输入的数据
    output [7:0] led,
    output [2:0] seg_an,
    output [3:0] seg_data,
    output       uart_dout  // 串口输出数据  
);

wire rst = sw[7];  // `sw[7]`为复位信号

wire [3:0] hex;
wire pulse;
wire [11:0] input_number;
wire [11:0] target_number;
wire check_start;
wire [5:0] check_result;
wire timer_en, timer_set, timer_finish;
wire print_answer, new_game, pause;
wire [7:0] minute, second;
wire [11:0] micro_second;
wire [11:0] minute_bcd, second_bcd, micro_second_bcd;
wire minute_done, second_done, micro_second_done;
wire minute_start, second_start, micro_second_start;
wire btn_posedge;
wire [1:0] led_sel, seg_sel;
wire generate_random;
wire [7:0] seed;  // 时间种子
wire [7:0] flow_led;  // 流水灯
wire [31:0] output_data;  // Segment模块输出数据
wire [7:0] output_valid;  // Segment掩码
wire din_vld;
wire [7:0] din_data;
wire dout_vld;
wire [7:0] dout_data;

Input in (
    .clk(clk),
    .rst(rst),
    .sw(sw[5:0]),
    .hex(hex),
    .pulse(pulse)
);

ShiftReg shift_reg (
    .clk(clk),
    .rst(rst),
    .hex(hex),
    .pulse(pulse),
    .dout(input_number)
);

Check check (
    .clk(clk),
    .rst(rst),
    .input_number(input_number),
    .target_number(target_number),
    .check_start(check_start),
    .check_result(check_result)
);

Timer timer (
    .clk(clk),
    .rst(rst),
    .set(timer_set),
    .en(timer_en),
    .minute(minute),
    .second(second),
    .micro_second(micro_second),
    .finish(timer_finish),
    .minute_changed(minute_start),
    .second_changed(second_start),
    .micro_second_changed(micro_second_start)
);

Control control (
    .clk(clk),
    .rst(rst),
    .btn(btn_posedge),
    .check_result(check_result),
    .check_start(check_start),
    .timer_en(timer_en),
    .timer_set(timer_set),
    .timer_finish(timer_finish),
    .print_answer(print_answer),
    .new_game(new_game),
    .pause(pause),
    .led_sel(led_sel),
    .seg_sel(seg_sel),
    .generate_random(generate_random)
);

FLOW_LED flow (
    .clk(clk),
    .rst(rst),
    .led(flow_led)
);

MUX4 #(.WIDTH(8)) mux_led (
    .src0(flow_led),  // 流水灯
    .src1({2'b00, check_result}),  // 检查结果
    .src2(8'b1111_1111),  // 全亮
    .src3(8'b0000_0000),  // 全灭
    .sel(led_sel),
    .res(led)
);

BIN2BCD minute_bin2bcd (
    .clk(clk),
    .rst(rst),
    .start(minute_start),
    .bin(minute),
    .bcd(minute_bcd),
    .done(minute_done)
);

BIN2BCD second_bin2bcd (
    .clk(clk),
    .rst(rst),
    .start(second_start),
    .bin(second),
    .bcd(second_bcd),
    .done(second_done)
);

BIN2BCD #(
    .BIN_WIDTH(12)
) micro_second_bin2bcd (
    .clk(clk),
    .rst(rst),
    .start(micro_second_start),
    .bin(micro_second),
    .bcd(micro_second_bcd),
    .done(micro_second_done)
);

MUX4 mux_seg (
    .src0({4'h0, minute_bcd[3:0], second_bcd[7:0], micro_second_bcd}),  // 显示倒计时 
    .src1(32'h8888_8888),  // 显示全8
    .src2(32'h4444_4444),  // 显示全4
    .src3(32'h0000_0000),  // 显示0
    .sel(seg_sel),
    .res(output_data)
);

SegmentMask segment_mask (
    .clk(clk),
    .rst(rst),
    .second(second),
    .micro_second(micro_second),
    .output_valid(output_valid)
);

Segment segment (
    .clk(clk),
    .rst(rst),
    .output_data(output_data),
    .output_valid(output_valid),
    .seg_an(seg_an),
    .seg_data(seg_data)
);

EdgeCapture edge_capture (
    .clk(clk),
    .rst(rst),
    .sig_in(btn),
    .pos_edge(btn_posedge)
);

TimeSeed time_seed (
    .clk(clk),
    .seed(seed)
);

Random random (
    .clk(clk),
    .rst(rst),
    .generate_random(generate_random),
    .sw_seed(input_number),
    .time_seed(seed),
    .random_data(target_number)
);

Receive receive (
    .clk(clk),
    .rst(rst),
    .din(uart_din),
    .din_vld(din_vld),
    .din_data(din_data)
);

UART_Decode uart_decode (
    .clk(clk),
    .rst(rst),
    .din_vld(din_vld),
    .din_data(din_data),
    .print_answer(print_answer),
    .new_game(new_game),
    .pause(pause)
);

UART_Encode uart_encode (
    .clk(clk),
    .rst(rst),
    .target_number(target_number),
    .print_answer(print_answer),
    .dout_vld(dout_vld),
    .dout_data(dout_data)
);

Send send (
    .clk(clk),
    .rst(rst),
    .dout_vld(dout_vld),
    .dout_data(dout_data),
    .dout(uart_dout)
);
    
endmodule