'''
References:

https://www.wikihow.com/Convert-a-Number-from-Decimal-to-IEEE-754-Floating-Point-Representation
https://babbage.cs.qc.cuny.edu/IEEE-754.old/Decimal.html
'''

from decimal import *
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
    __inputNum = Decimal
    __wholeNumBin = str
    __decNumBin = str
    __base2Num = str
    __decPlaces = int
    __spSign = str
    __dpSign = str
    __spExponent = int
    __dpExponent = int
    __spMantissa = str
    __dpMantissa = str
    spBinNum = str
    spHexNum = str
    dpBinNum = str
    dpHexNum = str
    
    # ----------------------------------------------------------------------------- Functions
    # constructor
    def __init__(self):
        self.__myargs = argparse.Namespace
        self.__inputNum = 0.0
        self.__wholeNumBin = ''
        self.__decNumBin = '0b'
        self.__base2Num = ''
        self.__decPlaces = 0
        self.__spSign = ''
        self.__dpSign = ''
        self.__spExponent = 127
        self.__dpExponent = 1023
        self.__spMantissa = ''
        self.__dpMantissa = ''
        self.spBinNum = '0b'
        self.spHexNum = ''
        self.dpBinNum = '0b'
        self.dpHexNum = ''
    
    
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
        parser.add_argument('-sign','--signbit',
                            type=int,default=0,metavar='',required=False,help='Include sign bit in hex num')
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
        # ---------- get num as arg or input
        if self.__myargs.inputvalue:
            self.__inputNum = Decimal(self.__myargs.inputvalue)
        else:
            self.__inputNum = Decimal(number)
        # print('Input dec num: ',self.__inputNum,type(self.__inputNum))
        # ---------- split input num
        decNum, wholeNum = math.modf(self.__inputNum)
        # print('Whole num: ',wholeNum,' Dec num: ',decNum)
        # ---------- convert whole num to binary
        self.__wholeNumBin = bin(int(wholeNum))
        # ---------- convert dec num to binary
        tempdecNum = decNum
        while not tempdecNum >= 1:
            tempdecNum *= 2
            # print('Each dec num stage: ',tempdecNum,' -> ',int(tempdecNum))
            self.__decNumBin += str(int(tempdecNum))
        print('Input Number:{:^5s}{:.20f} (10)'.format(' ',self.__inputNum))
        # print verbosity
        if self.__myargs.verbose:
            print('{:^5s}{:<15d} (10) ---> {:<15s} (2)'.format(' ',int(wholeNum),self.__wholeNumBin))
            print('{:^5s}{:<15f} (10) ---> {:<15s} (2)'.format(' ',decNum,self.__decNumBin))
    
    
    # convert bin num to base 2 scientific notation
    def base2Scientific(self):
        # concatenate whole num and dec num
        self.__base2Num = str(self.__wholeNumBin + '.' + self.__decNumBin).replace('0b','')
        # convert to base 2
        self.__decPlaces = self.__base2Num.index('.') - 1
        tempList = list(self.__base2Num)
        tempList.remove('.')
        tempList.insert(1,'.')
        self.__base2Num = ''
        self.__base2Num = self.__base2Num.join(tempList)
        tempList.clear()
        # print verbosity
        if self.__myargs.verbose:
            print('{:^5s}{:<15f} (10) ---> {:<15s} (2)'.format(' ',self.__inputNum,self.__base2Num))
            print('{:^5s}Decimal places: {:<5d}'.format(' ',int(self.__decPlaces)))
    
    
    # Determine sign of the number and display in binary format
    def getSign(self):
        if self.__inputNum >= 0:    
            self.__spSign = '0'
            self.__dpSign = '0'
            # print verbosity
            if self.__myargs.verbose:
                print("     Sign bit:       1'b0")
        else:
            self.__spSign = '1'
            self.__dpSign = '1'
            # print verbosity
            if self.__myargs.verbose:
                print("     Sign bit:       1'b1")
    
    
    # calculate the exponent bias and display in binary format
    def getexpoBias(self):
        if self.__myargs.doubleprecison == 1:
            self.__dpExponent += self.__decPlaces
            # print verbosity
            if self.__myargs.verbose:
                print('{:^5s}Exponent bias:  {:<5d}'.format(' ',int(self.__dpExponent)))
                print('{:^5s}{:<15d} (10) ---> {:<15s} (2)'.format(' ',int(self.__dpExponent),bin(self.__dpExponent)))
        elif self.__myargs.singleprecison == 1:
            self.__spExponent +=  self.__decPlaces
            # print verbosity
            if self.__myargs.verbose:
                print('{:^5s}Exponent bias:  {:<5d}'.format(' ',int(self.__spExponent)))
                print('{:^5s}{:<15d} (10) ---> {:<15s} (2)'.format(' ',int(self.__spExponent),bin(self.__spExponent)))
    
    
    # caculate the mantissa and display in binary format
    def getMantissa(self):
        w, tempMantissa = self.__base2Num.split('.')
        if self.__myargs.doubleprecison == 1:
            self.__dpMantissa = tempMantissa.ljust(52,'0')
            # print verbosity
            if self.__myargs.verbose:
                print('{:^5s}Mantissa:       0b{:<52s} (2)'.format(' ',self.__dpMantissa))
        elif self.__myargs.singleprecison == 1:
            self.__spMantissa = tempMantissa.ljust(23,'0')
            # print verbosity
            if self.__myargs.verbose:
                print('{:^5s}Mantissa:       0b{:<23s} (2)'.format(' ',self.__spMantissa))
    
    
    # combine all parts
    def combineAll(self):
        # for double precision
        if self.__myargs.doubleprecison == 1:
            self.__dpExponent = bin(self.__dpExponent).replace('0b','')
            # dont include sign bit in hex
            if self.__myargs.signbit == 0:
                self.dpBinNum += self.__dpExponent + self.__dpMantissa
            # include sign bit in hex
            elif self.__myargs.signbit == 1:
                self.dpBinNum += self.__dpSign + self.__dpExponent + self.__dpMantissa
            self.dpHexNum = hex(int(self.dpBinNum,2))
            # print(len(self.dpBinNum),self.dpBinNum,self.dpHexNum)
            print('Output Number: {:<17s} (16) ---> {:<66s} (2)'.format(self.dpHexNum,self.dpBinNum))
        
        # for single precision
        elif self.__myargs.singleprecison == 1:
            self.__spExponent = bin(self.__spExponent).replace('0b','')
            # dont include sign bit in hex
            if self.__myargs.signbit == 0:
                self.spBinNum += self.__spExponent + self.__spMantissa
            # include sign bit in hex
            elif self.__myargs.signbit == 1:
                self.spBinNum += self.__spSign + self.__spExponent + self.__spMantissa
            self.spHexNum = hex(int(self.spBinNum,2))
            # print(len(self.spBinNum),self.spBinNum,self.spHexNum)
            print('Output Number: {:<18s} (16) ---> {:<34s} (2)'.format(self.spHexNum,self.spBinNum))
    
    
    # convert decimal number to IEEE foat point conversion
    def dec2IeeeFloatPoint(self,number):
        self.convertInputNum2Bin(number)
        #self.base2Scientific()
        #self.getSign()
        #self.getexpoBias()
        #self.getMantissa()
        #self.combineAll()


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
    # convert decimal number to IEEE foat point conversion
    number=math.sin(math.radians(1))
    print('in num:  ',number)
    obj1.dec2IeeeFloatPoint(number)


if __name__ == '__main__':
    main()


0.01745240643728351
0.01745240643728351