#!/usr/bin/bash
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
  cnt1=$cnt
  if [ $cnt -le 9 ];then
    cnt1="00$cnt"
  elif [ $cnt -le 99 ];then
    cnt1="0$cnt"
  fi
  echo "$cnt $p" >>"out.txt"
  mv $in "$cnt1-$p"
done
IFS=$IFS_BACKUP
