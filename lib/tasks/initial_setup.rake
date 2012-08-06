namespace :db do
  desc "Initialize the system (add default roles)"
  task :initial_setup => [:roles]
end