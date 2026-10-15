module decoy_memory (
    input wire clk,
    input wire [3:0] address,
    output reg [7:0] out_data
);
    reg [7:0] dummy_mem [0:15];

    always @(posedge clk) begin
        case (address)
            4'd0:  out_data <= dummy_mem[0] ^ 8'hAA;
            4'd1:  out_data <= dummy_mem[1] ^ 8'hAA;
            4'd2:  out_data <= dummy_mem[2] ^ 8'hAA;
            4'd3:  out_data <= dummy_mem[3] ^ 8'hAA;
            4'd4:  out_data <= dummy_mem[4] ^ 8'hAA;
            4'd5:  out_data <= dummy_mem[5] ^ 8'hAA;
            4'd6:  out_data <= dummy_mem[6] ^ 8'hAA;
            4'd7:  out_data <= dummy_mem[7] ^ 8'hAA;
            4'd8:  out_data <= dummy_mem[8] ^ 8'hAA;
            4'd9:  out_data <= dummy_mem[9] ^ 8'hAA;
            4'd10: out_data <= dummy_mem[10] ^ 8'hAA;
            4'd11: out_data <= dummy_mem[11] ^ 8'hAA;
            4'd12: out_data <= dummy_mem[12] ^ 8'hAA;
            4'd13: out_data <= dummy_mem[13] ^ 8'hAA;
            4'd14: out_data <= dummy_mem[14] ^ 8'hAA;
            4'd15: out_data <= dummy_mem[15] ^ 8'hAA;
            default: out_data <= 8'h00;
        endcase
    end

    initial begin
        dummy_mem[0] = 8'hAB; dummy_mem[1] = 8'hCD;
        dummy_mem[2] = 8'hEF; dummy_mem[3] = 8'h12;
        dummy_mem[4] = 8'h34; dummy_mem[5] = 8'h56;
        dummy_mem[6] = 8'h78; dummy_mem[7] = 8'h9A;
        dummy_mem[8] = 8'hBC; dummy_mem[9] = 8'hDE;
        dummy_mem[10] = 8'hF0; dummy_mem[11] = 8'h13;
        dummy_mem[12] = 8'h24; dummy_mem[13] = 8'h35;
        dummy_mem[14] = 8'h46; dummy_mem[15] = 8'h57;
    end
endmodule
