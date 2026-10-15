module input_preprocess (
    input wire [7:0] in_signal,
    input wire [7:0] known_pattern,
    input wire [7:0] ref_constant,
    input wire select,
    output wire [7:0] processed_signal
);
    wire [7:0] xor_result;
    wire [7:0] and_result;

    assign xor_result = in_signal ^ known_pattern;
    assign and_result = in_signal & ref_constant;

    assign processed_signal = select ? xor_result : and_result;

endmodule
