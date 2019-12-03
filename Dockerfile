FROM ruby:2.6
MAINTAINER me@danielparnell.com

RUN apt-get clean \
  && mv /var/lib/apt/lists /var/lib/apt/lists.broke \
  && mkdir -p /var/lib/apt/lists/partial

RUN apt-get update

RUN apt-get install -y \
      python-pygments \
      locales \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
  && locale-gen en_US.UTF-8 \
  && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install

VOLUME /src
EXPOSE 4000

WORKDIR /src
ENTRYPOINT ["jekyll"]
