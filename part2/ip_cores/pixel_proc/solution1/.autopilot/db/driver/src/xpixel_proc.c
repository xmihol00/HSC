// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xpixel_proc.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XPixel_proc_CfgInitialize(XPixel_proc *InstancePtr, XPixel_proc_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axilites_BaseAddress = ConfigPtr->Axilites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

u32 XPixel_proc_Get_frames_V(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_FRAMES_V_DATA);
    return Data;
}

u32 XPixel_proc_Get_frames_V_vld(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_FRAMES_V_CTRL);
    return Data & 0x1;
}

u32 XPixel_proc_Get_rows_V(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_ROWS_V_DATA);
    return Data;
}

u32 XPixel_proc_Get_rows_V_vld(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_ROWS_V_CTRL);
    return Data & 0x1;
}

u32 XPixel_proc_Get_pixels_V(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_PIXELS_V_DATA);
    return Data;
}

u32 XPixel_proc_Get_pixels_V_vld(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_PIXELS_V_CTRL);
    return Data & 0x1;
}

u32 XPixel_proc_Get_sum_before_V(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_SUM_BEFORE_V_DATA);
    return Data;
}

u32 XPixel_proc_Get_sum_before_V_vld(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_SUM_BEFORE_V_CTRL);
    return Data & 0x1;
}

u32 XPixel_proc_Get_sum_after_V(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_SUM_AFTER_V_DATA);
    return Data;
}

u32 XPixel_proc_Get_sum_after_V_vld(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_SUM_AFTER_V_CTRL);
    return Data & 0x1;
}

u32 XPixel_proc_Get_values_V(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_VALUES_V_DATA);
    return Data;
}

u32 XPixel_proc_Get_values_V_vld(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_VALUES_V_CTRL);
    return Data & 0x1;
}

u32 XPixel_proc_Get_read_done_V(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_READ_DONE_V_DATA);
    return Data;
}

u32 XPixel_proc_Get_read_done_V_vld(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_READ_DONE_V_CTRL);
    return Data & 0x1;
}

void XPixel_proc_Set_write_ready_V(XPixel_proc *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPixel_proc_WriteReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_WRITE_READY_V_DATA, Data);
}

u32 XPixel_proc_Get_write_ready_V(XPixel_proc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPixel_proc_ReadReg(InstancePtr->Axilites_BaseAddress, XPIXEL_PROC_AXILITES_ADDR_WRITE_READY_V_DATA);
    return Data;
}

u32 XPixel_proc_Get_shared_memory_V_BaseAddress(XPixel_proc *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Axilites_BaseAddress + XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_BASE);
}

u32 XPixel_proc_Get_shared_memory_V_HighAddress(XPixel_proc *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Axilites_BaseAddress + XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_HIGH);
}

u32 XPixel_proc_Get_shared_memory_V_TotalBytes(XPixel_proc *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_HIGH - XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_BASE + 1);
}

u32 XPixel_proc_Get_shared_memory_V_BitWidth(XPixel_proc *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPIXEL_PROC_AXILITES_WIDTH_SHARED_MEMORY_V;
}

u32 XPixel_proc_Get_shared_memory_V_Depth(XPixel_proc *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPIXEL_PROC_AXILITES_DEPTH_SHARED_MEMORY_V;
}

u32 XPixel_proc_Write_shared_memory_V_Words(XPixel_proc *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_HIGH - XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Axilites_BaseAddress + XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XPixel_proc_Read_shared_memory_V_Words(XPixel_proc *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_HIGH - XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Axilites_BaseAddress + XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_BASE + (offset + i)*4);
    }
    return length;
}

u32 XPixel_proc_Write_shared_memory_V_Bytes(XPixel_proc *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_HIGH - XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Axilites_BaseAddress + XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XPixel_proc_Read_shared_memory_V_Bytes(XPixel_proc *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_HIGH - XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Axilites_BaseAddress + XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_BASE + offset + i);
    }
    return length;
}

