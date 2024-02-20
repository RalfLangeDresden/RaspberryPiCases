// ========================================
// Raspberry Pi case with 7" touch display
// Version 2 constant definitions
// (c) Ralf Lange, longsoft.de
// ========================================

// Dimensions

caseW = 122;      // Case width (122 mm)
caseD = 118;      // Case depth (118 mm)
caseH = 200;      // Total case hight (200 mm)
caseR = 6;        // Case corner radius (6 mm)
caseT = 3;        // Case wall thickness (3 mm)

caseHopperH = 140;   // Hopper part hight (hopper and hopper case)
caseChassisH = 26;   // Chasis part hight (26 mm)
caseBorderH = 10;    // Case border hight
caseOffsetX = 18.5;

hopperW = 180;    // Hopper to collect the water
hopperD = hopperW;
hopperH = hopperW/2;
hopperFrameH = 6; // Hopper framehight (6 mm)
sinkW = 15;
sinkD = 5;
sinkH = 10;
sinkT = 2;
sinkOffsetX = hopperW/4;
hopperCaseZ = hopperH-54;     // 36 mm
hopperCaseH = caseHopperH-hopperCaseZ;   // Case part on the hopper hight
hopperCaseOffsetZ = hopperCaseH/2+hopperCaseZ;

bucketW = 100;       // Bucket width
bucketD = 20;        // Bucket depth
bucketH = 30;        // Bucket hight
bucketT = 2;         // Bucket wall thickness
bucketPivotR = 2;    // Bucket axis radius
bucketPivotD = 40;   // Bucket axis length

bucketOffsetZ = 20;


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
case7BackH = caseH-case7FrontH-case7ChassisH;

case7displayXP = 9;  // Printed circuit board distance on X axis to right wall, without case7T (9 mm) (C4)
case7displayXN = 9;
case7displayYP = 9;  // Printed circuit board distance on Y axis to top wall, without caste7T (9 mm) (C9)
case7displayYN = 9;