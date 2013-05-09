require 'openssl'
require 'encryptor'
require 'digest/sha2'
require 'highline/import'

class Glove
  attr_accessor :file
  def initialize
    @file = settings.location
  end

  def encrypt
    write_file encrypted_file, Encryptor.encrypt(open_file(plaintext_file), key: key)
  end

  def decrypt
    write_file plaintext_file, Encryptor.decrypt(open_file(encrypted_file), key: key)
  end

  private

  def settings
    OpenStruct.new :location => 'data/settings.json'
  end

  def key
    sha256.digest ask('Enter your password? ') { |q| q.echo = 'x' }
  end

  def sha256
    @sha256 ||= Digest::SHA2.new(256)
  end

  def open_file file
    File.read file
  end

  def write_file file, content
    File.write file, content
  end

  def plaintext_file
    file
  end

  def encrypted_file
    file + '.cast5'
  end
end
