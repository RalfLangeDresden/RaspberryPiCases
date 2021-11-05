// ==================================================
// Raspberry Pi and pi3Hat printed circuit boards
// Constant definitions
// (c) Ralf Lange, longsoft.de
// ==================================================

// Dimensions Raspberry Zero

pi0PcbW = 65;    // Printed circuit board width (85 mm)
pi0PcbD = 30;    // Printed circuit board depth (56 mm)
pi0PcbH = 16;    // Printed circuit board hight (16 mm)
pi0PcbR = 3;     // Printed circuit board corner radius (3 mm)
pi0HoleX = 58;   // Centred hole distance on X axis (58 mm)
pi0HoleY = 23;   // Centred hole distance on Y axis (23 mm)
pi0HoleD = 2.75; // Hole radius (2.75 mm)

// Dimensions Raspberry Zero Hat Modul

pi0HatPcbW = 65;    // Printed circuit board width (85 mm)
pi0HatPcbD = 30;    // Printed circuit board depth (56 mm)
pi0HatPcbH = 16;    // Printed circuit board hight (16 mm)
pi0HatPcbR = 3;     // Printed circuit board corner radius (3 mm)
pi0HatHoleX = 58;   // Centred hole distance on X axis (58 mm)
pi0HatHoleY = 23;   // Centred hole distance on Y axis (49 mm)
pi0HatHoleD = 2.75; // Hole diameter (2.75 mm)
pi0HatHoleDX = 3.5; // Distance between left edge and hole center (3.5 mm)
pi0HatHoleDY = 3.5; // Distance between front edge and hole center (3.5 mm)

// Dimensions Raspberry 3 Model A and 3 Model A+

pi3aPcbW = 65;     // Printed circuit board width (65 mm)
pi3aPcbD = 56;     // Printed circuit board depth (56 mm)
pi3aPcbH = 7;      // Printed circuit board hight (7 mm)
pi3aPcbR = 3;      // Printed circuit board corner radius (3 mm)
pi3aHoleX = 58;    // Centred hole distance on X axis (58 mm)
pi3aHoleY = 49;    // Centred hole distance on Y axis (49 mm)
pi3aHoleD = 2.75;  // Hole diameter (2.75 mm)

// Dimensions Raspberry 3 Model B and 3 Model B+

pi3bPcbW = 85;     // Printed circuit board width (85 mm)
pi3bPcbD = 56;     // Printed circuit board depth (56 mm)
pi3bPcbH = 16;     // Printed circuit board hight (16 mm)
pi3bPcbR = 3;      // Printed circuit board corner radius (3 mm)
pi3bHoleX = 58;    // Centred hole distance on X axis (58 mm)
pi3bHoleY = 49;    // Centred hole distance on Y axis (49 mm)
pi3bHoleDC = 10;   // Distance between hole center and PCB center
pi3bHoleD = 2.75;  // Hole diameter (2.75 mm)
pi3bHoleDX = 3.5;  // Distance between left edge and hole center (3.5 mm)
pi3bHoleDY = 3.5;  // Distance between front edge and hole center (3.5 mm)

// Dimensions Raspberry 3 Hat Modul

pi3HatPcbW = 65;    // Printed circuit board width (85 mm)
pi3HatPcbD = 56.5;  // Printed circuit board depth (56 mm)
pi3HatPcbH = 16;    // Printed circuit board hight (16 mm)
pi3HatPcbR = 3;     // Printed circuit board corner radius (3 mm)
pi3HatHoleX = 58;   // Centred hole distance on X axis (58 mm)
pi3HatHoleY = 49;   // Centred hole distance on Y axis (49 mm)
pi3HatHoleD = 2.75; // Hole diameter (2.75 mm)
pi3HatHoleDX = 3.5; // Distance between left edge and hole center (3.5 mm)
pi3HatHoleDY = 3.5; // Distance between front edge and hole center (3.5 mm)

// Dimensions Raspberry 4 Model B

pi4bPcbW = 85;     // Printed circuit board width (85 mm)
pi4bPcbD = 56;     // Printed circuit board depth (56 mm)
pi4bPcbH = 16;     // Printed circuit board hight (16 mm)
pi4bPcbR = 3;      // Printed circuit board corner radius (3 mm)
pi4bHoleX = 58;    // Centred hole distance on X axis (58 mm)
pi4bHoleY = 49;    // Centred hole distance on Y axis (49 mm)
pi4bHoleDC = 10;   // Distance between hole center and PCB center
pi4bHoleD = 2.75;  // Hole diameter (2.75 mm)
pi4bHoleDX = 3.5;  // Distance between left edge and hole center (3.5 mm)
pi4bHoleDY = 3.5;  // Distance between front edge and hole center (3.5 mm)

// Dimensions Raspberry Pico

piPicoPcbW = 51;    // Printed circuit board width (51 mm)
piPicoPcbD = 21;    // Printed circuit board depth (21 mm)
piPicoPcbH = 5;     // Printed circuit board hight (5 mm)
piPicoPcbR = 1;     // Printed circuit board corner radius (1 mm)
piPicoHoleX = 47;   // Centred hole distance on X axis (47 mm)
piPicoHoleY = 11.4; // Centred hole distance on Y axis (11.4 mm)
piPicoHoleD = 2.1 ; // Hole radius (2.1 mm)
piPicoGpioD = 17.78;// GPIO depth (17.78 mm)

// Dimensions Raspberry Camera Module V2

piCameraV2PcbW = 23.862;    // Printed circuit board width (23.862 mm)
piCameraV2PcbD = 25;        // Printed circuit board depth (25 mm)
piCameraV2PcbH = 5;         // Printed circuit board hight (5 mm)
piCameraV2PcbR = 2;         // Printed circuit board corner radius (2 mm)
piCameraV2HoleX = 12.5;     // Centred hole distance on X axis (12.5 mm)
piCameraV2HoleY = 21;       // Centred hole distance on Y axis (21 mm)
piCameraV2HoleDC = (piCameraV2PcbW - piCameraV2HoleX - 2 * piCameraV2PcbR) / 2; // Distance between hole center and PCB center
piCameraV2HoleD = 2.2;      // Hole diameter (2.2 mm)
piCameraV2OffsetW = 1.245;  // Ribbon offset width
piCameraV2OffsetX = (piCameraV2PcbW - piCameraV2OffsetW)/2; // Ribbon connector offset on x axis
piCameraV2OffsetY = 0.0;    // Ribbon opening offset on y axis

// Dimensions Raspberry Camera module HQ

piCameraHqPcbW = 38;    // Printed circuit board width (38 mm)
piCameraHqPcbD = 38;    // Printed circuit board depth (38 mm)
piCameraHqPcbH = 5;     // Printed circuit board hight (5 mm)
piCameraHqPcbR = 2.5;     // Printed circuit board corner radius (2.5 mm)
piCameraHqHoleX = 30;   // Centred hole distance on X axis (30 mm)
piCameraHqHoleY = 30;   // Centred hole distance on Y axis (30 mm)
piCameraHqHoleD = 2.5;  // Hole diameter (2.5 mm)
