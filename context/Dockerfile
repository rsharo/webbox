FROM	centos:8

LABEL	name="webbox" \
	version="1" \
	maintainer="Randy" \
	description="an SSH server that can serve firefox over X11" \
	CentOS="8" \
	TINI_VERSION="v0.19.0"

RUN	dnf -y install	\
# basic ssh server
			openssh openssh-server openssh-clients pam_ssh_agent_auth \
# Xauthority and pulseaudio support
			xorg-x11-xauth pulseaudio-libs \
# firefox
			firefox \
# debug tools like pacat
#			pulseaudio-utils \
# debug tools like xprop
#			xorg-x11-utils \
# dbus over x11
#			dbus-x11 \
# pulseaudio volume control
#			pavucontrol \
			&& \
	dnf -y clean all && \
	useradd guest && \
	ssh-keygen -A && \
	mkdir -p /var/run/dbus

RUN	rm -f /var/run/nologin
COPY	--chown=guest:guest id_webbox.pub /home/guest/.ssh/authorized_keys
RUN	chmod -R g-rwx,o-rwx /home/guest/.ssh

COPY	tini-amd64 /tini
COPY	start.sh /start.sh
RUN	chmod 500 /tini /start.sh

EXPOSE 22
ENTRYPOINT ["/tini", "-g", "--" ]
CMD [ "/start.sh" ]

