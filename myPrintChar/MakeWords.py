import sys


def make_char_table(source_file_name):
    with open(source_file_name) as src:
        char_blocks = src.readlines()
    with open('CharTable.data', 'w') as char_table:
        sys.stdout = char_table
        print('CharTable:')
        while char_blocks:
            comment, bits, block_height = get_bit_grid(char_blocks)
            word1, word2 = make_words(bits)
            print('\t0x', *word1, sep='', end=', ')
            print('0x', *word2, sep='', end='\t')
            print('#', comment, end='')
            char_blocks = char_blocks[block_height + 1:]  # cut the done block, go to the next


def get_bit_grid(char_blocks):
    bits = []
    block_height = 0
    comment = char_blocks.pop(0)
    for line in char_blocks:
        if line == '\n':
            break
        block_height += 1
        bits += line
    bits = list(filter(filter_chars, bits))
    return comment, bits, block_height


def filter_chars(letter):
    undesirable_chars = [' ', '\n']
    return False if letter in undesirable_chars else True


def make_words(bits):
    nibble = ''
    nibbles = []
    for bit in bits:
        nibble += bit
        if not (len(nibble) % 4):
            nibbles += f'{int(nibble, base=2) : x}'
            nibble = ''
    nibbles = list(filter(filter_chars, nibbles))
    word1, word2 = nibbles[:8], nibbles[8:]
    return word1, word2


if __name__ == "__main__":
    make_char_table('bit_grids.txt')
