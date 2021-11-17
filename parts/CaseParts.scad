// ========================================
// Raspberry Pi case parts
// (c) Ralf Lange, longsoft.de
// ========================================

// Which one would you like to see?
display3PartsFront = false;    // Front part of the three part case
display3PartsChassis = false;  // Chassis part of the three part case
display3PartsBack = false;     // Back part of the three part case
display3PartsAll = false;      // All parts of the three part case together in on stack
display3PartsImage = true;    // All parts of the three part case together side by side
displayDonut = false;          // An "donut" for angles
displayCooling = false;        // Cooling boreholes
displayXxx = false;            // ???

// Details of the drawing (larger is better)
$fn=100;

// ========================================
// case with three parts
// ========================================

// Front part of the case
module case3PartsFront(
  caseW,          // Case width (on X axis)
  caseD,          // Case deap (on Y axis)
  caseFrontH,     // Case front part height (on Z axis)
  caseR,          // Case corner radius
  caseT)          // Case wall thickness
{
  color("silver") {
    difference() {
      donutZ = -(caseFrontH - caseT)/2;
      // Outer hull
      hull() {
        donutInnerR = caseR - caseT;
        cylinderZ = caseFrontH/2 - caseT/2;
        translate([caseW/2 - caseR, caseD/2 - caseR,0]) {
          translate([0, 0, donutZ])
            donut(caseR, donutInnerR);
          translate([0, 0, cylinderZ])
            cylinder(h=caseT, r=caseR, center=true);
        }
        translate([caseW/2 - caseR, -caseD/2 + caseR,0]) {
          translate([0, 0, donutZ])
            donut(caseR, donutInnerR);
          translate([0, 0, cylinderZ])
            cylinder(h=caseT, r=caseR, center=true);
        }
        translate([-caseW/2 + caseR, -caseD/2 + caseR,0]) {
          translate([0, 0, donutZ])
            donut(caseR, donutInnerR);
          translate([0, 0, cylinderZ])
            cylinder(h=caseT, r=caseR, center=true);
        }
        translate([-caseW/2 + caseR, caseD/2 - caseR,0]) {
          translate([0, 0, donutZ])
            donut(caseR, donutInnerR);
          translate([0, 0, cylinderZ])
            cylinder(h=caseT, r=caseR, center=true);
        }
      }
      
      // Inner hull
      translate([0, 0, caseT/2]) {
        hull() {
          cylinderH = caseFrontH - caseT + 0.1;
          cylinderZ = cylinderH/2 + donutZ;
          cylinderR = caseR - caseT;
          translate([caseW/2 - caseR, caseD/2 - caseR, cylinderZ])
            cylinder(h=cylinderH, r=cylinderR, center=true);
          translate([caseW/2 - caseR,-caseD/2 + caseR, cylinderZ])
            cylinder(h=cylinderH, r=cylinderR, center=true);
          translate([-caseW/2 + caseR,-caseD/2 + caseR, cylinderZ])
            cylinder(h=cylinderH, r=cylinderR, center=true);
          translate([-caseW/2 + caseR, caseD/2 - caseR, cylinderZ])
            cylinder(h=cylinderH, r=cylinderR, center=true);
        }
      }
    }
  }
  
  /* Check the part height
  color("black")
    translate([0, -caseD/2 - 10/2, -caseFrontH/2])
      cube([10, 10, caseFrontH], center=false);
  */
}

module case3PartsChassis(
  caseW,          // Case width (on X axis)
  caseD,          // Case deap (on Y axis)
  caseChassisH,   // Case chassis part height (on Z axis)
  caseR,          // Case corner radius
  caseT,          // Case wall thickness
  chassisT)       // Chassis base thickness
{
  color("silver") {
    difference() {
      // Outer hull
      hull() {
        translate([caseW/2 - caseR, caseD/2 - caseR,0])
          cylinder(h=caseChassisH, r=caseR, center=true);
        translate([caseW/2 - caseR, -caseD/2 + caseR,0])
          cylinder(h=caseChassisH, r=caseR, center=true);
        translate([-caseW/2 + caseR, -caseD/2 + caseR,0])
          cylinder(h=caseChassisH, r=caseR, center=true);
        translate([-caseW/2 + caseR, caseD/2 - caseR,0])
          cylinder(h=caseChassisH, r=caseR, center=true);
      }
      
      // Inner hull
      translate([0, 0, chassisT/2]) {
        hull() {
          cylinderH = caseChassisH - chassisT + 0.1;
          cylinderR = caseR - caseT;
          translate([caseW/2 - caseR, caseD/2 - caseR, 0])
            cylinder(h=cylinderH, r=cylinderR, center=true);
          translate([caseW/2 - caseR, -caseD/2 + caseR, 0])
            cylinder(h=cylinderH, r=cylinderR, center=true);
          translate([-caseW/2 + caseR, -caseD/2 + caseR, 0])
            cylinder(h=cylinderH, r=cylinderR, center=true);
          translate([-caseW/2 + caseR, caseD/2 - caseR, 0])
            cylinder(h=cylinderH, r=cylinderR, center=true);
        }
      }
    }
  }
  
  /* Check the part height
  color("black")
    translate([0, -caseD/2 - 10/2, -caseChassisH/2])
      cube([10, 10, caseChassisH], center=false);
  */
}

