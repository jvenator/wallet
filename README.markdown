# Wallet

Wallet is an app for helping renters organize their information.

Quick setup guide:

Copy services.yml.example to services.yml
$: cp config/services.yml.example config/services.yml

Copy .env.example to .env
$: cp .env.example .env

bundle install
$ bundle install

create a database
$ rake db:create

run the migrations:
$ rake db:migrate

Create seed data:
$ rake db:seed

Wallet uses sidekiq for workers. Please make sure you have redis installed.

Start the application:
$ foreman start


