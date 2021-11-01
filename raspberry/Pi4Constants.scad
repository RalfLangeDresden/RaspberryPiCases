// ========================================
// Raspberry Pi 4 Model B
// Constant definitions
// (c) Ralf Lange, longsoft.de
// ========================================

include <PiPcbConstants.scad>

// Offsets for micro USB socket

microUsbOffsetW = -pi4bPcbW/2 + 3.5 + 7.7;
microUsbOffsetD = -26.5;
microUsbOffsetZ = 0.0;

// Offsets for 1. micro HDMI socket

microHdmi1OffsetW = microUsbOffsetW + 14.8;
microHdmi1OffsetD = -26.0;
microHdmi1OffsetZ = 0.0;

// Offsets for 2. micro HDMI socket

microHdmi2OffsetW = microHdmi1OffsetW + 13.5;
microHdmi2OffsetD = -26.0;
microHdmi2OffsetZ = 0.0;

// Offsets for camera connector

cameraRibbonW = 22.0;
cameraOffsetW = microHdmi2OffsetW + 7.0;
cameraOffsetD = -pi4bPcbD/2 + 11.5;
cameraOffsetZ = 0.0;

// Offsets for audio socket

audioOffsetW = cameraOffsetW + 7.5;
audioOffsetD = -pi4bPcbD/2 + 5.0;
audioOffsetZ = 0.0;

// Offsets for 1. USB A socket

usbA1OffsetW = pi3bPcbW/2 - 7.0;
usbA1OffsetD = -pi4bPcbD/2 + 9.0;
usbA1OffsetZ = 0.0;

// Offsets for 2. USB A socket

usbA2OffsetW = pi3bPcbW/2 - 7.0;
usbA2OffsetD = -pi4bPcbD/2 + 27.0;
usbA2OffsetZ = 0.0;

// Offsets for ethernet socket

ethernetOffsetW = pi4bPcbW/2 - 8.5;
ethernetOffsetD = -pi4bPcbD/2 + 45.75;
ethernetOffsetZ = 0.0;

// Offsets for display connector

displayRibbonW = 22.0;
displayOffsetW = -pi4bPcbW/2 + 3.5;
displayOffsetD = -pi3bPcbD/2 + 3.5 + 24.5;
displayOffsetZ = 0.0;

// Offsets for the SD card slot

sdCardOffsetW = -pi4bPcbW/2 + 13/2;
sdCardOffsetD = 0.0;
sdCardOffsetZ = 0.0;
