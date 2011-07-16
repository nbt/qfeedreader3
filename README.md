# Heroku-ready framework with Thin, jQuery and Queuing

This app uses delayed_job to process deferred tasks.  If the
delayed_job daemon is not running, you will never get updates.  To
start the delayed_job daemon on the local machine:

    % script/delayed_job start
or
    % rake jobs:work

I'll need to figure out how to run that on Heroku, but it probably
involves adding to Procfile and paying for a worker job.

# setting up jquery

* include `gem 'jquery-rails'` in Gemfile
* bundle install
* rails generate jquery:install
