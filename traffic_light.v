//design code for traffic light.
module traffic_light(clk,rst,light);
  input clk,rst;
  output reg [2:0] light;
  reg [1:0] state;
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  always @(posedge clk or posedge rst)
     begin
       if(rst)
         state <= S0;
       else
          begin
             case(state)
                S0: state <= S1;
                S1: state <= S2;
                S2: state <= S0;
                default: state <= S0;
             endcase
          end
     end

  always @(*)
    begin
       case(state)
         S0: light = 3'b001; // Green
         S1: light = 3'b010; // Yellow
         S2: light = 3'b100; // Red
         default: light = 3'b000;
       endcase
    end
endmodule
