'''
References:

https://www.wikihow.com/Convert-a-Number-from-Decimal-to-IEEE-754-Floating-Point-Representation
https://babbage.cs.qc.cuny.edu/IEEE-754.old/Decimal.html
'''

import argparse
import logging
import math
import os
os.system('clear')

# =============================================================================
# ================================ Begin Class ================================
# =============================================================================

# class IEEE 754 Double Floating Point Unit
class IEEE754DFPU():
    
    # ----------------------------------------------------------------------------- Variables
    __myargs = argparse.Namespace
    
    
    # ----------------------------------------------------------------------------- Functions
    # constructor
    def __init__(self):
        self.__myargs = argparse.Namespace
    
    
    # setup arguments for class
    def setArguments(self):
        # set arguments for class IEEE754DFPU
        parser = argparse.ArgumentParser(prog='IEEE-754 Double Floating Point Unit',
                                        usage='%(prog)s [options] path',
                                        description='IEEE-754 single and double precision hexadecimal floating point unit generator',
                                        epilog='Happy trigonometry :)')
        # list of all possible args for IEEE754DFPU
        parser.add_argument('-dp','--doubleprecison',
                            type=int,default=1,metavar='',required=False,nargs='?',help='Set output value to have double precision')
        parser.add_argument('-sp','--singleprecison',
                            type=int,default=0,metavar='',required=False,nargs='?',help='Set output value to have single precision')        
        parser.add_argument('-num','--inputvalue',
                        type=float,default=0,metavar='',required=False,nargs='?',help='Input user defined decimal value')
        group = parser.add_mutually_exclusive_group()
        parser.add_argument('-v','--verbose',
                            type=int,default=0,metavar='',required=False,nargs='?',help='print verbose')
        self.__myargs = parser.parse_args()
    
    
    # set precison level i.e single or double
    def getPrecison(self):
        if self.__myargs.singleprecison == 1:
            self.__myargs.doubleprecison = 0
        elif self.__myargs.doubleprecison == 1:
            self.__myargs.singleprecison = 0
        else:
            self.__myargs.doubleprecison = 1
            self.__myargs.singleprecison = 0
        if self.__myargs.verbose:
            print('Single Precison: ',self.__myargs.singleprecison)
            print('Double Precison: ',self.__myargs.doubleprecison)

# =============================================================================
# ================================= End Class =================================
# =============================================================================

def main():
    # create class object
    obj1 = IEEE754DFPU()
    # setup arguments for class 
    obj1.setArguments()
    # set precison level
    obj1.getPrecison()


if __name__ == '__main__':
    main()