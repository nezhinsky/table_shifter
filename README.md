# table_filter

A bash script which reads a text file with the contents organized as a table.
The first line is the header with the column names.

For example:
```
name surname city zip
John Black London 123456
David White NY 654321
```

Each column name and each “cell” contents are assumed to be a single word.

The script should accept 3 parameters:
* filename to read
* a column name to filter by
* a string to filter by

The script reads the file into a bash array.
Then it passes over all the rows and prints out only those rows
which contain the filter-string in the filter-column.

For example:
```
./table_filter.sh names.txt city NY
```
should print out:
```
David White NY 654321
```

The test script test.sh calls table_filter.sh with various parameters and
requests filtering files in the name directory to check different use cases
(e.g. no output, single line in output, multiple lines, equality of strings in filter-column,
partial containment of the string, first column, last column, middle column,
non-existing column etc)
