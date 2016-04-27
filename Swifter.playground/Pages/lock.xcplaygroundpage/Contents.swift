
import Foundation

func myMethod(anObj: AnyObject!) {
    objc_sync_enter(anObj)
    
    // 在 enter 和 exit 之间 anObj 不会被其他线程改变
    
    objc_sync_exit(anObj)
}

func synchronized(lock: AnyObject, closure: () -> ()) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}

func myMethodLocked(anObj: AnyObject!) {
    synchronized(anObj) {
        // 在括号内 anObj 不会被其他线程改变
    }
}
