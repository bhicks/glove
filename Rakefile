#require 'rake'
require_relative 'lib/glove.rb'

namespace :sslify do
  desc 'Encrypt a settings file'
  task :encrypt_settings do
    mb = Glove.new
    mb.encrypt
  end

  desc 'Decrypt a settings file'
  task :decrypt_settings do
    mb = Glove.new
    mb.decrypt
  end
end
