#!/usr/local/bin/macruby
framework 'Foundation'
framework "ScriptingBridge"

@sys_prefs = SBApplication.applicationWithBundleIdentifier("com.apple.systempreferences")
@sys_prefs.activate()

sys_events = SBApplication.applicationWithBundleIdentifier("com.apple.systemevents")

class SBElementArray
  def [](value)
    self.objectWithName(value)
  end
end

#get the running system preferences process
@pref_process = sys_events.processes["System Preferences"]

#select the Sound preference app
def select_sound_preference_window(process)
  view_menu = process.menuBars.first.menus["View"]
  sound_item = view_menu.menuItems["Sound"]
  sound_item.clickAt(sound_item.position())
end

#input or output
def select_IO_scope_tab(scope)
  sound_window = @pref_process .windows.first
  @tab_group = sound_window.tabGroups.first
  tab =  @tab_group.radioButtons[scope]
  tab.clickAt(tab.position())
end

#Internal microphone, etc
def select_IO_device(io_device_name)
  scroll_area = @tab_group.scrollAreas.first
  outputTable = scroll_area.tables.first
  outputTable.rows.each do |row|
    if row.textFields.first.value.get == io_device_name
      row.selected = "true"
      puts "selecting #{row.textFields.first.value.get}"
      break
    end
  end
end
  
#my_preferred_input_device = "Internal microphone"
my_preferred_input_device = "Jabra PRO 9470"

INPUT_SCOPE = "Input"
OUTPUT_SCOPE = "Output"

#open the system preferences app, sound pane
select_sound_preference_window(@pref_process)
#select Input setup tab
select_IO_scope_tab(INPUT_SCOPE)
#set the device for Input
select_IO_device(my_preferred_input_device)
#select the Output setup tab
select_IO_scope_tab(OUTPUT_SCOPE)
#set the device for Output
select_IO_device(my_preferred_input_device

# from generated file
# enum SystemPreferencesApplicationSavo {
#   SystemPreferencesApplicationSavoAsk = 'ask ' /* Ask the user whether or not to save the file. */,
#   SystemPreferencesApplicationNo = 'no  ' /* Do not save the file. */,
#   SystemPreferencesApplicationYes = 'yes ' /* Save the file. */
# };
@sys_prefs.quitSaving(2)





