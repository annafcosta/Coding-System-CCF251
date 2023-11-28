`timescale 1ns/1ps
module lot_tb;
  reg clk_tb, reset_tb, fim_tb, fim_jogo_tb, insere_tb;
  reg [0:3] num_tb;
  wire [0:1] premio_tb;
  wire [0:4] p1_tb, p2_tb;

  Lot TB (.clk(clk_tb), .reset(reset_tb), .fim(fim_tb), .fim_jogo(fim_jogo_tb), .insere(insere_tb),
           .num(num_tb), .premio(premio_tb), .p1(p1_tb), .p2(p2_tb));
  
  initial begin
    $dumpfile("teste_gtx.vcd");
    $dumpvars;

    clk_tb = 0;
    reset_tb = 1;
    fim_tb = 0;
    fim_jogo_tb = 0;
    insere_tb = 0;
    #1;
    reset_tb = 0;
    #1;
    insere_tb = 1;
    num_tb[0] = 0; num_tb[1] = 1; num_tb[2] = 0; num_tb[3] = 0;
	 
	 $display("Numero = %d",num_tb);
    #1;
    num_tb[0] = 0; num_tb[1] = 1; num_tb[2] = 1; num_tb[3] = 1;
	 $display("Numero = %d",num_tb);
    #1;
    num_tb[0] = 0; num_tb[1] = 0; num_tb[2] = 0; num_tb[3] = 0;
	 $display("Numero = %d",num_tb);
    #1;
    num_tb[0] = 0; num_tb[1] = 0; num_tb[2] = 0; num_tb[3] = 1;
	 $display("Numero = %d",num_tb);
    #1;
	 num_tb[0] = 1; num_tb[1] = 0; num_tb[2] = 0; num_tb[3] = 1;
	 $display("Numero = %d",num_tb);
    #1;
    insere_tb = 0;
    fim_tb = 1;
    #1;
	 fim_tb = 0;
	 fim_jogo_tb = 1;
	 #1;
	 fim_jogo_tb = 0;
	 #1;

    $display("Premio sorteado = %d. Quantidade de premio 1 : %d, Quantidade de premio 2: %d", premio_tb, p1_tb, p2_tb);

    #1; 
	 
	 insere_tb = 1;
    num_tb[0] = 1; num_tb[1] = 0; num_tb[2] = 0; num_tb[3] = 0;
	 
	 $display("Numero = %d",num_tb);
    #1;
    num_tb[0] = 1; num_tb[1] = 0; num_tb[2] = 0; num_tb[3] = 1;
	 $display("Numero = %d",num_tb);
    #1;
    num_tb[0] = 0; num_tb[1] = 0; num_tb[2] = 0; num_tb[3] = 0;
	 $display("Numero = %d",num_tb);
    #1;
    num_tb[0] = 0; num_tb[1] = 0; num_tb[2] = 1; num_tb[3] = 0;
	 $display("Numero = %d",num_tb);
    #1;
	 num_tb[0] = 0; num_tb[1] = 0; num_tb[2] = 0; num_tb[3] = 0;
	 $display("Numero = %d",num_tb);
    #1;
    insere_tb = 0;
    fim_tb = 1;
    #1;

    $display("Premio sorteado = %d. Quantidade de premio 1 : %d, Quantidade de premio 2: %d", premio_tb, p1_tb, p2_tb);

    #1; 
			

    $finish; // Adicione um ponto e vírgula aqui
	 
  end
  always #1 clk_tb = ~clk_tb;
endmodule
