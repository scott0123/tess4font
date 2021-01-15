#!/bin/sh
echo INSTALLING...
sudo apt-get update
sudo apt-get -y install tesseract-ocr libtesseract-dev

wget https://raw.githubusercontent.com/tesseract-ocr/tesseract/master/src/training/tesstrain.sh
wget https://raw.githubusercontent.com/tesseract-ocr/tesseract/master/src/training/tesstrain_utils.sh
wget https://raw.githubusercontent.com/tesseract-ocr/tesseract/master/src/training/language-specific.sh

mkdir langdata
cd langdata
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/radical-stroke.txt
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/common.punc
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/font_properties
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/Latin.unicharset
wget https://raw.githubusercontent.com/tesseract-ocr/langdata_lstm/master/Latin.xheights
mkdir eng
cd eng
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.training_text
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.punc
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.numbers
wget https://raw.githubusercontent.com/tesseract-ocr/langdata/master/eng/eng.wordlist
cd ../..

mkdir tessdata
cd tessdata
wget https://github.com/tesseract-ocr/tessdata_best/raw/master/eng.traineddata
cd ..

echo CREATING TRAINING DATA...
mkdir training_data
sh tesstrain.sh --fonts_dir font --lang eng --linedata_only --noextract_font_properties --langdata_dir langdata --tessdata_dir tessdata --output_dir training_data
