module Adw
  # An interface for swipeable widgets.
  #
  # The `AdwSwipeable` interface is implemented by all swipeable widgets.
  #
  # See [class@Adw.SwipeTracker] for details about implementing it.
  module Swipeable
    def cancel_progress : Float64
      # adw_swipeable_get_cancel_progress: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_swipeable_get_cancel_progress(self)
      _retval
    end

    def distance : Float64
      # adw_swipeable_get_distance: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_swipeable_get_distance(self)
      _retval
    end

    def progress : Float64
      # adw_swipeable_get_progress: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_swipeable_get_progress(self)
      _retval
    end

    def snap_points(n_snap_points : Int32) : Enumerable(Float64)
      # adw_swipeable_get_snap_points: (Method)
      # @n_snap_points: (out) (transfer full)
      # Returns: (transfer full)

      _retval = LibAdw.adw_swipeable_get_snap_points(self, n_snap_points)
      _retval
    end

    def swipe_area(navigation_direction : Adw::NavigationDirection, is_drag : Bool) : Gdk::Rectangle
      # adw_swipeable_get_swipe_area: (Method)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      rect = Gdk::Rectangle.new

      LibAdw.adw_swipeable_get_swipe_area(self, navigation_direction, is_drag, rect)
      rect
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Swipeable__Impl
    include Swipeable

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
      LibAdw.adw_swipeable_get_type
    end

    # Cast a `GObject::Object` to `Swipeable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Swipeable")
    end

    # Cast a `GObject::Object` to `Swipeable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
