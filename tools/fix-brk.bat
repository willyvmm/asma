perl -p0777i -e "s/^([^\xFF]+.{5067})L(\0\0.{429})L(.+)\xe2\x02\xe3\x02..$/$1\x60$2\x60$3/s||die" ../asma/Composers/Zuegner_Alfred/*.sap
