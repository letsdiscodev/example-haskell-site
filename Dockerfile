FROM haskell:latest

WORKDIR /code

# copy cabal file
COPY ./example-haskell-site.cabal /code/example-haskell-site.cabal
# build the dependencies only
RUN cabal update
RUN cabal build --dependencies-only

COPY . /code
# build the actual app
RUN cabal build
CMD ["cabal", "exec", "example-haskell-site"]
