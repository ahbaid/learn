from Crypto.Cipher import AES

ENCRYPTION_START_INITIALIZATION_VALUE='\x01' * 16
DEFAULT_BLOCK_CIPHER_MODE=AES.MODE_ECB

# {{{ def prep_enc_key(encryption_key):

def prep_enc_key(encryption_key):

    """
    Prepare the encryption key string for Crypto.Cipher use:
    1. Strip any leading '0x'
    2. Return a hex decoded string

    Examples:
    - prep_enc_key('0xabcd') returns '\xab\xcd'
    - prep_enc_key('abcd') returns '\xab\xcd'

    Notes:
    - Key length needs to be hex modulo 16 compatible
    """
   
    if encryption_key[0:2]=="0x": 
       return encryption_key[2:].decode("hex")
    else:
       return encryption_key.decode("hex")

# }}}

# {{{ def pad(input_data, pad_multiple=16):

def pad(input_data, pad_multiple=16):
    """
    Pad an input string so that it's length is a multiple of pad_multiple

    The pad character dependes on the additional length needed. For example if
    the string is short by 2 characters, then it will be padded by chr(2).
    """
    padding = pad_multiple - (len(input_data) % pad_multiple)
    return input_data + chr(padding) * padding

# }}}

# {{{ def unpad(input_data):

def unpad(input_data):
    """
    Undo pad
    """
    return input_data[:len(input_data) - ord(input_data[-1])]

# }}}

# {{{ def encrypt(plain_data, encryption_key, encryption_mode=DEFAULT_BLOCK_CIPHER_MODE):

def encrypt(plain_data, encryption_key, encryption_mode=DEFAULT_BLOCK_CIPHER_MODE):
    """
    Encrypts data. To see possible encryption modes see help for Crypto.Cipher.AES
    """
    
    cipher=AES.new(prep_enc_key(encryption_key), encryption_mode, ENCRYPTION_START_INITIALIZATION_VALUE)
    return cipher.encrypt(pad(plain_data))

# }}}

# {{{ def decrypt(encrypted_data, encryption_key, encryption_mode=DEFAULT_BLOCK_CIPHER_MODE):

def decrypt(encrypted_data, encryption_key, encryption_mode=DEFAULT_BLOCK_CIPHER_MODE):
    """
    Decrypts data. See encrypt.
    """
    
    cipher=AES.new(prep_enc_key(encryption_key), encryption_mode, ENCRYPTION_START_INITIALIZATION_VALUE)
    return unpad(cipher.decrypt(encrypted_data))

# }}}
