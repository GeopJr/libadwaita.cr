module Pango
  # The `PangoAnalysis` structure stores information about
  # the properties of a segment of text.
  class Analysis
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::Analysis))
      @pointer.copy_from(pointer, sizeof(LibPango::Analysis))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(shape_engine : Pointer(Void)? = nil, lang_engine : Pointer(Void)? = nil, font : Pango::Font? = nil, level : UInt8? = nil, gravity : UInt8? = nil, flags : UInt8? = nil, script : UInt8? = nil, language : Pango::Language? = nil, extra_attrs : GLib::SList? = nil)
      _ptr = Pointer(Void).malloc(48)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.shape_engine = shape_engine unless shape_engine.nil?
      _instance.lang_engine = lang_engine unless lang_engine.nil?
      _instance.font = font unless font.nil?
      _instance.level = level unless level.nil?
      _instance.gravity = gravity unless gravity.nil?
      _instance.flags = flags unless flags.nil?
      _instance.script = script unless script.nil?
      _instance.language = language unless language.nil?
      _instance.extra_attrs = extra_attrs unless extra_attrs.nil?
      _instance
    end

    def finalize
    end

    def shape_engine : Pointer(Void)
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      _var.value
    end

    def shape_engine=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value
      value
    end

    def lang_engine : Pointer(Void)
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      _var.value
    end

    def lang_engine=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value
      value
    end

    def font : Pango::Font
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      Pango::Font.new(_var.value, GICrystal::Transfer::None)
    end

    def font=(value : Pango::Font)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def level : UInt8
      # Property getter
      _var = (@pointer + 24).as(Pointer(UInt8))
      _var.value
    end

    def level=(value : UInt8)
      # Property setter
      _var = (@pointer + 24).as(Pointer(UInt8)).value = value
      value
    end

    def gravity : UInt8
      # Property getter
      _var = (@pointer + 25).as(Pointer(UInt8))
      _var.value
    end

    def gravity=(value : UInt8)
      # Property setter
      _var = (@pointer + 25).as(Pointer(UInt8)).value = value
      value
    end

    def flags : UInt8
      # Property getter
      _var = (@pointer + 26).as(Pointer(UInt8))
      _var.value
    end

    def flags=(value : UInt8)
      # Property setter
      _var = (@pointer + 26).as(Pointer(UInt8)).value = value
      value
    end

    def script : UInt8
      # Property getter
      _var = (@pointer + 27).as(Pointer(UInt8))
      _var.value
    end

    def script=(value : UInt8)
      # Property setter
      _var = (@pointer + 27).as(Pointer(UInt8)).value = value
      value
    end

    def language : Pango::Language
      # Property getter
      _var = (@pointer + 32).as(Pointer(Pointer(Void)))
      Pango::Language.new(_var.value, GICrystal::Transfer::None)
    end

    def language=(value : Pango::Language)
      # Property setter
      _var = (@pointer + 32).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def extra_attrs : GLib::SList
      # Property getter
      _var = (@pointer + 40).as(Pointer(Pointer(LibGLib::SList)))
      GLib::SList(Pointer(Void)).new(_var.value, GICrystal::Transfer::None)
    end

    def extra_attrs=(value : GLib::SList)
      # Property setter
      _var = (@pointer + 40).as(Pointer(Pointer(LibGLib::SList))).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
