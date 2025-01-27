mkdir tmp
mkdir ../../dataset/019/
echo "Created temp directory"

###########################################################################################

echo "Start genetating TRAIN set"
python dataset_generate.py 11 1500000 0.1 0.1 1 numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.train.csv 0 999999 exponential

mkdir out_train
mv tmp/* out_train/
cat out_train/*.csv > ../../dataset/019/numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.train.csv
cat out_train/*.sym > ../../dataset/019/numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.train.sym
cat out_train/*.word > ../../dataset/019/numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.train.word

###########################################################################################

echo "Start genetating DEV set"
python dataset_generate.py 11 500000 0.1 0.1 1 numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.dev.csv 0 999999 exponential

mkdir out_dev
mv tmp/* out_dev/
cat out_dev/*.csv > ../../dataset/019/numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.dev.csv
cat out_dev/*.sym > ../../dataset/019/numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.dev.sym
cat out_dev/*.word > ../../dataset/019/numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.dev.word

###########################################################################################

echo "Start genetating TEST set"
python dataset_generate.py 11 50000 0.1 0.1 1 numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.test.csv 0 999999 exponential

mkdir out_test
mv tmp/* out_test/
cat out_test/*.csv > ../../dataset/019/numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.test.csv
cat out_test/*.sym > ../../dataset/019/numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.test.sym
cat out_test/*.word > ../../dataset/019/numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws.test.word


###########################################################################################

rm -rf out_train
rm -rf out_dev
rm -rf out_test
rm -rf tmp
echo "Removed temp files."

###########################################################################################

python merge_with_external_data.py ../../dataset/019/numtimegpoevetamdacdlcu-text_0.1_0.1_all-ws ../../dataset/014_015/SilverData/pmb_2016-12-14_has_at_least_one_semorsymbow_filtered ../../dataset/019/combined_dataset_pmb_2016-12-14
