module srff_tb();
reg s,r,clk;
wire q,qbar;
main uut(.s(s),.r(r),.clk(clk),.q(q),.qbar(qbar));
initial
begin
s=0;
r=0;
clk=0;
fork
#2 s=0;
#2 r=1;
#2 s=0;
#2 r=0;
#2 s=0;
#2 r=1;
#2 s=1;
#2 r=0;
#2 s=1;
#2 r=1;
end 
always #1 clk=!clk;
endmodule
