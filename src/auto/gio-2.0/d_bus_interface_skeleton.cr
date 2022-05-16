require "../g_object-2.0/object"
require "./d_bus_interface"

module Gio
  # Abstract base class for D-Bus interfaces on the service side.
  @[GObject::GeneratedWrapper]
  class DBusInterfaceSkeleton < GObject::Object
    include DBusInterface

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::DBusInterfaceSkeletonClass), class_init,
        sizeof(LibGio::DBusInterfaceSkeleton), instance_init, 0)
    end

    GICrystal.define_new_method(DBusInterfaceSkeleton, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DBusInterfaceSkeleton`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, g_flags : Gio::DBusInterfaceSkeletonFlags? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !g_flags.nil?
        (_names.to_unsafe + _n).value = "g-flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_flags)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusInterfaceSkeleton.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_interface_skeleton_get_type
    end

    def g_flags=(value : Gio::DBusInterfaceSkeletonFlags) : Gio::DBusInterfaceSkeletonFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "g-flags", unsafe_value, Pointer(Void).null)
      value
    end

    def g_flags : Gio::DBusInterfaceSkeletonFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "g-flags", pointerof(value), Pointer(Void).null)
      Gio::DBusInterfaceSkeletonFlags.new(value)
    end

    # Exports @interface_ at @object_path on @connection.
    #
    # This can be called multiple times to export the same @interface_
    # onto multiple connections however the @object_path provided must be
    # the same for all connections.
    #
    # Use g_dbus_interface_skeleton_unexport() to unexport the object.
    def export(connection : Gio::DBusConnection, object_path : ::String) : Bool
      # g_dbus_interface_skeleton_export: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_interface_skeleton_export(@pointer, connection, object_path, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # If @interface_ has outstanding changes, request for these changes to be
    # emitted immediately.
    #
    # For example, an exported D-Bus interface may queue up property
    # changes and emit the
    # `org.freedesktop.DBus.Properties.PropertiesChanged`
    # signal later (e.g. in an idle handler). This technique is useful
    # for collapsing multiple property changes into one.
    def flush : Nil
      # g_dbus_interface_skeleton_flush: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_interface_skeleton_flush(@pointer)

      # Return value handling
    end

    # Gets the first connection that @interface_ is exported on, if any.
    def connection : Gio::DBusConnection?
      # g_dbus_interface_skeleton_get_connection: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_interface_skeleton_get_connection(@pointer)

      # Return value handling

      Gio::DBusConnection.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets a list of the connections that @interface_ is exported on.
    def connections : GLib::List
      # g_dbus_interface_skeleton_get_connections: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_interface_skeleton_get_connections(@pointer)

      # Return value handling

      GLib::List(Gio::DBusConnection).new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the #GDBusInterfaceSkeletonFlags that describes what the behavior
    # of @interface_
    def flags : Gio::DBusInterfaceSkeletonFlags
      # g_dbus_interface_skeleton_get_flags: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_interface_skeleton_get_flags(@pointer)

      # Return value handling

      Gio::DBusInterfaceSkeletonFlags.new(_retval)
    end

    # Gets D-Bus introspection information for the D-Bus interface
    # implemented by @interface_.
    def info : Gio::DBusInterfaceInfo
      # g_dbus_interface_skeleton_get_info: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_interface_skeleton_get_info(@pointer)

      # Return value handling

      Gio::DBusInterfaceInfo.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the object path that @interface_ is exported on, if any.
    def object_path : ::String?
      # g_dbus_interface_skeleton_get_object_path: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_interface_skeleton_get_object_path(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets all D-Bus properties for @interface_.
    def properties : GLib::Variant
      # g_dbus_interface_skeleton_get_properties: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_interface_skeleton_get_properties(@pointer)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Checks if @interface_ is exported on @connection.
    def has_connection(connection : Gio::DBusConnection) : Bool
      # g_dbus_interface_skeleton_has_connection: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_interface_skeleton_has_connection(@pointer, connection)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets flags describing what the behavior of @skeleton should be.
    def flags=(flags : Gio::DBusInterfaceSkeletonFlags) : Nil
      # g_dbus_interface_skeleton_set_flags: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_interface_skeleton_set_flags(@pointer, flags)

      # Return value handling
    end

    # Stops exporting @interface_ on all connections it is exported on.
    #
    # To unexport @interface_ from only a single connection, use
    # g_dbus_interface_skeleton_unexport_from_connection()
    def unexport : Nil
      # g_dbus_interface_skeleton_unexport: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_interface_skeleton_unexport(@pointer)

      # Return value handling
    end

    # Stops exporting @interface_ on @connection.
    #
    # To stop exporting on all connections the interface is exported on,
    # use g_dbus_interface_skeleton_unexport().
    def unexport_from_connection(connection : Gio::DBusConnection) : Nil
      # g_dbus_interface_skeleton_unexport_from_connection: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_interface_skeleton_unexport_from_connection(@pointer, connection)

      # Return value handling
    end

    # Emitted when a method is invoked by a remote caller and used to
    # determine if the method call is authorized.
    #
    # Note that this signal is emitted in a thread dedicated to
    # handling the method call so handlers are allowed to perform
    # blocking IO. This means that it is appropriate to call e.g.
    # [polkit_authority_check_authorization_sync()](http://hal.freedesktop.org/docs/polkit/PolkitAuthority.html#polkit-authority-check-authorization-sync)
    # with the
    # [POLKIT_CHECK_AUTHORIZATION_FLAGS_ALLOW_USER_INTERACTION](http://hal.freedesktop.org/docs/polkit/PolkitAuthority.html#POLKIT-CHECK-AUTHORIZATION-FLAGS-ALLOW-USER-INTERACTION:CAPS)
    # flag set.
    #
    # If %FALSE is returned then no further handlers are run and the
    # signal handler must take a reference to @invocation and finish
    # handling the call (e.g. return an error via
    # g_dbus_method_invocation_return_error()).
    #
    # Otherwise, if %TRUE is returned, signal emission continues. If no
    # handlers return %FALSE, then the method is dispatched. If
    # @interface has an enclosing #GDBusObjectSkeleton, then the
    # #GDBusObjectSkeleton::authorize-method signal handlers run before
    # the handlers for this signal.
    #
    # The default class handler just returns %TRUE.
    #
    # Please note that the common case is optimized: if no signals
    # handlers are connected and the default class handler isn't
    # overridden (for both @interface and the enclosing
    # #GDBusObjectSkeleton, if any) and #GDBusInterfaceSkeleton:g-flags does
    # not have the
    # %G_DBUS_INTERFACE_SKELETON_FLAGS_HANDLE_METHOD_INVOCATIONS_IN_THREAD
    # flags set, no dedicated thread is ever used and the call will be
    # handled in the same thread as the object that @interface belongs
    # to was exported in.
    struct GAuthorizeMethodSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "g-authorize-method::#{@detail}" : "g-authorize-method"
      end

      def connect(&block : Proc(Gio::DBusMethodInvocation, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::DBusMethodInvocation, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gio::DBusMethodInvocation, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(invocation)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusMethodInvocation, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(invocation)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusInterfaceSkeleton.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(_sender, invocation)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusInterfaceSkeleton.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(_sender, invocation)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(invocation : Gio::DBusMethodInvocation) : Nil
        LibGObject.g_signal_emit_by_name(@source, "g-authorize-method", invocation)
      end
    end

    def g_authorize_method_signal
      GAuthorizeMethodSignal.new(self)
    end
  end
end
