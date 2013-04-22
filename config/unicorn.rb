worker_processes 2

project_dir = "/home/apps/rails101_forum/current"
working_directory project_dir

stderr_path "#{project_dir}/log/unicorn.err.log"
stdout_path "#{project_dir}/log/unicorn.out.log"
pid "#{project_dir}/tmp/pids/unicorn.pid"

listen "/home/apps/rails101_forum/shared/sockets/unicorn.sock"

preload_app true

#garbage collection(GC module)
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

check_client_connection true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
