// ==================================================
// Raspberry Pi and HAT openings for cases
// (c) Ralf Lange, longsoft.de
// ==================================================

// External definitions
include <PiPcbConstants.scad>
include <Pi4Constants.scad>
include <../parts/PartConstants.scad>

// External modules
use <../parts/Parts.scad>

// Which one would you like to see?
displayOpening = true;
displayBoreholes = false;
displayPi3bOpening = false;
displayPi3HatOpening = false;
displayPi4bOpening = false;
displayPi4HatOpening = false;
displayCameraHqOpening = false;
displayHolesOnCircle = false;

detail = 1;

// Constants
cornerR = 2.0;

module opening(width, deap, chassisT)
{
  if (width < 2*cornerR) {
    hull() {
      translate([0, deap/2 - width/2, 0])
        cylinder(h=chassisT+0.1, d=width, center=true);
      translate([0, -deap/2 + width/2, 0])
        cylinder(h=chassisT+0.1, d=width, center=true);
    }
  }
  else if (deap < 2*cornerR) {
    hull() {
      translate([ width/2 - deap/2, 0, 0])
        cylinder(h=chassisT+0.1, d=deap, center=true);
      translate([-width/2 + deap/2, 0, 0])
        cylinder(h=chassisT+0.1, d=deap, center=true);
    }
  }
  else {
    hull() {
      translate([ width/2 - cornerR, deap/2 - cornerR, 0])
        cylinder(h=chassisT+0.1, r=cornerR, center=true);
      translate([ width/2 - cornerR,-deap/2 + cornerR, 0])
        cylinder(h=chassisT+0.1, r=cornerR, center=true);
      translate([-width/2 + cornerR, deap/2 - cornerR, 0])
        cylinder(h=chassisT+0.1, r=cornerR, center=true);
      translate([-width/2 + cornerR,-deap/2 + cornerR, 0])
        cylinder(h=chassisT+0.1, r=cornerR, center=true);
    }
  }
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

// RaspberryPi 3b opening
module pi3bOpening(chassisT, space = 2.0)
{
  opening(pi3bPcbW + 2*space, 42.0, chassisT);

  openX1 = pi3bHoleX - 8.0;
  openY = 10.0 + 2*space;
  posX1 = -10.0;
  posY = 22.0;

  translate([posX1, -posY, 0]) {
    opening(openX1, openY, chassisT);
  }
  translate([posX1, posY, 0]) {
    opening(openX1, openY, chassisT);
  }

  openX2 = pi3bPcbW - pi3bHoleX + space - 8;
  posX2 = 33.0 + space/2;
  translate([posX2, -posY, 0]) {
    opening(openX2, openY, chassisT);
  }
  translate([posX2, posY, 0]) {
    opening(openX2, openY, chassisT);
  }

  // Opening for microSD card
  openX3 = 12.0;
  openY3 = 20.0;
  posX3 = -(pi3bPcbW + openX3)/2 + 1.0;
  translate([posX3, 0, 0]) {
    opening(openX3, openY3, chassisT);
  }

  // Boreholes
  translate([-pi3bHoleDC, 0, 0])
    boreholes(pi3bHoleX, pi3bHoleY, pi3bHoleD, chassisT);
  
  color("black") {
    cube([pi3bPcbW, 4, 6], center = true);
    cube([4, pi3bPcbD, 6], center = true);
  }
}

// Raspberry Pi 3 HAT module opening
module pi3HatOpening(chassisT, space = 2.0)
{
  openY = 2*pi3HatHoleY - pi3HatPcbD;
  openY1 = pi3HatHoleY - openY + space;
  openX = pi3HatPcbW + 2*space;
  
  opening(openX, openY, chassisT);

  openX1 = pi3HatHoleX - openY1;
  posY = openY/2 + openY1/2;

  translate([0, posY, 0]) {
    opening(openX1, openY1, chassisT);
  }
  translate([0, openY/2, 0]) {
    cube([openX1, 4.0, chassisT+0.1], center = true);
  }
  translate([0, -openY/2, 0]) {
    cube([openX1, 4.0, chassisT+0.1], center = true);
  }
  translate([0, -posY, 0]) {
    opening(openX1, openY1, chassisT);
  }

  // Boreholes
  boreholes(pi3bHoleX, pi3bHoleY, pi3bHoleD, chassisT);
}

// RaspberryPi 4b opening
module pi4bOpening(chassisT, space = 2.0)
{
  openY = 2*pi4bHoleY - pi4bPcbD;
  openY1 = pi4bHoleY - openY + space;
  openX = pi4bPcbW + 2*space;
  
  opening(openX, openY, chassisT);

  openX1 = pi4bHoleX - openY1;
  posX1 = -pi4bHoleDC;
  posY = openY/2 + openY1/2;

  translate([posX1, posY, 0]) {
    opening(openX1, openY1, chassisT);
  }
  translate([posX1, openY/2, 0]) {
    cube([openX1, 4.0, chassisT+0.1], center = true);
  }
  translate([posX1, -openY/2, 0]) {
    cube([openX1, 4.0, chassisT+0.1], center = true);
  }
  translate([posX1, -posY, 0]) {
    opening(openX1, openY1, chassisT);
  }

  openX2 = pi4bPcbW - pi4bHoleX - openY1 + space;
  posX2 = pi4bPcbW/2 - openX2/2 + space;
  
