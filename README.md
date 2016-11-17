# Shutup

If you find yourself in this situation (A server is already running) often:

```
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
A server is already running. Check /tmp/pids/server.pid.
Exiting
```

What you do includes, for instance, killing the process by its process id:

```
cat /tmp/pids/server.pid
kill -9 PID
```

But this is boring. And you have to do it all the times. This gems creates a shortcut to fix the 'A server is already running' problem when dealing with Rails.

## Installation

Go in the root folder of your Rails project:

    $ cd PROJECT_ROOT_FOLDER
    $ gem install shutup


## Usage

After installing the gem run:

    $ cd PROJECT_ROOT_FOLDER
    $ shutup

TEST IT: try to start the Rails app, open a new terminal window and then type:

    $ shutup

To see how this gem kills the current process.

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lorenzosinisi/shutup.

## Todo

1. Write tests
2. Kill other type of apps (Node, PHP, Scala)
3. Improve the error messages and error handling


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

