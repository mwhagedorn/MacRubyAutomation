framework 'Cocoa'
framework 'Foundation'
 
class NotificationHandler
    def handle(notification)
          puts "*** new notification ***"
          puts notification.name
          puts notification.object.inspect
          puts notification.userInfo.inspect
    end
end
 
center = NSDistributedNotificationCenter.defaultCenter
center.addObserver(NotificationHandler.new, selector:'handle:', name:nil, object:nil)
 
NSApplication.sharedApplication
NSApp.run
