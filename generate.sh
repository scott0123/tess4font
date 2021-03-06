#!/bin/sh
echo CREATING TRAINING DATA...
mkdir -p training_data
fonts="$(text2image --list_available_fonts --fonts_dir font | sed 's/.*: //' | sed 's/.*/"&"/')"
fonts="$(echo $fonts)"
echo $fonts
cmd="bash tesstrain.sh --fonts_dir font --fontlist "$fonts" --lang eng --linedata_only --noextract_font_properties --langdata_dir langdata --tessdata_dir tessdata --output_dir training_data"
eval $cmd
