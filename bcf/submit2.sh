# # for num_cv in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
# # for num_cv in 1 2 3 4 5 6 7 8 9 10
# for num_cv in 2 3 4 5
#     do
# 	# cp submit.sub submit-$num_cv.sub
# 	# echo Rscript bcf/test.r 40 2000 200 2 1 1 $num_cv 1  >> submit-$num_cv.sub
# 	# qsub submit-$num_cv.sub
# 	Rscript bcf/test.r 40 2000 200 0.01 1 1 $num_cv 1
# done

for num_cv in 1 2 3 4 5
    do
	Rscript bcf/plot_results.R 40 2000 200 0.01 1 1 $num_cv 1
done
