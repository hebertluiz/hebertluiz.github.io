FROM jekyll/builder

WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install

FROM jekyll/jekyll

VOLUME /src
EXPOSE 4000





RUN mkdir -p /src/{_site,_jekyll_site}
WORKDIR /src/_jekyll_site


ENTRYPOINT ["jekyll","serve","--force_polling","--livereload", "-H", "0.0.0.0"]
