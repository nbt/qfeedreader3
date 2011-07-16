# Heroku-ready demo using Rails3, delayed_job and jquery

This demo implements an RSS feed reader, based on Adam Wiggins's github.com/adamwiggins/qfeedreader, 
using Rails3, jquery, delayed_job, and structured to be deployed on Heroku's cedar stack.

# To deploy on heroku

    % heroku create --stack cedar
    % git push heroku master
    % heroku run rake db:create
    % heroku run rake db:migrate
    % heroku scale worker=1
    % heroku open

# To run locally

    % rails db:create
    % rails db:migrate
    % rake jobs:work &
    % rails server &
    % open http://localhost:3000
