module scramble_tb();

// all the inputs has been declared as reg
reg CLK, RST_N, in_en;
reg  seed_en;
reg  out_en;
reg [3 : 0] in_data;
reg [3 : 0] seed_data;

// output hs declared as wire
wire in_rdy;
wire seed_rdy;
wire [3 : 0] out_data;
wire out_rdy;

// instantiated the scambler
scrambler prince(CLK, RST_N, in_data, in_en, in_rdy, seed_data,seed_en, seed_rdy, out_en, out_data, out_rdy);

// initializing the input
initial 
begin
CLK =1'b0;
in_en=1'b0; 
seed_en=1'b0;
RST_N=1'b1;
out_en=1'b0;
#20 RST_N=1'b0;
#200 RST_N=1'b1;
#10 seed_en=1'b1;
#100 seed_en=1'b0; in_en = 1'b1; 
#100 out_en =1'b1;
end

// clock will repeat every after 50 s
always #50 CLK = ~CLK;

initial
begin
seed_data = 4'b0110;
in_data = 4'b1010;
#350 in_data= 4'b0001;
#100 in_data= 4'b0010;
#100 in_data= 4'b0000;
#100 in_data= 4'b0011;
#100 in_data= 4'b0111;
#100 in_data= 4'b0011;
#100 in_data= 4'b0111;
#100 in_data= 4'b0011;
#100 in_data= 4'b0111;
end
initial 
begin
$monitor ($time,"CLK=%b, RST_N=%b, in_data=%b, in_en=%b, in_rdy=%b, seed_data=%b,seed_en=%b, seed_rdy=%b, out_en=%b,out_data=%b, out_rdy=%b",
CLK, RST_N, in_data, in_en, in_rdy, seed_data,seed_en, seed_rdy, out_en, out_data, out_rdy);
#1150 $finish;
end
endmodule
