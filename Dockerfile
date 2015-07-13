FROM ubuntu:latest

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install build-essential git ruby2.0 ruby2.0-dev libyaml-dev libxslt1-dev libxml2-dev libsqlite3-dev zlib1g-dev --no-install-recommends
RUN ln -sf $(which ruby2.0) /usr/bin/ruby && ln -sf $(which gem2.0) /usr/bin/gem
RUN gem install rails --version 4.0.5 --no-document

COPY Gemfile /tmp/
WORKDIR /tmp
RUN bundle install --without production
