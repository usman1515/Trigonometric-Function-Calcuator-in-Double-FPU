'''
References:

https://www.wikihow.com/Convert-a-Number-from-Decimal-to-IEEE-754-Floating-Point-Representation
https://babbage.cs.qc.cuny.edu/IEEE-754.old/Decimal.html
https://class.ece.iastate.edu/arun/Cpre305/ieee754/ie4.html
https://class.ece.iastate.edu/arun/CprE281_F05/ieee754/ie5.html
'''

from mpmath import mp
import argparse
#import math
import re
import os
os.system('clear')

# =============================================================================
# ================================ Begin Class ================================
# =============================================================================

class DoublePrecision():
    # ------------------------------------------- Variables
    __myargs = argparse.Namespace
    __inputNum = float
    __spSign = str
    __dpSign = str
    
    # ------------------------------------------- Functions
    # constructor
    def __init__(self):
        self.__myargs = argparse.Namespace
        self.__inputNum = 0.0
        self.__spSign = ''
        self.__dpSign = ''
    
    
    # setup arguments for class
    def setArguments(self):
        # ---------- set arguments for class IEEE754DFPU
        parser = argparse.ArgumentParser(prog='IEEE-754 Double Floating Point Unit',
                                        usage='%(prog)s [options] path',
                                        description='IEEE-754 double precision hexadecimal floating point unit generator',
                                        epilog='Happy trigonometry :)')
        # ---------- list of all possible args for Double Precision
        parser.add_argument('-num','--inputvalue',
                        type=float,default=0,metavar='',required=False,nargs='?',help='Input user defined decimal value')
        parser.add_argument('-sign','--signbit',
                            type=int,default=0,metavar='',required=False,help='Include sign bit in hex num')
        parser.add_argument('-v','--verbose',
                            type=int,default=0,metavar='',required=False,nargs='?',help='print verbose')
        parser.add_argument('-d','--debug',
                            type=int,default=0,metavar='',required=False,nargs='?',help='print debugging')
        self.__myargs = parser.parse_args()
    
    
    # Determine sign of the number and display in binary format
    def getSign(self):
        if self.__inputNum >= 0:    
            self.__spSign = '0'
            self.__dpSign = '0'
            ## print verbosity
            #if self.__myargs.verbose:
            #    print('{:^5s}{:<21s}{:<5s}'.format(' ','Sign bit = ',"1'b0"))
        else:
            self.__spSign = '1'
            self.__dpSign = '1'
            ## print verbosity
            #if self.__myargs.verbose:
            #    print('{:^5s}{:<21s}{:<5s}'.format(' ','Sign bit = ',"1'b1"))


# =============================================================================
# ================================= End Class =================================
# =============================================================================

def main():
    obj1 = DoublePrecision()
    obj1.getSign()
    #for i in range(0,91,1):
    #    # val = Decimal(math.sin(math.radians(i)))
    #    print('Input({:^2d}) ----> {:<60f} {:>3d}'.format(i,val,len(str(val))))

if __name__ == '__main__':
    main()