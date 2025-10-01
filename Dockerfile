FROM ruby:3.1.2

WORKDIR /app

COPY Procfile config.ru Gemfile Gemfile.lock ./

RUN bundle install && \
    rake db:create && \
    rake db:migrate && \
    rake db:seed

EXPOSE 9292

CMD ["rackup" "config.ru"]