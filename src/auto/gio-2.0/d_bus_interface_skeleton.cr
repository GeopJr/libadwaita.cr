require "../g_object-2.0/object"
require "./d_bus_interface"

module Gio
  # Abstract base class for D-Bus interfaces on the service side.
  class DBusInterfaceSkeleton < GObject::Object
    include DBusInterface

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, g_flags : Gio::DBusInterfaceSkeletonFlags? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if g_flags
        (_names.to_unsafe + _n).value = "g-flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, g_flags)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusInterfaceSkeleton.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_interface_skeleton_get_type
    end

    def g_flags=(value : DBusInterfaceSkeletonFlags) : DBusInterfaceSkeletonFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "g-flags", unsafe_value, Pointer(Void).null)
      value
    end

    def g_flags : DBusInterfaceSkeletonFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "g-flags", pointerof(value), Pointer(Void).null)
      Gio::DBusInterfaceSkeletonFlags.from_value(value)
    end

    def export(connection : Gio::DBusConnection, object_path : ::String) : Bool
      # g_dbus_interface_skeleton_export: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_interface_skeleton_export(self, connection, object_path)
      GICrystal.to_bool(_retval)
    end

    def flush : Nil
      # g_dbus_interface_skeleton_flush: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_interface_skeleton_flush(self)
    end

    def connection : Gio::DBusConnection?
      # g_dbus_interface_skeleton_get_connection: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_interface_skeleton_get_connection(self)
      Gio::DBusConnection.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def connections : GLib::List
      # g_dbus_interface_skeleton_get_connections: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_interface_skeleton_get_connections(self)
      GLib::List(Gio::DBusConnection).new(_retval, GICrystal::Transfer::Full)
    end

    def flags : Gio::DBusInterfaceSkeletonFlags
      # g_dbus_interface_skeleton_get_flags: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_interface_skeleton_get_flags(self)
      Gio::DBusInterfaceSkeletonFlags.from_value(_retval)
    end

    def info : Gio::DBusInterfaceInfo
      # g_dbus_interface_skeleton_get_info: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_interface_skeleton_get_info(self)
      Gio::DBusInterfaceInfo.new(_retval, GICrystal::Transfer::None)
    end

    def object_path : ::String?
      # g_dbus_interface_skeleton_get_object_path: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_interface_skeleton_get_object_path(self)
      ::String.new(_retval) unless _retval.null?
    end

    def properties : GLib::Variant
      # g_dbus_interface_skeleton_get_properties: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_interface_skeleton_get_properties(self)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    def has_connection(connection : Gio::DBusConnection) : Bool
      # g_dbus_interface_skeleton_has_connection: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_interface_skeleton_has_connection(self, connection)
      GICrystal.to_bool(_retval)
    end

    def flags=(flags : Gio::DBusInterfaceSkeletonFlags) : Nil
      # g_dbus_interface_skeleton_set_flags: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_interface_skeleton_set_flags(self, flags)
    end

    def unexport : Nil
      # g_dbus_interface_skeleton_unexport: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_interface_skeleton_unexport(self)
    end

    def unexport_from_connection(connection : Gio::DBusConnection) : Nil
      # g_dbus_interface_skeleton_unexport_from_connection: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_interface_skeleton_unexport_from_connection(self, connection)
    end

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

      def connect(block : Proc(Gio::DBusMethodInvocation, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusMethodInvocation.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusMethodInvocation, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusMethodInvocation, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusMethodInvocation.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusMethodInvocation, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusInterfaceSkeleton.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusMethodInvocation.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusInterfaceSkeleton.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusMethodInvocation.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusInterfaceSkeleton, Gio::DBusMethodInvocation, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
