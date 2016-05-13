// asembler2016bProject.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "cpu.h"
#include "hashtable.h"



char instructionsSymbols[8] = { '!', '@', '#', '$', '%', '^', '&', '*' };

registers cpu_regs[7];
cpu_memory cpu_mem[1000];
cpu_code[10000];

int pc;
int sp;


int LENGTH[] = { 6, -9, 15 };
int K[] = { 2 };
 

int _tmain(int argc, _TCHAR* argv[])
{

	/*
	LABEL(MAIN)
	mov("5[4 - 6]", W);
	add(r2, STR);
	LABEL(LOOP)
	jmp(W);
	prn(# , -5);
	sub(r1, r4);
	inc(K);
	mov(-4[5 - 9], r3);
	bne(L3);
	LABLE(END);
	stop();
	*/
	 

	mov_imm_dynamic("-5[4 - 9]", r3);
	//inc_direct(K);
	//sub_registers(r1, r4);

	return 0;
}

