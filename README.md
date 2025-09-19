---------------------------------------------------------------------------------------------------
 COLLECTIONS OF CELLS, BINOMIAL IDEALS, AND SWITCHING ROOK POLYNOMIALS 
[![DOI](https://zenodo.org/badge/1055459624.svg)](https://doi.org/10.5281/zenodo.17108919)
---------------------------------------------------------------------------------------------------

This project is devoted to testing the following conjectures:

   1. The $h$-polynomial of the coordinate ring of a collection of cells Q 
      coincides with the switching rook polynomial of Q.

   2. The Castelnuovo–Mumford regularity of the coordinate ring of Q 
      coincides with the rook number of Q.

---------------------------------------------------------------------------------------------------
 DIRECTORIES
---------------------------------------------------------------------------------------------------

We provide two main directories:

(1) **SageMath/**  
    - Contains the code to compute the set L of all collections of cells of a fixed rank n.  
    - The scripts generate the collections up to symmetries.  
    - You can find the relevant code in this directory.

(2) **Macaulay2/**  
    - Contains the code `RookPol.m2`.  
    - For each collection Q in L, the program:  
        * computes the h-polynomial of the coordinate ring of Q;  
        * computes the switching rook polynomial and rook number of Q;  
        * compares the two polynomials and records any counterexamples.

Moreover, two `.zip` archives are provided:  
- one contains the lists of collections of cells up to rank 8,  
- the other contains the lists of polyominoes up to rank 11.  
These lists are already generated and stored in `.txt` format, ready to use with the Macaulay2 code.
A collection is represented as a list `Q`, whose elements are the cells, each specified by its diagonal corners. For example:
```
      __
   __|__|
  |__|__|

 ``` 
is encoded as:  Q={{{1,1},{2,2}},{{2,1},{3,2}},{{2,2},{3,3}}} 

---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
 HOW TO USE
---------------------------------------------------------------------------------------------------

1. **Download the repository**  
   - From GitHub, click on *Code* → *Download ZIP*.  
   - Extract the `.zip` archive on your computer.  
   - You will now have a local folder containing the subdirectories `macaulay2/` and `sage/`.

2. **Prepare the data files**  
   - Inside the main repository, you will also find two archives:  
       * `Collections_of_cells_up_rank_8.zip`  
       * `Polyominoes_up_rank_11.zip`  
   - Extract these archives **into the `macaulay2/` directory**.  
   - After extraction, the `.txt` files with the collections will be available in the same folder where `RookPol.m2` is located.

3. **Run the code in Macaulay2**  
   - Open a terminal and navigate to the `macaulay2/` directory;
   - Start Macaulay2 and load the required package and script:  
     ```
     loadPackage "Graphs";
     load "RookPol.m2";
     ```

4. **Test the conjectures**  
   - Load a file containing a list of collections of cells, e.g.:
     ```
     L = value get("weak_polyplets_n4.txt");
     TestConj(L);
     ```
   - This will test the conjectures for all collections in `L`.

5. **Additional functionality**  
   - The file `RookPol.m2` also contains several auxiliary functions that can be used independently

---

*Acknowledgements.* The function `PolyoIdeal` is adapted from and openly shared in the Macaulay2 package [PolyominoIdeals.m2](https://www.macaulay2.com/doc/Macaulay2/share/doc/Macaulay2/PolyominoIdeals/html/index.html), authored by C. Cisto, R. Jahangir, and F. Navarra. I am grateful to Carmelo Cisto for kindly sharing some preliminary functions which later allowed to make `AllNonAttackingRookConfigurations(Q)`, which has been incorporated into this project.  

*Acknowledgements.* The function `PolyoIdeal` is adapted from the Macaulay2 package [PolyominoIdeals.m2](https://www.macaulay2.com/doc/Macaulay2/share/doc/Macaulay2/PolyominoIdeals/html/index.html), provided by C. Cisto, R. Jahangir, and me. I also thank Carmelo Cisto for sharing preliminary functions that inspired the development of `AllNonAttackingRookConfigurations(Q)`, later integrated into this project.  

