require "../g_object-2.0/object"

module Gio
  # A helper class for testing code which uses D-Bus without touching the user's
  # session bus.
  #
  # Note that #GTestDBus modifies the user’s environment, calling setenv().
  # This is not thread-safe, so all #GTestDBus calls should be completed before
  # threads are spawned, or should have appropriate locking to ensure no access
  # conflicts to environment variables shared between #GTestDBus and other
  # threads.
  #
  # ## Creating unit tests using GTestDBus
  #
  # Testing of D-Bus services can be tricky because normally we only ever run
  # D-Bus services over an existing instance of the D-Bus daemon thus we
  # usually don't activate D-Bus services that are not yet installed into the
  # target system. The #GTestDBus object makes this easier for us by taking care
  # of the lower level tasks such as running a private D-Bus daemon and looking
  # up uninstalled services in customizable locations, typically in your source
  # code tree.
  #
  # The first thing you will need is a separate service description file for the
  # D-Bus daemon. Typically a `services` subdirectory of your `tests` directory
  # is a good place to put this file.
  #
  # The service file should list your service along with an absolute path to the
  # uninstalled service executable in your source tree. Using autotools we would
  # achieve this by adding a file such as `my-server.service.in` in the services
  # directory and have it processed by configure.
  # |[
  #     [D-BUS Service]
  #     Name=org.gtk.GDBus.Examples.ObjectManager
  #     Exec=@abs_top_builddir@/gio/tests/gdbus-example-objectmanager-server
  # ]|
  # You will also need to indicate this service directory in your test
  # fixtures, so you will need to pass the path while compiling your
  # test cases. Typically this is done with autotools with an added
  # preprocessor flag specified to compile your tests such as:
  # |[
  #     -DTEST_SERVICES=\""$(abs_top_builddir)/tests/services"\"
  # ]|
  #     Once you have a service definition file which is local to your source tree,
  # you can proceed to set up a GTest fixture using the #GTestDBus scaffolding.
  #
  # An example of a test fixture for D-Bus services can be found
  # here:
  # [gdbus-test-fixture.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-test-fixture.c)
  #
  # Note that these examples only deal with isolating the D-Bus aspect of your
  # service. To successfully run isolated unit tests on your service you may need
  # some additional modifications to your test case fixture. For example; if your
  # service uses GSettings and installs a schema then it is important that your test service
  # not load the schema in the ordinary installed location (chances are that your service
  # and schema files are not yet installed, or worse; there is an older version of the
  # schema file sitting in the install location).
  #
  # Most of the time we can work around these obstacles using the
  # environment. Since the environment is inherited by the D-Bus daemon
  # created by #GTestDBus and then in turn inherited by any services the
  # D-Bus daemon activates, using the setup routine for your fixture is
  # a practical place to help sandbox your runtime environment. For the
  # rather typical GSettings case we can work around this by setting
  # `GSETTINGS_SCHEMA_DIR` to the in tree directory holding your schemas
  # in the above fixture_setup() routine.
  #
  # The GSettings schemas need to be locally pre-compiled for this to work. This can be achieved
  # by compiling the schemas locally as a step before running test cases, an autotools setup might
  # do the following in the directory holding schemas:
  # |[
  #     all-am:
  #             $(GLIB_COMPILE_SCHEMAS) .
  #
  #     CLEANFILES += gschemas.compiled
  # ]|
  class TestDBus < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, flags : Gio::TestDBusFlags? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if flags
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TestDBus.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_test_dbus_get_type
    end

    def flags=(value : Gio::TestDBusFlags) : Gio::TestDBusFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    def flags : Gio::TestDBusFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "flags", pointerof(value), Pointer(Void).null)
      Gio::TestDBusFlags.from_value(value)
    end

    def initialize(flags : Gio::TestDBusFlags)
      # g_test_dbus_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_test_dbus_new(flags)
      @pointer = _retval
    end

    def self.unset : Nil
      # g_test_dbus_unset: (None)
      # Returns: (transfer none)

      LibGio.g_test_dbus_unset
    end

    def add_service_dir(path : ::String) : Nil
      # g_test_dbus_add_service_dir: (Method)
      # Returns: (transfer none)

      LibGio.g_test_dbus_add_service_dir(self, path)
    end

    def down : Nil
      # g_test_dbus_down: (Method)
      # Returns: (transfer none)

      LibGio.g_test_dbus_down(self)
    end

    def bus_address : ::String?
      # g_test_dbus_get_bus_address: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_test_dbus_get_bus_address(self)
      ::String.new(_retval) unless _retval.null?
    end

    def flags : Gio::TestDBusFlags
      # g_test_dbus_get_flags: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_test_dbus_get_flags(self)
      Gio::TestDBusFlags.from_value(_retval)
    end

    def stop : Nil
      # g_test_dbus_stop: (Method)
      # Returns: (transfer none)

      LibGio.g_test_dbus_stop(self)
    end

    def up : Nil
      # g_test_dbus_up: (Method)
      # Returns: (transfer none)

      LibGio.g_test_dbus_up(self)
    end
  end
end
