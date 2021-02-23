# TapResarch Assessment

## Objective
The objective of this assessment was to create a Ruby on Rails project that:
- Consumes TapResearch's API
- Stores responses in a relational database
- Defines a custom route that returns all stored Campaigns with nested Campaign Quotas and Campaign Qualifications, ordered by the number of Campaign Qualifiations, in JSON format

## Local Installation
This is a fairly straightforward Rails application.

### Requirements
- Ruby 2.6.5
- PostgreSQL
- Redis (used by Sidekiq)

### Install gems
```
bundle install
```

### Create and seed database
The `seeds.rb` file (which is called by the stup task) queues up a job to retrieve and persist all data
```
bundle exec rake db:setup
```

### Launch Sidekiq
Sidekiq needs to run to pick up the previously queued job and perform data retrieval and persistence
```
bundle exec sidekiq
```

### Run rails server
Run your local server and navigate to `localhost:3000/ordered_campaigns.json` to list all Campaigns
```
rails server
```

## Live Example
http://4lor.hatchboxapp.com
