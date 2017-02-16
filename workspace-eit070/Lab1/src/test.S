.global test
.text
.ent test
test:
	ADDI R3, R0, 0xFFFF0000
	RTSD r15,8
	NOP
.end test
