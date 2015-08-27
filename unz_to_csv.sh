for z in *.gz; do
	echo adding $z... 
	zcat $z | python /home/leonaressi//mysqldump-to-csv/mysqldump_to_csv.py > $z.csv &
done

