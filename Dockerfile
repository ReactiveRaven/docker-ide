FROM node:14-alpine

RUN apk add tmux
RUN apk add vim
RUN apk add curl
RUN apk add git
RUN apk add the_silver_searcher

COPY .vimrc /root/.vimrc
RUN mkdir -p /root/.config/coc

RUN vim +PlugInstall +qall

RUN apk add htop
RUN apk add build-base
RUN apk add python

CMD /bin/sh
