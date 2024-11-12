# modular multiplication
# def mult(p1, p2):
#     """Multiply two polynomials in GF(2^4)/x^4 + x + 1"""
#     p = 0
#     while p2:
#         if p2 & 0b1:
#             p ^= p1
#         p1 <<= 1
#         if p1 & 0b10000:
#             p1 ^= 0b11
#         p2 >>= 1
#     return p & 0b1111

# building table
def mult9(x):
    m = 19 # modulus is fixed: x^4+x+1
    mul_res = x^(x<<3) # multiply by 9
    while mul_res >= 16:
        if mul_res >= (16<<2):
            mul_res ^= m<<2
        elif mul_res >= (16<<1):
            mul_res ^= m<<1
        elif mul_res >= 16:
            mul_res ^= m
    return mul_res

def mult4(x):
    m = 19 # modulus is fixed: x^4+x+1
    mul_res = x<<2 # multiply by 4
    while mul_res >= 16:
        if mul_res >= (16<<1):
            mul_res ^= m<<1
        elif mul_res >= 16:
            mul_res ^= m
    return mul_res

def mult2(x):
    m = 19 # modulus is fixed: x^4+x+1
    mul_res = x<<1 # multiply by 2
    if mul_res >= 16:
        mul_res ^= m
    return mul_res

print("test multiplying by 9:")
for num in [13, 2, 8, 11]:
    print(f"{num:X} * 9 = {mult9(num):X}")

print("test multiplying by 4:")
for num in [8, 15, 11, 1]:
    print(f"{num:X} * 4 = {mult4(num):X}")

print("test multiplying by 2:")
for num in [2, 9, 13, 11, 8]:
    print(f"{num:X} * 2 = {mult2(num):X}")

# printing mul tables
print("multiplying by 9 table:")
print("x | y")
print("-----")
for num in range(16):
    print(f"{num:X} | {mult9(num):X}")

print("multiplying by 4 table:")
print("x | y")
print("-----")
for num in range(16):
    print(f"{num:X} | {mult4(num):X}")

print("multiplying by 2 table:")
print("x | y")
print("-----")
for num in range(16):
    print(f"{num:X} | {mult2(num):X}")