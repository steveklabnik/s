if [[ ! -o interactive ]]; then
    return
fi

compctl -K _s s

_s() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(s commands)"
  else
    completions="$(s completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
