// ==================================================
// Raspberry Pi and HAT openings for cases
// (c) Ralf Lange, longsoft.de
// ==================================================

// External definitions
include <PiPcbConstants.scad>
include <PiPartConstants.scad>
include <../parts/PartConstants.scad>

// External modules
use <../parts/Parts.scad>

// Which one would you like to see?
displayPi3bOpening = false;
displayPi3HatOpening = false;
displayBoreholes = false;

detail = 1;

// Constants
cornerR = 2.0;

// Opening
module opening(width, deap, chassisT)
{
  hull() {
    translate([ width/2, deap/2, 0])
      cylinder(h=chassisT+0.1, r=cornerR, center=true);
    translate([ width/2,-deap/2, 0])
      cylinder(h=chassisT+0.1, r=cornerR, center=true);
    translate([-width/2, deap/2, 0])
      cylinder(h=chassisT+0.1, r=cornerR, center=true);
    translate([-width/2,-deap/2, 0])
      cylinder(h=chassisT+0.1, r=cornerR, center=true);
  }
}

// RaspberryPi opening
module pi3bOpening(chassisT)
{
  opening(pi3bPcbW, 36, chassisT);

  openX1 = pi3bHoleX-12;
  openY = 10;
  posX1 = 0-10;
  posY = 22;

  translate([posX1,-posY, 0]) {
    opening(openX1, openY, chassisT);
  }
  translate([posX1, posY, 0]) {
    opening(openX1, openY, chassisT);
  }

  openX2 = pi3bPcbW-pi3bHoleX-10;
  posX2 = 34;
  translate([posX2,-posY,0]) {
    opening(openX2, openY, chassisT);
  }
  translate([posX2, posY,0]) {
    opening(openX2, openY, chassisT);
  }

  // Opening for microSD card
  openX3 = 10;
  openY3 = 20;
  posX3 = -(pi3bPcbW+openX3)/2;
  translate([posX3, 0,0]) {
    opening(openX3, openY3, chassisT);
  }

  // Boreholes
  translate([-pi3bHoleDC, 0, 0])
    boreholes(pi3bHoleX, pi3bHoleY, pi3bHoleD, chassisT);
}

// HAT module opening
module pi3HatOpening(chassisT)
{
  opening(pi3HatPcbW, 36, chassisT);

  openX = pi3bHoleX-12;
  openY = 10;
  posY = 22;
  translate([0, -posY, 0]) {
    opening(openX, openY, chassisT);
  }
  translate([0, posY, 0]) {
    opening(openX, openY, chassisT);
  }

  // Boreholes
  boreholes(pi3bHoleX, pi3bHoleY, pi3bHoleD, chassisT);
}

// Rectangle boreholes
module boreholes(distanceX, distanceY, diameter, hight)
{
  translate([-distanceX/2,-distanceY/2,0])
    cylinder(h=hight+0.1, d=diameter, center=true);
  translate([-distanceX/2, distanceY/2,0])
    cylinder(h=hight+0.1, d=diameter, center=true);
  translate([ distanceX/2,-distanceY/2,0])
    cylinder(h=hight+0.1, d=diameter, center=true);
  translate([ distanceX/2, distanceY/2,0])
    cylinder(h=hight+0.1, d=diameter, center=true);
}

// Display the selected modules
if (displayPi3bOpening == true) {
  $fn=100;

  pi3bOpening(5);
}
if (displayPi3HatOpening == true) {
  $fn=100;

  pi3HatOpening(5);
}
if (displayBoreholes == true) {
  $fn=100;

  boreholes(pi3bHoleX, pi3bHoleY, pi3bHoleD, 5);
}
