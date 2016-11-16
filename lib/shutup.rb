require "shutup/version"

module Shutup
  class Rails
    def current_dir
      File.expand_path(File.dirname(__FILE__))
    end

    def pid_file
      "#{current_dir}/tmp/pids/server.pid"
    end

    def pid
      begin
        File.read(pid_file)
      rescue => e
        e.message << ' Are you sure that the process is running?'
        raise(e)
      end
    end

    def hit!
      if pid
        system "kill -9 #{pid}"
        puts "Killed process id: #{pid}"
      else
        "File #{pid_file} does not exist, unable to find Rails process"
      end
    end
  end
end
