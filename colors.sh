cumwidth=7
for i in {0..255}; do
  printf "\x1b[38;5;${i}m [%03i] \x1b[0m" $i ;
  if [ $i -eq $cumwidth ]; then
    echo ;
    if [ $cumwidth -ge 15 ]; then
      ((cumwidth+=6))
    else
      ((cumwidth+=8))
    fi ;
  fi ;
done
