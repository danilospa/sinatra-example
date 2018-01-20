## Ruby example project with Sinatra

### Description

This project was built to illustrate a simple application with Sinatra framework.  
The app serves as a proxy to two Github endpoints for a specific repository: list issues and create an issue.  
It has a security layer that reads the Authorization header and verifies if that value is present on Redis.

### Dependencies

- Ruby 2.4.1
- Redis

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

### Examples

List issues:
```
curl localhost:9292/issues -H 'Authorization: <token>'
curl localhost:9292/issues?state=closed -H 'Authorization: <token>'
```

Create issue:
```
curl -X POST localhost:9292/issues -H 'Authorization: <token>' -H 'Content-type: application/json' --data '{"title":"teste"}'
```
