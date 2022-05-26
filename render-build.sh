hugo version

if [[ ! -d $XDG_CACHE_HOME/hugo ]]; then
  echo "...Downloading HUGO"
  mkdir -p ~/tmp

  wget -P ~/tmp https://github.com/gohugoio/hugo/releases/download/v0.99.1/hugo_0.99.1_Linux-32bit.tar.gz
  cd ~/tmp
  tar -xzf hugo_0.99.1_Linux-32bit.tar.gz
	mv hugo_0.99.1_Linux-32bit/hugo $XDG_CACHE_HOME/hugo	
  cd $HOME/project/src # Make sure we return to where we were
else
  echo "...Using HUGO from build cache"
fi

PATH="${PATH}:${HOME}/$XDG_CACHE_HOME/hugo"

hugo version
hugo --gc --minify -t hugo-icon --config themes/hugo-icon/exampleSite/config.toml