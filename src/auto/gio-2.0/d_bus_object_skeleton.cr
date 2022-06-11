require "../g_object-2.0/object"
require "./d_bus_object"

module Gio
  # A #GDBusObjectSkeleton instance is essentially a group of D-Bus
  # interfaces. The set of exported interfaces on the object may be
  # dynamic and change at runtime.
  #
  # This type is intended to be used with #GDBusObjectManager.
  @[GObject::GeneratedWrapper]
  class DBusObjectSkeleton < GObject::Object
    include DBusObject

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::DBusObjectSkeletonClass), class_init,
        sizeof(LibGio::DBusObjectSkeleton), instance_init, 0)
    end

    GICrystal.define_new_method(DBusObjectSkeleton, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DBusObjectSkeleton`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, g_object_path : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !g_object_path.nil?
        (_names.to_unsafe + _n).value = "g-object-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_object_path)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusObjectSkeleton.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_skeleton_get_type
    end

    def g_object_path=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "g-object-path", unsafe_value, Pointer(Void).null)
      value
    end

    def g_object_path : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "g-object-path", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new #GDBusObjectSkeleton.
    def self.new(object_path : ::String) : self
      # g_dbus_object_skeleton_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_skeleton_new(object_path)

      # Return value handling

      Gio::DBusObjectSkeleton.new(_retval, GICrystal::Transfer::Full)
    end

    # Adds @interface_ to @object.
    #
    # If @object already contains a #GDBusInterfaceSkeleton with the same
    # interface name, it is removed before @interface_ is added.
    #
    # Note that @object takes its own reference on @interface_ and holds
    # it until removed.
    def add_interface(interface_ : Gio::DBusInterfaceSkeleton) : Nil
      # g_dbus_object_skeleton_add_interface: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_object_skeleton_add_interface(@pointer, interface_)

      # Return value handling
    end

    # This method simply calls g_dbus_interface_skeleton_flush() on all
    # interfaces belonging to @object. See that method for when flushing
    # is useful.
    def flush : Nil
      # g_dbus_object_skeleton_flush: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_object_skeleton_flush(@pointer)

      # Return value handling
    end

    # Removes @interface_ from @object.
    def remove_interface(interface_ : Gio::DBusInterfaceSkeleton) : Nil
      # g_dbus_object_skeleton_remove_interface: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_object_skeleton_remove_interface(@pointer, interface_)

      # Return value handling
    end

    # Removes the #GDBusInterface with @interface_name from @object.
    #
    # If no D-Bus interface of the given interface exists, this function
    # does nothing.
    def remove_interface_by_name(interface_name : ::String) : Nil
      # g_dbus_object_skeleton_remove_interface_by_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_object_skeleton_remove_interface_by_name(@pointer, interface_name)

      # Return value handling
    end

    # Sets the object path for @object.
    def object_path=(object_path : ::String) : Nil
      # g_dbus_object_skeleton_set_object_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_object_skeleton_set_object_path(@pointer, object_path)

      # Return value handling
    end

    # Emitted when a method is invoked by a remote caller and used to
    # determine if the method call is authorized.
    #
    # This signal is like #GDBusInterfaceSkeleton's
    # #GDBusInterfaceSkeleton::g-authorize-method signal,
    # except that it is for the enclosing object.
    #
    # The default class handler just returns %TRUE.
    struct AuthorizeMethodSignal < GObject::Signal
      def name : String
        @detail ? "authorize-method::#{@detail}" : "authorize-method"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          interface = Gio::DBusInterfaceSkeleton.new(lib_interface, :none)
          # Generator::BuiltInTypeArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(interface, invocation)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::DBusObjectSkeleton, Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusObjectSkeleton.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          interface = Gio::DBusInterfaceSkeleton.new(lib_interface, :none)
          # Generator::BuiltInTypeArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DBusObjectSkeleton, Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(_sender, interface, invocation)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(interface : Gio::DBusInterfaceSkeleton, invocation : Gio::DBusMethodInvocation) : Nil
        LibGObject.g_signal_emit_by_name(@source, "authorize-method", interface, invocation)
      end
    end

    def authorize_method_signal
      AuthorizeMethodSignal.new(self)
    end
  end
end
