inslut = {
    "itype": ["ORI","ORUI","LW","SW","BEQ"],
    "rtype": ["ADD","SUB","OR","AND","XOR","COM","NOT"],
    "jtype": ["JMP"]
}

asm2bin_opcode = {
    "ORI" : "010000",
    "ORUI": "010001",
    "ADD": "000001",
    "SUB": "000001",
    "OR": "000001",
    "AND": "000001",
    "XOR": "000001",
    "COM": "000001",
    "NOT": "000001",

    "LW": "011000",
    "SW": "011100",
    "BEQ": "100100",
    "JMP": "110000"
}

asm2bin_aluopcode = {
    "ADD": "00000000_000",
    "SUB": "00000000_001",
    "OR": "00000000_010",
    "AND": "00000000_011",
    "XOR": "00000000_100",
    "COM": "00000000_101",
    "NOT": "00000000_110",
}

def binr(binstr):
    binize = bin(int(binstr))[2:]
    return  "0"*(5-len(binize)) + binize

def binimm(binstr):
    try:
        binize = bin(int(binstr))[2:]
    except:
        binize = bin(int(binstr,16))[2:]

    return  "0"*(16-len(binize)) + binize

def binaddr(binstr):
    binize = bin(int(binstr,16))[2:-2:]
    return  "0"*(26-len(binize)) + binize

def ins_trans(ins):
    arr  = ins.split()

    bin_opcode = asm2bin_opcode[arr[0]]

    opcode = arr[0]
    type = "NONE"
    for eachtype in inslut:
        if opcode in inslut[eachtype]:
            type = eachtype

    if type == "rtype":
        rd = arr[1].strip("$r")
        rs = arr[2].strip("$r")
        rt = arr[3].strip("$r")
        bin_alucode = asm2bin_aluopcode[opcode]
        return "%s_%s_%s_%s_%s" % (bin_opcode,binr(rs),binr(rt),binr(rd),bin_alucode)

    if type == "itype":
        rt = arr[1].strip("$r")
        rs = arr[2].strip("$r")
        imm = arr[3].strip("#")
        return "%s_%s_%s_%s" % (bin_opcode,binr(rs),binr(rt),binimm(imm))

    if type == "jtype":
        addr = arr[1].lstrip("0x")
        return "%s_%s" % (bin_opcode,binaddr(addr))

def whiletrue():
    inp = ""
    while(inp != "end"):
        inp = input("enter:")
        print(ins_trans(inp) + " // " + inp )

def whilelist():
    inslist = []
    inp = ""
    while(inp != "end"):
        inp = input()
        inslist.append(inp)
    for ins in inslist[:-1:]:
        print(ins_trans(ins) + " // " + ins )        