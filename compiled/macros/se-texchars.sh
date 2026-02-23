#!/bin/bash

#
# se.texchars.sh -- Swedish character replacement to TeX character codes.
#
# Replace all occurrences of 'å', 'ä', 'ö', 'Å', 'Ä' and 'Ö' with the
# universally recognized TeX codes '{\aa}', '{\"a}', '{\"o}', '{\AA}',
# '{\"A}' and '{\"O}', respectively.
#
# Simply run this script in bash by './se-texchars.sh <filename>', generating
# the converted text as a stream to standard output. In order to replace the
# currently read file, just pipe the stream back into the input file by
# './se-texchars.sh <filename> > <filename>'.
#
# Copyright (C) 2025, Fredrik Jonsson, under Gnu General Public License
# (GPL) v3. See the enclosed LICENSE for details.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

#
# Check if a filename was provided as command-line argument.
#
if [ $# -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

FILE="$1"

#
# Check if the input file exists.
#
if [ ! -f "$FILE" ]; then
  echo "Error: File '$FILE' not found!"
  exit 1
fi

#
# Perform the replacements using sed, the Stream EDitor. Here "sed -i" would
# edit the file in place (and overwriting it) instead of generating text to
# standard output.
#
sed \
    -e 's/å/{\\aa}/g' \
    -e 's/ä/{\\"a}/g' \
    -e 's/ö/{\\"o}/g' \
    -e 's/Å/{\\AA}/g' \
    -e 's/Ä/{\\"A}/g' \
    -e 's/Ö/{\\"O}/g' \
    "$FILE"
