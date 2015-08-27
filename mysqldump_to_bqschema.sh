

for z in *.gz; do
        echo generating schema for $z... 
        zcat $z | awk '/^CREATE TABLE.*/{p=1}/^\).+\;/{p=0;print}p' | grep -E '^ +`' | sed -r 's/\ (int|tinyint|smallint|mediumint|bigint).+/:INTEGER/g'| sed -r 's/\ (float|double|decimal).+/:FLOAT/g'| sed -r 's/\ (date|datetime|timestamp|time|year|char|varchar|blob|text|tinyblob|tinytext|mediumblob|mediumtext|longblob|longtext|enum).+/:STRING/g' | sed -r 's/\s+`(.+)`(:.+)/\1\2/' | tr '\n' ',' | sed -r 's/,$//g' >> $z.schema &
done

for z in *.7z; do
        echo generating schema for $z... 
        7zcat $z | awk '/^CREATE TABLE.*/{p=1}/^\).+\;/{p=0;print}p' | grep -E '^ +`' | sed -r 's/\ (int|tinyint|smallint|mediumint|bigint).+/:INTEGER/g'| sed -r 's/\ (float|double|decimal).+/:FLOAT/g'| sed -r 's/\ (date|datetime|timestamp|time|year|char|varchar|blob|text|tinyblob|tinytext|mediumblob|mediumtext|longblob|longtext|enum).+/:STRING/g' | sed -r 's/\s+`(.+)`(:.+)/\1\2/' | tr '\n' ',' | sed -r 's/,$//g' >> $z.schema &
done
