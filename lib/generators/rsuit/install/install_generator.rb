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
        init_application_config
        init_gemfile_config
      end

      def read_config
        File.readlines("./templates/Gemfiletemp").each do |line|
          puts line
        end
      end

      def init_rspec
        #if(File.exist?)
        #%x[#{rails g rspec:install}]
        #%x[#{bundle exec guard init rspec}]
        #%x[#{bundle exec guard init spork}]
        #%x[#{bundle exec spork --bootstrap}]
      end

      def copy_config_file
        copy_file "Guardfile","#{Rails.root}/Guardfile"
        copy_file "spec_helper.rb","#{Rails.root}/spec/spec_helper.rb"
      end

      private
      def init_application_config

      end

      def init_gemfile_config
        begin
          gem_config_file = File.open("#{Rails.root}/Gemfile","a")
          File.readlines("Gemfile").each do |line|
            gem_config_file.puts line
          end
          gem_config_file.close
        rescue Exception => e
          puts e.message
        end
      end

    end
  end
end
