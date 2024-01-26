// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xpixel_proc.h"

extern XPixel_proc_Config XPixel_proc_ConfigTable[];

XPixel_proc_Config *XPixel_proc_LookupConfig(u16 DeviceId) {
	XPixel_proc_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XPIXEL_PROC_NUM_INSTANCES; Index++) {
		if (XPixel_proc_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XPixel_proc_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XPixel_proc_Initialize(XPixel_proc *InstancePtr, u16 DeviceId) {
	XPixel_proc_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XPixel_proc_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XPixel_proc_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

