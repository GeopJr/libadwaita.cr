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

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
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
    def initialize(object_path : ::String)
      # g_dbus_object_skeleton_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_skeleton_new(object_path)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      LibGio.g_dbus_object_skeleton_add_interface(self, interface_)

      # Return value handling
    end

    # This method simply calls g_dbus_interface_skeleton_flush() on all
    # interfaces belonging to @object. See that method for when flushing
    # is useful.
    def flush : Nil
      # g_dbus_object_skeleton_flush: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_object_skeleton_flush(self)

      # Return value handling
    end

    # Removes @interface_ from @object.
    def remove_interface(interface_ : Gio::DBusInterfaceSkeleton) : Nil
      # g_dbus_object_skeleton_remove_interface: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_object_skeleton_remove_interface(self, interface_)

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
      LibGio.g_dbus_object_skeleton_remove_interface_by_name(self, interface_name)

      # Return value handling
    end

    # Sets the object path for @object.
    def object_path=(object_path : ::String) : Nil
      # g_dbus_object_skeleton_set_object_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_object_skeleton_set_object_path(self, object_path)

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
    struct AuthorizeMethodSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "authorize-method::#{@detail}" : "authorize-method"
      end

      def connect(&block : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterfaceSkeleton.new(lib_interface, :none)
          # Generator::GObjectArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(interface, invocation)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterfaceSkeleton.new(lib_interface, :none)
          # Generator::GObjectArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(interface, invocation)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::DBusObjectSkeleton, Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusObjectSkeleton.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterfaceSkeleton.new(lib_interface, :none)
          # Generator::GObjectArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DBusObjectSkeleton, Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(_sender, interface, invocation)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusObjectSkeleton, Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), lib_invocation : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusObjectSkeleton.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterfaceSkeleton.new(lib_interface, :none)
          # Generator::GObjectArgPlan
          invocation = Gio::DBusMethodInvocation.new(lib_invocation, :none)
          ::Box(Proc(Gio::DBusObjectSkeleton, Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(_lib_box).call(_sender, interface, invocation)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
