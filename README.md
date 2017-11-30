# Youtube BPM finder
### Find the beats-per-minute of your favorite songs on youtube

YT2BPM is an [OpenFAAS](https://www.github.com/openfaas/faas) function that lets you extract BPM information from youtube, by supplying it with youtube links.

## Other Platforms
While this remains untested, any of the plugins listed in [this page](https://github.com/rg3/youtube-dl/tree/master/youtube_dl/extractor) should theoretically also work, as long as it doesnt require you to authenticate or use any other special flags.

## Execution time
The function downloads and converts the `webm` video file into a `wav` that contains only the sound. This is what takes most of the functions time. This means that your internet speed and hardware is going to be the determining factor in wow long a video can be, before the function will timeout.

If you want to increase the time a function can use before returning error codes or non-zero exit codes. Change the `exec_timeout` environment variable in the `Dockerfile`, this number is in seconds.

See the [watchdog documentation](https://github.com/openfaas/faas/tree/master/watchdog) for more information on which options you can set.
## Software used in this function
* [Youtube-dl](https://github.com/rg3/youtube-dl) 
* [bpm-tools](http://www.pogo.org.uk/~mark/bpm-tools/)
