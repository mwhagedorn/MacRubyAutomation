#!/usr/local/bin/macruby
framework 'Foundation'
framework 'ScriptingBridge'

class SBElementArray
    def [](value)
          self.objectWithName(value)
    end
end


@of  = SBApplication.applicationWithBundleIdentifier("com.omnigroup.Omnifocus")

#@of.activate
@doc = @of.defaultDocument

inbox_tasks = @doc.inboxTasks

@results = inbox_tasks.filteredArrayUsingPredicate(NSPredicate.predicateWithFormat("completed == false"))

puts @results.count
