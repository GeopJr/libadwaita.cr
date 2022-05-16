module Gsk
  # A rectangular region with rounded corners.
  #
  # Application code should normalize rectangles using
  # `Gsk::RoundedRect#normalize`; this function will ensure that
  # the bounds of the rectangle are normalized and ensure that the corner
  # values are positive and the corners do not overlap.
  #
  # All functions taking a `GskRoundedRect` as an argument will internally
  # operate on a normalized copy; all functions returning a `GskRoundedRect`
  # will always return a normalized one.
  #
  # The algorithm used for normalizing corner sizes is described in
  # [the CSS specification](https://drafts.csswg.org/css-backgrounds-3/#border-radius).
  class RoundedRect
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGsk::RoundedRect))
      @pointer.copy_from(pointer, sizeof(LibGsk::RoundedRect))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(bounds : Graphene::Rect? = nil, corner : Enumerable(Graphene::Size)? = nil)
      _ptr = Pointer(Void).malloc(48)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.bounds = bounds unless bounds.nil?
      _instance.corner = corner unless corner.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGsk::RoundedRect)).zero?
    end

    def bounds : Graphene::Rect
      _var = (@pointer + 0).as(Pointer(Void))
      Graphene::Rect.new(_var, GICrystal::Transfer::None)
    end

    def bounds=(value : Graphene::Rect)
      _var = (@pointer + 0).as(Pointer(Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGsk::RoundedRect))
      value
    end

    def corner : Enumerable(Graphene::Size)
      _var = (@pointer + 16).as(Pointer(Void[4]))
      _var.value
    end

    def corner=(value : Enumerable(Graphene::Size))
      _var = (@pointer + 16).as(Pointer(Void[4])).value = value
      value
    end

    def contains_point(point : Graphene::Point) : Bool
      # gsk_rounded_rect_contains_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_rect_contains_point(@pointer, point)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def contains_rect(rect : Graphene::Rect) : Bool
      # gsk_rounded_rect_contains_rect: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_rect_contains_rect(@pointer, rect)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def init(bounds : Graphene::Rect, top_left : Graphene::Size, top_right : Graphene::Size, bottom_right : Graphene::Size, bottom_left : Graphene::Size) : Gsk::RoundedRect
      # gsk_rounded_rect_init: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_rect_init(@pointer, bounds, top_left, top_right, bottom_right, bottom_left)

      # Return value handling

      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def init_copy(src : Gsk::RoundedRect) : Gsk::RoundedRect
      # gsk_rounded_rect_init_copy: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_rect_init_copy(@pointer, src)

      # Return value handling

      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_rect(bounds : Graphene::Rect, radius : Float32) : Gsk::RoundedRect
      # gsk_rounded_rect_init_from_rect: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_rect_init_from_rect(@pointer, bounds, radius)

      # Return value handling

      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def intersects_rect(rect : Graphene::Rect) : Bool
      # gsk_rounded_rect_intersects_rect: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_rect_intersects_rect(@pointer, rect)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_rectilinear : Bool
      # gsk_rounded_rect_is_rectilinear: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_rect_is_rectilinear(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def normalize : Gsk::RoundedRect
      # gsk_rounded_rect_normalize: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_rect_normalize(@pointer)

      # Return value handling

      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def offset(dx : Float32, dy : Float32) : Gsk::RoundedRect
      # gsk_rounded_rect_offset: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_rect_offset(@pointer, dx, dy)

      # Return value handling

      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def shrink(top : Float32, right : Float32, bottom : Float32, left : Float32) : Gsk::RoundedRect
      # gsk_rounded_rect_shrink: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_rounded_rect_shrink(@pointer, top, right, bottom, left)

      # Return value handling

      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
