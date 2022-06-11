require "../g_object-2.0/object"
require "./debug_controller"

require "./initable"

module Gio
  # #GDebugControllerDBus is an implementation of #GDebugController which exposes
  # debug settings as a D-Bus object.
  #
  # It is a #GInitable object, and will register an object at
  # `/org/gtk/Debugging` on the bus given as
  # #GDebugControllerDBus:connection once it’s initialized. The object will be
  # unregistered when the last reference to the #GDebugControllerDBus is dropped.
  #
  # This D-Bus object can be used by remote processes to enable or disable debug
  # output in this process. Remote processes calling
  # `org.gtk.Debugging.SetDebugEnabled()` will affect the value of
  # #GDebugController:debug-enabled and, by default, g_log_get_debug_enabled().
  # default.
  #
  # By default, all processes will be able to call `SetDebugEnabled()`. If this
  # process is privileged, or might expose sensitive information in its debug
  # output, you may want to restrict the ability to enable debug output to
  # privileged users or processes.
  #
  # One option is to install a D-Bus security policy which restricts access to
  # `SetDebugEnabled()`, installing something like the following in
  # `$datadir/dbus-1/system.d/`:
  # |[<!-- language="XML" -->
  # <?xml version="1.0"?> <!--*-nxml-*-->
  # <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
  #      "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
  # <busconfig>
  #   <policy user="root">
  #     <allow send_destination="com.example.MyService" send_interface="org.gtk.Debugging"/>
  #   </policy>
  #   <policy context="default">
  #     <deny send_destination="com.example.MyService" send_interface="org.gtk.Debugging"/>
  #   </policy>
  # </busconfig>
  # ]|
  #
  # This will prevent the `SetDebugEnabled()` method from being called by all
  # except root. It will not prevent the `DebugEnabled` property from being read,
  # as it’s accessed through the `org.freedesktop.DBus.Properties` interface.
  #
  # Another option is to use polkit to allow or deny requests on a case-by-case
  # basis, allowing for the possibility of dynamic authorisation. To do this,
  # connect to the #GDebugControllerDBus::authorize signal and query polkit in
  # it:
  # |[<!-- language="C" -->
  #   g_autoptr(GError) child_error = NULL;
  #   g_autoptr(GDBusConnection) connection = g_bus_get_sync (G_BUS_TYPE_SYSTEM, NULL, NULL);
  #   gulong debug_controller_authorize_id = 0;
  #
  #   // Set up the debug controller.
  #   debug_controller = G_DEBUG_CONTROLLER (g_debug_controller_dbus_new (priv->connection, NULL, &child_error));
  #   if (debug_controller == NULL)
  #     {
  #       g_error ("Could not register debug controller on bus: %s"),
  #                child_error->message);
  #     }
  #
  #   debug_controller_authorize_id = g_signal_connect (debug_controller,
  #                                                     "authorize",
  #                                                     G_CALLBACK (debug_controller_authorize_cb),
  #                                                     self);
  #
  #   static gboolean
  #   debug_controller_authorize_cb (GDebugControllerDBus  *debug_controller,
  #                                  GDBusMethodInvocation *invocation,
  #                                  gpointer               user_data)
  #   {
  #     g_autoptr(PolkitAuthority) authority = NULL;
  #     g_autoptr(PolkitSubject) subject = NULL;
  #     g_autoptr(PolkitAuthorizationResult) auth_result = NULL;
  #     g_autoptr(GError) local_error = NULL;
  #     GDBusMessage *message;
  #     GDBusMessageFlags message_flags;
  #     PolkitCheckAuthorizationFlags flags = POLKIT_CHECK_AUTHORIZATION_FLAGS_NONE;
  #
  #     message = g_dbus_method_invocation_get_message (invocation);
  #     message_flags = g_dbus_message_get_flags (message);
  #
  #     authority = polkit_authority_get_sync (NULL, &local_error);
  #     if (authority == NULL)
  #       {
  #         g_warning ("Failed to get polkit authority: %s", local_error->message);
  #         return FALSE;
  #       }
  #
  #     if (message_flags & G_DBUS_MESSAGE_FLAGS_ALLOW_INTERACTIVE_AUTHORIZATION)
  #       flags |= POLKIT_CHECK_AUTHORIZATION_FLAGS_ALLOW_USER_INTERACTION;
  #
  #     subject = polkit_system_bus_name_new (g_dbus_method_invocation_get_sender (invocation));
  #
  #     auth_result = polkit_authority_check_authorization_sync (authority,
  #                                                              subject,
  #                                                              "com.example.MyService.set-debug-enabled",
  #                                                              NULL,
  #                                                              flags,
  #                                                              NULL,
  #                                                              &local_error);
  #     if (auth_result == NULL)
  #       {
  #         g_warning ("Failed to get check polkit authorization: %s", local_error->message);
  #         return FALSE;
  #       }
  #
  #     return polkit_authorization_result_get_is_authorized (auth_result);
  #   }
  # ]|
  @[GObject::GeneratedWrapper]
  class DebugControllerDBus < GObject::Object
    include DebugController
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::DebugControllerDBusClass), class_init,
        sizeof(LibGio::DebugControllerDBus), instance_init, 0)
    end

    GICrystal.define_new_method(DebugControllerDBus, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DebugControllerDBus`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, connection : Gio::DBusConnection? = nil, debug_enabled : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !connection.nil?
        (_names.to_unsafe + _n).value = "connection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, connection)
        _n += 1
      end
      if !debug_enabled.nil?
        (_names.to_unsafe + _n).value = "debug-enabled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, debug_enabled)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DebugControllerDBus.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_debug_controller_dbus_get_type
    end

    def connection=(value : Gio::DBusConnection?) : Gio::DBusConnection?
      unsafe_value = value

      LibGObject.g_object_set(self, "connection", unsafe_value, Pointer(Void).null)
      value
    end

    def connection : Gio::DBusConnection?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "connection", pointerof(value), Pointer(Void).null)
      Gio::DBusConnection.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Create a new #GDebugControllerDBus and synchronously initialize it.
    #
    # Initializing the object will export the debug object on @connection. The
    # object will remain registered until the last reference to the
    # #GDebugControllerDBus is dropped.
    #
    # Initialization may fail if registering the object on @connection fails.
    def self.new(connection : Gio::DBusConnection, cancellable : Gio::Cancellable?) : self?
      # g_debug_controller_dbus_new: (Constructor | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_debug_controller_dbus_new(connection, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DebugControllerDBus.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Stop the debug controller, unregistering its object from the bus.
    #
    # Any pending method calls to the object will complete successfully, but new
    # ones will return an error. This method will block until all pending
    # #GDebugControllerDBus::authorize signals have been handled. This is expected
    # to not take long, as it will just be waiting for threads to join. If any
    # #GDebugControllerDBus::authorize signal handlers are still executing in other
    # threads, this will block until after they have returned.
    #
    # This method will be called automatically when the final reference to the
    # #GDebugControllerDBus is dropped. You may want to call it explicitly to know
    # when the controller has been fully removed from the bus, or to break
    # reference count cycles.
    #
    # Calling this method from within a #GDebugControllerDBus::authorize signal
    # handler will cause a deadlock and must not be done.
    def stop : Nil
      # g_debug_controller_dbus_stop: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_debug_controller_dbus_stop(@pointer)

      # Return value handling
    end

    # Emitted when a D-Bus peer is trying to change the debug settings and used
    # to determine if that is authorized.
    #
    # This signal is emitted in a dedicated worker thread, so handlers are
    # allowed to perform blocking I/O. This means that, for example, it is
    # appropriate to call `polkit_authority_check_authorization_sync()` to check
    # authorization using polkit.
    #
    # If %FALSE is returned then no further handlers are run and the request to
    # change the debug settings is rejected.
    #
    # Otherwise, if %TRUE is returned, signal emission continues. If no handlers
    # return %FALSE, then the debug settings are allowed to be changed.
    #
    # Signal handlers must not modify @invocation, or cause it to return a value.
    #
    # The default class handler just returns %TRUE.
    struct AuthorizeSignal < GObject::Signal
      def name : String
        @detail ? "authorize::#{@detail}" : "authorize"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::DBusMethodInvocation, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::DBusMethodInvocation, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(invocation)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::DebugControllerDBus, Gio::DBusMethodInvocation, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DebugControllerDBus.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DebugControllerDBus, Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(_sender, invocation)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(invocation : Gio::DBusMethodInvocation) : Nil
        LibGObject.g_signal_emit_by_name(@source, "authorize", invocation)
      end
    end

    def authorize_signal
      AuthorizeSignal.new(self)
    end
  end
end
