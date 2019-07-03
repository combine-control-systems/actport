from re import match
from os import listdir
from os.path import join, realpath, dirname
from sys import argv

def generate_md(directory):
    f = open(join(directory, 'blocks-info.md'), 'w')
    f.write("# Ported blocks information\n\n\
List of blocks available to port from Activate to Simulink. \
Blocks might have all possible functionality implemented in Simulink \
or there might be some of it pending. The TODOs on each block are \
gathered in this file. Please be also aware that full Activate \
functionality might not be feasible in Simulink for some blocks. \
Carefully check the information and warnings printed in MATLAB while \
executing import_activate_oml.\n")
    library = join(dirname(realpath(__file__)),
                   '..', 'matlab', 'activate_standard_library')
    blocks = dict()
    for mfile in listdir(library):
        m = open(join(library, mfile), 'r')
        block_name = m.readline().split('\'')[1]
        # Ignore annotation block
        if block_name == 'TEXT_f':
            continue
        blocks.setdefault(block_name, [])
        line = m.readline()
        while line:
            todo = match('\s*%\s*TODO:\s*(.*)', line)
            if todo:
                blocks[block_name].append(todo.group(1))
            line = m.readline()
        m.close()

    for block, todos in sorted(blocks.items()):
        f.write("* {}\n".format(block))
        for i in todos:
            f.write("  * {}\n".format(i))

    f.close()

if __name__ == "__main__":
    if len(argv) > 1:
        d = argv[1]
    else:
        d = join(dirname(realpath(__file__)), '..', '..', '..', 'docs')
    generate_md(d)
