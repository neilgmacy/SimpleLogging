# SimpleLogging

`SimpleLogging` is a small utility for Swift apps that adds a little more customisation to a basic `print` statement. You can log at different priority levels, and each level has an emoji to allow for better visual scanning of logs.

## Usage

Just import `SimpleLogging` in the the file where you want to use it, and call `Log.print`:

```swift
import SimpleLogging

func someMethod {
    Log.print("Hello world!", level: .info)
}
```

This will output as below:

```
2020-02-01 11:31:14 ℹ️ [INFO]: Hello world!
```

The `level` parameter is optional, and by default is set to  `.debug`. 

## Levels

SimpleLogging has five logging levels. From lowest to highest, they are: 

1.  `verbose` 💬
2. `debug` 👨‍💻
3. `info` ℹ️
4. `warn` ⚠️
5. `error` 🛑

## Configuration Properties

`SimpleLogging` supports some static configuration properties. It's best to set these properties at an entry point or global configuration point in your app, such as in your AppDelegate.

### Minimum logging level

You can set a minimum level to filter out noise. By default this is set to `.verbose`, meaning all statements will be logged. You can change that easily, for example:

```swift
SimpleLogging.minimumLevel = .warn
```

When the minimum level is `warn`, any `verbose`, `debug` or `info` statements will be ignored, meaning you only see messages that you have marked as higher priority.

### File and Function of call site

You can record in which file and function the print statement took place. This is turned off by default, but is easy to turn on:

```swift
SimpleLogging.logFileAndFunction = true
```

This will add `at File: method` to the end of your print statements, giving output such as:

```
2020-02-01 11:31:14 👨‍💻 [DEBUG]: configuring tabs at SceneDelegate: configureTabs()
```
