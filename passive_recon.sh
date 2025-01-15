#! /bin/bash

chaos -d $1 -o 1

sed 's/*.//' 1 | tee -a 2
sed 's/www.//' 2 | tee -a 3
sort -u 3 | uniq | tee -a chaos_f

subfinder -d $1 | tee -a x

sed 's/*.//' x | tee -a y
sed 's/www.//' y | tee -a subf_f
 


assetfinder -subs-only $1 | tee -a a

sed 's/*.//' a | tee -a b
sed 's/www.//' b | tee -a ass_f


cat  chaos_f ass_f  subf_f  | tee -a 11

sed 's/*.//' 11 | tee -a 22
sed 's/www.//' 22 | tee -a 33
sort -u 33 | uniq | tee -a subs


rm 1 2 3 11 22 33 x y a b

touch PASSIVE_RECON_COMPLETED
