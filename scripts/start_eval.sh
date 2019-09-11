#!/bin/bash

datasets="cifar10 cifar100 svhn"
spaces="s1 s2 s3 s4"
wdecay=$(awk 'BEGIN{for(i=0.0009;i<=0.2187;i*=3)print i}')
dpath=$(awk 'BEGIN{for(j=0.2;j<=0.8;j+=0.2)print j}')

for d in $datasets; do
	for s in $spaces; do
		for dp in $dpath; do
			for wd in $wdecay; do
				sbatch scripts/DARTS_eval.sh $s $d $dp $wd
				echo submmited job $s $d $dp $wd
			done
		done
	done
done


