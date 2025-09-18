# Sage Scripts for Polyominoes and Collections of Cells

This directory contains two SageMath scripts:

1. polyomino_generator.sage – generates all free polyominoes of a given rank (number of cells), accounting for rotations and reflections to avoid duplicates.

2. collection_cells_generator.sage – generates all weakly connected collections of cells (polyplets) of a given rank, also up to symmetries.

The generated lists of polyominoes and polyplets are already available in the `macaulay2/` directory as `.txt` files and, for larger datasets, in `.zip` archives. 
These files are ready to use with the Macaulay2 code.
