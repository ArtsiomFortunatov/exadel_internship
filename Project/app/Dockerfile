FROM centos:7


RUN yum -y install curl 
RUN yum -y install gpg gpg2 gcc gcc-c++ make which patch autoconf automake bison libffi-devel libtool patch readline-devel sqlite-devel zlib-devel openssl-devel
RUN \curl -sSL https://get.rvm.io | bash
RUN source /usr/local/rvm/scripts/rvm
SHELL [ "/bin/bash", "-l", "-c" ]
RUN rvm install 2.7
RUN yum -y install mysql-devel

RUN rvm use 2.7.4 --default

WORKDIR /opt
RUN yum -y install git
RUN git clone https://github.com/edavis10/redmine.git
WORKDIR /opt/redmine
RUN rvm rvmrc warning ignore allGemfiles

RUN cd /opt/redmine

COPY ./database.yml ./config

RUN bundle install 
RUN bundle install --without development test

RUN bundle exec rake generate_secret_token


#ENTRYPOINT bundle exec rake db:migrate RAILS_ENV="production"

ENTRYPOINT ["bundle", "exec"]
CMD rake db:migrate RAILS_ENV="production"
ENTRYPOINT ruby bin/rails server -e production



