`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/03 10:39:00
// Design Name: 
// Module Name: DMEM
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



/*
module dmem(
    input clk,
    input DM_CS,
    input DM_W,
    input DM_R,
    input [4 : 0] addr,
    input [31 : 0] data_in,
    output reg [31 : 0] data_out
    );
    reg [31 : 0] data [31 : 0];
    
    always @(*)
    begin
    if(DM_CS==0)
        data_out <= 32'bz;
    else//ena=1
      begin
        if(clk==0)//����д
        begin
            if(DM_W==0)//��
                data_out <= data[addr];      
            else //(wena==1)
                data_out <= data_out;
        end
        else //clk==1
        begin
            if(DM_W==1)//д��Ч
            begin 
                data[addr] <= data_in;  
                data_out <= data_out;
            end
            else if(DM_R)//����Ч
                data_out <= data[addr];           
        end//end else
      end
    end
    
   
endmodule
*/
/*
module dmem(clk, DM_CS, DM_W, DM_R, addr, data_in, data_out);
       input clk; //�洢��ʱ���źţ�������ʱ�� ram �ڲ�д������
       input DM_CS; //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У�������� z
       input DM_W; //�洢��д��Ч�źţ��ߵ�ƽΪд��Ч,�� DM_CSͬʱ��Чʱ�ſɶԴ洢������д
       input DM_R;//�洢������Ч�źţ��ߵ�ƽΪ����Ч,�� DM_CSͬʱ��Чʱ�ſɶԴ洢�����ж�
       input [31 : 0] addr; //�����ַ��ָ�����ݶ�д�ĵ�ַ
       input [31 : 0] data_in; //�洢��д������ݣ��� clk ������ʱ��д��
       output wire [31 : 0] data_out; //�洢������������
       
       parameter wordsize = 8;
       parameter memsize = 512;
       reg [wordsize-1 : 0] mem[memsize-1 : 0];
       
       assign data_out = (DM_CS==1'b1 && DM_R==1'b1) ? {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]} : 32'bz;
       
       always @(posedge clk)
       begin
       if(DM_CS==1'b1&&DM_W==1'b1)
            begin           
             mem[addr+3] <= data_in[31 : 24];//˳�򷴹�����
             mem[addr+2] <= data_in[23 : 16];
             mem[addr+1] <= data_in[15 : 8];
             mem[addr] <= data_in[7 : 0];
            end              
       else ;
       end
endmodule
*/
module dmem(
input clk,
input DM_CS,
input DM_W,
input DM_R,
input [31:0] addr,
input [31:0] data_in,
output  [31:0] data_out
    );
    reg [31:0] mem [1023:0];
    
    always@ (posedge clk)
    begin
    if(DM_CS==1'b1&&DM_W==1'b1)
        mem[addr]<=data_in;
    end
    
    assign data_out= (DM_CS==1'b1 && DM_R==1'b1) ?mem[addr] : 32'bz; 

endmodule


