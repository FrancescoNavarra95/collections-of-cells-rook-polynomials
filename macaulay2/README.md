# Macaulay2 Code for Collections of Cells, Binomial Ideals, and Switching Rook Polynomials

This folder contains Macaulay2 code for experimenting with the following conjectures concerning a collection of cells Q:

1. The $h$-polynomial of the coordinate ring of Q coincides with the switching rook polynomial of Q.
2. The Castelnuovo–Mumford regularity of the coordinate ring of Q equals the rook number of Q.

## Features

The code provides functions to:

- Construct the inner 2-minor ideal of a collection of cells.
- Compute the rook number and the switching rook polynomial of a collection of cells.
- Test the conjectures on a list of collections of cells.

All functions are implemented in the general setting of collections of cells.  
A collection is represented as a list `Q`, whose elements are the cells, each specified by its diagonal corners.  
Example:
     				          __
  			             __|__|
   		            |__|__|      

   is encoded as:  Q={{{1,1},{2,2}},{{2,1},{3,2}},{{2,2},{3,3}}}

## Organization

The file is divided into three sections:

1. **Inner 2-Minor Ideal of a Collection of Cells**  
   Functions: `InnerInterval`, `PolyoRing`, `PolyoIdeal`.

2. **Switching Rook Polynomial**  
   Functions: `isInnerInterval`, `isNonAttackingRooks`, `kRookConfigurations`,  
   `RookNumber`, `SwitchOperation`, `areSwitchEquivalent`,  
   `kCoefficientSwitchingRook`, `CoeffSwitchingRookPolynomial`.

3. **Testing the Conjectures**  
   Main function: `TestConj`.

## Requirements

The code requires the Macaulay2 package **Graphs**, which must be loaded before using any switching rook functions or `TestConj`:

loadPackage "Graphs";

