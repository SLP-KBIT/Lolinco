rm -f train.txt
files="train_img/loli/*.jpg"
for filepath in ${files}
do
  echo ${filepath} 1 >> tmp.txt
done

files="train_img/others/*.jpg"
for filepath in ${files}
do
  echo ${filepath} 0 >> tmp.txt
done
shuf tmp.txt > train.txt
rm -f tmp.txt
