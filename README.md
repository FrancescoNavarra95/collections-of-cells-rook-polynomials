---------------------------------------------------------------------------------------------------
 COLLECTIONS OF CELLS, BINOMIAL IDEALS, AND SWITCHING ROOK POLYNOMIALS
---------------------------------------------------------------------------------------------------

This project is devoted to testing the following conjectures:

   1. The h-polynomial of the coordinate ring of a collection of cells Q 
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
- one contains the lists of collections of cells up to rank 10,  
- the other contains the lists of polyominoes up to rank 14.  
These lists are already generated and stored in `.txt` format, ready to use with the Macaulay2 code.  

---------------------------------------------------------------------------------------------------
