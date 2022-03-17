#!/bin/bash

repos=()
outfile="matthewsREISgourceBuild"
title="Matthews REIS Development Platform"

for d in */ ; do
    d=${d%/}
    repos+=(${d})
    echo "processing log: ${d}"
    gource --output-custom-log ${d}.txt ${d}
    sed -i -r "s#(.+)\|#\1|/${d}#" ${d}.txt
done

cat *.txt | sort -n > combined.txt

for r in "${repos[@]}" ; do
    echo "removing log: ${r}"
    rm ${r}.txt
done

gource combined.txt --key --title "${title}" --disable-progress --bloom-multiplier 0.7 --seconds-per-day 2 --auto-skip-seconds 1 \
    --bloom-multiplier 0.5 --bloom-intensity 1.4 --hide filenames --seconds-per-day 2 --auto-skip-seconds 1 -1280x720 -o - \
    | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset veryslow -crf 18 -threads 0 -bf 0 "${outfile}.mp4"

rm combined.txt