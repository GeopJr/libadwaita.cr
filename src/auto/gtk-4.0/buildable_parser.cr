module Gtk
  # A sub-parser for `GtkBuildable` implementations.
  class BuildableParser
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::BuildableParser))
      @pointer.copy_from(pointer, sizeof(LibGtk::BuildableParser))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(start_element : Pointer(Void)? = nil, end_element : Pointer(Void)? = nil, text : Pointer(Void)? = nil, error : Pointer(Void)? = nil, padding : Enumerable(Pointer(Void))? = nil)
      _ptr = Pointer(Void).malloc(64)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.start_element = start_element unless start_element.nil?
      _instance.end_element = end_element unless end_element.nil?
      _instance.text = text unless text.nil?
      _instance.error = error unless error.nil?
      _instance.padding = padding unless padding.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::BuildableParser)).zero?
    end

    def start_element : Pointer(Void)
      _var = (@pointer + 0).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def start_element=(value : Pointer(Void))
      _var = (@pointer + 0).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGtk::BuildableParser))
      value
    end

    def end_element : Pointer(Void)
      _var = (@pointer + 8).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def end_element=(value : Pointer(Void))
      _var = (@pointer + 8).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGtk::BuildableParser))
      value
    end

    def text : Pointer(Void)
      _var = (@pointer + 16).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def text=(value : Pointer(Void))
      _var = (@pointer + 16).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGtk::BuildableParser))
      value
    end

    def error : Pointer(Void)
      _var = (@pointer + 24).as(Pointer(-> Void))
      Pointer(Void).new(_var, GICrystal::Transfer::None)
    end

    def error=(value : Pointer(Void))
      _var = (@pointer + 24).as(Pointer(-> Void))
      _var.copy_from(value.to_unsafe, sizeof(LibGtk::BuildableParser))
      value
    end

    def padding : Enumerable(Pointer(Void))
      _var = (@pointer + 32).as(Pointer(Pointer(Void)[4]))
      _var.value
    end

    def padding=(value : Enumerable(Pointer(Void)))
      _var = (@pointer + 32).as(Pointer(Pointer(Void)[4])).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
