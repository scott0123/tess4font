#!/bin/sh
echo INSTALLING...
sudo apt-get update
sudo apt-get -y install tesseract-ocr libtesseract-dev

wget https://raw.githubusercontent.com/tesseract-ocr/tesseract/master/src/training/tesstrain.sh
wget https://raw.githubusercontent.com/tesseract-ocr/tesseract/master/src/training/tesstrain_utils.sh
wget https://raw.githubusercontent.com/tesseract-ocr/tesseract/master/src/training/language-specific.sh

mkdir -p langdata
cd langdata
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/radical-stroke.txt
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/common.punc
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/font_properties
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/Latin.unicharset
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/Latin.xheights
mkdir -p eng
cd eng
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.training_text
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.punc
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.numbers
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.wordlist
cd ../..

mkdir -p tessdata
cd tessdata
wget https://github.com/tesseract-ocr/tessdata_best/raw/master/eng.traineddata
mkdir -p configs
cd configs
wget https://raw.githubusercontent.com/tesseract-ocr/tesseract/master/tessdata/configs/lstm.train
cd ../..
