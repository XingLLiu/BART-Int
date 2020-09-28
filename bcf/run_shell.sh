# for num_cv in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
for num_cv in 2
    do
	Rscript bcf/test.r 50 2000 20 0.5 1 1 $num_cv 2
done
