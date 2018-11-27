for f in *_val_1.fq; do
mv -- "$f" "${f%_R1_val_1.fq}_R1.fq"
done
