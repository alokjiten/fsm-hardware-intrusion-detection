module clock_gating (
    input clk,
    input reset,
    input enable,        // From FSM
    output gated_clk     // Output gated clock
);

reg [1:0] enable_pipe;   // Adds FFs

always @(posedge clk or posedge reset) begin
    if (reset)
        enable_pipe <= 2'b00;
    else
        enable_pipe <= {enable_pipe[0], enable};  // 2-stage pipeline
end

// Gated clock logic using enable_pipe[1]
assign gated_clk = clk & enable_pipe[1];

endmodule
