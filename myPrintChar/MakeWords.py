# goofy ahh code to create the char sprites (words) from a source txt file
# source_file.txt generates CharTable.data
# 14/01/2023

# main function
import sys

def make_char_table(source_file_name):
    with open(source_file_name) as src:
        char_blocks = src.readlines()

    with open('CharTable.data', 'w') as char_table:
        sys.stdout = char_table
        print('CharTable:')

        while char_blocks:
            bit_grid, block_height = get_bit_grid(char_blocks)

            ID = bit_grid.pop(0)

            filtered_bit_grid = get_filtered_bit_grid(bit_grid)

            inverse_grid = filtered_bit_grid[::-1]

            bits = []
            for line in inverse_grid:   
                bits += line[::-1]      # the order of the lines is reversed, not the line itself

            word1, word2 = make_words(bits)
            
            print('\t0x', *word1, sep='', end=', ')
            print('0x', *word2, sep='', end='\t')
            print('#', ID, end='')

            char_blocks = char_blocks[block_height+1:]  # cut the done block, go to the next

# periferics
def make_words(bits):
    nibble = ''
    nibbles = []
    for bit in bits:
        nibble += bit
        if not (len(nibble) % 4):
            nibbles += f'{int(nibble, base=2) : x}'
            nibble = ''

    nibbles = list(filter(filter_chars, nibbles))

    word1, word2 = nibbles[8:], nibbles[:8]
    return word1, word2


def get_filtered_bit_grid(bit_grid):
    filtered_bit_grid = []
    filtered_line = ''

    for line in bit_grid:
        filtered_line = convert_to_str(filter(filter_chars, line))
        filtered_bit_grid.append(filtered_line)

    return filtered_bit_grid


def convert_to_str(filtered_object):
    filtered_list = list(filtered_object)
    filtered_line = ''
    for character in filtered_list:
        filtered_line += character
    return filtered_line


def get_bit_grid(char_blocks):
    bit_grid = []
    block_height = 0
    for line in char_blocks:
        if line == '\n':
            break
        block_height += 1
        bit_grid.append(line)
    return bit_grid, block_height


def filter_chars(letter):
    undesirable_chars = [' ', '\n']
    return False if letter in undesirable_chars else True 
#


if __name__ == "__main__":
    source_file_name = 'bit_grids.txt'
    make_char_table(source_file_name)
