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
  # `Gdk::Paintable#snapshot`. How the paintable interprets that size and
  # if it scales or centers itself into the given rectangle is implementation
  # defined, though if you are implementing a `GdkPaintable` and don't know what
  # to do, it is suggested that you scale your paintable ignoring any potential
  # aspect ratio.
  #
  # The contents that a `GdkPaintable` produces may depend on the `#GdkSnapshot`
  # passed to it. For example, paintables may decide to use more detailed images
  # on higher resolution screens or when OpenGL is available. A `GdkPaintable`
  # will however always produce the same output for the same snapshot.
  #
  # A `GdkPaintable` may change its contents, meaning that it will now produce
  # a different output with the same snapshot. Once that happens, it will call
  # `Gdk::Paintable#invalidate_contents` which will emit the
  # [signal@GdkPaintable::invalidate-contents] signal. If a paintable is known
  # to never change its contents, it will set the %GDK_PAINTABLE_STATIC_CONTENTS
  # flag. If a consumer cannot deal with changing contents, it may call
  # `Gdk::Paintable#current_image` which will return a static
  # paintable and use that.
  #
  # A paintable can report an intrinsic (or preferred) size or aspect ratio it
  # wishes to be rendered at, though it doesn't have to. Consumers of the interface
  # can use this information to layout thepaintable appropriately. Just like the
  # contents, the size of a paintable can change. A paintable will indicate this
  # by calling `Gdk::Paintable#invalidate_size` which will emit the
  # [signal@GdkPaintable::invalidate-size] signal. And just like for contents,
  # if a paintable is known to never change its size, it will set the
  # %GDK_PAINTABLE_STATIC_SIZE flag.
  #
  # Besides API for applications, there are some functions that are only
  # useful for implementing subclasses and should not be used by applications:
  # `Gdk::Paintable#invalidate_contents`,
  # `Gdk::Paintable#invalidate_size`,
  # `Gdk::Paintable#new_empty`.
  module Paintable
    def self.new_empty(intrinsic_width : Int32, intrinsic_height : Int32) : Gdk::Paintable
      # gdk_paintable_new_empty: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_paintable_new_empty(intrinsic_width, intrinsic_height)

      # Return value handling

      Gdk::AbstractPaintable.new(_retval, GICrystal::Transfer::Full)
    end

    def compute_concrete_size(specified_width : Float64, specified_height : Float64, default_width : Float64, default_height : Float64, concrete_width : Float64, concrete_height : Float64) : Nil
      # gdk_paintable_compute_concrete_size: (Method)
      # @concrete_width: (out) (transfer full)
      # @concrete_height: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_paintable_compute_concrete_size(@pointer, specified_width, specified_height, default_width, default_height, concrete_width, concrete_height)

      # Return value handling
    end

    def current_image : Gdk::Paintable
      # gdk_paintable_get_current_image: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_paintable_get_current_image(@pointer)

      # Return value handling

      Gdk::AbstractPaintable.new(_retval, GICrystal::Transfer::Full)
    end

    def flags : Gdk::PaintableFlags
      # gdk_paintable_get_flags: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_paintable_get_flags(@pointer)

      # Return value handling

      Gdk::PaintableFlags.new(_retval)
    end

    def intrinsic_aspect_ratio : Float64
      # gdk_paintable_get_intrinsic_aspect_ratio: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_paintable_get_intrinsic_aspect_ratio(@pointer)

      # Return value handling

      _retval
    end

    def intrinsic_height : Int32
      # gdk_paintable_get_intrinsic_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_paintable_get_intrinsic_height(@pointer)

      # Return value handling

      _retval
    end

    def intrinsic_width : Int32
      # gdk_paintable_get_intrinsic_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_paintable_get_intrinsic_width(@pointer)

      # Return value handling

      _retval
    end

    def invalidate_contents : Nil
      # gdk_paintable_invalidate_contents: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_paintable_invalidate_contents(@pointer)

      # Return value handling
    end

    def invalidate_size : Nil
      # gdk_paintable_invalidate_size: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_paintable_invalidate_size(@pointer)

      # Return value handling
    end

    def snapshot(snapshot : Gdk::Snapshot, width : Float64, height : Float64) : Nil
      # gdk_paintable_snapshot: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_paintable_snapshot(@pointer, snapshot, width, height)

      # Return value handling
    end

    struct InvalidateContentsSignal < GObject::Signal
      def name : String
        @detail ? "invalidate-contents::#{@detail}" : "invalidate-contents"
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

      def connect(handler : Proc(Gdk::Paintable, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::AbstractPaintable.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Paintable, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "invalidate-contents")
      end
    end

    def invalidate_contents_signal
      InvalidateContentsSignal.new(self)
    end

    struct InvalidateSizeSignal < GObject::Signal
      def name : String
        @detail ? "invalidate-size::#{@detail}" : "invalidate-size"
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

      def connect(handler : Proc(Gdk::Paintable, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::AbstractPaintable.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Paintable, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "invalidate-size")
      end
    end

    def invalidate_size_signal
      InvalidateSizeSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractPaintable < GObject::Object
    include Paintable

    GICrystal.define_new_method(Gdk::AbstractPaintable, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_paintable_get_type
    end

    # Cast a `GObject::Object` to `Paintable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Paintable")
    end

    # Cast a `GObject::Object` to `Paintable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
