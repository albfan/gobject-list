# hello-world vala example

A program that creates some MyObject class to demonstrate gobject-list

## Usage

Program terminated with signal SIGUSR2, User defined signal 2.
The program no longer exists.

### Build and install gobject-list

```
cd gobject-list
meson --prefix /usr build
ninja -C build
sudo ninja -C build install
```

### build this 

```
meson build
ninja -C build
```

### Run 
```
LD_PRELOAD=/usr/lib/libgobject-list.so build/src/hello-world
 ++ Created object 0x555555566a20, MyObject
 ++ Created object 0x555555566a50, MyObject
[New Thread 0x7ffff7838700 (LWP 38096)]
 ++ Created object 0x55555556b830, GTask
 ++ Created object 0x555555566b40, MyObject
 ++ Created object 0x555555566b70, MyObject
This is project hello-world.
Object prop hello.
 -- Finalized object 0x555555566b70, MyObject
 -- Finalized object 0x555555566b40, MyObject
 ++ Created object 0x555555566ba0, MyObject
 ++ Created object 0x555555567a10, MyObject
This is project hello-world.
Object prop hello.
 -- Finalized object 0x555555567a10, MyObject
 -- Finalized object 0x555555566ba0, MyObject
 ++ Created object 0x555555567a40, MyObject
 ++ Created object 0x555555567a70, MyObject
This is project hello-world.
Object prop hello.
```

### Run with gdb

```
$ GOBJECT_LIST_DISPLAY=none LD_PRELOAD=/usr/lib/libgobject-list.so gdb build/src/hello_world  
...
Reading symbols from build/src/hello_world...
(gdb) run
Starting program: /home/alberto/projects/c/gobject-list/examples/hello-world/build/src/hello_world 
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/usr/lib/libthread_db.so.1".
[New Thread 0x7ffff7838700 (LWP 39085)]
This is project hello-world.
Object prop hello.
This is project hello-world.
Object prop hello.
This is project hello-world.
Object prop hello.
^C
Thread 1 "hello_world" received signal SIGINT, Interrupt.
0x00007ffff7b26abf in poll () from /usr/lib/libc.so.6
(gdb) signal SIGUSR1
Continuing with signal SIGUSR1.
Living Objects:
 - 0x555555566a50, MyObject: 1 refs
 - 0x55555556b830, GTask: 1 refs
 - 0x555555566a20, MyObject: 1 refs
3 objects
This is project hello-world.
Object prop hello.
This is project hello-world.
Object prop hello.
^C
Thread 1 "hello_world" received signal SIGINT, Interrupt.
0x00007ffff7b26abf in poll () from /usr/lib/libc.so.6
(gdb) bt
#0  0x00007ffff7b26abf in poll () at /usr/lib/libc.so.6
#1  0x00007ffff7e777a0 in  () at /usr/lib/libglib-2.0.so.0
#2  0x00007ffff7e78843 in g_main_loop_run () at /usr/lib/libglib-2.0.so.0
#3  0x0000555555555a09 in _vala_main (args=0x7fffffffcfd8, args_length1=1)
    at ../src/hello_world.vala:16
#4  0x0000555555555a86 in main (argc=1, argv=0x7fffffffcfd8)
    at ../src/hello_world.vala:5
(gdb) info locals
No symbol table info available.
(gdb) up
#1  0x00007ffff7e777a0 in ?? () from /usr/lib/libglib-2.0.so.0
(gdb) info locals
No symbol table info available.
(gdb) up
#2  0x00007ffff7e78843 in g_main_loop_run () from /usr/lib/libglib-2.0.so.0
(gdb) info locals
No symbol table info available.
(gdb) up
#3  0x0000555555555a09 in _vala_main (args=0x7fffffffcfd8, args_length1=1)
    at ../src/hello_world.vala:16
16	  loop.run ();
(gdb) info locals
myo = 0x555555566a20
_tmp1_ = 0x555555566a20
_tmp2_ = 0x555555566a20
myo2 = 0x555555566a50
_tmp3_ = 0x555555566a50
_tmp4_ = 0x555555566a50
loop = 0x555555566eb0
_tmp5_ = 0x555555566eb0
_tmp6_ = 0x555555566eb0
result = 0
(gdb) print myo
$4 = 0x555555566a20
(gdb) print myo2
$5 = 0x555555566a50
$9 = {_myprop = 0x555555566d20 "bye"}
```

