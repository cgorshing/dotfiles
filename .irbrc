# http://lucapette.com/irb/why-you-should-spend-some-time-configuring-irb/

require 'irb/completion'
require 'irb/ext/save-history'

# where history is saved
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
# how many lines to save
IRB.conf[:SAVE_HISTORY] = 1000
