#########################################################################################
# SageMath Script: Generation of Polyominoes (up to rotations and reflections)		
#											
# Purpose:
#   This script generates all polyominoes of a given rank n (number of cells),
#   accounting for rotations and reflections to avoid duplicates.
#   Each polyomino is represented as a set of cells (x,y) and can be converted
#   into a diagonal format compatible with Macaulay2 input.
#
#
# Usage:
#   1. Set the desired order of polyominoes with `n = <number>`.
#   2. Run the script in SageMath.
#   3. The output file `polyomino_output_n<n>.txt` will be generated in the same folder.
#
#########################################################################################

import time

# Normalize a polyomino by translating it to the origin (0,0) and sorting cells
def normalize(cells):
    min_x = min(x for x, y in cells)
    min_y = min(y for x, y in cells)
    return tuple(sorted((x - min_x, y - min_y) for x, y in cells))

# Rotate polyomino 90 degrees clockwise
def rotate90(cells):
    return tuple((-y, x) for x, y in cells)

# Reflect polyomino across the vertical axis
def reflect(cells):
    return tuple((-x, y) for x, y in cells)

# Generate all 8 symmetries of a polyomino (rotations + reflections)
def all_symmetries(cells):
    forms = []
    current = cells
    for _ in range(4):
        current = rotate90(current)
        forms.append(normalize(current))
        forms.append(normalize(reflect(current)))
    return forms

# Get a canonical representation for a polyomino (minimum among all symmetries)
def canonical_form(cells):
    return tuple(min(all_symmetries(cells)))

# Get neighboring cells of a given cell (up, down, left, right)
def neighbors(cell):
    x, y = cell
    return ((x+1,y), (x-1,y), (x,y+1), (x,y-1))

# Generate all free polyominoes of size n
def generate_free_polyominoes(n):
    seen = set()  # store canonical forms to avoid duplicates

    # Recursive function to grow polyominoes
    def grow(poly, excl):
        if len(poly) == n:
            seen.add(canonical_form(poly))  # store polyomino in canonical form
            return

        frontier = set()  # potential new cells to add
        new_excl = set()  # keep track of excluded cells to avoid repetitions
        for cell in poly:
            for nb in neighbors(cell):
                if nb not in poly and nb not in excl:
                    frontier.add(nb)
        for new_cell in frontier:
            grow(poly | {new_cell}, excl | new_excl)  # add new cell recursively
            new_excl.add(new_cell)

    grow({(0, 0)}, set())  # start growing from the origin
    return seen

# Convert a list of cells [(x,y), ...] into the diagonal format [[x,y],[x+1,y+1]]
def to_diagonal_format(polyomino):
    return [[[x, y], [x + 1, y + 1]] for x, y in polyomino]

# Convert output to string with curly braces for compatibility with M2
def format_as_curly_braces(obj):
    return repr(obj).replace('[', '{').replace(']', '}')

##############################################################################################
##############################################################################################
# ------------------ MAIN ------------------
n = 14  # order of polyomino (number of cells)



start = time.perf_counter()  # start timer
polyominoes = generate_free_polyominoes(n)  # generate polyominoes
end = time.perf_counter()  # end timer

# Print execution info
print(f"Tempo di esecuzione: {end - start:.2f} secondi")
print(f"Numero di polimini distinti di ordine {n}: {len(polyominoes)}")

filename = f"polyomino_output_n{n}.txt"

# Write output in M2-friendly format
with open(filename, 'w') as f:
    f.write("{\n")  # start of list
    for i, p in enumerate(polyominoes):
        diag = to_diagonal_format(p)
        s = format_as_curly_braces(diag)
        if i < len(polyominoes) - 1:
            f.write(f"  {s},\n")
        else:
            f.write(f"  {s}\n")  # no trailing comma on last element
    f.write("}\n")  # end of list
