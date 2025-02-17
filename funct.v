////////////////////////////////////////////

    wire [7:0] a,b,out;
    and #5 AND8[7:0] (out,a,b);
    and #5 AND8[7:0] (out[7:0],a[7:0],b[7:0]);

    and and0(out[0],a[0],b[0]);
    and and0(out[1],a[1],b[1]);
    and and0(out[2],a[2],b[2]);
    and and0(out[3],a[3],b[3]);
    and and0(out[4],a[4],b[4]);
    and and0(out[5],a[5],b[5]);
    and and0(out[6],a[6],b[6]);
    and and0(out[7],a[7],b[7]);

////////////////////////////////////////////

    flipflop R[7:0], (q[7:0], data_in[7:0], clk, set, rest)
    
    flipflop R0[7:0], (q[0], data_in[0], clk, set, rest)
    flipflop R1[7:0], (q[1], data_in[1], clk, set, rest)
    flipflop R2[7:0], (q[2], data_in[2], clk, set, rest)
    flipflop R3[7:0], (q[3], data_in[3], clk, set, rest)
    flipflop R4[7:0], (q[4], data_in[4], clk, set, rest)
    flipflop R5[7:0], (q[5], data_in[5], clk, set, rest)
    flipflop R6[7:0], (q[6], data_in[6], clk, set, rest)
    flipflop R7[7:0], (q[7], data_in[7], clk, set, rest)

////////////////////////////////////////////
