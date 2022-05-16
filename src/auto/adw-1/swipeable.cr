module Adw
  # An interface for swipeable widgets.
  #
  # The `AdwSwipeable` interface is implemented by all swipeable widgets.
  #
  # See `#SwipeTracker` for details about implementing it.
  module Swipeable
    def cancel_progress : Float64
      # adw_swipeable_get_cancel_progress: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_swipeable_get_cancel_progress(@pointer)

      # Return value handling

      _retval
    end

    def distance : Float64
      # adw_swipeable_get_distance: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_swipeable_get_distance(@pointer)

      # Return value handling

      _retval
    end

    def progress : Float64
      # adw_swipeable_get_progress: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_swipeable_get_progress(@pointer)

      # Return value handling

      _retval
    end

    def snap_points : Enumerable(Float64)
      # adw_swipeable_get_snap_points: (Method)
      # @n_snap_points: (out) (transfer full)
      # Returns: (transfer full) (array length=n_snap_points element-type Double)

      # Generator::OutArgUsedInReturnPlan
      n_snap_points = 0
      # C call
      _retval = LibAdw.adw_swipeable_get_snap_points(@pointer, pointerof(n_snap_points))

      # Return value handling

      GICrystal.transfer_array(_retval, n_snap_points, GICrystal::Transfer::Full)
    end

    def swipe_area(navigation_direction : Adw::NavigationDirection, is_drag : Bool) : Gdk::Rectangle
      # adw_swipeable_get_swipe_area: (Method)
      # @rect: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      rect = Gdk::Rectangle.new
      # C call
      LibAdw.adw_swipeable_get_swipe_area(@pointer, navigation_direction, is_drag, rect)

      # Return value handling

      rect
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractSwipeable < GObject::Object
    include Swipeable

    GICrystal.define_new_method(Adw::AbstractSwipeable, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_swipeable_get_type
    end

    # Cast a `GObject::Object` to `Swipeable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Swipeable")
    end

    # Cast a `GObject::Object` to `Swipeable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
