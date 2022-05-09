module DEMUX_1_to_2( input c,
    input In, output Out1, output Out2);
    wire cn;

    not(cn, c);
    and(Out1, cn, In);
    and(Out2, c, In);
endmodule
