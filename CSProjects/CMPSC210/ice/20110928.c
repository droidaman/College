/*
set n bits of x to rightmost n bits of y
            p
x...xxx...xnnnxx...x        x...xxx...oooxx...x
            ^^^clear                  ^^^
                                      111
y...yyy.........ynnn        y...ooo........onnn
              <--^^^            oo......nnnoooo

1) Clear the n bits in x.
2) Clear all bits in y except the rightmost n bits.
3) Shift them to position p.
4) OR them together.

   X-Mask
     ~0<<n                  =>   n 0's on the right
     ~(~0<<n)               =>   n 1's on the right
     ~(~(~0<<n)<<(p+1-n))   =>   shifts n 1's to p
     x&~(~(~0<<n)<<(p+1n))  =>   n 0's at p

   Y-Mask
     ~(~0<<n)
     y&~(~0<<n)
     (y&~(~0<<n))<<(p+1-n)

   Combined
   return (x&~(~(~0<<n)<<(p+1-n))|((y&~(~0<<n))<<(p+1-n));


NOTE:
 0 = 00000000 in 8-bit
~0 = 11111111 in 8-bit
*/
