# coding: utf-8
module SlackMathbot
  module Commands
    class Ruby < SlackRubyBot::Commands::Base
      match /\!ruby(?<code>.*)$/ do |client, _data, _match|

        puts _match[:code]

      end
    end
  end
 end
