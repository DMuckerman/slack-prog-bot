# coding: utf-8
module SlackMathbot
  module Commands
    class Ruby < SlackRubyBot::Commands::Base
      match /\!ruby(?<code>.*)$/ do |client, _data, _match|

        # Strip code out of triple backtick block
        command = _data.text.split("```").drop(1)[0]
        # Combine all lines of code into a single string
        #command.gsub! "\n", ";" # May be unnessecary

        # Debug print code to be run
        puts command

        #command.gsub! "puts", ""
        #command.gsub! "print", ""

        # If someone (Ryan decides to be an asshat)
        if (command.include? "while true") || (command.include? "while 1")
          result = "Fuck off, Ryan!"
        else # Otherwise, eval the cod
          result = eval(command).to_s.chomp.strip
          result = eval("begin $stdout = StringIO.new; #{command}; $stdout.string;
ensure $stdout = STDOUT end")
        end

        # Debug print the result
        puts result

        client.say(text: "```" + result + "```", channel: _data.channel)
        
      end
    end
  end
end
