module Counter #(
    parameter   MAX_VALUE = 8'd100,
    parameter   MIN_VALUE = 0
)(
    input  clk,
    input  rst,
    input  enable,
    output out
);

reg [7:0] counter;

always @(posedge clk) begin
    if (rst)
        counter <= 0;
    else begin
        if (enable) begin
            if (counter == 0)
                counter <= MIN_VALUE;
            else if (counter >= MAX_VALUE)
                counter <= MIN_VALUE;
            else
                counter <= counter + 8'b1;
        end
        else
            counter <= 0;
    end
end

assign out = (counter == MAX_VALUE);

endmodule
