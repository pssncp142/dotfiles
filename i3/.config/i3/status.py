#!/usr/bin/env python3

from i3pystatus import Status
from i3pystatus.weather import weathercom

status = Status()

status.register("pulseaudio", format=" {volume} ", format_muted="  ", )

status.register("clock",
        format="%a %-d %b | %H:%M",)

status.register("cpu_usage", format="CPU {usage:02}%")

status.register("temp",)

status.register(
    'battery',
    interval=5,
    format="[ {status} ]%{percentage_design:.2f} {remaining}",
    alert=True,
    alert_percentage=15,
    status = {
        'DPL': 'DPL',
        'CHR': 'CHR',
        'DIS': 'DIS',
        'FULL': '',
    }
)

status.register("network",
                format_up="{essid} {quality}",
                format_down="DOWN",
                interface="wlp2s0",)

status.register(
    'weather',
    format='{condition} {current_temp}{temp_unit}[ {icon}][ Hi: {high_temp}][ Lo: {low_temp}][ {update_error}]',
    interval=900,
    colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
        location_code='USFL0163:1:US',
        units='imperial',
        update_error='<span color="#ff0000">!</span>',
    ),
)


status.register("spotify",
                format="\[  {artist} - {title} {status}\]",
    status={
        "pause": "▷",
        "play": "▶",
        "stop": "◾",
    },)

status.run()
