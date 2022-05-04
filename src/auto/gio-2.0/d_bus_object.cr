module Gio
  # The #GDBusObject type is the base type for D-Bus objects on both
  # the service side (see #GDBusObjectSkeleton) and the client side
  # (see #GDBusObjectProxy). It is essentially just a container of
  # interfaces.
  module DBusObject
    def interface(interface_name : ::String) : Gio::DBusInterface?
      # g_dbus_object_get_interface: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_get_interface(self, interface_name)

      # Return value handling

      Gio::DBusInterface__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def interfaces : GLib::List
      # g_dbus_object_get_interfaces: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_get_interfaces(self)

      # Return value handling

      GLib::List(Gio::DBusInterface).new(_retval, GICrystal::Transfer::Full)
    end

    def object_path : ::String
      # g_dbus_object_get_object_path: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_object_get_object_path(self)

      # Return value handling

      ::String.new(_retval)
    end

    struct InterfaceAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "interface-added::#{@detail}" : "interface-added"
      end

      def connect(&block : Proc(Gio::DBusInterface, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::DBusInterface, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gio::DBusInterface, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusInterface, Nil)).unbox(_lib_box).call(interface)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusInterface, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusInterface, Nil)).unbox(_lib_box).call(interface)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusObject__Impl.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(_lib_box).call(_sender, interface)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusObject__Impl.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(_lib_box).call(_sender, interface)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(interface : Gio::DBusInterface) : Nil
        LibGObject.g_signal_emit_by_name(@source, "interface-added", interface)
      end
    end

    def interface_added_signal
      InterfaceAddedSignal.new(self)
    end

    struct InterfaceRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "interface-removed::#{@detail}" : "interface-removed"
      end

      def connect(&block : Proc(Gio::DBusInterface, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::DBusInterface, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gio::DBusInterface, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusInterface, Nil)).unbox(_lib_box).call(interface)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusInterface, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusInterface, Nil)).unbox(_lib_box).call(interface)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusObject__Impl.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(_lib_box).call(_sender, interface)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusObject__Impl.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(_lib_box).call(_sender, interface)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(interface : Gio::DBusInterface) : Nil
        LibGObject.g_signal_emit_by_name(@source, "interface-removed", interface)
      end
    end

    def interface_removed_signal
      InterfaceRemovedSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class DBusObject__Impl < GObject::Object
    include DBusObject

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_get_type
    end

    # Cast a `GObject::Object` to `DBusObject`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DBusObject")
    end

    # Cast a `GObject::Object` to `DBusObject`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
