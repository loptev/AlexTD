namespace :db do
    desc "Deleting everything in database and making new fake data."
    task :populate => :environment do
        require 'populator'
        require 'faker'

        #to run... do "rake db:populate" in your terminal
        
        password = "TowerDefense"

        # delete values in these models
        Rake::Task['db:drop'].invoke
        Rake::Task['db:create'].invoke
        Rake::Task['db:schema:load'].invoke

        User.populate 400 do |user|
            user.username = Faker::Internet.user_name
            user.highscore = 1000..50000
            user.email = Faker::Internet.email
            user.encrypted_password = User.new(:password => password).encrypted_password
        end
    end
end
