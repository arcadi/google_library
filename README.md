# google_library

This is a Sinatra web application which displays a list of books from Google Books.

 
Application was deployed to Heroku: [http://adviditestapp.herokuapp.com/](http://adviditestapp.herokuapp.com/).

##Use:

  +  Google Books API
  +  Pagination (will_paginate)
  +  Twitter Bootstrap
  +  Memcahed
  +  Unicorn
  +  Heroku
  +  Rspec

## Install
`git clone git@github.com:arcadi/google_library.git`

`bundle`

`memcached`

`bundle exec unicorn -p 3000 -c ./config/unicorn.rb`

## Deploy
`git push heroku master`

## Test
`rspec spec`

