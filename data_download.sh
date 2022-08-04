 #!/bin/bash

output_base='data/raw/'
db_base='https://trace.ncbi.nlm.nih.gov/Traces/sra-reads-be/fastq?acc='
num=0
limit=50

while read line
do
  if [ $num -gt 0 ]; then
      id_base=$(echo ${line} | cut -d , -f 19)
      
      #data download -> data/raw/
      wget -O $output_base$id_base'.fastq.gz' $db_base$id_base &
  fi
  
  num=$(( $num+1 ))
  if [ $num -gt $limit ]; then
      sleep 3m;
      num=1;
  fi

done < $1