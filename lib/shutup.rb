require "shutup/version"
require "shutup/server"

module Shutup
  ALLOWED_SERVICES = %i(server)

  def self.process(name:)
    if ALLOWED_SERVICES.include?(name)
      send(name)
    else
      puts "#{name.to_s}.pid not yet supported"
    end
  end

  def self.server
    Shutup::Server.hit! && Shutup::Server.delete_pid
  end

end
