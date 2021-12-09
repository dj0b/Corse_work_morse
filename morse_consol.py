
def morse():
    end_str = "ff"
    print('!Max length is 4095 symbols!')
    in_str = input('Enter your messege: ')

    in_str = in_str.upper()
    t = open("input.txt", "w")
    t.write(in_str)
    t.close()

    in_list = []
    in_list = list(in_str)
    print(in_list)

    hex_str = ""
    for in_list in in_list:
        hex_str += format(ord(in_list), "x") + "\n"
        
    hex_str += end_str
    print(hex_str)
    
    i = open("inh.txt", "w")
    in_str = in_str.upper()
    i.write(hex_str)
    i.close()

    input('pres enter when simulation end ')

    o = open("outh.txt", "r")
    lines = o.read().splitlines()
    o.close()
    del(lines[0:5])
    del(lines[len(in_str):4099])
    print(lines)

    text = ""
    for lines in lines:
        bytes_object = bytes.fromhex(lines)
        ascii_string = bytes_object.decode("ASCII")
        text += ascii_string

    print(text)
    f = open("output.txt", "w")
    f.write(text)
    f.close()
        
    f.close()
    
    return 0
    
