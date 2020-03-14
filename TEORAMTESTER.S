                    1       * TEO RAM TESTER
                    2               OBJ $300
                    3               ORG $300
0300: 20 58 FC      4       START   JSR $FC58		; clr
0303: A9 65         5               LDA #$65     ; lsb
0305: 85 06         6               STA $06
0307: A9 03         7               LDA #$03     ; msb
0309: 85 07         8               STA $07
030B: A5 06         9       ILOOP   LDA $06
030D: 20 DA FD      10              JSR $FDDA
0310: A5 07         11              LDA $07
0312: 20 DA FD      12              JSR $FDDA
0315: 20 25 03      13              JSR VRFY
0318: E6 06         14              INC $06
031A: D0 EF         15              BNE ILOOP
031C: E6 07         16              INC $07
031E: A5 07         17              LDA $07
0320: C9 40         18              CMP #$40		; stop @ 16K
0322: 90 E7         19              BCC ILOOP
0324: 60            20      END     RTS
0325: A0 00         21      VRFY    LDY #$00
0327: A9 FF         22              LDA #$FF
0329: 91 06         23              STA ($06),Y
032B: B1 06         24              LDA ($06),Y
032D: C9 FF         25              CMP #$FF
032F: D0 0B         26              BNE BTCK
0331: A9 00         27              LDA #$00
0333: 91 06         28              STA ($06),Y
0335: B1 06         29              LDA ($06),Y
0337: C9 00         30              CMP #$00
0339: D0 01         31              BNE BTCK
033B: 60            32              RTS
033C: A9 01         33      BTCK    LDA #$01
033E: 85 08         34              STA $08
0340: A5 08         35      BLOOP   LDA $08
0342: 91 06         36              STA ($06),Y
0344: B1 06         37              LDA ($06),Y
0346: C5 08         38              CMP $08
0348: 20 DA FD      39              JSR $FDDA
034B: D0 07         40              BNE ERROR
034D: 06 08         41              ASL $08
034F: 90 EF         42              BCC BLOOP
0351: 4C 54 03      43              JMP ERROR
0354: 68            44      ERROR   PLA
0355: 4C 24 03      45              JMP END
