# Simple Appointments Management System (with an API)

### System versions:

* Ruby: 2.5.1

* Bundler: 1.16.1

* Rails: 5.1.6

* Postgresql: 10.3

### Database setup:

* Add rails role to `postgresql` db: `create role rails with createdb login password 'rails';`

* Create the database: `rails db:setup`

### Scheduler:

* Whenever gem is used to generate and install crontab file

* Install with `whenever --update-crontab`

### API:

* `GET /api/appointments` - return a list of appointments for the authenticated user

* `POST /api/appointments` - create an appointment with an optional reminder
