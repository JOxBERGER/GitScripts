#!/bin/bash
TemplatePath='/var/www/template/'
		convert template.png -gravity SouthWest -font Armata-Regular -fill '#7ba400'  -pointsize 14 -draw "text 110,10'45beta31.2'" testtemplate.png
		mv testtemplate.png $TemplatePath
