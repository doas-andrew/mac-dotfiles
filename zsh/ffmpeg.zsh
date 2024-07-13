# Automatically convert file types
# ffmpeg -i input.mp4 output.webm
# Can specify library used for conversion but not required

# Cut videos
# ffmpeg -i input.mp4 -ss hh:mm:ss.000 -to hh:mm:ss.000 -an output.webm
# -an flag excludes audio stream from output file

function split_gif {
    mkdir "split-$1"
    ffmpeg -i $1 -vsync 0 "split-$1"/%03d.png
}

function test_ffmpeg {
    filePath=$1
    file=$(basename "$filePath")
    filename="${file%.*}"
    fileExtension="${file##*.}"

    # echo "Input File: $fileWithPath"
    # echo "Filename without Path: $file"
    # echo "Filename without Extension: $filename"
    # echo "File Extension without Name: $fileExtension"

    # ffmpeg -i $filePath -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus "$filename.webm"
}
