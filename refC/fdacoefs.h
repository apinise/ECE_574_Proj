/*
 * Filter Coefficients (C Source) generated by the Filter Design and Analysis Tool
 * Generated by MATLAB(R) 9.13 and Signal Processing Toolbox 9.1.
 * Generated on: 16-Nov-2023 22:53:24
 */

/*
 * Discrete-Time FIR Filter (real)
 * -------------------------------
 * Filter Structure  : Direct-Form FIR
 * Filter Length     : 32
 * Stable            : Yes
 * Linear Phase      : Yes (Type 2)
 */

/* General type conversion for MATLAB generated C-code  */
/* 
 * Expected path to tmwtypes.h 
 * C:\Program Files\MATLAB\R2022b\extern\include\tmwtypes.h 
 */
/*
 * Warning - Filter coefficients were truncated to fit specified data type.  
 *   The resulting response may not match generated theoretical response.
 *   Use the Filter Design & Analysis Tool to design accurate
 *   single-precision filter coefficients.
 */
#define BL 32

const float B[32] = {
  -0.001501631225,-0.000254106475,0.0006102158222,  0.00239732163, 0.005359967705,
   0.009701744653,  0.01552934572,  0.02281497046,  0.03137002885,  0.04084405303,
    0.05073419586,  0.06042836979,  0.06926061958,  0.07657948881,  0.08181104064,
      0.084540084,    0.084540084,  0.08181104064,  0.07657948881,  0.06926061958,
    0.06042836979,  0.05073419586,  0.04084405303,  0.03137002885,  0.02281497046,
    0.01552934572, 0.009701744653, 0.005359967705,  0.00239732163,0.0006102158222,
  -0.000254106475,-0.001501631225
};
