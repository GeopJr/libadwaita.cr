module Gdk
  # `GdkPaintable` is a simple interface used by GTK to represent content that
  # can be painted.
  #
  # The content of a `GdkPaintable` can be painted anywhere at any size
  # without requiring any sort of layout. The interface is inspired by
  # similar concepts elsewhere, such as
  # [ClutterContent](https://developer.gnome.org/clutter/stable/ClutterContent.html),
  # [HTML/CSS Paint Sources](https://www.w3.org/TR/css-images-4/#paint-source),
  # or [SVG Paint Servers](https://www.w3.org/TR/SVG2/pservers.html).
  #
  # A `GdkPaintable` can be snapshot at any time and size using
  # [method@Gdk.Paintable.snapshot]. How the paintable interprets that size and
  # if it scales or centers itself into the given rectangle is implementation
  # defined, though if you are implementing a `GdkPaintable` and don't know what
  # to do, it is suggested that you scale your paintable ignoring any potential
  # aspect ratio.
  #
  # The contents that a `GdkPaintable` produces may depend on the [class@GdkSnapshot]
  # passed to it. For example, paintables may decide to use more detailed images
  # on higher resolution screens or when OpenGL is available. A `GdkPaintable`
  # will however always produce the same output for the same snapshot.
  #
  # A `GdkPaintable` may change its contents, meaning that it will now produce
  # a different output with the same snapshot. Once that happens, it will call
  # [method@Gdk.Paintable.invalidate_contents] which will emit the
  # [signal@GdkPaintable::invalidate-contents] signal. If a paintable is known
  # to never change its contents, it will set the %GDK_PAINTABLE_STATIC_CONTENTS
  # flag. If a consumer cannot deal with changing contents, it may call
  # [method@Gdk.Paintable.get_current_image] which will return a static
  # paintable and use that.
  #
  # A paintable can report an intrinsic (or preferred) size or aspect ratio it
  # wishes to be rendered at, though it doesn't have to. Consumers of the interface
  # can use this information to layout thepaintable appropriately. Just like the
  # contents, the size of a paintable can change. A paintable will indicate this
  # by calling [method@Gdk.Paintable.invalidate_size] which will emit the
  # [signal@GdkPaintable::invalidate-size] signal. And just like for contents,
  # if a paintable is known to never change its size, it will set the
  # %GDK_PAINTABLE_STATIC_SIZE flag.
  #
  # Besides API for applications, there are some functions that are only
  # useful for implementing subclasses and should not be used by applications:
  # [method@Gdk.Paintable.invalidate_contents],
  # [method@Gdk.Paintable.invalidate_size],
  # [func@Gdk.Paintable.new_empty].
  module Paintable
    def self.new_empty(intrinsic_width : Int32, intrinsic_height : Int32) : Gdk::Paintable
      # gdk_paintable_new_empty: (None)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_paintable_new_empty(intrinsic_width, intrinsic_height)
      Gdk::Paintable__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def compute_concrete_size(specified_width : Float64, specified_height : Float64, default_width : Float64, default_height : Float64, concrete_width : Float64, concrete_height : Float64) : Nil
      # gdk_paintable_compute_concrete_size: (Method)
      # @concrete_width: (out) (transfer full)
      # @concrete_height: (out) (transfer full)
      # Returns: (transfer none)

      LibGdk.gdk_paintable_compute_concrete_size(self, specified_width, specified_height, default_width, default_height, concrete_width, concrete_height)
    end

    def current_image : Gdk::Paintable
      # gdk_paintable_get_current_image: (Method)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_paintable_get_current_image(self)
      Gdk::Paintable__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def flags : Gdk::PaintableFlags
      # gdk_paintable_get_flags: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_paintable_get_flags(self)
      Gdk::PaintableFlags.from_value(_retval)
    end

    def intrinsic_aspect_ratio : Float64
      # gdk_paintable_get_intrinsic_aspect_ratio: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_paintable_get_intrinsic_aspect_ratio(self)
      _retval
    end

    def intrinsic_height : Int32
      # gdk_paintable_get_intrinsic_height: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_paintable_get_intrinsic_height(self)
      _retval
    end

    def intrinsic_width : Int32
      # gdk_paintable_get_intrinsic_width: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_paintable_get_intrinsic_width(self)
      _retval
    end

    def invalidate_contents : Nil
      # gdk_paintable_invalidate_contents: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_paintable_invalidate_contents(self)
    end

    def invalidate_size : Nil
      # gdk_paintable_invalidate_size: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_paintable_invalidate_size(self)
    end

    def snapshot(snapshot : Gdk::Snapshot, width : Float64, height : Float64) : Nil
      # gdk_paintable_snapshot: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_paintable_snapshot(self, snapshot, width, height)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Paintable__Impl
    include Paintable

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
      LibGdk.gdk_paintable_get_type
    end

    # Cast a `GObject::Object` to `Paintable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Paintable")
    end

    # Cast a `GObject::Object` to `Paintable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
