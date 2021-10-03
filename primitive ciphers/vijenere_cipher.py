from itertools import cycle

alp = "abcdefghijklmnopqrstuvwxyz !'1234567890-=_+"

def encode_vijn(text, keytext):
    f = lambda arg: alp[(alp.index(arg[0])+alp.index(arg[1])%43)%43]
    return ''.join(map(f, zip(text.lower(), cycle(keytext))))


def decode_vijn(coded_text, keytext):
    f = lambda arg: alp[alp.index(arg[0])-alp.index(arg[1])%43]
    return ''.join(map(f, zip(coded_text, cycle(keytext))))

if __name__ == '__main__':
    message = "Hello world! It's a secret conidential message"
    key = "my secret key is 123!"
    ciphertext = encode_vijn(message, key)
    print("Ciphertext:", ciphertext)
    opentext = decode_vijn(ciphertext, key)
    print("Opentext:", opentext)