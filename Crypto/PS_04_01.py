# -*- coding: utf-8 -*-
"""
Created on Thu Oct 17 21:28:32 2013

@author: Alex
"""

IV = "20814804c1767293b99f1d9cab3bc3e7"
te = "P A Y _ B O B _ 1
CT = "ac1e37bfb15599e5f40eef805488281d"


def strxor(a, b):     # xor two strings of different lengths
    if len(a) > len(b):
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a[:len(b)], b)])
    else:
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a, b[:len(a)])])
        
        
def number_to_name(number):
    # fill in your code below
    number = 1
    if(number == 1) :
        x = "rock"
    
    # convert number to a name using if/elif/else
    # don't forget to return the result!
