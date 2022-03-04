require "../g_object-2.0/object"
require "./d_bus_object"

module Gio
  # A #GDBusObjectSkeleton instance is essentially a group of D-Bus
  # interfaces. The set of exported interfaces on the object may be
  # dynamic and change at runtime.
  #
  # This type is intended to be used with #GDBusObjectManager.
  class DBusObjectSkeleton < GObject::Object
    include DBusObject

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, g_object_path : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if g_object_path
        (_names.to_unsafe + _n).value = "g-object-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_object_path)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusObjectSkeleton.g_type, _n, _names, _values)
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

    def initialize(object_path : ::String)
      # g_dbus_object_skeleton_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_dbus_object_skeleton_new(object_path)

      # Return value handling
      @pointer = _retval
    end

    def add_interface(interface_ : Gio::DBusInterfaceSkeleton) : Nil
      # g_dbus_object_skeleton_add_interface: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_object_skeleton_add_interface(self, interface_)

      # Return value handling
    end

    def flush : Nil
      # g_dbus_object_skeleton_flush: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_object_skeleton_flush(self)

      # Return value handling
    end

    def remove_interface(interface_ : Gio::DBusInterfaceSkeleton) : Nil
      # g_dbus_object_skeleton_remove_interface: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_object_skeleton_remove_interface(self, interface_)

      # Return value handling
    end

    def remove_interface_by_name(interface_name : ::String) : Nil
      # g_dbus_object_skeleton_remove_interface_by_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_object_skeleton_remove_interface_by_name(self, interface_name)

      # Return value handling
    end

    def object_path=(object_path : ::String) : Nil
      # g_dbus_object_skeleton_set_object_path: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_dbus_object_skeleton_set_object_path(self, object_path)

      # Return value handling
    end

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

      def connect(block : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusInterfaceSkeleton.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusMethodInvocation.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusInterfaceSkeleton.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusMethodInvocation.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusObjectSkeleton, Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectSkeleton.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusInterfaceSkeleton.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusMethodInvocation.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectSkeleton, Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObjectSkeleton, Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectSkeleton.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusInterfaceSkeleton.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusMethodInvocation.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectSkeleton, Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
