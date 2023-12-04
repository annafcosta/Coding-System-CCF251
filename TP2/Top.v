module Top (
    clk, num, reset, fim,  fim_jogo, insere,  hex7, hex6, hex5, hex4, ledp1, ledp2, led15, sled,state,
);
   input  wire clk, reset, fim, insere, fim_jogo;
   input  wire  [0:3] num, sled;
   output wire  [0:6] hex7, hex6, hex5, hex4;
   output wire  [0:1] ledp1,ledp2;
   output wire led15;

	 wire [0:1] premio;
    wire [0:4] p1, p2;
   output wire [0:3] state;


   Lot lt(.clk(clk), .num(num), .reset(reset), .fim(fim), .fim_jogo(fim_jogo),.insere(insere), .premio(premio), . p1(p1), .p2(p2), .state(state));
   Display ds(.hex7(hex7), .hex6(hex6), .hex5(hex5), .hex4(hex4), .ledp1(ledp1), .ledp2(ledp2), .led15(led15), .premio_f(premio), .p1_f(p1), .p2_f(p2), .state_f(state), .sled(sled));

endmodule

