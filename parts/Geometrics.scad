// ========================================
// Geometrics
// Version 1
// (c) Ralf Lange, longsoft.de
// ========================================

// Include the constants with the dimensions
// and the special variables
include <GeometricConstants.scad>;

// Which one would you like to see?
displayBallBearing = false;
displayPrism = true;
displayRamp = false;
displayAll = false;           // All parts together
displayImage = false;         // All parts together in one image

displayDevices = true;
withThread = false;

// Details of the drawing (larger is better)
$fn = 100;
transparency = 0.5;  // 1.0 is opace

module ballBearing(height, outerD, innerD)
{
  padding = (outerD-innerD)/3;
  difference() {
    cylinder(h=height, d=outerD, center = true);
    cylinder(h=height+0.1, d=outerD-padding, center = true);
  }
  color("blue") {
  difference() {
    cylinder(h=height, d=outerD-padding, center = true);
    cylinder(h=height+0.1, d=innerD+padding, center = true);
  }
  }
  difference() {
    cylinder(h=height, d=innerD+padding, center = true);
    cylinder(h=height+0.1, d=innerD, center = true);
  }
}

module prism(widthBottom, depth, height, widthTop = 0.1, center = false)
{
  assert(widthTop > 0, "");
  
  CubePoints = [
    [ 0, 0, 0 ],                                  // 0
    [ widthBottom, 0, 0 ],                        // 1
    [ widthBottom, depth, 0 ],                    // 2
    [ 0, depth, 0 ],                              // 3
    [ (widthBottom-widthTop)/2, 0, height ],      // 4
    [ (widthBottom+widthTop)/2, 0, height ],      // 5
    [ (widthBottom+widthTop)/2, depth, height ],  // 6
    [ (widthBottom-widthTop)/2, depth, height ]   // 7
  ];
  
  CubeFaces = [
    [0,1,2,3],  // bottom
    [4,5,1,0],  // front
    [7,6,5,4],  // top
    [5,6,2,1],  // right
    [6,7,3,2],  // back
    [7,4,0,3]   // left
  ];
  
  if (center == true) {
    translate([ -widthBottom/2, -depth/2, -height/2])
      polyhedron( CubePoints, CubeFaces );
  }
  else {
    polyhedron( CubePoints, CubeFaces );
  }
}

module ramp(widthBottom, depth, height, widthTop = 0.1, center = false)
{
  assert(widthTop > 0, "");
    
  CubePoints = [
    [ 0, 0, 0 ],                  // 0
    [ widthBottom, 0, 0 ],        // 1
    [ widthBottom, depth, 0 ],    // 2
    [ 0, depth, 0 ],              // 3
    [ 0, 0, height ],             // 4
    [ widthTop, 0, height ],      // 5
    [ widthTop, depth, height ],  // 6
    [ 0, depth, height ]          // 7
  ];
  
  CubeFaces = [
    [0,1,2,3],  // bottom
    [4,5,1,0],  // front
    [7,6,5,4],  // top
    [5,6,2,1],  // right
    [6,7,3,2],  // back
    [7,4,0,3]   // left
  ];
  
  if (center == true) {
    translate([ -widthBottom/2, -depth/2, -height/2])
      polyhedron( CubePoints, CubeFaces );
  }
  else {
    polyhedron( CubePoints, CubeFaces );
  }
}

// ==============================================================================================

if (displayBallBearing) {
  ballBearing( bbHeight, bbOuterD, bbInnerD);
}
if (displayPrism) {
  prism(40, 10, 20, 10, false);
}
if (displayRamp) {
  ramp(40, 10, 20, 10, false);
}
if (displayAll) {
  hopperOffsetZ = 160;
  
  if (!displayDevices) {
    translate([ 0, 0, bucketOffsetZ])
      rotate([ 0, bucketRotate, 90])
        tippingBucket();
  }
}
if (displayImage) {
  translate([ (caseD+10), 0, 0])
    rotate([ 0, 0, 90])
      case7back(false);

  translate([ 0, 0, 0])
    rotate([ 0, 0, 90])
      case7chassis(false);
}
