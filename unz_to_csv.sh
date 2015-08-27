for z in *.gz; do
	echo adding $z... 
	zcat $z | python /home/leonaressi//mysqldump-to-csv/mysqldump_to_csv.py >> $z.csv &
done

for z in *.7z; do
	echo adding $z... 
        7zcat  $z | python /home/leonaressi/mysqldump-to-csv/mysqldump_to_csv.py >> $z.csv &
done
