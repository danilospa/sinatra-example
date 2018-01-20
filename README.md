## Ruby example project

### Dependencies

- Ruby 2.4.1

### Ruby installation

I recommend to use rbenv to manager Ruby versions on your machine. You can follow the instructions [here](https://github.com/rbenv/rbenv#installation).  
Then, install Ruby 2.4.1.
```
rbenv install 2.4.1
rbenv global 2.4.1
```

### How to setup

Install bundle gem and use it to install project dependencies.
```
gem install bundle
bundle i
```

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

### Instruction

```
curl localhost:9292/issues -H 'Authorization: <token>'
curl localhost:9292/issues?state=closed -H 'Authorization: <token>'
curl -X POST localhost:9292/issues -H 'Authorization: <token>' -H 'Content-type: application/json' --data '{"title":"teste"}'
```
