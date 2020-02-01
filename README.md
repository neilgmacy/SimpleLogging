# SimpleLogger

To use log, just import tools in the AppDelegate and globally define an object called `log`:
```
import UIKit
import tools

let log = Log.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    ...
}
```

set a minimum level to filter out noise:
```
SimpleLogger.minimumLevel = .info
```
