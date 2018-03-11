#!/bin/bash
##### Measure AtoI conversion levels from the BAM file of an RNAseq experiment
## copy scripts to CWD from ~/scripts

##### for x in `/bin/ls *.sortedByCoord.out.bam` ; do bash AtoI_RNAseq_test.sh $x; done

## load required modules
module add samtools

## define global variables
NAME=`basename $1 .Aligned.sortedByCoord.out.bam`
BAMFILE=$1
EDITSITES="/srv/gsfs0/projects/snyder/chappell/Annotations/UCSC-hg19/Human_AG_all_hg19_v2.txt"

##### write a tempscript to be looped over
cat > $NAME.tempscript.sh << EOF
#!/bin/bash
#$ -N $NAME.AtoI
#$ -j y
#$ -cwd
#$ -V
#$ -l h_vmem=2G
#$ -pe shm 12
#$ -l h_rt=5:59:00
#$ -l s_rt=5:59:00

##### run commands
## perl Query_Editing_Level_hg19.pl <Edit Site list> <INDEXED BAM alignment file> <outputFile>
perl Query_Editing_Level_hg19.pl $EDITSITES $BAMFILE $NAME.AtoI.txt
cat $NAME.AtoI.txt | cut -f3,9 > $NAME.editLevel.txt
EOF

## qsub then remove the tempscript
qsub $NAME.tempscript.sh 
sleep 1
rm $NAME.tempscript.sh
