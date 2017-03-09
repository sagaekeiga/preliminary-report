worker_processes 2
working_directory "/home/anime/preliminary/current"

timeout 3600

listen "/var/run/unicorn/unicorn_preliminary.sock"
pid "/var/run/unicorn/unicornpreliminary.pid"


stderr_path "/home/anime/preliminary/current/log/unicorn.log"
stdout_path "/home/anime/preliminary/current/log/unicorn.log"


preload_app true