module case3PartsBack(
  caseW,          // Case width (on X axis)
  caseD,          // Case deap (on Y axis)
  caseBackH,      // Case back part height (on Z axis)
  caseR,          // Case corner radius
  caseT)          // Case wall thickness
{
  color("silver") {
    difference() {
      donutZ = -(caseBackH - caseT)/2;
      // Outer hull
      hull() {
        donutInnerR = caseR - caseT;
        cylinderZ = caseBackH/2 - caseT/2;
        translate([caseW/2 - caseR, caseD/2 - caseR, 0]) {
          translate([0, 0, donutZ])
            donut(caseR, donutInnerR);
          translate([0, 0, cylinderZ])
            cylinder(h=caseT, r=caseR, center=true);
        }
        translate([caseW/2 - caseR, -caseD/2 + caseR, 0]) {
          translate([0, 0, donutZ])
            donut(caseR, donutInnerR);
          translate([0, 0, cylinderZ])
            cylinder(h=caseT, r=caseR, center=true);
        }
        translate([-caseW/2 + caseR, -caseD/2 + caseR, 0]) {
          translate([0, 0, donutZ])
            donut(caseR, donutInnerR);
          translate([0, 0, cylinderZ])
            cylinder(h=caseT, r=caseR, center=true);
        }
        translate([-caseW/2 + caseR, caseD/2 - caseR, 0]) {
          translate([0, 0, donutZ])
            donut(caseR, donutInnerR);
          translate([0, 0, cylinderZ])
            cylinder(h=caseT, r=caseR, center=true);
        }
      }
      
      // Inner hull
      translate([0, 0, caseT/2]) {
        hull() {
          cylinderH = caseBackH - caseT + 0.1;
          cylinderZ = cylinderH/2 + donutZ;
          cylinderR = caseR - caseT;
          translate([caseW/2 - caseR, caseD/2 - caseR, cylinderZ])
            cylinder(h=cylinderH, r=cylinderR, center=true);
          translate([caseW/2 - caseR, -caseD/2 + caseR, cylinderZ])
            cylinder(h=cylinderH, r=cylinderR, center=true);
          translate([-caseW/2 + caseR, -caseD/2 + caseR, cylinderZ])
            cylinder(h=cylinderH, r=cylinderR, center=true);
          translate([-caseW/2 + caseR, caseD/2 - caseR, cylinderZ])
            cylinder(h=cylinderH, r=cylinderR, center=true);
        }
      }
    }
  }
  
  /* Check the part height
  color("black")
    translate([caseW/2 - 10/2, -caseD/2 - 10/2, -caseBackH/2])
      cube([10, 10, backH], center=false);
  */
}

module donut(outerR=5, innerR=3)
{
  circleR = (outerR-innerR)/2;

  rotate_extrude(convexity = 10)
    translate([outerR-circleR, 0, 0])
      circle(r = circleR);
}

// Boreholes for cooling air
module coolingBoreholes(caseT)
{
  airHoleR = 5.0;

  // Center line
  translate([0,20,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);
  translate([0,10,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);
  translate([0,0,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);
  translate([0,-10,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);
  translate([0,-20,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);

  // Top line
  translate([5,15,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);
  translate([5, 5,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);
  translate([5,-5,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);
  translate([5,-15,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);

  // Bottom line
  translate([-5,15,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);
  translate([-5, 5,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);
  translate([-5,-5,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);
  translate([-5,-15,0])
    cylinder(h=caseT+1, d=airHoleR, center=true);
}

testCaseW = 80.0;
testCaseD = 40.0;
testCaseFrontH = 6.0;
testCaseChassisH = 12.0;
testCaseBackH = 6.0;
testCaseR = 3.0;
testCaseT = 2.0;
testChassisT = 1.0;

if(display3PartsFront) {
  case3PartsFront(testCaseW, testCaseD, testCaseFrontH, testCaseR, testCaseT);
}
if(display3PartsChassis) {
  case3PartsChassis(testCaseW, testCaseD, testCaseChassisH, testCaseR, testCaseT, testChassisT);
}
if(display3PartsBack) {
  case3PartsBack(testCaseW, testCaseD, testCaseBackH, testCaseR, testCaseT);
}
if(display3PartsAll) {
  distance = 1.0;
  
  translate([0, 0, 0])
    rotate([0, 0, 180])
      case3PartsBack(testCaseW, testCaseD, testCaseBackH, testCaseR, testCaseT);
  
  translate([0, 0, testCaseBackH/2 + testCaseChassisH/2 + distance])
    rotate([0, 180, 0])
      case3PartsChassis(testCaseW, testCaseD, testCaseChassisH, testCaseR, testCaseT, testChassisT);
  
  translate([0, 0, testCaseBackH/2 + testCaseChassisH + testCaseFrontH/2 + 2*distance])
    rotate([0, 180, 0])
      case3PartsFront(testCaseW, testCaseD, testCaseFrontH, testCaseR, testCaseT);
}
if(display3PartsImage) {
  translate([(testCaseD + 10.0), 0, 0])
    rotate([0, 0, 90])
      case3PartsBack(testCaseW, testCaseD, testCaseBackH, testCaseR, testCaseT);
  
  translate([0, 0, 0])
    rotate([0, 0, 90])
      case3PartsChassis(testCaseW, testCaseD, testCaseChassisH, testCaseR, testCaseT, testChassisT);
  
  translate([-(testCaseD + 10.0), 0, 0])
    rotate([0, 0, 90])
      case3PartsFront(testCaseW, testCaseD, testCaseFrontH, testCaseR, testCaseT);
}
if(displayDonut) {
  donut();
}
if(displayCooling) {
  coolingBoreholes(5);
}
if(displayXxx) {
  xxx(withDevices);
}
