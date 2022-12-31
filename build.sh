#!/bin/bash

TUNES=(Fountainhall Monetville Lipstick_and_Invitations Dont_You_Dare Red_Wolf Revolution Cats Villagers_All)
Len=${#TUNES[@]}

for (( x=0; x<${Len}; x++ ));
do
  abcm2ps -e ${TUNES[$x]} -F ABC/musescore.fmt -O - ABC/simon_new.abc |
  gs -sDEVICE=pdfwrite -sOutputFile="PDF/${TUNES[$x]}.pdf" -dNOPAUSE -dBATCH - -c "[ /Title (${TUNES[$x]}) /DOCINFO pdfmark"
  abc2xml -b -m $x 1 --meta A:lyricist ABC/simon_new.abc > XML/${TUNES[$x]}.xml
done
