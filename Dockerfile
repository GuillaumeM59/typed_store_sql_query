FROM ruby:3

RUN apt-get update -qq && \
    apt-get install -y nodejs yarn postgresql-client

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3007

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
