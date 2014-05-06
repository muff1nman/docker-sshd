FROM base/devel

MAINTAINER Andrew DeMaria

RUN rm /etc/pacman.d/mirrorlist
ADD mirrorlist /etc/pacman.d/mirrorlist

RUN yaourt -Syyua --noconfirm --nocolor

RUN yaourt -S --noconfirm --nocolor openssh pwgen dnsutils iputils procps-ng supervisor
ADD supervisord.conf /etc/supervisord.conf

RUN /usr/bin/ssh-keygen -A

RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
#RUN sed -ri 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
# RUN sed -ri 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE 22

CMD ["/usr/bin/supervisord"]
