/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/boza/4IR/Archi/Procesor/memory.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3392787015_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    int t11;
    unsigned char t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    t1 = (t0 + 3144U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(64, ng0);

LAB6:    t2 = (t0 + 3464);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t5 = (t0 + 3464);
    *((int *)t5) = 0;
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 14208);
    t5 = (t0 + 3544);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 14224);
    t4 = 1;
    if (2U == 2U)
        goto LAB11;

LAB12:    t4 = 0;

LAB13:    if (t4 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 14242);
    t4 = 1;
    if (2U == 2U)
        goto LAB24;

LAB25:    t4 = 0;

LAB26:    if (t4 != 0)
        goto LAB22;

LAB23:
LAB9:    goto LAB2;

LAB5:    t3 = (t0 + 1472U);
    t4 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t4 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(69, ng0);
    t8 = (t0 + 1992U);
    t9 = *((char **)t8);
    t11 = *((int *)t9);
    t12 = (t11 == 0);
    if (t12 != 0)
        goto LAB17;

LAB19:    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t11 = *((int *)t3);
    t4 = (t11 <= 1);
    if (t4 != 0)
        goto LAB20;

LAB21:
LAB18:    goto LAB9;

LAB11:    t10 = 0;

LAB14:    if (t10 < 2U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t6 = (t3 + t10);
    t7 = (t2 + t10);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB12;

LAB16:    t10 = (t10 + 1);
    goto LAB14;

LAB17:    xsi_set_current_line(70, ng0);
    t8 = (t0 + 3608);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((int *)t16) = 1;
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t2 = (t0 + 5848U);
    t11 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t5, t2);
    t17 = (t11 - 0);
    t10 = (t17 * 1);
    xsi_vhdl_check_range_of_index(0, 512, 1, t11);
    t18 = (16U * t10);
    t19 = (0 + t18);
    t6 = (t3 + t19);
    t7 = (t0 + 3544);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t6, 16U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB18;

LAB20:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 14226);
    t6 = (t0 + 3544);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t13 = *((char **)t9);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 3608);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = 0;
    xsi_driver_first_trans_fast(t2);
    goto LAB18;

LAB22:    xsi_set_current_line(78, ng0);
    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t18 = (15 - 15);
    t19 = (t18 * 1U);
    t20 = (0 + t19);
    t8 = (t9 + t20);
    t13 = (t0 + 1032U);
    t14 = *((char **)t13);
    t13 = (t0 + 5848U);
    t11 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t14, t13);
    t17 = (t11 - 0);
    t21 = (t17 * 1);
    t22 = (16U * t21);
    t23 = (0U + t22);
    t15 = (t0 + 3672);
    t16 = (t15 + 56U);
    t24 = *((char **)t16);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t8, 16U);
    xsi_driver_first_trans_delta(t15, t23, 16U, 0LL);
    goto LAB9;

LAB24:    t10 = 0;

LAB27:    if (t10 < 2U)
        goto LAB28;
    else
        goto LAB26;

LAB28:    t6 = (t3 + t10);
    t7 = (t2 + t10);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB25;

LAB29:    t10 = (t10 + 1);
    goto LAB27;

}


extern void work_a_3392787015_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3392787015_3212880686_p_0};
	xsi_register_didat("work_a_3392787015_3212880686", "isim/test_pc_isim_beh.exe.sim/work/a_3392787015_3212880686.didat");
	xsi_register_executes(pe);
}
