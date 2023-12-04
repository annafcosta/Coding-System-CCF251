`timescale 1ns / 1ps

module lot_tb;

  reg clk, reset, fim, insere, fim_jogo;
  reg [0:3] num;
  wire [0:6] hex7, hex6, hex5, hex4;
  wire [0:1] ledp1, ledp2;
  wire led15;
  wire [0:3] state, sled;
  
  // Instanciação do módulo Top
  Top uut (
    .clk(clk),
    .num(num),
    .reset(reset),
    .fim(fim),
    .fim_jogo(fim_jogo),
    .insere(insere),
    .hex7(hex7),
    .hex6(hex6),
    .hex5(hex5),
    .hex4(hex4),
    .ledp1(ledp1),
    .ledp2(ledp2),
    .led15(led15),
    .state(state),
    .sled(sled)
  );

  // Geração de clock sincronizada com insere
    /*
    Numeros para teste:
    47010 - premio 1 - 4 consecutivos
    67039 - premio 2 - 2 consequtivos + acerto 5o digito;
    47029 - premio 1 - 3 consequitivos + acerto 5o digito;
    23119 - premio 0 - 1 consequtivo + acerto 5o digito;
    49219 - premio 0 - 2 num, mas não consequtivos + acerto 5o digito;
    */

  initial begin
    clk = 0;
	reset = 1;
	insere = 0;
	fim = 0;
	fim_jogo = 0;
    #10
    reset = 0;
    #10
    num = 4'b0100; //4
    insere = 1;

    #10
    num = 4'b0111; //7
    
    #10
    num = 4'b0000; //0

    #10
    num = 4'b0001; //1

    #10
    num = 4'b0000; //0

    #10
    insere = 0;
    fim = 1;
    #10
    fim = 0;
    fim_jogo = 1;

    #10
    fim_jogo = 0;
    #10
    insere = 1;
    num = 4'b0110; //6
    #10
    num = 4'b0111; //7
    #10
    num = 4'b0000; //0
    #10
    num = 4'b0011; //3
    #10
    num = 4'b1001; //9
    #10
    insere = 0;
    #10
    fim = 1;
    #10
    fim = 0;
    fim_jogo = 1;
    #10

    fim_jogo = 0;
    #10
    insere = 1;
    num = 4'b0100; //4
    #10
    num = 4'b0111; //7
    #10
    num = 4'b0000; //0
    #10
    num = 4'b0010; //2
    #10
    num = 4'b1001; //9
    #10
    insere = 0;
    #10
    fim = 1;
    #10
    fim = 0;
    fim_jogo = 1;
    #10
    fim_jogo = 0;
    #10
    insere = 1;
    num = 4'b0010; //2 
    #10
    num = 4'b0011; //3
    #10
    num = 4'b0001; //1
    #10
    num = 4'b0001; //1
    #10
    num = 4'b1001; //9
    #10
    insere = 0;
    #10
    fim = 1;
    #10
    fim = 0;
    fim_jogo = 1;
    #10
    fim_jogo = 0;
    #10
    insere = 1;
    num = 4'b0100; //4
    #10
    num = 4'b1001; //9
    #10
    num = 4'b0010; //2
    #10
    num = 4'b0001; //1
    #10
    num = 4'b1001; //9
    #10
    insere = 0;
    #10
    fim = 1;
    #10
    fim = 0;
    fim_jogo = 1;
    #10

    $stop;
  end
  always #5 clk = ~clk;

endmodule
