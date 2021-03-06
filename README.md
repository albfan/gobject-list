# gobject-list

A simple `LD_PRELOAD` library for tracking the lifetime of GObjects. When loaded into an application, it prints a list of living GObjects on exiting the application (unless the application crashes), and also prints reference count data when it changes. `SIGUSR1` or `SIGUSR2` can be sent to the application to trigger printing of more information.

## Usage

```
LD_PRELOAD=/path/to/libgobject-list.so /path/to/my-app
kill -SIGUSR1 `pidof my-app`  # print a list of currently alive objects
kill -SIGUSR2 `pidof my-app`  # create a checkpoint and print a list of objects created and destroyed since the previous checkpoint
```

If running your application within a debugger, you can list the currently alive objects at any point by manually sending the SIGUSR1 signal. e.g. In gdb:

```
handle SIGUSR1 nostop  # do this once, at startup
signal SIGUSR1
```

## Environment variables

The following environment variables may be set to affect the output printed by gobject-list.

- `GOBJECT_LIST_DISPLAY`:
	Comma-separated list of types of messages to print. The list may
	contain:
	 - `none`: Display no messages unless `SIGUSR1` or `SIGUSR2` are received, or the application exits.
	 - `create`: Print information about newly created objects as they’re created.
	 - `refs`: Print information about every reference increment and decrement on objects.
	 - `backtrace`: Include backtraces with every printed message.
	 - `tracerefs`: At exit, for each object still alive, print a call tree.
	 - `all`: All of the above.

- `GOBJECT_LIST_FILTER`:
	Comma-separated list of object types to print messages about. If this is unset, messages will be printed for all object types. Otherwise, they will only be printed for the specified camel-case object types.

- `GOBJECT_PROPAGATE_LD_PRELOAD`:
	By default, the `LD_PRELOAD` environment variable is unset after gobject-list finishes loading.
