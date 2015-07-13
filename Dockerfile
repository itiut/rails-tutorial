FROM ubuntu:latest

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install build-essential ruby2.0 ruby2.0-dev libyaml-dev libxslt1-dev libsqlite3-dev
RUN ln -sf $(which ruby2.0) /usr/bin/ruby && ln -sf $(which gem2.0) /usr/bin/gem
RUN gem install rails --version 4.0.5 --no-document

COPY first_app/Gemfile /tmp/first_app/
WORKDIR /tmp/first_app
RUN bundle install
