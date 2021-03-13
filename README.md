# README

API serving atucasa-front-end.

Set up for Linux and Mac:

* Update to Ruby 2.7.2
  * If using rvm: 
    * `rvm install 2.7.2`
    * `rvm use 2.7.2`
  * If using rbenv:
    * `rbenv install 2.7.2`
    * `rbenv local 2.7.2`

* Set up gems:
`bundle install`

* Create PostgreSQL database:
`rails db:create`

* Run migrations:
`rails db:migrate`

* Fill up data base with seeds:
`rails db:seed`

* Run server:
`rails s`
