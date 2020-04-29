`include "processor.v"
module tb;
reg clk=0;
integer k;
processor pro (clk);

always
#2 clk = ~clk;

initial
begin
  for(k=0;k<31;k++)
	pro.regbank[k] = k;

	pro.I_mem[0]<=32'b00000000001000000000000000001010;
	pro.I_mem[1]<=32'b00000000010000000000000000010100;
	pro.I_mem[2]<=32'b00000000011000000000000000011110;
	pro.I_mem[3]<=32'b00010000000001000000000000100010;
	pro.I_mem[4]<=32'b00010000000001010000000010000011;
	pro.I_mem[5]<=32'b11111111111111111111111111111111;
	pro.halted <= 0;
	pro.pc<=6'b0;

	for(k=0;k<6;k++)
		#10 $display("R%1d - %2d",k,pro.regbank[k]);
end

initial
begin
$dumpfile("pro.vcd");
$dumpvars(0,pro);
#50 $finish;
end

endmodule


