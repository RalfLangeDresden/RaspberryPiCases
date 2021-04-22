// ========================================
// Raspberry Pi case with 7" touch display
// Version 2 constant definitions
// (c) Ralf Lange, longsoft.de
// ========================================

// Dimensions

case7W = 196;     // Case width (200 mm)
case7D = 132;     // Case depth (132 mm)
case7H = 75;      // Case hight (40 mm)
case7R = 6;       // Case corner radius (6 mm)
case7T = 3;       // Case wall thickness (3 mm)

case7BushH = 10;     // Threaded bush hight (10 mm)
case7BushD = 8;      // Threaded bush diameter (8 mm)
case7BushB = 4.2;    // Threaded bush bore diameter for M4 (4.2 mm)
case7BushTB = 3.5;   // Threaded bush thread bore diameter for M4 (3.5 mm)
case7BushX = 7;      // Threaded bush distance on X axis (10 mm)
case7BushY = 7;      // Threaded bush distance on Y axis (10 mm)

chassisT = 2;        // Chassis thickness (2 mm)
chassisG = 2;        // Chassis to case gap (2 mm)
chassisBushH = 18;   // Chassis threaded bush hight (14 mm)
chassisBushD = 8;    // Chassis threaded bush diameter (8 mm)
chassisBushB = 3;    // Chassis threaded bush bore diameter (3 mm)
chassisBushXR = 30;  // Chassis threaded bush distance on X axis on the right side (10 mm)
chassisBushXL = 40;  // Chassis threaded bush distance on X axis on the left side (10 mm)
chassisBushYT = 15;  // Chassis threaded bush distance on Y axis on the top side (10 mm)
chassisBushYB = 20;  // Chassis threaded bush distance on Y axis on the buttom side (10 mm)

case7FrontH = 18;    // Front part hight (18 mm)
case7ChassisH = 26;  // Chasis part hight (26 mm)
case7BackFrameH = 6; // Back part hight (6 mm)
case7BackH = case7H-case7FrontH-case7ChassisH;

case7displayXP = 9;  // Printed circuit board distance on X axis to right wall, without case7T (9 mm) (C4)
case7displayXN = 9;
case7displayYP = 9;  // Printed circuit board distance on Y axis to top wall, without caste7T (9 mm) (C9)
case7displayYN = 9;