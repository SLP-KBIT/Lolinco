rm -f test.txt
files="test_img/*.jpg"
for filepath in ${files}
do
  echo ${filepath} 1 >> test.txt
done
