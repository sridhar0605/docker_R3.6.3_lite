# Fork from latest LTS ubuntu release
# FROM ubuntu:18.04
FROM rocker/r-base:3.6.3
# set variables
# ENV r_version 3.6.3

# run update
RUN apt-get update -y && apt-get install -y \
  gfortran \
  libreadline-dev \
  libpcre3-dev \
  libcurl4-openssl-dev \
  build-essential \
  zlib1g-dev \
  libbz2-dev \
  liblzma-dev \
  openjdk-8-jdk \
  wget \
  libssl-dev \
  libxml2-dev \
  libnss-sss \  
  vim-tiny


# install R packages
RUN R --vanilla -e 'install.packages(c("devtools", "BiocManager"), repos="http://cran.us.r-project.org")'
RUN R --vanilla -e 'BiocManager::install(c("biomaRt", "fgsea", "DESeq2", "maser", "RJWANGbioinfo/APAlyzer", "clusterProfiler"))'
RUN R --vanilla -e 'install.packages(c("ggplot2", "data.table", "dplyr", "reshape2", "tidyr", "viridis", "cowplot", "ggalluvial", "msigdbr", "ggdendro", "gridExtra","tidyverse", "splitstackshape"), repos = "http://cran.us.r-project.org")'
