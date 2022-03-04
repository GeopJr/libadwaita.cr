module GLib
  # Any of the fields in #GMarkupParser can be %NULL, in which case they
  # will be ignored. Except for the @error function, any of these callbacks
  # can set an error; in particular the %G_MARKUP_ERROR_UNKNOWN_ELEMENT,
  # %G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE, and %G_MARKUP_ERROR_INVALID_CONTENT
  # errors are intended to be set from these callbacks. If you set an error
  # from a callback, g_markup_parse_context_parse() will report that error
  # back to its caller.
  class MarkupParser
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGLib::MarkupParser))
      @pointer.copy_from(pointer, sizeof(LibGLib::MarkupParser))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(start_element : Pointer(Void)? = nil, end_element : Pointer(Void)? = nil, text : Pointer(Void)? = nil, passthrough : Pointer(Void)? = nil, error : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(40)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.start_element = start_element unless start_element.nil?
      _instance.end_element = end_element unless end_element.nil?
      _instance.text = text unless text.nil?
      _instance.passthrough = passthrough unless passthrough.nil?
      _instance.error = error unless error.nil?
      _instance
    end

    def finalize
    end

    def start_element : Pointer(Void)
      # Property getter
      _var = (@pointer + 0).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def start_element=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 0).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def end_element : Pointer(Void)
      # Property getter
      _var = (@pointer + 8).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def end_element=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 8).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def text : Pointer(Void)
      # Property getter
      _var = (@pointer + 16).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def text=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 16).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def passthrough : Pointer(Void)
      # Property getter
      _var = (@pointer + 24).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def passthrough=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 24).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def error : Pointer(Void)
      # Property getter
      _var = (@pointer + 32).as(Pointer(-> Void))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def error=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 32).as(Pointer(-> Void)).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
