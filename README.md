# Ruby Sidekiq example

Using

* ruby 1.9.3p484
* sidekiq 2.11.2
* timers 2.0.0
* rack 1.6.4
* sidekiq-status 0.6.0

## Installation

```Shell
bundle
```

## Start workers

```Shell
bundle exec sidekiq -r ./worker.rb
```

## Start clients

```Shell
bundle exec irb -r ./worker.rb
```

You can then start workers as follows:

```Ruby
job_id = Worker.perform_async "hard"
Sidekiq::Status::total job_id
Sidekiq::Status::get job_id, :result
```

# External links

* [Sidekiq wiki](https://github.com/mperham/sidekiq/wiki)
* [Sidekiq installation and first job](https://www.youtube.com/watch?v=bfPb1zD91Rg&index=1&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1)
* [Sidekiq status](https://github.com/utgarda/sidekiq-status)
