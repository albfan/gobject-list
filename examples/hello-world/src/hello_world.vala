class MyObject: Object {
    public string myprop {get; set;}
}

public static int main (string[] args) {
  if(args.length != 1) {
    print("%s takes no arguments.\n", args[0]);
    return 1;
  }
  var myo = new MyObject();
  myo.myprop = "bye";
  var myo2 = new MyObject();
  myo2.myprop = "chao";
  GLib.MainLoop loop = new GLib.MainLoop ();
  do_stuff.begin ();
  loop.run ();

  return 0;
}

private async void do_stuff () {
  GLib.Timeout.add (1000, () => {
    string PROJECT_NAME = "hello-world";

    var myo = new MyObject();
    myo.myprop = "hello";
    var myo2 = new MyObject();
    myo2.myprop = "hola";
    print("This is project %s.\n", PROJECT_NAME);
    print("Object prop %s.\n", myo.myprop);
    return true;
  }, GLib.Priority.DEFAULT);
  yield;
}

