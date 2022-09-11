FROM centos

COPY tableau-server-2022-1-6.x86_64.rpm tableau-server-2022-1-6.x86_64.rpm

RUN pwd

WORKDIR /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y

WORKDIR /
RUN yum install -y tableau-server-2022-1-6.x86_64.rpm

RUN /opt/tableau/tableau_server/packages/scripts.2022-1-6/initialize-tsm --accepteula

ENTRYPOINT [ "tableau-server" ]
