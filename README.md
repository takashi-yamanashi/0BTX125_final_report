# Overview
As a class report, I collected and analyzed data from [Aviv Regev, 2015](https://doi.org/10.1101/gr.192237.115).

For this analysis, 2128 fastq files published by NCBI were used to reproduce the figure generation used in the paper.

I used STAR and featureCounts to map the fastq data to the reference genome and made cell×gene matrix.
(* This step requires sufficient storage (> 3TB) and computing power. If you want to skip it, start from Quick start in "Stepup" and "Run".)

Finally, after performing the same qc and data processing as in the paper, I created a figure equivalent to the results shown in the paper.
(In  this step, I used scanpy platform)

* This repository is open until 8/31.  



# Setup
### Reference genome download   
source : https://support.illumina.com/sequencing/sequencing_software/igenome.html  

$ wget http://igenomes.illumina.com.s3-website-us-east-1.amazonaws.com/Mus_musculus/UCSC/mm10/Mus_musculus_UCSC_mm10.tar.gz  
$ tar xvf Mus_musculus_UCSC_mm10.tar.gz  


### STAR 2.7.10a install 
source : https://github.com/alexdobin/STAR  

Make index (Please fix to your environment)  
$ ~/opt/STAR-2.7.10a/source/STAR \  
--runThreadN 30 \  
--runMode genomeGenerate \  
--genomeDir ~/opt/ref_genome/STAR_ref/UCSC_mm10 \  
--genomeFastaFiles ~/opt/ref_genome/STAR_ref/Mus_musculus/UCSC/mm10/Sequence/WholeGenomeFasta/genome.fa \  
--sjdbGTFfile ~/opt/ref/ref_genome/STAR_ref/Mus_musculus/UCSC/mm10/Annotation/Genes/genes.gtf   


----------Quick start----------
### code clone
$ git clone git@github.com:takashi-yamanashi/0BTX125_final_report.git ~/final_report  


### subread install (2.0.3, 15 July 2021)  
$ sudo apt install subread  


### pyenv install (if you need)  
$ git clone git://github.com/yyuu/pyenv.git ~/.pyenv    
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile    
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile    
$ echo 'eval "$(pyenv init --path)"' >> ~/.bash_profile    
$ source ~/.bash_profile  


### pyenv setup
$ pyenv install 3.8.5    
$ cd ~/final_report  
$ pyenv local 3.8.5   


### poetry install
$ pip3 install poetry  
$ poetry config virtualenvs.in-project true  

### package install
$ poetry install  


### Raw Data Download
source : https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE59114  
$ mkdir -p data/raw  
$ bash data_download.sh SraRunTable.csv



# Run
## Mapping  
STAR and featureCounts(Rsubread)  
$ bash mapping.sh


----------Quick start----------
## Analysis
$ poetry run jupyter lab  

run data_qc.ipynb  
run make_fig.ipynb
