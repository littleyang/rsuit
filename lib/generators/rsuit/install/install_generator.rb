require 'rails/generators'

module Rsuit
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "create rspec install and init the guard file,spec_help file"
      root_dir = Rails.root

      def init_rspec
        #if(File.exist?)
        %x[#{rails g rspec:install}]
        %x[#{bundle exec guard init rspec}]
        %x[#{bundle exec guard init spork}]
        %x[#{bundle exec spork --bootstrap}]
      end

      def copy_config_file
        copy_file "Guardfile","#{root_dir}"
        copy_file "spec_help.rb","#{root_dir}/spec/"
      end

    end
  end
end
