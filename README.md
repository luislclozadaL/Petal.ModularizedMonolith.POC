# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
* System dependencies

Install RabbitMQ 

1. `homebrew install rabbitmq`
2. add `export PATH=$PATH:/usr/local/sbin` to `./.zshrc`
3. `rabbitmqctl add_user "admin"` *creates admin user*
4. use password `password` *sets the user password*
5. `rabbitmqctl add_vhost development` *Creates a default VHost*
6. `rabbitmqctl set_permissions -p "development" "admin" ".*" ".*" ".*"` *sets the permissions for the newly created use, gives full access*
7. `rabbitmqctl set_user_tags admin administrator` *allows the new user to have access to the administration frontend tool*

you should have access now to the admin tool at url `http://localhost:15672/`

* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions

* ...
