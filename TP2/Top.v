module Top (
    input wire clk, fim, insere, fim_jogo, reset,
    input wire [3:0] num,
    output wire [0:6] hex0, hex1, hex2, hex3,
    output wire [0:1] ledp1, ledp2,
    output wire led15, sled,
    output wire [3:0] gled,
    output wire [3:0] state
);

    wire [1:0] premio;
    wire [4:0] p1, p2;

    Lot lt(
        .clk(clk), .num(num), .reset(reset),
        .fim(fim), .fim_jogo(fim_jogo),
        .insere(insere), .premio(premio),
        .p1(p1), .p2(p2), .state(state)
    );

    Display ds(
        .hex0(hex0), .hex1(hex1), .hex2(hex2), .hex3(hex3),
        .ledp1(ledp1), .ledp2(ledp2), .led15(led15),
        .premio_f(premio), .p1_f(p1), .p2_f(p2),
        .state_f(state), .sled(sled), .gled(gled), .reset(reset)
    );

endmodule
