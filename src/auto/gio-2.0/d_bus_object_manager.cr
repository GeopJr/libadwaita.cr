module Gio
  # The #GDBusObjectManager type is the base type for service- and
  # client-side implementations of the standardized
  # [org.freedesktop.DBus.ObjectManager](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
  # interface.
  #
  # See #GDBusObjectManagerClient for the client-side implementation
  # and #GDBusObjectManagerServer for the service-side implementation.
  module DBusObjectManager
    def interface(object_path : ::String, interface_name : ::String) : Gio::DBusInterface?
      # g_dbus_object_manager_get_interface: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_manager_get_interface(self, object_path, interface_name)

      # Return value handling

      Gio::DBusInterface__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def object(object_path : ::String) : Gio::DBusObject?
      # g_dbus_object_manager_get_object: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_manager_get_object(self, object_path)

      # Return value handling

      Gio::DBusObject__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def object_path : ::String
      # g_dbus_object_manager_get_object_path: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_object_manager_get_object_path(self)

      # Return value handling

      ::String.new(_retval)
    end

    def objects : GLib::List
      # g_dbus_object_manager_get_objects: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_manager_get_objects(self)

      # Return value handling

      GLib::List(Gio::DBusObject).new(_retval, GICrystal::Transfer::Full)
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

      def connect(&block : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusInterface__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusInterface__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectManager__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusInterface__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectManager__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusInterface__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Gio::DBusObject, interface : Gio::DBusInterface) : Nil
        LibGObject.g_signal_emit_by_name(@source, "interface-added", object, interface)
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

      def connect(&block : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusInterface__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObject, Gio::DBusInterface, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusInterface__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectManager__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusInterface__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectManager__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gio::DBusInterface__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Gio::DBusObject, interface : Gio::DBusInterface) : Nil
        LibGObject.g_signal_emit_by_name(@source, "interface-removed", object, interface)
      end
    end

    def interface_removed_signal
      InterfaceRemovedSignal.new(self)
    end

    struct ObjectAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "object-added::#{@detail}" : "object-added"
      end

      def connect(&block : Proc(Gio::DBusObject, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::DBusObject, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::DBusObject, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObject, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObject, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObject, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectManager__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectManager__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Gio::DBusObject) : Nil
        LibGObject.g_signal_emit_by_name(@source, "object-added", object)
      end
    end

    def object_added_signal
      ObjectAddedSignal.new(self)
    end

    struct ObjectRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "object-removed::#{@detail}" : "object-removed"
      end

      def connect(&block : Proc(Gio::DBusObject, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::DBusObject, Nil))
        connect(block)
      end

      def connect(block : Proc(Gio::DBusObject, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObject, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObject, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObject, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectManager__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusObjectManager__Impl.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::DBusObject__Impl.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Gio::DBusObject) : Nil
        LibGObject.g_signal_emit_by_name(@source, "object-removed", object)
      end
    end

    def object_removed_signal
      ObjectRemovedSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class DBusObjectManager__Impl < GObject::Object
    include DBusObjectManager

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_object_manager_get_type
    end

    # Cast a `GObject::Object` to `DBusObjectManager`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DBusObjectManager")
    end

    # Cast a `GObject::Object` to `DBusObjectManager`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
