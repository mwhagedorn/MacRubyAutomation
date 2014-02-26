#!/usr/local/bin/macruby

framework 'Foundation'
framework "ScriptingBridge"

@sys_events = SBApplication.applicationWithBundleIdentifier("com.apple.systemevents")
@skype = SBApplication.applicationWithBundleIdentifier("com.skype.skype")
@skype.activate()

SCRIPT_NAME = "MacRubySkypeDialer"

class SBElementArray
  def [](value)
    self.objectWithName(value)
  end
end

#get the running skype process
@skype_process = @sys_events.processes["Skype"]

def wait_for_ready
  status = "COMMAND_PENDING"
  while status == "COMMAND_PENDING"
    status = @skype.sendCommand("GET USERSTATUS", :scriptName => SCRIPT_NAME)
    if status ==  "COMMAND_PENDING"
        dismiss_skype_api_security
    end
    #TODO how to get the results of sendCommand
    puts status
    sleep 0.5
  end
end

def dismiss_skype_api_security
  if(@skype_process.windows["Skype API Security"])
    window = @skype_process.windows["Skype API Security"]
    allow_button = window.radioGroups.first.radioButtons["Allow this application to use Skype"]
    allow_button.click()
    sleep 0.2
    window.buttons["OK"].click()
  end
end


wait_for_ready()
puts "ready"
