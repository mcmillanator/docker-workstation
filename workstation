export HOME=/home
docker run  --rm \
  --net=host \
  -e DISPLAY \
  -e XAUTHORITY \
  -v ssh:/home/.ssh \
  -v minpac:/home/.vim/pack/minpac \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc/passwd:/etc/passwd:ro \
  -v /etc/group:/etc/group:ro \
  -v "$XAUTHORITY:/root/.Xauthority:rw" \
  --hostname workstation \
  -u $ID:997 \
  -v $(pwd):/app \
  -w /app \
  -e HOME \
  -it workstation /bin/zsh
