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
  @[GObject::GeneratedWrapper]
  class TestDBus < GObject::Object
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(TestDBus, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TestDBus`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, flags : Gio::TestDBusFlags? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !flags.nil?
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TestDBus.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gio::TestDBusFlags.new(value)
    end

    # Create a new #GTestDBus object.
    def self.new(flags : Gio::TestDBusFlags) : self
      # g_test_dbus_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_test_dbus_new(flags)

      # Return value handling

      Gio::TestDBus.new(_retval, GICrystal::Transfer::Full)
    end

    # Unset DISPLAY and DBUS_SESSION_BUS_ADDRESS env variables to ensure the test
    # won't use user's session bus.
    #
    # This is useful for unit tests that want to verify behaviour when no session
    # bus is running. It is not necessary to call this if unit test already calls
    # g_test_dbus_up() before acquiring the session bus.
    def self.unset : Nil
      # g_test_dbus_unset: (None)
      # Returns: (transfer none)

      # C call
      LibGio.g_test_dbus_unset

      # Return value handling
    end

    # Add a path where dbus-daemon will look up .service files. This can't be
    # called after g_test_dbus_up().
    def add_service_dir(path : ::String) : Nil
      # g_test_dbus_add_service_dir: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_test_dbus_add_service_dir(@pointer, path)

      # Return value handling
    end

    # Stop the session bus started by g_test_dbus_up().
    #
    # This will wait for the singleton returned by g_bus_get() or g_bus_get_sync()
    # to be destroyed. This is done to ensure that the next unit test won't get a
    # leaked singleton from this test.
    def down : Nil
      # g_test_dbus_down: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_test_dbus_down(@pointer)

      # Return value handling
    end

    # Get the address on which dbus-daemon is running. If g_test_dbus_up() has not
    # been called yet, %NULL is returned. This can be used with
    # g_dbus_connection_new_for_address().
    def bus_address : ::String?
      # g_test_dbus_get_bus_address: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_test_dbus_get_bus_address(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Get the flags of the #GTestDBus object.
    def flags : Gio::TestDBusFlags
      # g_test_dbus_get_flags: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_test_dbus_get_flags(@pointer)

      # Return value handling

      Gio::TestDBusFlags.new(_retval)
    end

    # Stop the session bus started by g_test_dbus_up().
    #
    # Unlike g_test_dbus_down(), this won't verify the #GDBusConnection
    # singleton returned by g_bus_get() or g_bus_get_sync() is destroyed. Unit
    # tests wanting to verify behaviour after the session bus has been stopped
    # can use this function but should still call g_test_dbus_down() when done.
    def stop : Nil
      # g_test_dbus_stop: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_test_dbus_stop(@pointer)

      # Return value handling
    end

    # Start a dbus-daemon instance and set DBUS_SESSION_BUS_ADDRESS. After this
    # call, it is safe for unit tests to start sending messages on the session bus.
    #
    # If this function is called from setup callback of g_test_add(),
    # g_test_dbus_down() must be called in its teardown callback.
    #
    # If this function is called from unit test's main(), then g_test_dbus_down()
    # must be called after g_test_run().
    def up : Nil
      # g_test_dbus_up: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_test_dbus_up(@pointer)

      # Return value handling
    end
  end
end
