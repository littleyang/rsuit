require 'rails/generators'

module Rsuit
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "create rspec install and init the guard file,spec_help file"

      def init_dir
        if(!File.exist?("#{Rails.root}/spec"))
          Dir.mkdir("#{Rails.root}/spec")
        end
        if(!File.exist?("#{Rails.root}/spec/factories"))
            Dir.mkdir("#{Rails.root}/spec/factories")
        end
      end

      def init_config
        init_gemfile_config
        init_application_config
      end

      def init_rsuit
        generate("rspec:install")

      end

      def copy_config_file
        copy_file "Guardfile","#{Rails.root}/Guardfile"
        copy_file "spec_helper.rb","#{Rails.root}/spec/spec_helper.rb"
      end

      private
      def init_application_config

        application "
        config.generators do |g|
          g.test_framework :rspec,
            :fixtures => true,
            :view_specs => true,
            :helper_specs => true,
            :routing_specs => true,
            :controller_specs => true,
            :request_specs => true
          g.fixture_replacement :factory_girl,:dir=>'spec/factories'
        end
        "
      end

      def init_gemfile_config
        begin
          gem_group :development,:test do
            gem 'rspec-rails'
            gem 'rspec'
            gem 'rb-inotify',:require => false
            gem 'rb-fsevent',:require => false
            gem 'rb-fchange',:require => false
            gem 'guard-rspec'
            gem 'factory_girl_rails'
            gem 'watchr'
            gem 'launchy'
            gem 'capybara'
            gem 'faker'
            gem 'guard-spork'
            gem 'spork','~> 1.0rc'
            gem 'spork-rails',github: 'railstutorial/spork-rails'
          end
        rescue Exception => e
          puts e.message
        end
      end

    end
  end
end
