require 'irb/completion'
IRB.conf[:AUTO_INDENT]=true

# Save History between irb sessions
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# Load the readline module.
IRB.conf[:USE_READLINE] = true

# Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:PROMPT_MODE]  = :SIMPLE

# Clear the screen
def clear!
  system 'clear'
  if ENV['RAILS_ENV']
    return "Rails environment: " + ENV['RAILS_ENV']
  end
end

if defined?(::Rails)
  require "logger"
  Rails.logger = Logger.new(STDOUT)
  def c!
    clear!
    "Rails environment: " + ::Rails.env
  end

  def r!
    reload!
  end
end
