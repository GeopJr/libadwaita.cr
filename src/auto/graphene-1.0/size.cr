module Graphene
  # A size.
  class Size
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGraphene::Size))
      @pointer.copy_from(pointer, sizeof(LibGraphene::Size))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(width : Float32? = nil, height : Float32? = nil)
      _ptr = Pointer(Void).malloc(8)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.width = width unless width.nil?
      _instance.height = height unless height.nil?
      _instance
    end

    def finalize
    end

    def width : Float32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Float32))
      _var.value
    end

    def width=(value : Float32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Float32)).value = value
      value
    end

    def height : Float32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Float32))
      _var.value
    end

    def height=(value : Float32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Float32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGraphene.graphene_size_get_type
    end

    def self.alloc : self
      # graphene_size_alloc: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_size_alloc

      # Return value handling
      Graphene::Size.new(_retval, GICrystal::Transfer::Full)
    end

    def equal(b : Graphene::Size) : Bool
      # graphene_size_equal: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_size_equal(self, b)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # graphene_size_free: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGraphene.graphene_size_free(self)

      # Return value handling
    end

    def init(width : Float32, height : Float32) : Graphene::Size
      # graphene_size_init: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_size_init(self, width, height)

      # Return value handling
      Graphene::Size.new(_retval, GICrystal::Transfer::None)
    end

    def init_from_size(src : Graphene::Size) : Graphene::Size
      # graphene_size_init_from_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_size_init_from_size(self, src)

      # Return value handling
      Graphene::Size.new(_retval, GICrystal::Transfer::None)
    end

    def interpolate(b : Graphene::Size, factor : Float64) : Graphene::Size
      # graphene_size_interpolate: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Size.new

      # C call
      LibGraphene.graphene_size_interpolate(self, b, factor, res)

      # Return value handling
      res
    end

    def scale(factor : Float32) : Graphene::Size
      # graphene_size_scale: (Method)
      # @res: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      res = Graphene::Size.new

      # C call
      LibGraphene.graphene_size_scale(self, factor, res)

      # Return value handling
      res
    end

    def self.zero : Graphene::Size
      # graphene_size_zero: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGraphene.graphene_size_zero

      # Return value handling
      Graphene::Size.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
