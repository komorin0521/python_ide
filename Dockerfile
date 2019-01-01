FROM ubuntu:16.04

RUN set -x && \
    apt update && \
    apt install -y --no-install-recommends \
    software-properties-common python-dev python-pip python-setuptools python3-dev python3-pip python3-setuptools curl git

RUN add-apt-repository -y ppa:neovim-ppa/unstable
RUN apt update
RUN apt install -y --no-install-recommends neovim

RUN pip3 install --no-cache-dir --upgrade neovim pip
RUN pip2 install --no-cache-dir --upgrade neovim pip

RUN curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
RUN sh ./installer.sh ~/.cache/dein

COPY .config /root/.config

RUN echo -e '\nexport PYENV_ROOT=/opt/pyenv\nexport PATH=$PYENV_ROOT/bin:$PATH\neval "$(pyenv init -)"\neval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

RUN nvim +PlugInstall +qa

ENTRYPOINT ["nvim"]
