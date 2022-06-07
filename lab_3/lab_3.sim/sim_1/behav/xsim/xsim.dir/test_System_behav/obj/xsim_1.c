/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_168(char*, char *);
extern void execute_169(char*, char *);
extern void execute_241(char*, char *);
extern void execute_242(char*, char *);
extern void execute_243(char*, char *);
extern void execute_244(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_176(char*, char *);
extern void execute_177(char*, char *);
extern void execute_178(char*, char *);
extern void execute_179(char*, char *);
extern void execute_180(char*, char *);
extern void execute_181(char*, char *);
extern void execute_182(char*, char *);
extern void execute_183(char*, char *);
extern void execute_184(char*, char *);
extern void execute_185(char*, char *);
extern void execute_186(char*, char *);
extern void execute_187(char*, char *);
extern void execute_188(char*, char *);
extern void execute_189(char*, char *);
extern void execute_190(char*, char *);
extern void execute_191(char*, char *);
extern void execute_192(char*, char *);
extern void execute_193(char*, char *);
extern void execute_194(char*, char *);
extern void execute_5(char*, char *);
extern void execute_6(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_195(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void execute_74(char*, char *);
extern void execute_75(char*, char *);
extern void execute_76(char*, char *);
extern void execute_202(char*, char *);
extern void execute_203(char*, char *);
extern void execute_164(char*, char *);
extern void execute_165(char*, char *);
extern void execute_166(char*, char *);
extern void execute_167(char*, char *);
extern void execute_237(char*, char *);
extern void execute_238(char*, char *);
extern void execute_239(char*, char *);
extern void execute_240(char*, char *);
extern void execute_163(char*, char *);
extern void execute_171(char*, char *);
extern void execute_172(char*, char *);
extern void execute_173(char*, char *);
extern void execute_245(char*, char *);
extern void execute_246(char*, char *);
extern void execute_247(char*, char *);
extern void execute_248(char*, char *);
extern void execute_249(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[56] = {(funcp)execute_168, (funcp)execute_169, (funcp)execute_241, (funcp)execute_242, (funcp)execute_243, (funcp)execute_244, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_176, (funcp)execute_177, (funcp)execute_178, (funcp)execute_179, (funcp)execute_180, (funcp)execute_181, (funcp)execute_182, (funcp)execute_183, (funcp)execute_184, (funcp)execute_185, (funcp)execute_186, (funcp)execute_187, (funcp)execute_188, (funcp)execute_189, (funcp)execute_190, (funcp)execute_191, (funcp)execute_192, (funcp)execute_193, (funcp)execute_194, (funcp)execute_5, (funcp)execute_6, (funcp)execute_56, (funcp)execute_57, (funcp)execute_195, (funcp)execute_59, (funcp)execute_60, (funcp)execute_74, (funcp)execute_75, (funcp)execute_76, (funcp)execute_202, (funcp)execute_203, (funcp)execute_164, (funcp)execute_165, (funcp)execute_166, (funcp)execute_167, (funcp)execute_237, (funcp)execute_238, (funcp)execute_239, (funcp)execute_240, (funcp)execute_163, (funcp)execute_171, (funcp)execute_172, (funcp)execute_173, (funcp)execute_245, (funcp)execute_246, (funcp)execute_247, (funcp)execute_248, (funcp)execute_249, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 56;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/test_System_behav/xsim.reloc",  (void **)funcTab, 56);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/test_System_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/test_System_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/test_System_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/test_System_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/test_System_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
