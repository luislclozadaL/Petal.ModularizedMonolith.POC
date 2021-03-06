# Rails Modularized Monolith POC

## Description

This is a small project to implement and demonstrate some key concepts that we needed for our goal of isolating a single domain from its monolithic parent app.

<img width="1045" alt="image" src="https://user-images.githubusercontent.com/5014037/168661421-bd33c596-04e0-4ad1-9b7d-19827913dac2.png">

<img width="1333" alt="image" src="https://user-images.githubusercontent.com/5014037/168661854-ed9b4b25-80d2-41a5-bb5b-6271a6292e81.png">

<img width="1271" alt="Screen Shot 2022-05-17 at 8 03 35 AM" src="https://user-images.githubusercontent.com/9501182/168806643-6d735a2f-ccca-482d-a649-c4600f7bacc4.png">

<img width="1295" alt="image" src="https://user-images.githubusercontent.com/5014037/168661937-8b423cc0-36ef-4407-9121-8f0a8f2ef3b7.png">

<img width="1368" alt="image" src="https://user-images.githubusercontent.com/5014037/168662005-81f8a352-ef90-40ea-ac61-c0c7e32b6915.png">

<img width="1354" alt="image" src="https://user-images.githubusercontent.com/5014037/168662073-4ef30537-c7b4-4aab-996d-3c1c1635a4e8.png">

<img width="1368" alt="image" src="https://user-images.githubusercontent.com/5014037/168662140-01a7905c-8970-40cf-a926-eb008f907acd.png">

<img width="1222" alt="image" src="https://user-images.githubusercontent.com/5014037/168662251-76fe2684-fe68-40a5-bc33-03f1151f08ea.png">

## Setup

### System dependencies

  * Rails (5.1.3 -> 5.1.7)
  * MySql
  * RabbitMQ
  * Bunny
  * Sneakers

### Database creation

1. run `rails db:create` (uses user `root` with password `password`)
2. run `rails db:migrate`
3. run `rails s`

### Install RabbitMQ, create exchange, queue and bindings and run workers.

#### Install RabbitMQ

1. `homebrew install rabbitmq`
2. add `export PATH=$PATH:/usr/local/sbin` to `./.zshrc`
3. `rabbitmqctl add_user "admin"` *creates admin user*
4. use password `password` *sets the user password*
5. `rabbitmqctl add_vhost development` *Creates a default VHost*
6. `rabbitmqctl set_permissions -p "development" "admin" ".*" ".*" ".*"` *sets the permissions for the newly created use, gives full access*
7. `rabbitmqctl set_user_tags admin administrator` *allows the new user to have access to the administration frontend tool*
8. you should have access now to the admin tool at url `http://localhost:15672/`

#### Create exchange, queues and bindings with tasks from workers/listeners

1. open a terminal on the workers/listeners folder *engines/patients/workers/patient_workers*
2. run `bundle install`
3. run `rake rabbitmq:setup` *this will create the exchange and queue required for messaging (these tasks should be part of the main app)*

#### Run workers/listeners

1. To run the workers/listeners run `WORKERS=PatientCertificationListener rake sneakers:run `

