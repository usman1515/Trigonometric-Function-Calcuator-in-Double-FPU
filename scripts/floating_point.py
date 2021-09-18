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
    
    
    # get precison level ie sp/dp
    def getPrecison(self):
        pass



# =============================================================================
# ================================= End Class =================================
# =============================================================================

def main():
    # 
    obj1 = IEEE754DFPU()
    # 
    obj1.setArguments()
    obj1.getPrecison()
    # print(type(obj1.__myargs))

if __name__ == '__main__':
    main()