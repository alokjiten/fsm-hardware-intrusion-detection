module top (
    input wire clk,
    input wire rst,
    input wire [7:0] signal_input,
    input wire select,
    input wire [3:0] address,
    output wire [7:0] final_output,
    output wire led
);

    wire [7:0] processed_data;
    wire trojan_flag;
    wire decoy_en;
    wire [7:0] decoy_data;

    wire [7:0] known_pattern = 8'b10101010;
    wire [7:0] ref_constant = 8'b01010101;

    input_preprocess U1 (
        .in_signal(signal_input),
        .known_pattern(known_pattern),
        .ref_constant(ref_constant),
        .select(select),
        .processed_signal(processed_data)
    );

    trojan_detector U2 (
        .clk(clk),
        .rst(rst),
        .in_data(processed_data),
        .trojan_detected(trojan_flag)
    );

    alarm_decoy_logic U3 (
        .trojan_detected(trojan_flag),
        .led(led),
        .decoy_enable(decoy_en)
    );

    decoy_memory U4 (
        .clk(clk),
        .address(address),
        .out_data(decoy_data)
    );

    assign final_output = (decoy_en) ? decoy_data : processed_data;

endmodule
