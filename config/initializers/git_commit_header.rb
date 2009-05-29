# Rack middleware to insert git commit id into http response header
# For Rails, put this script under RAILS_ROOT/config/initializers

require 'open3'
module Rack
  class GitCommitHeader
    def initialize(app)
      @app = app
      str = git_rev_parse_head
      @commit = verify_sha1_string(str)
    rescue
      nil
    end

    def call(env)
      status, headers, body = @app.call(env)
      headers['X-Git-Commit'] = @commit if @commit
      [status, headers, body]
    end

    private
    def git_rev_parse_head
      commit = nil
      Open3.popen3('git rev-parse HEAD') do |stdin, stdout, stderr|
        commit = stdout.gets.chomp
      end
      commit
    end

    def verify_sha1_string(str)
      str && (str =~ /^[0-9a-f]{40}$/) ? str : nil
    end
  end
end
ActionController::Dispatcher.middleware.use Rack::GitCommitHeader rescue nil
