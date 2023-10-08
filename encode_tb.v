`include "encode_display.v"
`timescale 1ns/1ns

module encode_display_tb;

reg S0, S1, S2, S3;
wire a, b, c, d, e, f, g;

display uut (
    .S0(S0),
    .S1(S1),
    .S2(S2),
    .S3(S3),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g)
  );

initial begin
    $dumpfile("encode_tb.vcd"); // Dumpfile para visualisacao das formas de onda
    $dumpvars(0, encode_display_tb);;

  // Casos de teste
  // Intervalos de 10ns por cada entrada, para facilitar a visualisacao
  // Imprime o tempo, entrada e saida no terminal
    #10;
    S0 = 0; S1 = 0; S2 = 0; S3 = 0;

    $display("Time = %0t | Entrada = %0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h",
             $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 1; S1 = 0; S2 = 0; S3 = 0;

    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 0; S1 = 1; S2 = 0; S3 = 0;

    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 1; S1 = 1; S2 = 0; S3 = 0;

    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 0; S1 = 0; S2 = 1; S3 = 0;

  //5
    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 1; S1 = 0; S2 = 1; S3 = 0;

   //6
    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 0; S1 = 1; S2 = 1; S3 = 0;

    //7
    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 1; S1 = 1; S2 = 1; S3 = 0;

     //8
    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 0; S1 = 0; S2 = 0; S3 = 1;

     //9
    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 1; S1 = 0; S2 = 0; S3 = 1;

     //10
    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 0; S1 = 1; S2 = 0; S3 = 1;

    //11
    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 1; S1 = 1; S2 = 0; S3 = 1;

    //12
    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 0; S1 = 0; S2 = 1; S3 = 1;

    //13
    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 1; S1 = 0; S2 = 1; S3 = 1;

    //14
    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 0; S1 = 1; S2 = 1; S3 = 1;

    //15
    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);
    #10;
    S0 = 1; S1 = 1; S2 = 1; S3 = 1;

    $display("Time = %0t | Entrada = %0h%0h%0h%0h%0h Saída = %0h%0h%0h%0h%0h%0h%0h", 
    $time, S0, S1, S2, S3, a, b, c, d, e, f, g);

    #100; // Adicione um atraso maior antes de finalizar para visualizar melhor
    $finish;
end

endmodule