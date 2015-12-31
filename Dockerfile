FROM ruby:2.2
MAINTAINER Ryan Guo<ryan@islandzero.net>

# install Node.js
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# install PostgreSQL client
RUN apt-get update && apt-get install -y postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

# create workdir
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# rails env
ENV RAILS_ENV=production

# copy Gemfile
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
# fix nokogiri
RUN bundle config build.nokogiri --use-system-libraries
# install gems
RUN bundle install --verbose --without development test doc --deployment --jobs=4

# add app
COPY . /usr/src/app

# compile assets
RUN bundle exec rake assets:precompile

# expose 3000
EXPOSE 3000

# execute
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
