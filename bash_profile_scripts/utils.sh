# bash utilities

# sample random N files from directory (recursively)
randomfiles () {
  find $1 -type f | shuf -n $2
}

# count files in directory
countfiles () {
  find $1 -type f | wc -l
}
