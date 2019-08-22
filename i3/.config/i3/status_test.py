#!/usr/bin/env python3

from i3pystatus import Status
from i3pystatus.weather import weathercom

pw_right = ''
pw_right2 = ''

pw_left = ''
pw_left2 = ''

def set_text(color1, color2, format, first=False):

    color1 = "'" + color1 + "'"
    color2 = "'" + color2 + "'"

    if first == False:
        text =  "<span background=" + color1 + ">" + format + "</span>" + \
                "<span background=" + color1 + \
                " foreground=" + color2 +">" + pw_right + "</span>" 
    else:
        text =  "<span background=" + color1 + ">" + format + "</span>" 

    return text

hints = {"markup" : "pango", "seperator" : False, "separator_block_width" : 0}

status = Status()

text = set_text("#303642", "#414a59",  "  {volume} ", first=True)

status.register("pulseaudio", hints=hints, format=text, format_muted="  ", )

text = set_text("#414a59", "#303642", " %a, %-d %b  %H:%M ")

status.register("clock", hints=hints, format=text,)

text = set_text("#303642", "#414a59", " CPU {usage:02}% ")

status.register("cpu_usage", hints=hints, format=text,)

text = set_text("#414a59", "#303642", " {temp} °C ")

status.register("temp", hints=hints, file='/sys/class/thermal/thermal_zone9/temp', format=text,)

text = set_text("#303642", "#414a59", " [  {status} ]%{percentage_design:.2f} {remaining} ")

status.register(
    'battery',
    interval=5,
    hints=hints,
    format=text,
    alert=True,
    alert_percentage=15,
    status = {
        'DPL': 'DPL',
        'CHR': 'CHR',
        'DIS': 'DIS',
        'FULL': '',
    }
)

text = set_text("#414a59", "#303642", " {essid} {quality} ")

status.register("network",
                hints=hints,
                format_up=text,
                format_down="DOWN",
                interface="wlp2s0",)

text = set_text("#303642", "#414a59", 
        ' {condition} {current_temp}{temp_unit}[ {icon}][ Hi: {high_temp}][ Lo: {low_temp}][ {update_error}] ')

status.register(
    'weather',
    format=text, 
    interval=900,
    hints=hints,
    colorize=True,
    backend=weathercom.Weathercom(
        location_code='USFL0163:1:US',
        units='imperial',
        update_error='<span color="#ff0000">!</span>',
    ),
)

text = set_text("#414a59", "#303642", 
        "    {artist} - {title} {status}   ")

status.register("spotify",
                hints=hints,
                format=text,
    status={
        "pause": "",
        "play": "",
        "stop": "",
    },)

status.run()
