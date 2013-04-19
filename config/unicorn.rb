worker_processes 2

project_dir = "/home/apps/rails101_forum/current"
working_directory project_dir

stderr_path "#{project_dir}/log/unicorn.err.log"
stdout_path "#{project_dir}/log/unicorn.out.log"
pid "#{project_dir}/tmp/pids/unicorn.pid"

listen "/home/apps/rails101_forum/shared/sockets/unicorn.sock"
