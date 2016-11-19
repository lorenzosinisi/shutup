require "shutup/version"
require "shutup/server"

module Shutup
  ALLOWED_SERVICES = %i(server)

  def self.process(name:)
    done = ALLOWED_SERVICES.include?(name) && send(name)
    done || puts("#{name.to_s} not supported.")
  end

  def self.server
    Shutup::Server.hit! && Shutup::Server.delete_pid
  end

end
