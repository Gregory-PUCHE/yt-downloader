DL_LOOP=true
while [ $DL_LOOP == true ]; do
    echo -n "Insérer une URL (stop pour sortir de la boucle) : "
    read Youtube
    if [ $Youtube != "stop" ]; then
        youtube-dl -f mp4 -o './yt_download/%(title)s.%(ext)s' $Youtube
        for i in yt_download/*; do
            OUTPUT=${i%}
            ffmpeg -i "$i" "$OUTPUT".mp3
            mv "$i" ./videos
        done
        for remain in yt_download/*; do
           mv "$remain" ./audios
        done
    else
        DL_LOOP=false
    fi
    sleep 1
done

