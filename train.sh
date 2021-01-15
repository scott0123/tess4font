#!/bin/sh
echo TRAINING...
mkdir -p output
combine_tessdata -e tessdata/eng.traineddata \
  tessdata/eng.lstm
lstmtraining --model_output output \
  --continue_from tessdata/eng.lstm \
  --traineddata tessdata/eng.traineddata \
  --train_listfile training_data/eng.training_files.txt \
  --max_iterations 400
