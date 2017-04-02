#!/bin/bash
##############################################################
# @Author David Kirwan https://github.com/davidkirwan
# Create a video from a number of image files
#
# @Date 2017-04-01
##############################################################
ffmpeg -r 30 -f image2 -i %04d.JPG -vcodec libx264 -crf 25  -pix_fmt yuv420p output.mp4
