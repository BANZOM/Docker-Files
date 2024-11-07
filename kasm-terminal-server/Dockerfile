ARG BASE_TAG="1.16.0"
ARG BASE_IMAGE="terminal"
FROM kasmweb/$BASE_IMAGE:$BASE_TAG
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customizations Start ###########
RUN apt-get update && apt-get install -y tmux screen nano dnsutils zip git htop

RUN echo "set -g mouse on" > $HOME/.tmux.conf && chown 1000:1000  $HOME/.tmux.conf

### Update .bashrc to run an arbitrary command if specified as an environment variable
RUN echo "if [ ! -z \"\${SHELL_EXEC}\" ] && [ \"\${TERM}\" == \"xterm-256color\" ] ; \n\
then \n\
    set +e \n\
    eval \${SHELL_EXEC} \n\
fi  " >> $HOME/.bashrc && chown 1000:1000  $HOME/.bashrc

RUN echo "banzo.tech" > /etc/hostname

RUN apt-get update \
    && apt-get install -y sudo \
    && useradd -m -s /bin/bash banzo \
    && echo "banzo:linux for life" | chpasswd \
    && echo 'banzo ALL=(ALL) ALL' >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/*
    
RUN apt-get update \
    && apt-get install -y sudo \
    && echo "kasm-user:linux for life" | chpasswd \
    && echo 'kasm-user ALL=(ALL) ALL' >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/*

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
