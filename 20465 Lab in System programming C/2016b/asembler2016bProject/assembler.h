#pragma once 

#define JUMP(f) goto f##_LABLE
#define LABEL(x) x##_LABLE:



 
typedef enum ARE_INFO
{
	ARE_ABSOLUTE,
	ARE_EXTERNAL,
	ARE_RELOCATABLE,
}ARE_INFO;

typedef enum   ACCESSING_MODE
{
	IMMEDIATE_ACCESSING,
	DIRECT_ACCESSING,
	DYNAMIC_IMMEDIATE_ACCESSING,
	REGISTER_DIRECT_ACCESSING
} ACCESSING_MODE;

typedef enum GRUOP_OPERANDS
{
	NO_OPERANDS,
	ONE_OPERANDS,
	TWO_OPERANDS
} GRUOP_OPERANDS;

typedef enum OPCODES
{
	OPCODE_MOV,
	OPCODE_CMP,
	OPCODE_ADD,
	OPCODE_SUB,
	OPCODE_NOT,
	OPCODE_CLR,
	OPCODE_LEA,
	OPCODE_INC,
	OPCODE_DEC,
	OPCODE_JMP,
	OPCODE_BNE,
	OPCODE_RED,
	OPCODE_PRN,
	OPCODE_JSR,
	OPCODE_RTS,
	OPCODE_STOP,
}OPCODES;


typedef enum CPU_REGISTERS
{
	r0,
	r1,
	r2,
	r3,
	r4,
	r5,
	r6,
	r7
} CPU_REGISTERS;


typedef union cpuOpcode
{
	struct
	{
		unsigned short era : 2;
		unsigned short opDest : 2;
		unsigned short opSource : 2;
		unsigned short opcode : 4;
		unsigned short group : 2;
		unsigned short unused : 3;
	} u;
	unsigned short fullReg;	 
} cpuOpcode;




typedef union cpuOpcode2
{
	struct
	{
		unsigned short era : 2;
		unsigned short direct_operand : 13;
		unsigned short unused : 1;
	} u;
	unsigned short fullReg;
} cpuOpcode2;

  

typedef union cpuOperandDestination
{
	struct
	{
		unsigned short era : 2;
		unsigned short reg_num : 6;
		unsigned short unused : 8;
	} u;
	unsigned short fullReg;
} cpuOperandDestination;


typedef union cpuOperandSourceAndDestination
{
	struct
	{
		unsigned short era : 2;
		unsigned short dest_reg_num : 6;
		unsigned short source_reg_num : 6;
		unsigned short unused : 1;
	} u;
	unsigned short fullReg;
} cpuOperandSourceAndDestination;

 


typedef union registers
{
	struct
	{
		short r : 15;
		short unused : 1;
	} u;
	short fullReg;
} registers;


typedef union status_register
{
	struct
	{
		short c : 1;
		short z : 1;
		short unused : 14;
	} u;
	short fullReg;
} status_register;



typedef union cpu_memory
{
	struct
	{
		short mem : 15;
		short unsued : 1;
	} u;
	short fullReg;
} cpu_memory;




 


void mov_immediate(int operand, CPU_REGISTERS reg);
//void add(CPU_REGISTERS reg, STR);
//void jmp(W);
//void prn(# , -5);
void sub_immediate(CPU_REGISTERS source_reg, CPU_REGISTERS dest_reg);
void sub_registers(CPU_REGISTERS source_reg, CPU_REGISTERS dest_reg);
//void inc(K);
//void mov(-4[5 - 9], r3);
void stop();
void cmp();
void not();
void clr();
void lea();
void dec();




void pushCommand(unsigned short cmd);

