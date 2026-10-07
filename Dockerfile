# Use OSRF ROS image with ARG support
ARG ROS_DISTRO=humble
FROM osrf/ros:${ROS_DISTRO}-desktop-full

# Update and install required dependencies
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends --no-install-suggests \
    ros-dev-tools \
    wget \
    && apt update && apt upgrade -y \
    && rosdep update \
    && apt install -y \
        ros-${ROS_DISTRO}-nav2-bringup \
        ros-${ROS_DISTRO}-navigation2 \
        ros-${ROS_DISTRO}-ros-ign-gazebo \
        ros-${ROS_DISTRO}-ros-ign-bridge \
        lsb-release \ 
        gnupg

RUN curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null

RUN apt update \
    && apt install -y ignition-fortress


# ARG UID=1000
# ARG GID=1018
# RUN groupadd -g ${GID} aiolos-indoors || true
# RUN useradd -m -u ${UID} -g ${GID} -s /bin/bash \
#     -G sudo,adm,dialout,cdrom,floppy,audio,dip,video,plugdev \
#     dockeruser && \
#     echo "dockeruser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
#     usermod -aG sudo dockeruser && \
#     passwd -d dockeruser
    

# RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc && \
#     echo "source /opt/ros/humble/setup.bash" >> /home/dockeruser/.bashrc
    


# Set up entrypoint (Optional)
CMD ["/bin/bash"]
