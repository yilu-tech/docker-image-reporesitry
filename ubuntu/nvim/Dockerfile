FROM yilutech/ubuntu:20.04

RUN apt-get update \
 && apt-get install -y python3 python3-pip silversearcher-ag neovim \
 && mkdir -p $HOME/.pip/ \
 && echo -e "[global]\nindex-url = https://pypi.douban.com/simple/\n" > $HOME/.pip/pip.conf \
 && python3 -m pip install --user --upgrade pynvim \
 && echo "type nvim > /dev/null 2>&1 && alias vi='nvim'" >> $HOME/.bashrc \
 && sh -c 'curl -fLo "$HOME/.local/share"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
 && mkdir -p $HOME/.config/nvim

COPY ubuntu/nvim/init.vim /root/.config/nvim/
