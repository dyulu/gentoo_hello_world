FROM gentoo/stage3-amd64:latest

# Sync global gentoo repo
RUN emerge --sync
RUN eselect profile set 1 

# Create local repo
RUN mkdir -p /var/db/repos/myrepo/{metadata,profiles}
COPY myrepo_repo_name /var/db/repos/myrepo/profiles/repo_name
COPY myrepo_layout.conf /var/db/repos/myrepo/metadata/layout.conf
RUN mkdir -p /etc/portage/repos.conf/
COPY myrepo_myrepo.conf /etc/portage/repos.conf/myrepo.conf

# Create hello-world ebuild
RUN mkdir -p /var/db/repos/myrepo/app-misc/hello-world
COPY hello-world-1.0.ebuild /var/db/repos/myrepo/app-misc/hello-world/hello-world-1.0.ebuild

# Create local distfile
COPY distfiles/hello-world-1.0.tar.gz /var/cache/distfiles

# Merge
RUN chown -R portage:portage /var/db/repos/
WORKDIR /var/db/repos/myrepo/app-misc/hello-world
RUN ebuild hello-world-1.0.ebuild manifest clean merge

ENTRYPOINT hello-world && /bin/bash

