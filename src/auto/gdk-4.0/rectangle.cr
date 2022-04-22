module Gdk
  # A `GdkRectangle` data type for representing rectangles.
  #
  # `GdkRectangle` is identical to `cairo_rectangle_t`. Together with Cairo’s
  # `cairo_region_t` data type, these are the central types for representing
  # sets of pixels.
  #
  # The intersection of two rectangles can be computed with
  # `Gdk::Rectangle#intersect`; to find the union of two rectangles use
  # `Gdk::Rectangle#union`.
  #
  # The `cairo_region_t` type provided by Cairo is usually used for managing
  # non-rectangular clipping of graphical operations.
  #
  # The Graphene library has a number of other data types for regions and
  # volumes in 2D and 3D.
  class Rectangle
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGdk::Rectangle))
      @pointer.copy_from(pointer, sizeof(LibGdk::Rectangle))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(x : Int32? = nil, y : Int32? = nil, width : Int32? = nil, height : Int32? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.x = x unless x.nil?
      _instance.y = y unless y.nil?
      _instance.width = width unless width.nil?
      _instance.height = height unless height.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGdk::Rectangle)).zero?
    end

    def x : Int32
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def x=(value : Int32)
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def y : Int32
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def y=(value : Int32)
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def width : Int32
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def width=(value : Int32)
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def height : Int32
      _var = (@pointer + 12).as(Pointer(Int32))
      _var.value
    end

    def height=(value : Int32)
      _var = (@pointer + 12).as(Pointer(Int32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_rectangle_get_type
    end

    def contains_point(x : Int32, y : Int32) : Bool
      # gdk_rectangle_contains_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_rectangle_contains_point(self, x, y)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def equal(rect2 : Gdk::Rectangle) : Bool
      # gdk_rectangle_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_rectangle_equal(self, rect2)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def intersect(src2 : Gdk::Rectangle) : Gdk::Rectangle
      # gdk_rectangle_intersect: (Method)
      # @dest: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      dest = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      dest = Gdk::Rectangle.new

      # C call
      _retval = LibGdk.gdk_rectangle_intersect(self, src2, dest)

      # Return value handling

      dest
    end

    def union(src2 : Gdk::Rectangle) : Gdk::Rectangle
      # gdk_rectangle_union: (Method)
      # @dest: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      dest = Gdk::Rectangle.new

      # C call
      LibGdk.gdk_rectangle_union(self, src2, dest)

      # Return value handling

      dest
    end

    def to_unsafe
      @pointer
    end
  end
end
