module xor_mixer (
    input wire clk,
    input wire [7:0] a,
    input wire [7:0] b
);
    reg [7:0] mixed [0:15];  // 16 FFs * 8 bits = 128 FFs

    integer i;

    always @(posedge clk) begin
        for (i = 0; i < 16; i = i + 1) begin
            mixed[i] <= a ^ b ^ i;
        end
    end
endmodule
