# Display color codes (with the corresponding color)
# It tries to organize the color in a visually consistent way
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

echo ""

# Another cool one
awk 'BEGIN{
for (colnum = 0; colnum<256; colnum++) {
  r = 255-(colnum*255/255);
  g = (colnum*510/255);
  b = (colnum*255/255);
  if (g>255) g = 510-g;
  printf "\033[48;2;%d;%d;%dm", r,g,b;
  printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
  printf "o\033[0m";
}
printf "\n";
}'
