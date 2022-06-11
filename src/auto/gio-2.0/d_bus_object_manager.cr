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
      _retval = LibGio.g_dbus_object_manager_get_interface(@pointer, object_path, interface_name)

      # Return value handling

      Gio::AbstractDBusInterface.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def object(object_path : ::String) : Gio::DBusObject?
      # g_dbus_object_manager_get_object: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_manager_get_object(@pointer, object_path)

      # Return value handling

      Gio::AbstractDBusObject.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def object_path : ::String
      # g_dbus_object_manager_get_object_path: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_object_manager_get_object_path(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    def objects : GLib::List
      # g_dbus_object_manager_get_objects: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_object_manager_get_objects(@pointer)

      # Return value handling

      GLib::List(Gio::DBusObject).new(_retval, GICrystal::Transfer::Full)
    end

    struct InterfaceAddedSignal < GObject::Signal
      def name : String
        @detail ? "interface-added::#{@detail}" : "interface-added"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::DBusObject, Gio::DBusInterface, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::DBusObject, Gio::DBusInterface, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          object = Gio::DBusObject.new(lib_object, :none)
          # Generator::BuiltInTypeArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(_lib_box).call(object, interface)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDBusObjectManager.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          object = Gio::DBusObject.new(lib_object, :none)
          # Generator::BuiltInTypeArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(_lib_box).call(_sender, object, interface)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(object : Gio::DBusObject, interface : Gio::DBusInterface) : Nil
        LibGObject.g_signal_emit_by_name(@source, "interface-added", object, interface)
      end
    end

    def interface_added_signal
      InterfaceAddedSignal.new(self)
    end

    struct InterfaceRemovedSignal < GObject::Signal
      def name : String
        @detail ? "interface-removed::#{@detail}" : "interface-removed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::DBusObject, Gio::DBusInterface, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::DBusObject, Gio::DBusInterface, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          object = Gio::DBusObject.new(lib_object, :none)
          # Generator::BuiltInTypeArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(_lib_box).call(object, interface)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : Pointer(Void), lib_interface : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDBusObjectManager.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          object = Gio::DBusObject.new(lib_object, :none)
          # Generator::BuiltInTypeArgPlan
          interface = Gio::DBusInterface.new(lib_interface, :none)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Gio::DBusInterface, Nil)).unbox(_lib_box).call(_sender, object, interface)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(object : Gio::DBusObject, interface : Gio::DBusInterface) : Nil
        LibGObject.g_signal_emit_by_name(@source, "interface-removed", object, interface)
      end
    end

    def interface_removed_signal
      InterfaceRemovedSignal.new(self)
    end

    struct ObjectAddedSignal < GObject::Signal
      def name : String
        @detail ? "object-added::#{@detail}" : "object-added"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::DBusObject, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::DBusObject, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          object = Gio::DBusObject.new(lib_object, :none)
          ::Box(Proc(Gio::DBusObject, Nil)).unbox(_lib_box).call(object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDBusObjectManager.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          object = Gio::DBusObject.new(lib_object, :none)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil)).unbox(_lib_box).call(_sender, object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(object : Gio::DBusObject) : Nil
        LibGObject.g_signal_emit_by_name(@source, "object-added", object)
      end
    end

    def object_added_signal
      ObjectAddedSignal.new(self)
    end

    struct ObjectRemovedSignal < GObject::Signal
      def name : String
        @detail ? "object-removed::#{@detail}" : "object-removed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::DBusObject, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::DBusObject, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          object = Gio::DBusObject.new(lib_object, :none)
          ::Box(Proc(Gio::DBusObject, Nil)).unbox(_lib_box).call(object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::AbstractDBusObjectManager.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          object = Gio::DBusObject.new(lib_object, :none)
          ::Box(Proc(Gio::DBusObjectManager, Gio::DBusObject, Nil)).unbox(_lib_box).call(_sender, object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
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
  class AbstractDBusObjectManager < GObject::Object
    include DBusObjectManager

    GICrystal.define_new_method(Gio::AbstractDBusObjectManager, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

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
