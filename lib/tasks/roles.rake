require 'say.rb'

namespace :db do
  include Say

  desc "Erase Roles data"
  task :delete_roles => :environment do
    say_with_time "Erasing Roles data..." do
      Role.delete_all
    end
  end

  desc "Fill Roles table with user roles"
  task :create_roles do 
    say_with_time "Filling roles table with system roles" do
      @role = Role.new
      @role.name = "super_manager"
      @role.save

      @role = Role.new
      @role.name = "product_manager"
      @role.save

      @role = Role.new
      @role.name = "customer"
      @role.save
    end
  end

  desc "Erase and fill Roles table"
  task :roles => [:delete_roles, :create_roles]
end