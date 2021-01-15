# tess4font
Fine-tune Tesseract OCR with specific fonts

## Recommended hardware / OS
* m5.4xlarge / Ubuntu 18.04

## Steps
1. 
```shell
git clone https://github.com/scott0123/tess4font.git
cd tess4font
mkdir font
```
Place your font(s) in the `font` directory (may need to scp first if working on remote server)

2. `sh install.sh`

3. (Optional) Update `langdata/eng/eng.training_text` to suit your use-case. Append to this file with newline separated sentences.

4. `sh generate.sh`

5. `sh train.sh`

6. After 20 mins your trained data file will be ready in the `output` directory (`custom.trainedata`)
