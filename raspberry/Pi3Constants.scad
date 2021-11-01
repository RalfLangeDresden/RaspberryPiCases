// ========================================
// Raspberry Pi 3 Model B+
// Constant definitions
// (c) Ralf Lange, longsoft.de
// ========================================

include <PiPcbConstants.scad>

// Offsets for micro USB socket

microUsbOffsetW = -pi3bPcbW/2 + 10.6;
microUsbOffsetD = -pi3bPcbD/2 + 1.5;
microUsbOffsetZ = 0.0;

// Offsets for HDMI socket

hdmiOffsetW = -pi3bPcbW/2 + 32.0;
hdmiOffsetD = -pi3bPcbD/2 + 4.0;
hdmiOffsetZ = 0.0;

// Offsets for camera connector

cameraRibbonW = 22.0;
cameraOffsetW = -pi3bPcbW/2 + 32.0 + 13.0;
cameraOffsetD = -pi3bPcbD/2 + 11.5;
cameraOffsetZ = 0.0;

// Offsets for audio socket

audioOffsetW = -pi3bPcbW/2 + 53.5;
audioOffsetD = -pi3bPcbD/2 + 5.0;
audioOffsetZ = 0.0;

// Offsets for ethernet socket

ethernetOffsetW = pi3bPcbW/2 - 8.5;
ethernetOffsetD = -pi3bPcbD/2 + 10.25;
ethernetOffsetZ = 0.0;

// Offsets for 1. USB A socket

usbA1OffsetW = pi3bPcbW/2 - 7.0;
usbA1OffsetD = -pi3bPcbD/2 + 29.0;
usbA1OffsetZ = 0.0;

// Offsets for 2. USB A socket

usbA2OffsetW = pi3bPcbW/2 - 7.0;
usbA2OffsetD = -pi3bPcbD/2 + 47.0;
usbA2OffsetZ = 0.0;

// Offsets for display connector

displayRibbonW = 22.0;
displayOffsetW = -pi3bPcbW/2 + 3.5;
displayOffsetD = -pi3bPcbD/2 + 28.0;
displayOffsetZ = 0.0;

// Offsets for the SD card slot

sdCardOffsetW = -pi3bPcbW/2 + 13/2;
sdCardOffsetD = 0.0;
sdCardOffsetZ = 0.0;
