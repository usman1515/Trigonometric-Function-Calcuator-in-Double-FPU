'''
References:

https://www.wikihow.com/Convert-a-Number-from-Decimal-to-IEEE-754-Floating-Point-Representation
https://babbage.cs.qc.cuny.edu/IEEE-754.old/Decimal.html
https://class.ece.iastate.edu/arun/Cpre305/ieee754/ie4.html
https://class.ece.iastate.edu/arun/CprE281_F05/ieee754/ie5.html
'''

from mpmath import *
import argparse
#import math
import re
import os
os.system('clear')

# =============================================================================
# ================================ Begin Class ================================
# =============================================================================

class DoublePrecision():
    # ----------------------------------------------------------------------------- Variables
    # ----------------------------------------------------------------------------- Functions
    # constructor
    pass

# =============================================================================
# ================================= End Class =================================
# =============================================================================

def main():
    for i in range(0,91,1):
        # val = Decimal(math.sin(math.radians(i)))
        print('Input({:^2d}) ----> {:<60f} {:>3d}'.format(i,val,len(str(val))))

if __name__ == '__main__':
    main()