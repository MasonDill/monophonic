FROM tensorflow/tensorflow:1.12.3
WORKDIR /
RUN ["apt", "update"]

# Install Primus Dataset to /primus_data
RUN ["apt", "install", "wget", "-y"]
RUN ["wget", "https://grfia.dlsi.ua.es/primus/packages/primusCalvoRizoAppliedSciences2018.tgz", "--no-check-certificate"]
RUN ["gzip", "-d", "./primusCalvoRizoAppliedSciences2018.tgz"]
RUN ["mkdir", "primus_data"]
RUN ["tar", "-xf", "./primusCalvoRizoAppliedSciences2018.tar", "-C", "./primus_data", "--strip-components=1"]
RUN ["rm", "./primusCalvoRizoAppliedSciences2018.tar"]
RUN mv /primus_data/package_aa/* /primus_data/
RUN ["rmdir", "/primus_data/package_aa"]
# package_ab is too big to move in one command
RUN mv /primus_data/package_ab/*22* /primus_data/
RUN mv /primus_data/package_ab/*23* /primus_data/
RUN mv /primus_data/package_ab/* /primus_data/
RUN ["rmdir", "/primus_data/package_ab"]

# Install the dependencies for tf-end-to-end
RUN ["pip", "install", "--upgrade", "pip"]
RUN ["pip", "install", "opencv-contrib-python"]
RUN ["apt", "install", "libxrender1", "libfontconfig1", "-y"]
RUN ["apt", "install", "-y", "libsm6", "libxext6"]
RUN ["apt", "install", "-y", "git"]
RUN ["apt", "clean"]

# Download the repos
RUN ["git", "clone", "https://gitea.dill.digital/mason/MonophonicML.git"]
RUN ["git", "clone", "https://gitea.dill.digital/mason/tf-end-to-end.git"]

WORKDIR /MonophonicML/notebooks