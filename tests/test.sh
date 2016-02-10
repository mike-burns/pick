field() {
  f=$(grep "^${1}: ") || return 1
  echo "$f" | sed 's/^[^:]*: //'
}

input() {
  awk '
  /^$/ { input = 1; next }
  input { print $0 }
  '
}

pick() {
  args=$(field arguments <"$1")
  input=$(field input <"$1") && input="-i ${input}"

  input <"$1" >"$in"
  $DIR/test $input -- $args <"$in"
}

main() {
  DIR=$(dirname "$0")
  PATH="${DIR}/../src:${PATH}"

  in=$(mktemp pick.XXXX)
  exp=$(mktemp pick.XXXX)
  act=$(mktemp pick.XXXX)
  err=$(mktemp pick.XXXX)
  trap 'rm "$in" "$exp" "$act" "$err"' EXIT

  [ $# -eq 0 ] && set $(find "$DIR" -name '*.in')
  for a
  do
    e=$(field exit <"$a" || echo 0)

    field output <"$a" >"$exp"
    pick "$a" >"$act" 2>"$err"
    e=$((e ^ $?))

    [ $e -ne 0 ] && { echo "${a}: wrong exit code" 1>&2; exit 1; }
    ! diff -c "$exp" "$act" && { cat "$err"; exit 1; }
  done
  return 0
}

main $@
