Ruby Myth
=================

Ruby Myth is a bridge to the Myth preprocessor.

    Myth.preprocess File.read("input.css")


Installation
------------

    gem install myth


Dependencies
------------

This library depends on the `myth-source` gem.

You can use this library with unreleased versions of
Myth by setting the `MYTH_SOURCE_PATH` environment
variable:

    export MYTH_SOURCE_PATH=/path/to/myth.js

### ExecJS

The [ExecJS](https://github.com/sstephenson/execjs) library is used to automatically choose the best JavaScript engine for your platform. Check out its [README](https://github.com/sstephenson/execjs/blob/master/README.md) for a complete list of supported engines.

## Running tests

    $ bundle install
    $ bundle exec rake test

If you need to test against local gems, use Bundler's gem :path option in the Gemfile.