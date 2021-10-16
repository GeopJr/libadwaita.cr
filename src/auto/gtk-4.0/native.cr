module Gtk
  # `GtkNative` is the interface implemented by all widgets that have
  # their own `GdkSurface`.
  #
  # The obvious example of a `GtkNative` is `GtkWindow`.
  #
  # Every widget that is not itself a `GtkNative` is contained in one,
  # and you can get it with [method@Gtk.Widget.get_native].
  #
  # To get the surface of a `GtkNative`, use [method@Gtk.Native.get_surface].
  # It is also possible to find the `GtkNative` to which a surface
  # belongs, with [func@Gtk.Native.get_for_surface].
  #
  # In addition to a [class@Gdk.Surface], a `GtkNative` also provides
  # a [class@Gsk.Renderer] for rendering on that surface. To get the
  # renderer, use [method@Gtk.Native.get_renderer].
  module Native
    def self.for_surface(surface : Gdk::Surface) : Gtk::Native
      # gtk_native_get_for_surface: (None)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_native_get_for_surface(surface)
      Gtk::Native__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def renderer : Gsk::Renderer
      # gtk_native_get_renderer: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_native_get_renderer(self)
      Gsk::Renderer.new(_retval, GICrystal::Transfer::None)
    end

    def surface : Gdk::Surface
      # gtk_native_get_surface: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_native_get_surface(self)
      Gdk::Surface.new(_retval, GICrystal::Transfer::None)
    end

    def surface_transform(x : Float64, y : Float64) : Nil
      # gtk_native_get_surface_transform: (Method)
      # @x: (out) (transfer full)
      # @y: (out) (transfer full)
      # Returns: (transfer none)

      LibGtk.gtk_native_get_surface_transform(self, x, y)
    end

    def realize : Nil
      # gtk_native_realize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_native_realize(self)
    end

    def unrealize : Nil
      # gtk_native_unrealize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_native_unrealize(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Native__Impl
    include Native

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
      LibGtk.gtk_native_get_type
    end

    # Cast a `GObject::Object` to `Native`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Native")
    end

    # Cast a `GObject::Object` to `Native`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
