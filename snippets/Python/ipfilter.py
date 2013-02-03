# File ipfilter.py
# David Kirwan - http://about.me/dkirwan
#
# Usage: python ipfilter.py < <fileToParse>
#
# Description: Simple parser that extracts IP addresses from an 
#              input file, sorts then removes duplicates

# Library / Module Imports
import sys
import re
from array import *

# The pattern I'm using to find IP addresses
pattern = '\d+\.\d+\.\d+\.\d+'

# Define an empty Python List
ip_list = []

# Function to strip duplicates from a List
def makeItUnique(seq):
    seen = set()
    seen_add = seen.add
    return [ x for x in seq if x not in seen and not seen_add(x)]

# For every line of input read from STDIN, search using the pattern, and place matches
# into the List
for line in sys.stdin:
    result = re.search(pattern, line, re.I).group()
    if result:
        ip_list.append(result)

# Sort the resulting List
sorted_ip_list = sorted(ip_list)
# Remove duplicates
result = makeItUnique(sorted_ip_list)

# Then print out the results
for x in result:
    print(x)

