module Gtk
  # `GtkStyleProvider` is an interface for style information used by
  # `GtkStyleContext`.
  #
  # See [method@Gtk.StyleContext.add_provider] and
  # [func@Gtk.StyleContext.add_provider_for_display] for
  # adding `GtkStyleProviders`.
  #
  # GTK uses the `GtkStyleProvider` implementation for CSS in
  # [class@Gtk.CssProvider].
  module StyleProvider
    abstract def to_unsafe
  end

  # :nodoc:
  class StyleProvider__Impl
    include StyleProvider

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
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
