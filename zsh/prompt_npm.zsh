#!/usr/bin/env zsh

# color
[[ -z ${AM_NPM_COLOR} ]] && AM_NPM_COLOR=2

# symbol
if [[ ${AM_USE_NERD_FONT} = 1 ]]; then
  [[ -z "${AM_NPM_SYM}" ]] && AM_NPM_SYM='📦 '
fi

[[ -z "${AM_NPM_SYM}" ]]       && AM_NPM_SYM='NPM:'

# commands to get npm version
plib_npm_version(){
  command -v npm > /dev/null && echo -ne "$(npm -v | tr -d 'v')"
}

plib_npm_major_minor_version(){
  command -v npm > /dev/null && echo -ne "$(npm -v | awk -F. '{print $1"."$2}' | tr -d 'v')"
}

plib_npm_major_version(){
  command -v npm > /dev/null && echo -ne "$(npm -v | awk -F. '{print $1}' | tr -d 'v')"
}

plib_node_major_minor_version(){
  command -v node > /dev/null && echo -ne "$(node -v | awk -F. '{print $1"."$2}' | tr -d 'v')"
}

# version string
am_npm_version(){
  echo -ne "%F{$AM_NPM_COLOR}${AM_NPM_SYM}$(plib_npm_version)%f"
}

am_npm_short_version(){
  echo -ne "%F{$AM_NPM_COLOR}${AM_NPM_SYM}$(plib_npm_major_minor_version)%f"
}

# reloading version_prompt function
version_prompt(){
  if [[ -n ${1} ]]; then
    LOOP_INDEX=0
    for _v in $(echo "${1}"); do
      [[ ${LOOP_INDEX} != "0" ]] && version_prompt_val+="%F{$AM_FADE_COLOR}${AM_VERSION_PROMPT_SEP}%f"
      [[ ${LOOP_INDEX} == "0" ]] && LOOP_INDEX=$((LOOP_INDEX + 1)) && version_prompt_val+="%F{$AM_FADE_COLOR}[%f"

      [[ ${_v} == "NODE" ]]      && version_prompt_val+="$(am_node_version)"
      [[ ${_v} == "NODE_S" ]]    && version_prompt_val+="$(am_node_short_version)"
      [[ ${_v} == "NPM" ]]       && version_prompt_val+="$(am_npm_version)"
      [[ ${_v} == "NPM_S" ]]     && version_prompt_val+="$(am_npm_short_version)"

      [[ ${_v} == "PYTHON" ]]    && version_prompt_val+="$(am_python_version)"
      [[ ${_v} == "PYTHON_S" ]]  && version_prompt_val+="$(am_python_short_version)"
      [[ ${_v} == "RUBY" ]]      && version_prompt_val+="$(am_ruby_version)"
      [[ ${_v} == "RUBY_S" ]]    && version_prompt_val+="$(am_ruby_short_version)"
      [[ ${_v} == "JAVA" ]]      && version_prompt_val+="$(am_java_version)"
      [[ ${_v} == "JAVA_S" ]]    && version_prompt_val+="$(am_java_short_version)"
      [[ ${_v} == "GO" ]]        && version_prompt_val+="$(am_go_version)"
      [[ ${_v} == "GO_S" ]]      && version_prompt_val+="$(am_go_short_version)"
      [[ ${_v} == "ELIXIR" ]]    && version_prompt_val+="$(am_elixir_version)"
      [[ ${_v} == "ELIXIR_S" ]]  && version_prompt_val+="$(am_elixir_short_version)"
      [[ ${_v} == "CRYSTAL" ]]   && version_prompt_val+="$(am_crystal_version)"
      [[ ${_v} == "CRYSTAL_S" ]] && version_prompt_val+="$(am_crystal_short_version)"
      [[ ${_v} == "PHP" ]]       && version_prompt_val+="$(am_php_version)"
      [[ ${_v} == "PHP_S" ]]     && version_prompt_val+="$(am_php_short_version)"
    done

    [[ "$LOOP_INDEX" != "0" ]] && version_prompt_val+="%F{$AM_FADE_COLOR}]%f"
  fi
  echo -n "${version_prompt_val}"
}
