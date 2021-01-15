#!/bin/sh
echo TRAINING...
mkdir -p output
combine_tessdata -e tessdata/eng.traineddata \
  tessdata/eng.lstm
lstmtraining --model_output output/custom \
  --continue_from tessdata/eng.lstm \
  --traineddata tessdata/eng.traineddata \
  --train_listfile training_data/eng.training_files.txt \
  --max_iterations 1000
lstmtraining --stop_training \
  --continue_from output/custom_checkpoint \
  --traineddata tessdata/eng.traineddata \
  --model_output output/custom.traineddata
