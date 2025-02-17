# Photos

A simple app so that I can share some photos I take.

## Installation

- Run `script/bootstrap` to install the required gems
- Run `script/migrations` to create the blank database
- Run `script/server` to run the server locally
- Open http://localhost:9595 in your browser

### To run unicorns

- `bundle exec unicorn -c config/unicorn.rb -D`
- `kill -HUP $(cat tmp/pids/unicorn.pid)`
