module Shutup
  class Server
    class << self
      def current_dir
        File.expand_path(File.dirname('.'))
      end

      def pid_file
        "#{current_dir}/tmp/pids/server.pid"
      end

      def pid
        begin
          File.read(pid_file)
        rescue => e
          puts "Error reading the pid file."
          system "cat #{pid_file}"
        end
      end

      def hit!
        if pid
          system "kill -9 #{pid}"
          puts "Killed process id: #{pid}"
          true
        end
      end

      def delete_pid
        File.delete(pid_file) if File.exist?(pid_file)
      end
    end
  end
end
