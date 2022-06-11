module Gtk
  # `GtkStyleProvider` is an interface for style information used by
  # `GtkStyleContext`.
  #
  # See `Gtk::StyleContext#add_provider` and
  # `Gtk::StyleContext#add_provider_for_display` for
  # adding `GtkStyleProviders`.
  #
  # GTK uses the `GtkStyleProvider` implementation for CSS in
  # `Gtk#CssProvider`.
  module StyleProvider
    struct GtkPrivateChangedSignal < GObject::Signal
      def name : String
        @detail ? "gtk-private-changed::#{@detail}" : "gtk-private-changed"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::StyleProvider, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractStyleProvider.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::StyleProvider, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "gtk-private-changed")
      end
    end

    def gtk_private_changed_signal
      GtkPrivateChangedSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractStyleProvider < GObject::Object
    include StyleProvider

    GICrystal.define_new_method(Gtk::AbstractStyleProvider, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_style_provider_get_type
    end

    # Cast a `GObject::Object` to `StyleProvider`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to StyleProvider")
    end

    # Cast a `GObject::Object` to `StyleProvider`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
