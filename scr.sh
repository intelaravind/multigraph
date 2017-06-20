export FN=groute_data.tar.gz
for i in a b c d e f
do
for j in a b c d e f g h i j k l m n o p q r s t u v w x y z
do 
git add ${FN}${i}${j}
git commit -m "test"
git push
#git remote set-url origin https://hochawa@github.com/hochawa/multigraph.git
#git push origin master
done
done
