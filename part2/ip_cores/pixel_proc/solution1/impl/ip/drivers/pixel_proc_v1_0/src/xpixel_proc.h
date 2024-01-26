// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XPIXEL_PROC_H
#define XPIXEL_PROC_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xpixel_proc_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Axilites_BaseAddress;
} XPixel_proc_Config;
#endif

typedef struct {
    u32 Axilites_BaseAddress;
    u32 IsReady;
} XPixel_proc;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XPixel_proc_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XPixel_proc_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XPixel_proc_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XPixel_proc_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XPixel_proc_Initialize(XPixel_proc *InstancePtr, u16 DeviceId);
XPixel_proc_Config* XPixel_proc_LookupConfig(u16 DeviceId);
int XPixel_proc_CfgInitialize(XPixel_proc *InstancePtr, XPixel_proc_Config *ConfigPtr);
#else
int XPixel_proc_Initialize(XPixel_proc *InstancePtr, const char* InstanceName);
int XPixel_proc_Release(XPixel_proc *InstancePtr);
#endif


u32 XPixel_proc_Get_frames_V(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_frames_V_vld(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_rows_V(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_rows_V_vld(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_pixels_V(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_pixels_V_vld(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_sum_before_V(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_sum_before_V_vld(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_sum_after_V(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_sum_after_V_vld(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_values_V(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_values_V_vld(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_read_done_V(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_read_done_V_vld(XPixel_proc *InstancePtr);
void XPixel_proc_Set_write_ready_V(XPixel_proc *InstancePtr, u32 Data);
u32 XPixel_proc_Get_write_ready_V(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_shared_memory_V_BaseAddress(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_shared_memory_V_HighAddress(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_shared_memory_V_TotalBytes(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_shared_memory_V_BitWidth(XPixel_proc *InstancePtr);
u32 XPixel_proc_Get_shared_memory_V_Depth(XPixel_proc *InstancePtr);
u32 XPixel_proc_Write_shared_memory_V_Words(XPixel_proc *InstancePtr, int offset, int *data, int length);
u32 XPixel_proc_Read_shared_memory_V_Words(XPixel_proc *InstancePtr, int offset, int *data, int length);
u32 XPixel_proc_Write_shared_memory_V_Bytes(XPixel_proc *InstancePtr, int offset, char *data, int length);
u32 XPixel_proc_Read_shared_memory_V_Bytes(XPixel_proc *InstancePtr, int offset, char *data, int length);

#ifdef __cplusplus
}
#endif

#endif
