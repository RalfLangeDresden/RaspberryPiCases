// ========================================
// Weather Pi case
// Version 2 constant definitions
// (c) Ralf Lange, longsoft.de
// ========================================

include <../raspberry/PiPcbConstants.scad>
include <../raspberry/PiPartConstants.scad>

// Dimensions

caseW = 122;      // Case width (122 mm)
caseD = 118;      // Case depth (118 mm)
caseH = 180;      // Total case hight (200 mm)
caseR = 6;        // Case corner radius (6 mm)
caseT = 3;        // Case wall thickness (3 mm)

caseHopperH = 140;   // Hopper part hight (hopper and hopper case)
caseChassisH = caseH-caseHopperH;   // Chasis part hight (26 mm)
caseBorderH = 10;    // Case border hight
caseOffsetX = -18;

hopperW = 180;    // Hopper to collect the water
hopperD = hopperW;
hopperH = hopperW*0.6;
hopperFrameH = 6; // Hopper framehight (6 mm)
sinkW = 10;
sinkD = 5;
sinkH = 10;
sinkT = 2;
hopperCaseZ = caseT;     // 36 mm
hopperCaseH = caseHopperH-hopperCaseZ;   // Case part on the hopper hight
hopperCaseOffsetZ = hopperCaseH/2+hopperCaseZ;

caseSleeveH = 10;     // Threaded bush hight (10 mm)
caseSleeveD = 8;      // Threaded bush diameter (8 mm)
caseSleeveB = 4.2;    // Threaded bush bore diameter for M4 (4.2 mm)
caseSleeveTB = 3.5;   // Threaded bush thread bore diameter for M4 (3.5 mm)
caseSleeveX = 7;      // Threaded bush distance on X axis (10 mm)
caseSleeveY = 7;      // Threaded bush distance on Y axis (10 mm)

bucketW = 100;       // Bucket width
bucketD = 20;        // Bucket depth
bucketH = 30;        // Bucket hight
bucketT = 2;         // Bucket wall thickness
bucketPivotR = 3;    // Bucket axis radius
bucketPivotD = 40;   // Bucket axis length

bucketOffsetZ = bucketPivotR/2+bucketT*1.5 + 30;
bucketRotate = 0; // 23.8

// Rasberry Pi printed ciruits board position
raspiOffsetX = -25;
raspiOffsetY = 0;
raspiOffsetZ = caseChassisH+25;

poeHatOffsetX = raspiOffsetX;
poeHatOffsetY = raspiOffsetY;
poeHatOffsetZ = raspiOffsetZ + pi3bHoleDC;

senseHatOffsetX = poeHatOffsetX - 13;
senseHatOffsetY = poeHatOffsetY;
senseHatOffsetZ = raspiOffsetZ + pi3bHoleDC;
