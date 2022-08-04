FROM fedora:rawhide
RUN dnf -y install gcc ccache make gtk3-devel meson gtk4-devel desktop-file-utils gtk-doc libadwaita-devel git openssl-devel libyaml-devel
RUN curl -fsSL https://crystal-lang.org/install.sh | sudo bash
CMD ["/bin/sh"]
