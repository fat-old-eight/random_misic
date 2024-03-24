#!/usr/bin/bash
strindex() { 
  x="${1%%$2*}"
  [[ $x = $1 ]] && echo -1 || echo ${#x}
}
cd /media/fatoldeight/G01/Vocaloid
rm out.txt
a=$(ls 2>/dev/null|sort -R)
IFS_BACKUP=$IFS
IFS=$(echo -en "\n\b")
cnt=0
for in in $a
do
  if [[ "$in" == "bash.sh" ]];then
    continue
  fi
  if [[ "$in" == "out.txt" ]];then
    continue
  fi
  len=$(echo $in | grep -b -o -)
  len=${len:0:1}
  if [ -z $len ];then
    len="-1"
  fi
  # echo $len
  p=${in:len+1:$((${#in}))}
  cnt=$((cnt+1))
  echo "$cnt $p" >>"out.txt"
  mv $in "$cnt-$p"
done
IFS=$IFS_BACKUP