set :branch, 'master'

set :application, proc { fetch(:stage).split(':').reverse[1] }

set :repo_url, proc { "git@github.com:chytreg/#{fetch(:application)}.git" }

set :deploy_to, proc { "/var/www/#{fetch(:application)}" }

set :rails_env, proc { fetch(:stage).split(':').last }

set :scm, :git

set :format, :pretty

set :log_level, :debug

set :pty, true

set :bundle_binstubs, nil

set :bundle_flags, '--deployment'

set :linked_files, %w{config/database.yml config/application.yml}

set :linked_dirs, %w{log tmp vendor/bundle public/system}

set :keep_releases, 5

role :app, %w{user@127.0.0.1}
role :web, %w{user@127.0.0.1}
role :db,  %w{user@127.0.0.1}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
end
