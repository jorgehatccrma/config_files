# bash utilities

# sample random N files from directory (recursively)
randomfiles () {
  find $1 -type f | shuf -n $2
}

# count files in directory
countfiles () {
  find $1 -type f | wc -l
}

# concatenate a bunch of files in a directory, making sure each one is written
# to a single file
concatenate() {
  # ls *.json | xargs perl -lpe ''
  ls $1 | xargs perl -lpe ''
}
