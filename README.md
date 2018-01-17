## Ruby example project

### Dependencies

- Ruby 2.4.1

### How to setup

First of all, make sure you have the correct version of Ruby installed. Then, execute `bundle i`.
Afterwards, copy the `.env.example` file and fill the required information.
```
cp .env.example .env
```

### How to run

Execute `bundle exec rackup`. The server will listen on port 9292.

### Running linter

Execute `bundle exec rubocop`.

### Running tests

Execute `bundle exec rspec`.

### Running with docker

Just build the image and run it:
```
docker build -t poc-ruby .
docker run -it -p 9292:9292 -e APP_ENV=production \
                            -e REDIS_URL=<REDIS_HOST> \
                            -e GITHUB_URL=https://api.github.com \
                            -e GITHUB_AUTH_TOKEN=<your_github_token> poc-ruby
```
