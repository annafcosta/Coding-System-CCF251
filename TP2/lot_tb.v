`timescale 1ns / 1ps

module lot_tb;

  reg clk,reset, fim, insere, fim_jogo;
  reg [3:0] num;
  wire [0:6] hex1, hex0, hex2, hex3;
  wire [0:1] ledp1, ledp2;
  wire led15, sled;
  wire [3:0] state, gled;
  
  
  
  // Instanciação do módulo Top
  Top uut (
    .clk(clk),
    .num(num),
    .reset(reset),
    .fim(fim),
    .fim_jogo(fim_jogo),
    .insere(insere),
    .hex1(hex1),
    .hex0(hex0),
    .hex2(hex2),
    .hex3(hex3),
    .ledp1(ledp1),
    .ledp2(ledp2),
    .led15(led15),
    .state(state),
    .sled(sled),
	 .gled(gled)
  );

 
    /*
    Numeros para teste:
    47010 - premio 1 - 4 consecutivos
    67039 - premio 2 - 2 consequtivos + acerto 5o digito;
    47029 - premio 1 - 3 consequitivos + acerto 5o digito;
    23119 - premio 0 - 1 consequtivo + acerto 5o digito;
    49219 - premio 0 - 2 num, mas não consequtivos + acerto 5o digito;
    17011 - prmeio 0 - 3 consecutivos + erro 5o digito;
    */

  initial begin
    $dumpfile("teste_tp2_gtk.vcd");
	 $dumpvars;
    clk = 0;
    reset = 1;
    insere = 0;
    fim = 0;
    fim_jogo = 0;
    #10
    reset = 0;
    #10

    insere = 1;
    num = 4'b0100; #10 num = 4'b0111; #10 num = 4'b0000; #10 num = 4'b0001; #10 num = 4'b0000; // 47010 
    #10
    insere = 0;
    fim = 1;
    #10
    fim = 0;
    $display("Premio sorteado: %d, Quantidade de P1: %d, Quantidade de P2: %d", uut.premio, uut.p1, uut.p2);
    fim_jogo = 1;
    #10
    fim_jogo = 0;
    #10
    insere = 1;

    num = 4'b0110; #10 num = 4'b0111; #10 num = 4'b0000; #10 num = 4'b0011; #10 num = 4'b1001; // 67039
    #10
    insere = 0;
    #10
    fim = 1;
    #10
    fim = 0;
    $display("Premio sorteado: %d, Quantidade de P1: %d, Quantidade de P2: %d", uut.premio, uut.p1, uut.p2);
    fim_jogo = 1;
    #10

    fim_jogo = 0;
    #10
    insere = 1;
    num = 4'b0100; #10 num = 4'b0111; #10 num = 4'b0000; #10 num = 4'b0010; #10 num = 4'b1001; 
    #10
    insere = 0;
    #10
    fim = 1;
    #10
    fim = 0;
    $display("Premio sorteado: %d, Quantidade de P1: %d, Quantidade de P2: %d", uut.premio, uut.p1, uut.p2);
    fim_jogo = 1;
    #10
    fim_jogo = 0;
    #10

    insere = 1;
    num = 4'b0010; #10 num = 4'b0011; #10 num = 4'b0001; #10 num = 4'b0001; #10 num = 4'b1001; // 49219
    #10
    insere = 0;
    #10
    fim = 1;
    #10
    fim = 0;
    $display("Premio sorteado: %d, Quantidade de P1: %d, Quantidade de P2: %d", uut.premio, uut.p1, uut.p2);
    fim_jogo = 1;
    #10
    fim_jogo = 0;
    #10

    insere = 1;
    num = 4'b0010; #10 num = 4'b0011; #10 num = 4'b0001; #10 num = 4'b0001; #10 num = 4'b1001; // 23119
    #10
    insere = 0;
    #10
    fim = 1;
    #10
    fim = 0;
    $display("Premio sorteado: %d, Quantidade de P1: %d, Quantidade de P2: %d", uut.premio, uut.p1, uut.p2);
    fim_jogo = 1;
    #10
    fim_jogo = 0;
    #10
    
    insere = 1;
    num = 4'b0001; #10 num = 4'b0111; #10 num = 4'b0000; #10 num = 4'b0001; #10 num = 4'b0001; // 17011
    #10
    insere = 0;
    #10
    fim = 1;
    #10
    fim = 0;
    $display("Premio sorteado: %d, Quantidade de P1: %d, Quantidade de P2: %d", uut.premio, uut.p1, uut.p2);
    fim_jogo = 1;
    #10

	  reset = 1;

    $stop;
  end
  always #5 clk = ~clk;

endmodule
