FROM ruby:3.1.2

WORKDIR /app

COPY . .

RUN bundle install 
RUN rake db:migrate && \
    rake db:seed

EXPOSE 9292

CMD ["rackup", "config.ru", "-o", "0.0.0.0"]