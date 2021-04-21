// ========================================
// Waveshare 7" touch display
// Type: 7inch HDMI LCD [c]
// Constant definitions
// (c) Ralf Lange, longsoft.de
// ========================================

// Dimensions

// Touch display
display7W = 154.08;     // 7" Display width (154.08 mm) (D18)
display7D = 85.92;      // 7" Display depth (85.92 mm) (D19)

// Glas panel
display7GlasW = 164.90; // 7" Display glas width (D15)
display7GlasD = 100.00; // 7" Display glas depth (100.00 mm) (D20)

display7BlackBorder = 1.50;   // Black border arround the touch display (D3,D7,D10,D14)

display7BlackGlasDeltaXP = 5.68;   // Distance black border to glas border on positive X axis (D5,D6)
display7BlackGlasDeltaXN = display7GlasW-display7W-2*display7BlackBorder-display7BlackGlasDeltaXP; // Distance black border to glas border on negative X axis
echo("Black glas delta XN: ", display7BlackGlasDeltaXN);
display7BlackGlasDeltaYP = 1.90;   // Distance black border to glas border on positive Y axis (D9)
display7BlackGlasDeltaYN = display7GlasD-display7D-2*display7BlackBorder-display7BlackGlasDeltaYP; // Distance black border to glas border on negative Y axis
echo("Black glas delta YN: ", display7BlackGlasDeltaYN);
display7TouchGlasDeltaZ = 0.2;  // Distance touch panal over glas

// Printed circuit board
display7PcbW = display7GlasW; // Printed circuit board width (164.90 mm) (D15)
display7PcbD = 107.02;        // Printed circuit board depth (107.02 mm) (D16)
display7PcbR = 3;             // Printed circuit board corner radius (3 mm)
display7PcbT = 1;             // Printed circuit board thickness (1 mm)
display7PcbJX = 8;            // Printed circuit board join bar width (8 mm)
display7PcbJY = 8.625;        // Printed circuit board join bar length (8.625 mm)
display7HoleX = 156.90;       // Centered hole distance on X axis (156.90 mm) (D21)
display7HoleY = 114.96;       // Centered hole distance on Y axis (114.96 mm) (D22)

display7GlasPcbDeltaXP = 0.00;    // Distance glas border to pcb border on positive X axis (0.0 mm) (D4)
display7GlasPcbDeltaXN = 0.00;    // Distance glas border to pcb border on negative X axis (0.0 mm) (D1)
display7GlasPcbDeltaYP = 1.75;    // Distance glas border to pcb border on positive Y axis (2.5 mm) (D8)
display7GlasPcbDeltaYN = 5.20;    // Distance glas border to pcb border on negative Y axis (3.3 mm + 6.0 mm) (D11)
display7GlasPcbDeltaZ = 6.65;     // Distance glas over board

display7HoleD = 3.18;  // Hole diameter (3.18 mm)
display7HoleDX = 4.0;  // Distance between left edge and hole center (4.0 mm)
display7HoleDY = 4.0;  // Distance between front edge and hole center (4.0 mm)

display7BushH = 10;  // Threaded bush hight (10 mm)
display7BushD = 8;   // Threaded bush diameter (8 mm)
display7BushB = 3;   // Threaded bush bore diameter (3 mm)
display7BushX = 10;  // Threaded bush distance on X axis (10 mm)
display7BushY = 10;  // Threaded bush distance on Y axis (10 mm)
