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
    __wholeNum = int
    __decNum = Decimal
    __wholeNumBin = str
    __decNumBin = str
    __base2Num = str
    __decPlaces = int
    __spSign = str
    __dpSign = str
    __spExponent = int
    __dpExponent = int
    __spExponentBin = str
    __dpExponentBin = str
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
        self.__wholeNum = 0
        self.__decNum = 0.0
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
        # ---------- set arguments for class IEEE754DFPU
        parser = argparse.ArgumentParser(prog='IEEE-754 Double Floating Point Unit',
                                        usage='%(prog)s [options] path',
                                        description='IEEE-754 single and double precision hexadecimal floating point unit generator',
                                        epilog='Happy trigonometry :)')
        # ---------- list of all possible args for IEEE754DFPU
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
        parser.add_argument('-d','--debug',
                            type=int,default=0,metavar='',required=False,nargs='?',help='print debugging')
        self.__myargs = parser.parse_args()
    
    
    # set precision level i.e single or double
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
            print('Single Precision: ',self.__myargs.singleprecison)
            print('Double Precision: ',self.__myargs.doubleprecison)
    
    
    # split input number into whole and dec
    def splitInputNum(self,number):
        # ---------- get num as arg or input
        if self.__myargs.inputvalue:
            self.__inputNum = Decimal(self.__myargs.inputvalue)
        else:
            self.__inputNum = Decimal(number)
        print('Input dec num: ',self.__inputNum)
        # ---------- split input num
        self.__decNum, self.__wholeNum = math.modf(self.__inputNum)
        self.__wholeNum = int(self.__wholeNum)
        self.__decNum = Decimal(self.__decNum)
        # ---------- print debugging
        if self.__myargs.debug:
            print('{:<5s}---- Length -> Whole num = [{:d}] Decimal num = [{:d}]'
                .format(' ',len(str(self.__wholeNum)),len(str(self.__decNum))))
    
    
    # convert whole num to bin
    def wholeNum2Bin(self):
        self.__wholeNumBin = bin(self.__wholeNum)
        # ---------- print verbosity
        if self.__myargs.verbose:
            print('{:^5s}{:<15d} (10) ---> {:<15s} (2)'.format(' ',self.__wholeNum,self.__wholeNumBin))
    
    
    # convert dec num to bin
    def decNum2Bin(self):
        # ---------- change dec width to 32 bits
        tempFloat = self.__decNum * 1
        # ---------- multiply by 2 and store MSB in str
        for i in range(len(str(tempFloat))):
            tempFloat *= 2
            bit, dump = str(tempFloat).split('.')
            # ---------- print debugging
            if self.__myargs.debug:
                print('{:<5s}---- Bit[{:>2d}]= {:^5s} --> Temp float  =  {:f}'.format(' ',i,bit,tempFloat))
            self.__decNumBin += bit
            # ---------- if tempFloat >= 1 change back to 0
            if tempFloat >= 1.0:
                tempFloat -= 1
        # ---------- print verbosity
        if self.__myargs.verbose:
            print('{:^5s}{:<15f} (10) ---> {:<15s} (2)'.format(' ',float(self.__decNum),self.__decNumBin))
    
    
    # convert bin num to base 2 scientific notation
    def base2Scientific(self):
        # ---------- concatenate whole num and dec num
        self.__base2Num = str(self.__wholeNumBin + '.' + self.__decNumBin).replace('0b','')
        oldDotPos = self.__base2Num.index('.')
        tempList = list(self.__base2Num)
        tempList.remove('.')
        # ---------- check if MSB is 1'b1
        if self.__base2Num[0] == '1':
            # print('MSB is 1: ',self.__base2Num[0])
            tempList.insert(1,'.')
        # ---------- check if LSB is 1'b1
        elif self.__base2Num[0] == '0' and self.__base2Num[-1] == '1':
            # print('LSB is 1: ',self.__base2Num[-1])
            tempList.insert(len(tempList),'.0')
        # ---------- append dec point
        self.__base2Num = ''
        self.__base2Num = self.__base2Num.join(tempList)
        tempList.clear()
        newDotPos = self.__base2Num.index('.')
        print('new ',newDotPos,'old ',oldDotPos)
        self.__decPlaces = -1 * (newDotPos - oldDotPos)
        # ---------- print verbosity
        if self.__myargs.verbose:
            print('{:^5s}{:<15f} (10) ---> {:<15s} (2)'.format(' ',float(self.__inputNum),self.__base2Num))
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
        self.splitInputNum(number)
        self.wholeNum2Bin()
        self.decNum2Bin()
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
    # set precision level
    obj1.getPrecison()
    # convert decimal number to IEEE foat point conversion
    obj1.dec2IeeeFloatPoint(number=math.sin(math.radians(1)))
    #obj1.dec2IeeeFloatPoint(number=85.125)

if __name__ == '__main__':
    main()



# print('len is ',len(str('1.0001110111110000101100101011100010011101110100011110')))
# 0.01745240643728351

# 1.0001110111110000101100101011100010011101110100011110
# 0.017452406437283511653202339175550150685012340545654296875
# 0.01745240643728351