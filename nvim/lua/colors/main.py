#! /usr/bin/env python

import re
import os

from io import TextIOWrapper

colorIdx = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "0A", "0B", "0C", "0D", "0E", "0F"]

def readlines(file: TextIOWrapper):
    i = 0
    colors = {}

    for line in file.readlines():
        if not line.startswith("let s:gui"):
            continue

        hex = re.sub(r'[\s\n"]', '', line.split("=")[1])

        colors[f'base{colorIdx[i]}'] = f"#{hex}"

        i += 1
        if i == 16:
            content = "return {\n"

            for k, v in colors.items():
                content += f'\t{k} = "{v}",\n'
                
            content += "}"

            with open(file.name.split(".")[0]+".lua", "x") as w:
                w.write(content)
                return


for filename in os.listdir("."):
    with open(filename) as file:
        readlines(file)
