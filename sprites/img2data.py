import os
import sys
from numpy import asarray
from PIL import Image


def img2data(image_file_name):
    image = Image.open(image_file_name)
    contents = asarray(image)

    image_height, image_length = contents.shape[:2]  
    
    RGBs = [RGB for line in contents for RGB in line] # noqa

    label, path = get_path_and_label(image_file_name)
    data_name = label + '.data'

    with open(os.path.join(path, data_name), 'w') as data_file:
        sys.stdout = data_file  # print will now act upon the .data file
        print(label, end=':\t')
        print('.word %d, %d\n.byte' % (image_length, image_height))

        column_cont = 0
        for RGB in RGBs:
            red_value, green_value, blue_value = RGB[:3]
            color_byte = \
                (round(7 * red_value / 255) << 0) + \
                (round(7 * green_value / 255) << 3) + \
                (round(3 * blue_value / 255) << 6)
            print(color_byte, end='')

            num_spaces = 4 - len(str(color_byte))   # variable spacing for better visualization
            print(num_spaces * ' ', end='')

            column_cont += 1
            if column_cont == image_length:
                column_cont = 0
                print()

    sys.stdout = sys.__stdout__     # print is back to acting upon terminal
    print("%s %dx%d created in '%s'" % (data_name, image_length, image_height, path))


def get_path_and_label(image_file_name):
    extension_removed   = os.path.splitext(image_file_name)[0]
    path, label         = os.path.split(extension_removed)
    return (label or os.path.basename(path)), path


if __name__ == '__main__':
    img2data(sys.argv[1])
