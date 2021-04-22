// ========================================
// Raspberry Pi HAT Modules
// Pi USV Plus
// (c) Ralf Lange, longsoft.de
// ========================================

// External definitions
include <../raspberry/PiPcbConstants.scad>
include <../parts/PartConstants.scad>

// External modules
use <../raspberry/PiPcbs.scad>
use <../raspberry/PiParts.scad>
use <../parts/Parts.scad>

// Which one would you like to see?
displayPiUsvPlus = true;    // PiUSV+

// Show Header
header = true; // true: Show Header; false:Don't show Header

module piUsvPlus(detail=2)
{
  pi3HatPcb(false, true, 5.5, true);

  // micro USB
  translate([-pi3HatPcbW/2+10.6,-pi3HatPcbD/2+1.5,0])
    rotate([0,0,-90])
      usbMicroSocket(detail);

  translate([-pi3HatPcbW/2+30.5-12/2,pi3HatPcbD/2-24.5+12/2,pcbT/2+6/2])
    cube([12,12,6], center=true);

  translate([-pi3HatPcbW/2+18.75-12.2/2,-pi3HatPcbD/2+30.5-12.2/2,pcbT/2+7.7/2])
    cube([12.2,12.2,7.7], center=true);

  translate([-pi3HatPcbW/2+15.5-6.5/2,pi3HatPcbD/2-17.5+6.5/2,pcbT/2+6/2])
    cylinder(h=7.2, d=6.5, center=true);

  translate([-pi3HatPcbW/2+18.0-6.5/2,-pi3HatPcbD/2+16.5-6.5/2,pcbT/2+6.3/2])
    cylinder(h=6.3, d=6.5, center=true);
}

if(displayPiUsvPlus == true) {
  $fn=100;

  piUsvPlus();
}
