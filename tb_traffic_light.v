//testbench for traffic light.
module tb();
  reg clk,rst;
  wire [2:0] light;
  traffic_light dut(clk,rst,light);
  always #5 clk=~clk;
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      clk=0; rst=1; #10;
      rst=0; #100;
      $finish;
    end
  initial
    $monitor($time,"clk=%b,rst=%b,light=%b",clk,rst,light);
endmodule
      