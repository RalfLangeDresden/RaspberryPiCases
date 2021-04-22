// ========================================
// Waveshare 7" display
// Board modules
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <Display7Constants.scad>
include <PartConstants.scad>

// External modules
use <Parts.scad>
use <NutsAndBolts.scad>

// Which one would you like to see?
displayDisplay7 = true;  // Waveshare 7" display

detail = 1;

// Show Header
header = true;   // true: Show Header; false: Don't show Header
heatSink = true;  // true: Show the IC heatSink; false: Don't show the heatSink

module display7()
{
  // PCB
  color("blue") {
    cube([display7PcbW,display7PcbD,pcbT], center=true);

    difference() {
      intersection() {
        translate([display7PcbW/2-display7PcbJX/2,display7PcbD/2,0])
          cylinder(r=display7PcbJY, h=pcbT, center=true);
        translate([display7PcbW/2-display7PcbJX/2,display7PcbD/2+display7PcbJY/2,0])
          cube([display7PcbJX,display7PcbJY,pcbT], center=true);
      }
      translate([ display7HoleX-display7PcbW/2+display7HoleDX, display7HoleY/2,0])
        cylinder(h=pcbT, d=display7HoleD, center=true);
    }

    difference() {
      intersection() {
        translate([display7PcbW/2-display7PcbJX/2,-display7PcbD/2,0])
          cylinder(r=display7PcbJY, h=pcbT, center=true);
        translate([display7PcbW/2-display7PcbJX/2,-display7PcbD/2-display7PcbJY/2,0])
          cube([display7PcbJX,display7PcbJY,pcbT], center=true);
      }
      translate([ display7HoleX-display7PcbW/2+display7HoleDX,-display7HoleY/2,0])
        cylinder(h=pcbT, d=display7HoleD, center=true);
    }

    difference() {
      intersection() {
        translate([-display7PcbW/2+display7PcbJX/2,-display7PcbD/2,0])
          cylinder(r=display7PcbJY, h=pcbT, center=true);
        translate([-display7PcbW/2+display7PcbJX/2,-display7PcbD/2-display7PcbJY/2,0])
          cube([display7PcbJX,display7PcbJY,pcbT], center=true);
      }
      translate([-display7PcbW/2+display7HoleDX,-display7HoleY/2,0])
        cylinder(h=pcbT, d=display7HoleD, center=true);
    }

    difference() {
      intersection() {
        translate([-display7PcbW/2+display7PcbJX/2,display7PcbD/2,0])
          cylinder(r=display7PcbJY, h=pcbT, center=true);
        translate([-display7PcbW/2+display7PcbJX/2,display7PcbD/2+display7PcbJY/2,0])
          cube([display7PcbJX,display7PcbJY,pcbT], center=true);
      }
      translate([-display7PcbW/2+display7HoleDX, display7HoleY/2,0])
        cylinder(h=pcbT, d=display7HoleD, center=true);
    }
  }

  color("white") {
    translate([-40,-15,pcbT/2]) {
      linear_extrude(height=0.1)
        text("7inch HDMI LCD (C)", size=3, halign="center", valign="center");
    }
    translate([-40,-19,pcbT/2]) {
      linear_extrude(height=0.1)
        text("USB Capacitive Touch Screen", size=2, halign="center", valign="center");
    }
    translate([-40,-19,pcbT/2]) {
      linear_extrude(height=0.1)
        text("USB Capacitive Touch Screen", size=2, halign="center", valign="center");
    }
  }

  // HDMI
  translate([-display7PcbW/2+5,display7PcbD/2-16.8,0])
    rotate([0,0,180])
      hdmiSocket(detail);

  // micro USB
  translate([-display7PcbW/2+2,display7PcbD/2-35.5,0])
    rotate([0,0,180])
      usbMicroSocket(detail);

  // LCD display - glas
  glasOffsetX = -(display7GlasPcbDeltaXP-display7GlasPcbDeltaXN)/2;
  glasOffsetY = -(display7GlasPcbDeltaYP-display7GlasPcbDeltaYN)/2;
  echo("glasOffsetY: ", glasOffsetY);
  glasOffsetZ = -(pcbT+display7GlasPcbDeltaZ)/2;
  translate([glasOffsetX,glasOffsetY,glasOffsetZ])
    cube([display7GlasW,display7GlasD,display7GlasPcbDeltaZ], center=true);

  // LCD display - black border
  blackOffsetX = glasOffsetX + (display7BlackGlasDeltaXP-display7BlackGlasDeltaXN)/2;
  blackOffsetY = glasOffsetY - (display7BlackGlasDeltaYP-display7BlackGlasDeltaYN)/2;
  echo("blackOffsetY: ", blackOffsetY);
  blackOffsetZ = glasOffsetZ - 3.4;
  translate([blackOffsetX,blackOffsetY,blackOffsetZ])
    color("black")
      cube([display7GlasW-display7BlackGlasDeltaXP-display7BlackGlasDeltaXN,display7GlasD-display7BlackGlasDeltaYP-display7BlackGlasDeltaYN,0.2], center=true);

  // Touch panel
  translate([blackOffsetX,blackOffsetY,blackOffsetZ-0.1])
    color("yellow")
      cube([display7W,display7D,0.2], center=true);

  // Display threaded sleeves
  translate([ display7HoleX/2, display7HoleY/2,pcbT/2]) hex_nut(8, 3, 8, 0.2, $fn, 1, "metric");
  translate([ display7HoleX/2,-display7HoleY/2,pcbT/2]) hex_nut(8, 3, 8, 0.2, $fn, 1, "metric");
  translate([-display7HoleX/2,-display7HoleY/2,pcbT/2]) hex_nut(8, 3, 8, 0.2, $fn, 1, "metric");
  translate([-display7HoleX/2, display7HoleY/2,pcbT/2]) hex_nut(8, 3, 8, 0.2, $fn, 1, "metric");
}

// Distatances between board border and diplay border
function display7deltaXP() = 20;
function display7deltaXN() = 20;
function display7deltaYP() = 20;
function display7deltaYN() = 20;

if(displayDisplay7) {
  $fn=100;

  display7();
}
