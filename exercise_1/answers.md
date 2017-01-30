## Part I.

1. 305 with 10 bits -> 0100110001 -> 0b0100110001

2. -305 with 10 bits -> 1011001111 -> 0b1011001111

3. -197 with 9 bits -> 100111011 -> 0b100111011

4. 197 with 9 bits -> 011000101 -> 0b011000101

5. 00+01 0101 0101 -> 1 5 5 -> 0x155

6. 00+11 0011 1101 -> 33d -> 0x33d

7. 11001100 to decimal unsigned -> 204

8. 11001100 to decimal signed -> -52

## Part II.

1.  | Mem   | Val|
    | ----- | -- |
    | 0xa80 | d3 |
    | 0xa81 | f0 |
    | 0xa82 | 55 |
    | 0xa83 | a1 |

2.  var *x; 1-byte
    var b; 4-bytes

    b = 0x2f552;

    | Mem   | Val|
    | ----- | -- |
    | 0xa80 | 2f |
    | 0xa81 | 55 |
    | 0xa82 | 02 |
    | 0xa83 | 00 |

    x = 0xa81;

    b = b + *x;

    0x2f552 + 0x55 = 193874 + 85 = 193959 = 0x2f5a7

    | Mem   | Val|
    | ----- | -- |
    | 0xa80 | 2f |
    | 0xa81 | 5a |
    | 0xa82 | 07 |
    | 0xa83 | 00 |

3.  b = [0..7] = [0b000..0b111];
    merge = 00000001;
    merge = merge << b;
    c |= merge;


4.  var b; 1-byte
    pos5to1 = 00100000; // |
    pos2invert = 00000010; //
    asofashjonfasuifhgqui[ghqfgiuahsfiu[asf


