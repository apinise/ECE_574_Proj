module mult12x12 (
    input  logic             clk,
    input  logic             reset,
    input  logic [11:0]      a,
    input  logic [11:0]      b,
    input  logic             start,
    output logic [23:0]      result,
    output logic             done
);

  logic [23:0]        r;
  logic [11:0][23:0]  next_r;
  logic [23:0] 	      next_r2;
  logic               d, next_d;

  genvar i;
  generate
    for (i=0; i < 12; i++) begin
      assign next_r[i] = (b[i] == 1) ? (a << i) : 24'd0;
    end
  endgenerate
  
  always_ff @(posedge clk) begin
    r <= (reset) ? 24'h0 : next_r2;
    d <= (reset) ? 1'd0 : next_d;
  end
  
  always_comb begin
    next_d = start;
    next_r2 = next_r[0]+next_r[1]+next_r[2]+next_r[3]+next_r[4]+next_r[5]+next_r[6]
                +next_r[7]+next_r[8]+next_r[9]+next_r[10]+next_r[11];
  end
  
  assign done = d;
  assign result = r;
  
   // create a 16 * 16 -> 32 bit multipier
   //
   // make sure to have one level of registers:
   //    result_in <- (a * b)
   //    result = register(result_in)
   // similarly, the done signal follows the start signal
   // with on clock cycle of delay:
   //    done = register(start)
      
endmodule
