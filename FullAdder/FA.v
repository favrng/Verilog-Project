//full adder FA.v
module fa ( a, b, c, sum, carry);
    input a, b, c;
    output sum, carry ;
    wire s1, c1, c2; //internal

    xor(s1, a, b);
    xor(sum, s1, c);
    and(c2, s1, c);
    and(c1, a, b);
    or(carry, c1, c2);
endmodule
