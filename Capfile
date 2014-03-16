# Load DSL and Setup Up Stages
require 'capistrano/multiconfig'

# Includes default deployment tasks
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }

# Load all custom recipes
Dir['recipes/**/*.rb'].each { |recipe| load(recipe) }
