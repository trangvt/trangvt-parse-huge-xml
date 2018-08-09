#!/bin/bash

# create file to check is run
# if file exist quit bash

#decrale variables
xml_file="wiley_3.0_1.20180618.xml.xml"
folder_name="xml2"

# Create folder if not exist
mkdir -p $folder_name
# Clean up folder
rm -rf $folder_name/*

# order
input_data () {
    echo "$line" >> ${folder_name}/${page}.xml
}

# Read file
# Keep track of whether or not we're inside of an "product" element
product=0
order=0
mark=1
page=1
step=2
open_tag=0
# Loop through the lines of the file
cat $xml_file | while read line; do

    # Set the product flag to true if we come across an opening tag
    if echo "${line}" | grep -q '<product>'; then
        product=1

        #count product
        let "order++"

    # Set the product flag to false and print a newline if we come across a closing tag
    elif echo "${line}" | grep -q '</product>'; then
        product=0

    # If we're inside an product tag
    elif [ ${product} == 1 ]; then
        # printf "${line}"

        # if [ $order -ne 1 ] && [ `expr $order % $step` -eq 1 ] && [ $order -ne $mark ]; then
        if [ $order -ne $mark ]; then
            eval mark="$order"
            let "page++"
        fi

        #input data to csv
        input_data "${line}"
    fi
done