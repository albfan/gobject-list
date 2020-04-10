glib_dep = dependency('glib-2.0')
gobject_dep = dependency('gobject-2.0')
gio_dep = dependency('gio-2.0')

exe = executable('hello_world', 'hello_world.vala',
  install : true,
  dependencies: [glib_dep, gobject_dep, gio_dep])

test('basic', exe)
