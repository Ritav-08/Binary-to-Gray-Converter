`timescale 1ns / 1ps

module tb_BtGconvertor();
reg [3:0]a_ti;
wire [3:0]b_to;

//net(s)
integer i;
reg [3:0]exp_gray;
integer count;
integer pass;
integer fail;

//instantiation
BtGconvertor DUT(.a_i(a_ti), 
   .b_o(b_to));

//input feeding
initial begin
a_ti = 4'b0000;
#2;
check();
for(i = 1; i < 16; i = i + 1) begin //loop feed
   #3 a_ti = i;
   #2;
   check();
end
$display("-----------"); //status display
$display("Total Checks: %d | Pass: %d, Fail: %d", count, pass, fail);
$display("-----------");
#5 $finish;
end

//self checker
task check(); begin
exp_gray[3] = a_ti[3];
exp_gray[2] = a_ti[2] ^ a_ti[3];
exp_gray[1] = a_ti[1] ^ a_ti[2];
exp_gray[0] = a_ti[0] ^ a_ti[1];
if(exp_gray !== b_to) begin
   fail = fail + 1;
   $display("Time: %0t | Binary: %b, Gray: %b | Expected Gray: %b", $time, a_ti, b_to, exp_gray);
   //$fatal(1, "Time: %0t | Binary: %b, Gray: %b | Expected Gray: %b", $time, a_ti, b_to, exp_gray); 
   //fatal error tag: 0-stop(default), 1(current time step), 2(current simulation time)
end
else 
   pass = pass + 1;
count = count + 1;
end
endtask

//initialization
initial begin 
count = 0;
pass = 0;
fail = 0;
end

//capture
initial begin
$monitor("Time: %0t | Binary: %b, Gray: %b", $time, a_ti, b_to);
$dumpfile("BtG_Convertor.vcd");
$dumpvars(0, tb_BtGconvertor);
end

endmodule
