// ========================================
// Raspberry Pi Zero and HAT basic
// Constant definitions
// (c) Ralf Lange, longsoft.de
// ========================================

include <PiPcbConstants.scad>

// Offsets for mini HDMI socket

miniHdmiOffsetW = -pi0PcbW/2 + 12.4;
miniHdmiOffsetD = -pi0PcbD/2 + 3.3;
miniHdmiOffsetZ = 0.0;

// Offsets for 1. micro USB socket

microUsb1OffsetW = -pi0PcbW/2 + 41.5;
microUsb1OffsetD = -pi0PcbD/2 + 2.5;
microUsb1OffsetZ = 0.0;

// Offsets for 2. micro USB socket

microUsb2OffsetW = -pi0PcbW/2 + 54.0;
microUsb2OffsetD = -pi0PcbD/2 + 2.5;
microUsb2OffsetZ = 0.0;

// Offsets for camera connector

cameraRibbonW = 17.0;
cameraOffsetW = pi0PcbW/2 - 2.25;
cameraOffsetD = 0.0;
cameraOffsetZ = 0.0;

// Offsets for the SD card slot

sdCardOffsetW = -pi0PcbW/2 + 13.0/2 + 1.0;
sdCardOffsetD = -pi0PcbD/2 + 16.9;
sdCardOffsetZ = 0.0;
