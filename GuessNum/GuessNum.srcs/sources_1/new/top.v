module Top (
    input        clk, btn,
    input  [7:0] sw,
    output [7:0] led,
    output [2:0] seg_an,
    output [3:0] seg_data
);

wire rst = sw[7];  // `sw[7]`为复位信号
wire [3:0] hex;
wire pulse;
wire [11:0] input_number;
wire [11:0] target_number = 12'h520;
wire check_start;
wire [5:0] check_result;
wire timer_en, timer_set, timer_finish;
wire [7:0] minute, second;
wire [11:0] micro_second;
wire btn_posedge;
wire [1:0] led_sel, seg_sel;
wire [7:0] flow_led;  // 流水灯
wire [31:0] output_data;  // Segment模块输出数据

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
    .finish(timer_finish) 
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
    .led_sel(led_sel),
    .seg_sel(seg_sel)
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

MUX4 mux_seg (
    .src0({4'h0, minute, second, micro_second}),  // 显示倒计时 
    .src1(32'h8888_8888),  // 显示全8
    .src2(32'h4444_4444),  // 显示全4
    .src3(32'h0000_0000),  // 显示0
    .sel(seg_sel),
    .res(output_data)
);

Segment segment (
    .clk(clk),
    .rst(rst),
    .output_data(output_data),
    .seg_an(seg_an),
    .seg_data(seg_data)
);

EdgeCapture edge_capture (
    .clk(clk),
    .rst(rst),
    .sig_in(btn),
    .pos_edge(btn_posedge)
);
    
endmodule