## Capitrano multiconfig example

We use [caphub](https://github.com/railsware/caphub)

Deployment process

1) clone repository

2) run `bundle install`

3) run capistrano task:

- `bundle exec cap app1:staging deploy`
- `bundle exec cap app2:staging deploy`

Tip: Deploy App1 and App2 at ones: `bundle exec cap general staging:deploy_all`
