
/*
Declaração do Modulo
Codificador
*/

module Modulo_Codificador (bit0, bit1, bit2, bit3, s0, s1, s2, s3);
	//Declaração das Entradas/Saidas
	input  bit0, bit1, bit2, bit3;
	output  s0, s1, s2, s3;
	
	
	// Declaração do funcionamento do circuito
	
	assign s3 = ( ~bit0 & ~bit2 & ~bit3) | (~bit1 & ~bit3) | (~bit0 & bit1 & bit3) | (bit0 & ~bit1 & ~bit2);
	assign s2 = ( ~bit0 & bit1 & bit3) | (bit0 & ~bit1 & ~bit2) | (bit0 & bit2 & bit3) | (bit0  & bit1 & ~bit3);
	assign s1 = ( ~bit0 & ~bit1 & ~bit2) | (~bit0 & ~bit2 & bit3) | (bit1 & bit2 & ~bit3) | (bit0  & ~bit3);
	assign s0 = ( ~bit0 & ~bit2 & bit3) | (~bit1 & bit2 & ~bit3) | ( bit1 & bit3) | (bit0  & bit1 & ~bit2);
	



endmodule	