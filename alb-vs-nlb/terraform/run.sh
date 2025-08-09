docker run --rm -it \
  -v $(pwd):/workspace \
  -v $HOME/.aws:/root/.aws:ro \
  tofu-ubuntu
