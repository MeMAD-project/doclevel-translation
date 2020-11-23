#!/usr/bin/env bash

sed 's/ //g;s/▁/ /g' |
tr "\n" ' ' |
sed -e "s/<SEP>/\n/g" |
sed -e "s/<\(END\|CNT\)>/\n/g" |
sed 's/<\(BRK\|CNT\)>//g' |
uniq
