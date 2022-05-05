FT_DPCM_PTR=$c000

.export _boot_sound

_boot_sound:
	.byte 1
	.word @instruments
	.word @samples-75
	.word @song0ch0,@song0ch1,@song0ch2,@song0ch3,@song0ch4,307,256

@instruments:

@samples:
	.byte $00+.lobyte(FT_DPCM_PTR),$f3,$0c	;25 (02-p1)
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;26 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;27 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;28 
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;29 
	.byte $3d+.lobyte(FT_DPCM_PTR),$b1,$0c	;30 (03-p2)
	.byte $00+.lobyte(FT_DPCM_PTR),$00,$00	;31 
	.byte $6a+.lobyte(FT_DPCM_PTR),$4d,$0c	;32 (04-p3)

@env0:
	.byte $c0,$7f,$00,$00
@song0ch0:
	.byte $fb, $01
@song0ch0loop:
	.byte $f9, $e9, $f9, $e9, $fd
	.word @song0ch0loop
@song0ch1:
@song0ch1loop:
	.byte $f9, $e9, $f9, $e9, $fd
	.word @song0ch1loop
@song0ch2:
@song0ch2loop:
	.byte $f9, $e9, $f9, $e9, $fd
	.word @song0ch2loop
@song0ch3:
@song0ch3loop:
	.byte $f9, $e9, $f9, $e9, $fd
	.word @song0ch3loop
@song0ch4:
@song0ch4loop:
	.byte $32, $f9, $df, $3c, $85, $f9, $91, $40, $d3, $00, $fd
	.word @song0ch4loop


.segment "CODE6"
;	.incbin "boot_sound.dmc"