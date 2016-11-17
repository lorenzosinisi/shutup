require "shutup/version"
require "shutup/server"

module Shutup
  ALLOWED_SERVICES = %w(server)

  def self.process(name:)
    ALLOWED_SERVICES.include?(name) && send(name)
  end

  def self.server
    Shutup::Server.hit! && Shutup::Server.delete_pid
  end

end
