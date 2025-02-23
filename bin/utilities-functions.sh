git_clean_branches() {
	branch=${1-master}
	git checkout $branch
	git remote prune origin
	git branch | grep -v "$branch" | xargs git branch -D
}

git_fetch_pr() {
  pr=$1
  git fetch -- $(git remote get-url origin) +refs/pull-requests/$pr/from:refs/remotes/origin/PR-$pr
}

use_java() {
  export JAVA_HOME=$(/usr/libexec/java_home -v $1)
  echo $JAVA_HOME
}

len() {
  echo -n $1 | wc -c
}

lg() {
  COMMAND=(eza --no-permissions -l --no-user --no-time --no-filesize --tree --git -I node_modules)
  if [ -f "Cargo.toml" ]; then
    COMMAND+=( -I target)
  fi
  "${COMMAND[@]}"
}

