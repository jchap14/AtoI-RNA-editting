##### intersect AtoI files with a column of gene symbols
#for x in `/bin/ls *.AtoI.txt` ; do bash AtoI_intersect_w_genes.sh $x; done
## ^^ this doesn't work now, maybe set it up on cluster

## define variables
FILE=$1
NAME=`basename $FILE .AtoI.txt`
GENES=ISG_list.txt

## TESTfile FILE=DON0362.AtoI.txt

## commands to run
# cat $FILE | sed 's/#chrom/Chr/g' | sed 's/gene/SYMBOL/g' > $FILE.new
# cat $FILE.new | cut -f3 > $FILE.symb
# cat $FILE.new | cut -f1,2,4,5,6,7,8,9 > $FILE.other
# paste $FILE.symb $FILE.other > $FILE.new2
# ## sort and join the AtoI file with a column of genes
# sort $FILE.new2 > $FILE.a.txt
# sort $GENES > $FILE.b.txt
# join -t $'\t' $FILE.a.txt $FILE.b.txt > $FILE.c.txt
# head -1 $FILE.new2 > $FILE.header
# cat $FILE.header $FILE.c.txt > $NAME.AtoI.ISGgenes.txt
# 
# ## remove unnecessary files
# rm $FILE.symb $FILE.other $FILE.new $FILE.new2
# rm $FILE.a.txt $FILE.b.txt $FILE.c.txt $FILE.header

##### PART 2: uncomment here and run this command
### pick any random *.AtoI.txt because these cols the same
# cut -f1,2,3,4,5,6,7 $NAME.AtoI.ISGgenes.txt > ISGgenes.AtoI.matrix

##### PART 3: uncomment here, comment out part 1. and re-submit 

##### 
cat $NAME.AtoI.ISGgenes.txt | cut -f9 | tail -n +2 > $NAME.col
cat <(echo $NAME.editLevel) $NAME.col > $NAME.col2
paste ISGgenes.AtoI.matrix $NAME.col2 > $NAME.temp
mv $NAME.temp ISGgenes.AtoI.matrix

## remove unnecessary files
rm $NAME.col $NAME.col2

##### submit jobs serially to not overwhelm local memory
##### & to add columns sequentially

# bash AtoI_intersect_w_genes.sh DON0349.AtoI.txt
# bash AtoI_intersect_w_genes.sh DON0357.AtoI.txt
# bash AtoI_intersect_w_genes.sh DON0358.AtoI.txt
# bash AtoI_intersect_w_genes.sh DON0362.AtoI.txt
# bash AtoI_intersect_w_genes.sh DON0363.AtoI.txt
# bash AtoI_intersect_w_genes.sh DON0364.AtoI.txt
# bash AtoI_intersect_w_genes.sh DON0365.AtoI.txt
# bash AtoI_intersect_w_genes.sh DON100418.AtoI.txt
# bash AtoI_intersect_w_genes.sh STP113.AtoI.txt
# bash AtoI_intersect_w_genes.sh STP277.AtoI.txt
# bash AtoI_intersect_w_genes.sh STP280.AtoI.txt
# bash AtoI_intersect_w_genes.sh STP344.AtoI.txt
# bash AtoI_intersect_w_genes.sh STP365.AtoI.txt
# bash AtoI_intersect_w_genes.sh STP377.AtoI.txt
# bash AtoI_intersect_w_genes.sh STP43.AtoI.txt
# bash AtoI_intersect_w_genes.sh STP511.AtoI.txt
# bash AtoI_intersect_w_genes.sh STP85.AtoI.txt