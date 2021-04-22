// ========================================
// Raspberry Pi case parts
// (c) Ralf Lange, longsoft.de
// ========================================

// Which one would you like to see?
displayCooling = true; // Cooling boreholes
displayXxx = false;    // Back part of the case

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

if(displayCooling) {
  coolingBoreholes(5);
}
if(displayXxx) {
  xxx(withDevices);
}
