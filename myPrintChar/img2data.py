import sys
from numpy import asarray
from PIL import Image


def img2data(image_file_name):
    image = Image.open(image_file_name)
    print(image.mode)
    contents = asarray(image)
    print(contents.shape)
    image_height, image_length, _ = contents.shape

    RGBs = [RGB for line in contents for RGB in line] # noqa
    print(RGBs)

    path, label = get_path_and_label(image_file_name)
    data_name = label + '.data'

    with open(path + data_name, 'w') as data_file:
        sys.stdout = data_file
        print(label, end=':\t')
        print('.word %d, %d\n .byte' % (image_length, image_height))

        column_cont = 0
        for RGB in RGBs:
            red_value, green_value, blue_value = RGB[0], RGB[1], RGB[2]
            color_byte = red_value//32 + ((green_value//32) << 3) + ((blue_value//64) << 6)
            print(color_byte, end='')

            num_spaces = 4 - len(str(color_byte))
            print(num_spaces*' ', end='')

            column_cont += 1
            if column_cont == image_length:
                column_cont = 0
                print()


def get_path_and_label(image_file_name):
    backwards_name = image_file_name[::-1]
    last_dot_pos = -backwards_name.index('.')
    last_slash_pos = 0
    if '/' in image_file_name:
        last_slash_pos = -backwards_name.index('/')

    path = image_file_name[:last_slash_pos]
    label = image_file_name[last_slash_pos:last_dot_pos - 1]
    return path, label


if __name__ == '__main__':
    img2data(input())
