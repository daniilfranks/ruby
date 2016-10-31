width = 960
heigth = 600

recording_options = %W[-f x11grab -s #{width}x#{heigth} -i 0:0+800, 300 -r 30]
p recording_options

misc_options = %W[-sameq -threads 6]
output_options = %W[screencast.mp4]

ffmpeg_flags = 
	recording_options +
	misc_options +
	output_options

p ffmpeg_flags