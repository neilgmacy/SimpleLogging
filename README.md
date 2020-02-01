# SimpleLogger

SimpleLogger is a small utility for Swift apps that adds a little more customisation to a basic `print` statement.

## Usage

Just import `SimpleLogger` in the the file where you want to use it, and call `Log.print`:

```
import SimpleLogger

func someMethod {
    Log.print("Hello world!", level: .info)
}
```

The `level` parameter is optional, and by default is set to  `.debug`. This will output as below:

```
2020-02-01 11:31:14 ℹ️ [INFO]: Hello world!
```

## Configuration

It's best to set these at an entry point or global configuration point in your app, such as in your AppDelegate.

### Minimum logging level

You can set a minimum level to filter out noise. By default this is set to `.verbose`, meaning all statements will be logged. You can change that easily:

```
SimpleLogger.minimumLevel = .info
```

### File Locations

You can record in which file and function the print statement took place. This is turned off by default, but is easy to turn on:

```
SimpleLogger.logFileAndFunction = true
```

This will add `at File: method` to the end of your print statements, giving output such as:

```
2020-02-01 11:31:14 👨‍💻 [DEBUG]: configuring tabs at SceneDelegate: configureTabs()
```
