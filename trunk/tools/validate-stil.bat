grep -E " $" ../asma/Docs/STIL.txt
grep -E ".{100}" ../asma/Docs/STIL.txt
grep -v -n -E "^#|^/|^   NAME: |^  TITLE: |^ ARTIST: |^COMMENT: |^         |^$|\(#[0-9]+\)$" ../asma/Docs/STIL.txt
perl -nle "m{^/} and (-e qq{../asma/$_} or print)" ../asma/Docs/STIL.txt
grep -c "^/" ../asma/Docs/STIL.txt
