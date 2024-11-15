import os
import sys
import re
import struct

def usage():
    print("Usage: read_write_heap.py pid search_string replace_string")
    sys.exit(1)

# Validate arguments
if len(sys.argv) != 4:
    usage()

try:
    pid = int(sys.argv[1])
except ValueError:
    print("Invalid PID. Must be an integer.")
    usage()

search_string = sys.argv[2]
replace_string = sys.argv[3]

if len(replace_string) > len(search_string):
    print("Error: Replacement string must not be longer than the search string.")
    sys.exit(1)

# Paths to the memory and maps files
mem_path = f"/proc/{pid}/mem"
maps_path = f"/proc/{pid}/maps"

try:
    # Locate the heap section
    with open(maps_path, "r") as maps_file:
        heap_start, heap_end = None, None
        for line in maps_file:
            if "[heap]" in line:
                match = re.match(r"([0-9a-f]+)-([0-9a-f]+)", line)
                if match:
                    heap_start = int(match.group(1), 16)
                    heap_end = int(match.group(2), 16)
                    break
        if not heap_start or not heap_end:
            print("Heap segment not found.")
            sys.exit(1)

    # Open the process memory for reading and writing
    with open(mem_path, "r+b") as mem_file:
        mem_file.seek(heap_start)
        heap_data = mem_file.read(heap_end - heap_start)

        # Find the search string in the heap
        search_offset = heap_data.find(search_string.encode("ascii"))
        if search_offset == -1:
            print(f"String '{search_string}' not found in the heap.")
            sys.exit(1)

        print(f"Found '{search_string}' at offset {search_offset} in the heap.")

        # Replace the string
        mem_file.seek(heap_start + search_offset)
        mem_file.write(replace_string.encode("ascii").ljust(len(search_string), b'\x00'))
        print(f"Replaced '{search_string}' with '{replace_string}'.")

except FileNotFoundError as e:
    print(f"Error: {e}")
    sys.exit(1)

except PermissionError:
    print("Permission denied. Run the script as root.")
    sys.exit(1)

print("Operation completed successfully.")
