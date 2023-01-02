def GetWord ():
    ID = input()
    print("char:", ID, end='\t')

    bit_grid = []
    for line in range(11):		 # 10 = altura em pixels de um char    
        bit_grid += input()  
    # print(bit_grid)            # debug
        
    filtered_bit_grid = list(filter(FilterChar, bit_grid))
    filtered_bit_grid = filtered_bit_grid[::-1]
    # print(filtered_bit_grid)    # debug

    nibble = ''
    nibbles = []
    for bit in filtered_bit_grid:
        nibble += bit
        if not (len(nibble) % 4):
            nibbles += f'{int(nibble, base=2) : x}'
            nibble = ''

    nibbles = list(filter(FilterChar, nibbles))
    # print(nibbles)              # debug

    word1 = nibbles[8:]
    word2 = nibbles[:8]
    
    print('words: word1, word2 = 0x', *word1, sep='', end=', ')
    print('0x', *word2, sep='')

def FilterChar (letter):
    undesirable_chars = [' ', '\t']
    return False if letter in undesirable_chars else True 


GetWord()
