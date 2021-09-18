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
    __inputNum = float
    __wholeNumBin = str
    __decNumBin = str
    __base2Num = str
    
    spSign = str
    dpSign = str
    spExponent = str
    dpExponent = str
    spMantissa = str
    dpMantissa = str
    
    # ----------------------------------------------------------------------------- Functions
    # constructor
    def __init__(self):
        self.__myargs = argparse.Namespace
        self.__inputNum = 0.0
        self.__wholeNumBin = ''
        self.__decNumBin = '0b'
        self.__base2Num = ''
        
        self.spSign = ''
        self.dpSign = ''
        self.spExponent = ''
        self.dpExponent = ''
        self.spMantissa = ''
        self.dpMantissa = ''
    
    
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
        # print verbosity
        if self.__myargs.verbose:
            print('Single Precison: ',self.__myargs.singleprecison)
            print('Double Precison: ',self.__myargs.doubleprecison)
    
    
    # convert whole number to binary
    def convertInputNum2Bin(self,number):
        # get num as arg or input
        if self.__myargs.inputvalue:
            self.__inputNum = self.__myargs.inputvalue
        else:
            self.__inputNum = number
        # split input num
        decNum, wholeNum = math.modf(self.__inputNum)
        # convert whole num to binary
        self.__wholeNumBin = bin(int(wholeNum))
        # convert dec num to binary
        tempdecNum = decNum
        while not tempdecNum >= 1:
            tempdecNum *= 2
            # print('Each dec num stage: ',tempdecNum,int(tempdecNum))
            self.__decNumBin += str(int(tempdecNum))
        # print verbosity
        if self.__myargs.verbose:
            print('Input Number: ',self.__inputNum)
            print('{:^5s}{:<10d} (10) ---> {:<15s} (2)'.format(' ',int(wholeNum),self.__wholeNumBin))
            print('{:^5s}{:<10f} (10) ---> {:<15s} (2)'.format(' ',decNum,self.__decNumBin))
    
    
    # convert bin num to base 2 scientific notation
    def base2Scientific(self):
        # concatenate whole num and dec num
        self.__base2Num = str(self.__wholeNumBin + '.' + self.__decNumBin).replace('0b','')
        # convert to base 2
        decPlaces = self.__base2Num.index('.') - 1
        tempList = list(self.__base2Num)
        tempList.remove('.')
        tempList.insert(1,'.')
        self.__base2Num = ''
        self.__base2Num = self.__base2Num.join(tempList)
        tempList.clear()
        # print verbosity
        if self.__myargs.verbose:
            print('{:^5s}{:<10f} (10) ---> {:<15s} (2)'.format(' ',self.__inputNum,self.__base2Num))
            print('{:^5s}Decimal places = {:>5f}'.format(' ',int(decPlaces)))
    
    
    # calculate the exponent bias
    def expoBias(self):
        pass


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
    # convert dec num to bin num
    obj1.convertInputNum2Bin(number=85.125)
    # combine bin num to base 2 notation
    obj1.base2Scientific()
    # get exponent bias
    obj1.expoBias()


if __name__ == '__main__':
    main()