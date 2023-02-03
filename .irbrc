# http://lucapette.com/irb/why-you-should-spend-some-time-configuring-irb/
# https://nts.strzibny.name/improving-irb-with-custom-irbrc/

require 'irb'
require 'irb/completion'
require 'irb/ext/save-history'

# where history is saved
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
# how many lines to save
IRB.conf[:SAVE_HISTORY] = 1000

# https://twitter.com/clarkware/status/1489660147630755841
IRB.conf[:ECHO_ON_ASSIGNMENT] = true


IRB.conf[:PROMPT][:MY_PROMPT] = { # name of prompt mode
  :AUTO_INDENT => true,           # enables auto-indent mode
  :PROMPT_I =>  ">> ",            # simple prompt
  :PROMPT_S => nil,               # prompt for continuated strings
  :PROMPT_C => nil,               # prompt for continuated statement
  :RETURN => "    ==>%s\n"        # format to return value
}

IRB.conf[:PROMPT_MODE] = :MY_PROMPT


# IRB.conf[:IRB_NAME]="irb"
# IRB.conf[:MATH_MODE]=false
# IRB.conf[:INSPECT_MODE]=nil
# IRB.conf[:IRB_RC] = nil
# IRB.conf[:BACK_TRACE_LIMIT]=16
# IRB.conf[:USE_LOADER] = false
# IRB.conf[:USE_READLINE] = nil
# IRB.conf[:USE_TRACER] = false
# IRB.conf[:IGNORE_SIGINT] = true
# IRB.conf[:IGNORE_EOF] = false
# IRB.conf[:PROMPT_MODE] = :DEFAULT
# IRB.conf[:PROMPT] = {...}
# IRB.conf[:DEBUG_LEVEL]=0
