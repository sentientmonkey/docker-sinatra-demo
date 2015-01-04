FROM ubuntu
MAINTAINER swindsor@gmail.com

ENV PORT 5000

RUN apt-get -y install software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get -y update
RUN apt-get -y install build-essential
RUN apt-get -y install ruby2.2 ruby2.2-dev
RUN apt-get -y install ruby-switch
RUN ruby-switch --set ruby2.2
RUN gem update --system
RUN gem install bundler

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

RUN useradd -ms /bin/bash sinatra

USER sinatra
ADD . /app
WORKDIR /app
USER root
RUN chown -R sinatra:sinatra /app

USER sinatra
EXPOSE $PORT

CMD ["foreman", "start", "-d", "/app"]
