module Gsk
  # A rectangular region with rounded corners.
  #
  # Application code should normalize rectangles using
  # [method@Gsk.RoundedRect.normalize]; this function will ensure that
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
      raise ArgumentError.new if pointer.null?

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

    def bounds : Graphene::Rect
      # Property getter
      _var = (@pointer + 0).as(Pointer(LibGraphene::Rect))
      Graphene::Rect.new(_var.value, GICrystal::Transfer::Full)
    end

    def bounds=(value : Graphene::Rect)
      # Property setter
      _var = (@pointer + 0).as(Pointer(LibGraphene::Rect)).value = value.to_unsafe
      value
    end

    def corner : Enumerable(Graphene::Size)
      # Property getter
      _var = (@pointer + 16).as(Pointer(Void[4]))
      _var.value
    end

    def corner=(value : Enumerable(Graphene::Size))
      # Property setter
      _var = (@pointer + 16).as(Pointer(Void[4])).value = value
      value
    end

    def contains_point(point : Graphene::Point) : Bool
      # gsk_rounded_rect_contains_point: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_rect_contains_point(self, point)
      GICrystal.to_bool(_retval)
    end

    def contains_rect(rect : Graphene::Rect) : Bool
      # gsk_rounded_rect_contains_rect: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_rect_contains_rect(self, rect)
      GICrystal.to_bool(_retval)
    end

    def init(bounds : Graphene::Rect, top_left : Graphene::Size, top_right : Graphene::Size, bottom_right : Graphene::Size, bottom_left : Graphene::Size) : Gsk::RoundedRect
      # gsk_rounded_rect_init: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_rect_init(self, bounds, top_left, top_right, bottom_right, bottom_left)
      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def init_copy(src : Gsk::RoundedRect) : Gsk::RoundedRect
      # gsk_rounded_rect_init_copy: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_rect_init_copy(self, src)
      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_rect(bounds : Graphene::Rect, radius : Float32) : Gsk::RoundedRect
      # gsk_rounded_rect_init_from_rect: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_rect_init_from_rect(self, bounds, radius)
      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def intersects_rect(rect : Graphene::Rect) : Bool
      # gsk_rounded_rect_intersects_rect: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_rect_intersects_rect(self, rect)
      GICrystal.to_bool(_retval)
    end

    def is_rectilinear : Bool
      # gsk_rounded_rect_is_rectilinear: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_rect_is_rectilinear(self)
      GICrystal.to_bool(_retval)
    end

    def normalize : Gsk::RoundedRect
      # gsk_rounded_rect_normalize: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_rect_normalize(self)
      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def offset(dx : Float32, dy : Float32) : Gsk::RoundedRect
      # gsk_rounded_rect_offset: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_rect_offset(self, dx, dy)
      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def shrink(top : Float32, right : Float32, bottom : Float32, left : Float32) : Gsk::RoundedRect
      # gsk_rounded_rect_shrink: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_rounded_rect_shrink(self, top, right, bottom, left)
      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
