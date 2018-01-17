FROM ruby:2.4.1

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN bundle install --without development test

EXPOSE 9292
CMD ["bundle", "exec", "puma"]
