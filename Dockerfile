FROM public.ecr.aws/docker/library/ruby:3.3.2-slim AS tmp-base
FROM tmp-base as development
ENV APP_HOME /app
RUN mkdir $APP_HOME

WORKDIR $APP_HOME
EXPOSE 3000

# Copy entire source code
COPY . $APP_HOME/

EXPOSE 3000

CMD [ "bundle", "exec", "bin/rails", "s", "-p", "3000", "-b", "0.0.0.0" ]