  translate([posX2, posY, 0]) {
    opening(openX2, openY1, chassisT);
  }
  translate([posX2, openY/2, 0]) {
    cube([openX2, 4.0, chassisT+0.1], center = true);
  }
  translate([posX2, -openY/2, 0]) {
    cube([openX2, 4.0, chassisT+0.1], center = true);
  }
  translate([posX2, -posY, 0]) {
    opening(openX2, openY1, chassisT);
  }

  // Opening for microSD card
  openX3 = 12.0;
  openY3 = 20.0;
  posX3 = -(pi4bPcbW + openX3)/2 + 2.0;
  translate([posX3, 0, 0]) {
    opening(openX3, openY3, chassisT);
  }

  // Boreholes
  translate([-pi4bHoleDC, 0, 0])
    boreholes(pi4bHoleX, pi4bHoleY, pi4bHoleD, chassisT);
}

// Raspberry Pi 4 HAT module opening
module pi4HatOpening(chassisT, space = 2.0)
{
  openY = 2*pi4HatHoleY - pi4HatPcbD;
  openY1 = pi4HatHoleY - openY + space;
  openX = pi4HatPcbW + 2*space;
  
  opening(openX, openY, chassisT);

  openX1 = pi4HatHoleX - openY1;
  posY = openY/2 + openY1/2;

  translate([0, posY, 0]) {
    opening(openX1, openY1, chassisT);
  }
  translate([0, openY/2, 0]) {
    cube([openX1, 4.0, chassisT+0.1], center = true);
  }
  translate([0, -openY/2, 0]) {
    cube([openX1, 4.0, chassisT+0.1], center = true);
  }
  translate([0, -posY, 0]) {
    opening(openX1, openY1, chassisT);
  }

  // Boreholes
  boreholes(pi4bHoleX, pi4bHoleY, pi4bHoleD, chassisT);
}

module cameraHqOpening(chassisT)
{
  color("yellow") {
    hull() {
      translate([-piCameraHqPcbW/2+piCameraHqPcbR, -piCameraHqPcbD/2+piCameraHqPcbR, 0])
        cylinder(r=piCameraHqPcbR, h=pcbT, center=true);
      translate([-piCameraHqPcbW/2+piCameraHqPcbR,  piCameraHqPcbD/2-piCameraHqPcbR, 0])
        cylinder(r=piCameraHqPcbR, h=pcbT, center=true);
      translate([ piCameraHqPcbW/2-piCameraHqPcbR, -piCameraHqPcbD/2+piCameraHqPcbR, 0])
        cylinder(r=piCameraHqPcbR, h=pcbT, center=true);
      translate([ piCameraHqPcbW/2-piCameraHqPcbR,  piCameraHqPcbD/2-piCameraHqPcbR, 0])
        cylinder(r=piCameraHqPcbR, h=pcbT, center=true);
    }

    // Boreholes
    translate([0, 0, -chassisT/2])
      boreholes(piCameraHqHoleX, piCameraHqHoleY, piCameraHqHoleD, chassisT);
    
    // Opening for chips
    openingW = piCameraHqPcbW - piCameraHqHoleY;
    openingD = piCameraHqHoleX - 2*piCameraHqHoleD;
    margin = 0.6;
    
    translate([0, (piCameraHqPcbD - openingW - margin)/2, -chassisT/2])
      opening(openingD, openingW, chassisT);
    translate([0, -(piCameraHqPcbD - openingW - margin)/2, -chassisT/2])
      opening(openingD, openingW, chassisT);
    translate([(piCameraHqPcbD - openingW - margin)/2, 0, -chassisT/2])
      opening(openingW, openingD, chassisT);
    translate([-(piCameraHqPcbD - openingW - margin)/2, 0, -chassisT/2])
      opening(openingW, openingD, chassisT);
    translate([0, 0, -chassisT/2])
      opening(openingD, openingD, chassisT);
    
    // Opening for ribbon cable
    translate([piCameraHqPcbW/2, 0, -(1.5*pcbT)])
      opening(cameraRibbonW/2, cameraRibbonW, pcbT);
  }
}

module holesOnCircle(holeD, holeH, circleD, number)
{
  circleR = circleD/2;
  
  for(alpha=[0:360/number:359]) {
    translate([circleR*cos(alpha), circleR*sin(alpha), 0])
      cylinder(h=holeH, d=holeD, center=true);
  }
}

// Display the selected modules
if (displayOpening == true) {
  $fn=100;

  // Case width and deep < corner radius
  // opening(1.0, 1.0, 2.0);
  // Case width < corner radius
  // opening(1.0, 10.0, 2.0);
  // Case deep < corner radius
  // opening(10.0, 1.0, 2.0);
  // Case width and deep > corner radius
  opening(30.0, 10.0, 2.0);
}
if (displayBoreholes == true) {
  $fn=100;

  boreholes(pi3bHoleX, pi3bHoleY, pi3bHoleD, 5);
}
if (displayPi3bOpening == true) {
  $fn=100;

  pi3bOpening(5, 0);
}
if (displayPi3HatOpening == true) {
  $fn=100;

  pi3HatOpening(5, 0);
}
if (displayPi4bOpening == true) {
  $fn=100;

  pi4bOpening(5, 0);
}
if (displayPi4HatOpening == true) {
  $fn=100;

  pi4HatOpening(5, 0);
}
if (displayCameraHqOpening == true) {
  $fn=100;
  
  cameraHqOpening(10);
}
if (displayHolesOnCircle == true) {
  $fn=100;
  
  holesOnCircle(5, 5, 30, 15);
}
