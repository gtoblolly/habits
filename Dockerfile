FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs

RUN gem install bundler:2.1.4

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

COPY . /app

ENTRYPOINT ["/entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]