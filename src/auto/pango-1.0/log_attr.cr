module Pango
  # The `PangoLogAttr` structure stores information about the attributes of a
  # single character.
  class LogAttr
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::LogAttr))
      @pointer.copy_from(pointer, sizeof(LibPango::LogAttr))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(is_line_break : UInt32? = nil, is_mandatory_break : UInt32? = nil, is_char_break : UInt32? = nil, is_white : UInt32? = nil, is_cursor_position : UInt32? = nil, is_word_start : UInt32? = nil, is_word_end : UInt32? = nil, is_sentence_boundary : UInt32? = nil, is_sentence_start : UInt32? = nil, is_sentence_end : UInt32? = nil, backspace_deletes_character : UInt32? = nil, is_expandable_space : UInt32? = nil, is_word_boundary : UInt32? = nil, break_inserts_hyphen : UInt32? = nil, break_removes_preceding : UInt32? = nil, reserved : UInt32? = nil)
      _ptr = Pointer(Void).malloc(64)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.is_line_break = is_line_break unless is_line_break.nil?
      _instance.is_mandatory_break = is_mandatory_break unless is_mandatory_break.nil?
      _instance.is_char_break = is_char_break unless is_char_break.nil?
      _instance.is_white = is_white unless is_white.nil?
      _instance.is_cursor_position = is_cursor_position unless is_cursor_position.nil?
      _instance.is_word_start = is_word_start unless is_word_start.nil?
      _instance.is_word_end = is_word_end unless is_word_end.nil?
      _instance.is_sentence_boundary = is_sentence_boundary unless is_sentence_boundary.nil?
      _instance.is_sentence_start = is_sentence_start unless is_sentence_start.nil?
      _instance.is_sentence_end = is_sentence_end unless is_sentence_end.nil?
      _instance.backspace_deletes_character = backspace_deletes_character unless backspace_deletes_character.nil?
      _instance.is_expandable_space = is_expandable_space unless is_expandable_space.nil?
      _instance.is_word_boundary = is_word_boundary unless is_word_boundary.nil?
      _instance.break_inserts_hyphen = break_inserts_hyphen unless break_inserts_hyphen.nil?
      _instance.break_removes_preceding = break_removes_preceding unless break_removes_preceding.nil?
      _instance.reserved = reserved unless reserved.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::LogAttr)).zero?
    end

    def is_line_break : UInt32
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def is_line_break=(value : UInt32)
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def is_mandatory_break : UInt32
      _var = (@pointer + 4).as(Pointer(UInt32))
      _var.value
    end

    def is_mandatory_break=(value : UInt32)
      _var = (@pointer + 4).as(Pointer(UInt32)).value = value
      value
    end

    def is_char_break : UInt32
      _var = (@pointer + 8).as(Pointer(UInt32))
      _var.value
    end

    def is_char_break=(value : UInt32)
      _var = (@pointer + 8).as(Pointer(UInt32)).value = value
      value
    end

    def is_white : UInt32
      _var = (@pointer + 12).as(Pointer(UInt32))
      _var.value
    end

    def is_white=(value : UInt32)
      _var = (@pointer + 12).as(Pointer(UInt32)).value = value
      value
    end

    def is_cursor_position : UInt32
      _var = (@pointer + 16).as(Pointer(UInt32))
      _var.value
    end

    def is_cursor_position=(value : UInt32)
      _var = (@pointer + 16).as(Pointer(UInt32)).value = value
      value
    end

    def is_word_start : UInt32
      _var = (@pointer + 20).as(Pointer(UInt32))
      _var.value
    end

    def is_word_start=(value : UInt32)
      _var = (@pointer + 20).as(Pointer(UInt32)).value = value
      value
    end

    def is_word_end : UInt32
      _var = (@pointer + 24).as(Pointer(UInt32))
      _var.value
    end

    def is_word_end=(value : UInt32)
      _var = (@pointer + 24).as(Pointer(UInt32)).value = value
      value
    end

    def is_sentence_boundary : UInt32
      _var = (@pointer + 28).as(Pointer(UInt32))
      _var.value
    end

    def is_sentence_boundary=(value : UInt32)
      _var = (@pointer + 28).as(Pointer(UInt32)).value = value
      value
    end

    def is_sentence_start : UInt32
      _var = (@pointer + 32).as(Pointer(UInt32))
      _var.value
    end

    def is_sentence_start=(value : UInt32)
      _var = (@pointer + 32).as(Pointer(UInt32)).value = value
      value
    end

    def is_sentence_end : UInt32
      _var = (@pointer + 36).as(Pointer(UInt32))
      _var.value
    end

    def is_sentence_end=(value : UInt32)
      _var = (@pointer + 36).as(Pointer(UInt32)).value = value
      value
    end

    def backspace_deletes_character : UInt32
      _var = (@pointer + 40).as(Pointer(UInt32))
      _var.value
    end

    def backspace_deletes_character=(value : UInt32)
      _var = (@pointer + 40).as(Pointer(UInt32)).value = value
      value
    end

    def is_expandable_space : UInt32
      _var = (@pointer + 44).as(Pointer(UInt32))
      _var.value
    end

    def is_expandable_space=(value : UInt32)
      _var = (@pointer + 44).as(Pointer(UInt32)).value = value
      value
    end

    def is_word_boundary : UInt32
      _var = (@pointer + 48).as(Pointer(UInt32))
      _var.value
    end

    def is_word_boundary=(value : UInt32)
      _var = (@pointer + 48).as(Pointer(UInt32)).value = value
      value
    end

    def break_inserts_hyphen : UInt32
      _var = (@pointer + 52).as(Pointer(UInt32))
      _var.value
    end

    def break_inserts_hyphen=(value : UInt32)
      _var = (@pointer + 52).as(Pointer(UInt32)).value = value
      value
    end

    def break_removes_preceding : UInt32
      _var = (@pointer + 56).as(Pointer(UInt32))
      _var.value
    end

    def break_removes_preceding=(value : UInt32)
      _var = (@pointer + 56).as(Pointer(UInt32)).value = value
      value
    end

    def reserved : UInt32
      _var = (@pointer + 60).as(Pointer(UInt32))
      _var.value
    end

    def reserved=(value : UInt32)
      _var = (@pointer + 60).as(Pointer(UInt32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
