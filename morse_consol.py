#!/usr/bin/env python3

"""This module created for using as consol in project
https://github.com/dj0b/Corse_work_morse
BEFORE START PROJECT OPEN MODELSIM
inh.txt(input ROM) - input text file every letter in new line and in heximal format
outh.txt(outpur ROM) - output text file lines 0-5 is service, xx - undefined symbols 
"""

end_str = "ff"
print('!Max length is 4095 symbols!')
in_str = input('Enter your messege: ')
"""read and save massege for transmission"""

in_str = in_str.upper()
t = open("input.txt", "w")
t.write(in_str)
t.close()
"""write massege for transmission analis"""

in_list = []
in_list = list(in_str)
print(in_list)
"""convert string to list for a simpler next convertion in ASCII(hex) """

hex_str = ""
for in_list in in_list:
    hex_str += format(ord(in_list), "x") + "\n"
"""convert letters to ASCII format """
    
hex_str += end_str
print(hex_str)

i = open("inh.txt", "w")
in_str = in_str.upper()
i.write(hex_str)
i.close()
"""write in files for initialization input ROM"""

input('pres enter when simulation end ')

o = open("outh.txt", "r")
lines = o.read().splitlines()
o.close()
del(lines[0:5])
del(lines[len(in_str)+2:4099])
print(lines)
"""read file delate service and undefined lines"""

text = ""
for lines in lines:
    bytes_object = bytes.fromhex(lines)
    ascii_string = bytes_object.decode("ASCII")
    text += ascii_string
"""convert ASCII to letters"""

print(text)
f = open("output.txt", "w")
f.write(text)
f.close()
"""write in files analis"""

input('pres enter to exit')

