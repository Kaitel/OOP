#include "assembler.h"




// Example  move -1, r2
void mov_immediate(int source_operand, CPU_REGISTERS dest_reg)
{
	cpuOpcode		o;	
	o.fullReg = 0;
	o.u.era = ARE_ABSOLUTE;
	o.u.opSource =  IMMEDIATE_ACCESSING;
	o.u.opDest =    REGISTER_DIRECT_ACCESSING;
	o.u.opcode =    OPCODE_MOV;
	o.u.unused =    0x5;
	o.u.group =     TWO_OPERANDS;
	pushCommand(o.fullReg);

	cpuOpcode2 m2;
	m2.fullReg = 0;
	m2.u.era = ARE_ABSOLUTE;
	m2.u.direct_operand = source_operand;
	m2.u.unused = 0;
	pushCommand(m2.fullReg);
	

	cpuOperandDestination m3;
	m3.fullReg = 0;
	m3.u.era = ARE_ABSOLUTE;
	m3.u.reg_num = dest_reg;
	m3.u.unused = 0;

	pushCommand(m3.fullReg);
}

 

// Example  sub_registers  r1,r4
void sub_registers(CPU_REGISTERS source_reg, CPU_REGISTERS dest_reg)
{
	cpuOpcode		o;
	o.fullReg = 0;
	o.u.era = ARE_ABSOLUTE;
	o.u.opSource = REGISTER_DIRECT_ACCESSING;
	o.u.opDest = REGISTER_DIRECT_ACCESSING;
	o.u.opcode = OPCODE_SUB;
	o.u.group = TWO_OPERANDS;
	o.u.unused = 0x5;
	pushCommand(o.fullReg, 0);

	cpuOperandSourceAndDestination m2;
	m2.fullReg = 0;
	m2.u.era = ARE_ABSOLUTE;
	m2.u.source_reg_num = source_reg;
	m2.u.dest_reg_num = dest_reg;
	m2.u.unused = 0;
	pushCommand(m2.fullReg, 1);

}


void inc_direct(char address)
{
	cpuOpcode		o;
	o.fullReg = 0;
	o.u.era = ARE_ABSOLUTE;
	o.u.opSource = 0;
	o.u.opDest = REGISTER_DIRECT_ACCESSING;
	o.u.opcode = OPCODE_INC;
	o.u.group = ONE_OPERANDS;
	o.u.unused = 0x5;
	pushCommand(o.fullReg, 0);

	cpuOperandDestination m2;
	m2.fullReg = 0;
	m2.u.era = ARE_RELOCATABLE;
	m2.u.reg_num = 0; // Address is not matter in the first pass
	m2.u.unused = 0;
	pushCommand(m2.fullReg, 1);
}

void inc_register(CPU_REGISTERS reg)
{


}

/* This command will have three lines in code segment */
void mov_imm_dynamic(char *address, CPU_REGISTERS reg)
{
	cpuOpcode	o;
	o.fullReg = 0;
	o.u.era = ARE_ABSOLUTE;
	o.u.opSource = DYNAMIC_IMMEDIATE_ACCESSING ;
	o.u.opDest = REGISTER_DIRECT_ACCESSING;
	o.u.opcode = OPCODE_MOV;
	o.u.group = TWO_OPERANDS;
	o.u.unused = 0x5;
	pushCommand(o.fullReg, 0);


	cpuOperandDestination m3;
	m3.fullReg = 0;
	m3.u.era = ARE_ABSOLUTE;
	m3.u.reg_num = reg;
	m3.u.unused = 0;

	pushCommand(m3.fullReg);



}

void stop()
{

	cpuOpcode		o;
	o.fullReg = 0;
	o.u.era = ARE_ABSOLUTE;
	o.u.opSource = 0;
	o.u.opDest = 0;
	o.u.opcode = OPCODE_STOP;
	o.u.group = NO_OPERANDS;
	o.u.unused = 0x5;
	pushCommand(o.fullReg, 0);
}