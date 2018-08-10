#!/bin/bash

for filename in xml2/*.xml; do
	# check <product> is exist
    sed  -i '1i <product>' $filename

	# check </product> is exist
    sed -i '$s/$/<\/product>/' $filename
done