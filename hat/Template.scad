// ========================================
// Raspberry Pi HAT Modules
// Board modules
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
displayTemplate = true;    // Template

// Show Header
header = true; // true: Show Header; false:Don't show Header

module template(withHeader=false)
{
  pi3HatPcb();

}

if(displayTemplate == true) {
  $fn=100;

  template(header);
}
