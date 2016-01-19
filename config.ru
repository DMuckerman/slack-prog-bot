$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'slack-prog'
require 'web'

Thread.new do
  begin
    SlackProg::App.instance.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackProg::Web
