module Lot(clk, num, reset, fim, fim_jogo, insere, premio, p1, p2);
  input  clk, reset, fim, insere, fim_jogo; 
  input  [0:3] num;
  output reg [0:1] premio;
  output reg [0:4] p1, p2;
  
  reg [3:0] state; // registrador de estados
  reg [3:0] c;   // registrador de consecutivos
  
  // num da loteria: 47019
  /* Codificação dos premios:
		- premio 1 = 01
		- premio 2 = 10
		- s/premio = 00
  */
  parameter s0 = 4'b0000,
    s1  = 4'b0001,
    s2  = 4'b0010,
    s3  = 4'b0011,
    s4  = 4'b0100,
	 sg1 = 4'b0101, // estado de premio 1
	 sg2 = 4'b0110, // estado de premio 2
    sg0 = 4'b0111, // estado de premio 0
	 sgx = 4'b1000; // estado de espera 
					
  
  
  
  initial begin
    state <= s0;
    premio = 2'b00;
    p1 = 5'b00000;
    p2 = 5'b00000;
	c = 4'b0000;
  end 
  
  always @(posedge clk , posedge reset , posedge fim_jogo , posedge fim) begin
    if (reset == 1'b1) begin
			state <= s0;
			premio <= 2'b00;
			p1 <= 5'b00000;
			p2 <= 5'b00000;
			c <= 4'b0000;
    end else if (fim_jogo == 1'b1) begin
			state <= s0;
			premio <= 2'b00;
			c <= 4'b0000;
    end else if (fim == 1'b1) begin //  depois de comprarar e os numeros de input com os numeros da loteria e gerar o estado de premio, e mostrado a saída e contabilizado o premio
        case(state)
			sg1: begin
				premio = 2'b01;
				p1 <= p1 + 1;
				state <= sgx;
			end
			sg2: begin
				premio = 2'b10;
				p2 <= p2 + 1;
				state <= sgx;
			end
            sg0: begin
                premio = 2'b00;
					 state <= sgx;
            end
			default: begin
				premio = 2'b00;
				state <= state;
			end
		endcase
	 end else if(insere) begin // caso de inserção, onde o numero do input é comparado com os numero da loteria, caso seja iguais, é somado mais 1 no contador de consecutivo e pula para o próximo estado, caso contrario, só pula para o próximo estado;
			case (state)
                s0: begin
                    if(num == 4'b0100)begin
                        c <= c+1;
                        state <= s1;
                    end else if(num != 4'b0100)begin
                        c <= 0;
                        state <= s1;
                    end
                end
                s1: begin
                    if(num == 4'b0111)begin
                        c <= c+1;
                        state <= s2;
                    end else if (num != 4'b0111) begin
                        c <= 0;
                        state <= s2;                       
                    end
                end
                s2: begin
                    if(num == 4'b0000)begin
                        c <= c+1;
                        state <= s3;
                    end else if(num != 4'b0000)begin
                        if (c >= 2) begin // caso o numero de consecutivo foi maior ou igual a 2, a pessoa tem a chance com o digito 5, por isso mesmo que erre, o contador nao pode zerar;
                            state <= s3;
                        end else begin
                            c <= 0;
                            state <= s3;
                        end
                        
                    end
                end
                s3: begin
                    if(num == 4'b0001)begin
                        if (c >= 3) begin
                            state <= sg1; // caso acerte os 4 numeros, vai direto para o estado de premio 1;
                        end else begin
                            c <= c +1;
                            state <= s4;  
                        end
                    end else if(num != 4'b0000)begin
                        if (c >= 2) begin
                            state <= s4;
                        end else begin
                            c <= 0;
                            state <= s4;
                        end
                    end
                end
                s4: begin
                   case (c) // analisando o contador,
                        2'b10: begin
                            if(insere && (num == 4'b1001))begin // se é dois consecutivos e acerta o digito 5, ganha o premio 2;
                                state <= sg2;
                            end else if(insere && (num != 4'b1001))begin
                                state <= sg0; // caso contrario não ganha nada;
                            end
                        end
                        2'b11: begin
                            if(insere &&(num == 4'b1001))begin // caso acerte 3 consecutivo e o digito 5, ganha o premio 1;
                                state <= sg1;
                            end else if(insere && (num != 4'b1001))begin
                                state <= sg2; // caso erre o 5, fica com 3 consecutivo e ganha o premio 2;
                            end
                        end
						default: begin
                            state <= sg0; 
                        end		
                    endcase 
                end 
            endcase
     end  
  end
endmodule
