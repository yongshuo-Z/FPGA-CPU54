`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/02 20:14:07
// Design Name: 
// Module Name: MUX6
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module MUX6(//ָ���ȡʱ�ж���rt����rd����Ĵ������д���ݶˣ�1Ϊrt��0Ϊrd,2Ϊjal��Ӧ��31�żĴ��� 
    input [4 : 0] rdc,//0
    input [4 : 0] rtc,//1
    input [4:  0] jal,//2
    input [4 : 0] none6,//3
    input [1 : 0] M6,
    output reg [4 : 0] to_regfile
    );
    always @(*)
    begin
    case(M6)
        2'b01: to_regfile = rtc;
        2'b00: to_regfile = rdc; 
        2'b10: to_regfile = jal;
        2'b11: to_regfile = none6;
        default:
        to_regfile = rdc;
        //to_regfile = 32'h1f1f1f1f;
   endcase
   end
endmodule
