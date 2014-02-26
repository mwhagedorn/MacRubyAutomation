#!/usr/local/bin/macruby
framework 'Foundation'
framework 'ScriptingBridge'


@airport = SBApplication.applicationWithBundleIdentifier("com.apple.airport.airportutility")

@airport.activate

sys_events = SBApplication.applicationWithBundleIdentifier("com.apple.systemevents")


class SBElementArray
  def [](value)
    self.objectWithName(value)
  end
  def second
    self.objectAtIndex(1)
  end
end


#get the running system preferences process
@airport_process = sys_events.processes["Airport Utility"]


#select the Sound preference app
def select_sound_preference_window(process)
  view_menu = process.menuBars.first.menus["View"]
  sound_item = view_menu.menuItems["Sound"]
  sound_item.clickAt(sound_item.position())
end

def select_internet_window(process)
	@airport.standard_window
end


puts @airport


