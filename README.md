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
