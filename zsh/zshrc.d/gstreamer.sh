#!/bin/zsh


 # GStreamer
GST_ENV_PATH=$(realpath "/Library/Frameworks/GStreamer.framework/Versions/Current/share/gstreamer/gst-env" 2>/dev/null)
[[ -f "$GST_ENV_PATH" ]] && . "$GST_ENV_PATH"

# 1 - ERROR, 2 - WARNING, 3 - FIXME, 4 - INFO, 5 - DEBUG, 6 - LOG, 7 - TRACE, 9 - MEMDUMP
export GST_DEBUG=5 

export GST_PLUGIN_SYSTEM_PATH_1_0=$(realpath "/Library/Frameworks/GStreamer.framework/Versions/Current/Libraries/gstreamer-1.0" 2>/dev/null)

export GST_PLUGIN_PATH_1_0=$HOME/.local/lib/gstreamer-1.0

GST_PATH=$(realpath "/Library/Frameworks/GStreamer.framework/Versions/Current/bin" 2>/dev/null)
export PATH="$GST_PATH:$PATH"

