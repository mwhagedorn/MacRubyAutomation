set proxyServer to "web-proxy.houston.hp.com"
set proxyPort to "8080"

tell application "System Preferences"
 activate
end tell
tell application "System Events"
 get properties
 tell process "System Preferences"
  click menu item "Network" of menu "View" of menu bar 1
  delay 2
  tell window "Network"
   tell group 1
    tell tab group 1
     click radio button "Proxies"
     tell group 1
      if value of static text 1 of window "Network" of process ¬
      "System Preferences" of application "System Events" is ¬
      "Click the lock to make changes." then click button 4 of ¬
      window "Network" of process "System Preferences" of ¬
      application "System Events"
                                              
      click check box "Web Proxy (HTTP)"
      if value of check box "Web Proxy (HTTP)" is 1 then
       set outStr to "Turned Proxy ON " & return & ¬
       "(set to '" & proxyServer & ":" & proxyPort & "')"
      else
       set outStr to "Turned Proxy OFF"
      end if
                                               
      set value of text field 10 to proxyServer
      set value of text field 11 to proxyPort
     end tell
    end tell
   end tell
   click button "Apply Now"
  end tell
 end tell
end tell

ignoring application responses
 tell application "System Preferences" to quit
end ignoring

display dialog outStr buttons {"Ok"} giving up after 2