FROM docker.io/archlinux:latest

LABEL com.github.containers.toolbox="true" \
      name="archlx-toolbox" \
      version="latest" \
      usage="Image is created for usage with fedora-toolbox." \
      summary="Base is the Arch Linux core image. Can be extended by pacman installs, as the system is full mutable." \
      maintainer="Laura Faessler <dev at faessler dot io"

RUN mkdir /etc/krb5.conf.d
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm sudo bash-completion base-devel nano flatpak-xdg-utils mlocate glibc
RUN echo "%wheel    ALL=(ALL)   NOPASSWD: ALL" > /etc/sudoers.d/archlx-toolbox
RUN echo 'PS1="$(tput setaf 12; tput bold)⬢$(tput sgr0)[\u@\h \W]$ "' >> /etc/bash.bashrc
RUN echo 'PROMPT_COMMAND=""' >> /etc/bash.bashrc
RUN touch /etc/machine-id
RUN sed -i s/^NoExtract.*$//g /etc/pacman.conf

CMD /bin/sh
