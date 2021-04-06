function idea() {
  open -na IntelliJ\ IDEA.app --args "$@"
}

# mkdir, cd into it (via http://onethingwell.org/post/586977440/mkcd-improved)
function mkcd () {
    mkdir -p "$*"
    cd "$*"
}

# tree
alias tree1="tree -L 1"
alias tree1h="tree -L 1 -h"
alias tree2="tree -L 2"
alias tree2h="tree -L 2 -h"
alias tree3="tree -L 3"
alias tree3h="tree -L 3 -h"

alias drm="docker rmi $(docker images -f 'dangling=true' | awk '{if ($1 == "<none>") {print $3} }')"
