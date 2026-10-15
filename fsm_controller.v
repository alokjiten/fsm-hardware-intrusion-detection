module fsm_controller (
    input clk,
    input reset,
    input trojan_detected,
    output reg [2:0] state,
    output reg alarm,
    output reg decoy_enable
);

// State Encoding (3 bits = 8 states max)
parameter IDLE = 3'b000,
          WAIT1 = 3'b001,
          MONITOR = 3'b010,
          VERIFY = 3'b011,
          ALERT = 3'b100,
          RESET_STATE = 3'b101;

reg [2:0] next_state;  // Adds pipeline FFs

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= IDLE;
    else
        state <= next_state;  // Pipeline adds FFs
end

always @(*) begin
    // Default outputs
    alarm = 0;
    decoy_enable = 0;
    next_state = state;

    case (state)
        IDLE:       next_state = WAIT1;
        WAIT1:      next_state = MONITOR;
        MONITOR:    next_state = trojan_detected ? VERIFY : MONITOR;
        VERIFY:     next_state = ALERT;
        ALERT: begin
            alarm = 1;
            decoy_enable = 1;
            next_state = RESET_STATE;
        end
        RESET_STATE: next_state = IDLE;
    endcase
end

endmodule
