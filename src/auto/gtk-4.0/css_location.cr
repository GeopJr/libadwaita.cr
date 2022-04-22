module Gtk
  # Represents a location in a file or other source of data parsed
  # by the CSS engine.
  #
  # The @bytes and @line_bytes offsets are meant to be used to
  # programmatically match data. The @lines and @line_chars offsets
  # can be used for printing the location in a file.
  #
  # Note that the @lines parameter starts from 0 and is increased
  # whenever a CSS line break is encountered. (CSS defines the C character
  # sequences "\r\n", "\r", "\n" and "\f" as newlines.)
  # If your document uses different rules for line breaking, you might want
  # run into problems here.
  class CssLocation
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::CssLocation))
      @pointer.copy_from(pointer, sizeof(LibGtk::CssLocation))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(bytes : UInt64? = nil, chars : UInt64? = nil, lines : UInt64? = nil, line_bytes : UInt64? = nil, line_chars : UInt64? = nil)
      _ptr = Pointer(Void).malloc(40)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.bytes = bytes unless bytes.nil?
      _instance.chars = chars unless chars.nil?
      _instance.lines = lines unless lines.nil?
      _instance.line_bytes = line_bytes unless line_bytes.nil?
      _instance.line_chars = line_chars unless line_chars.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::CssLocation)).zero?
    end

    def bytes : UInt64
      _var = (@pointer + 0).as(Pointer(UInt64))
      _var.value
    end

    def bytes=(value : UInt64)
      _var = (@pointer + 0).as(Pointer(UInt64)).value = value
      value
    end

    def chars : UInt64
      _var = (@pointer + 8).as(Pointer(UInt64))
      _var.value
    end

    def chars=(value : UInt64)
      _var = (@pointer + 8).as(Pointer(UInt64)).value = value
      value
    end

    def lines : UInt64
      _var = (@pointer + 16).as(Pointer(UInt64))
      _var.value
    end

    def lines=(value : UInt64)
      _var = (@pointer + 16).as(Pointer(UInt64)).value = value
      value
    end

    def line_bytes : UInt64
      _var = (@pointer + 24).as(Pointer(UInt64))
      _var.value
    end

    def line_bytes=(value : UInt64)
      _var = (@pointer + 24).as(Pointer(UInt64)).value = value
      value
    end

    def line_chars : UInt64
      _var = (@pointer + 32).as(Pointer(UInt64))
      _var.value
    end

    def line_chars=(value : UInt64)
      _var = (@pointer + 32).as(Pointer(UInt64)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
