module trojan_detector (
    input wire clk,
    input wire rst,
    input wire [7:0] in_data,
    output reg trojan_detected
);
    reg [1:0] state;
    localparam IDLE = 2'b00, MONITOR = 2'b01, DETECTED = 2'b10;

    reg [7:0] pattern = 8'b10101010;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            trojan_detected <= 0;
        end else begin
            case (state)
                IDLE: state <= MONITOR;
                MONITOR: begin
                    if (in_data == pattern)
                        state <= DETECTED;
                    else
                        state <= MONITOR;
                end
                DETECTED: begin
                    trojan_detected <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule
