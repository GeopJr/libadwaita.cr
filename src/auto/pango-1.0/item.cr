module Pango
  # The `PangoItem` structure stores information about a segment of text.
  #
  # You typically obtain `PangoItems` by itemizing a piece of text
  # with [func@itemize].
  class Item
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::Item))
      @pointer.copy_from(pointer, sizeof(LibPango::Item))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(offset : Int32? = nil, length : Int32? = nil, num_chars : Int32? = nil, analysis : Pango::Analysis? = nil)
      _ptr = Pointer(Void).malloc(64)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.offset = offset unless offset.nil?
      _instance.length = length unless length.nil?
      _instance.num_chars = num_chars unless num_chars.nil?
      _instance.analysis = analysis unless analysis.nil?
      _instance
    end

    def finalize
    end

    def offset : Int32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def offset=(value : Int32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def length : Int32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def length=(value : Int32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def num_chars : Int32
      # Property getter
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def num_chars=(value : Int32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    def analysis : Pango::Analysis
      # Property getter
      _var = (@pointer + 16).as(Pointer(Void))
      Pango::Analysis.new(_var.value, GICrystal::Transfer::None)
    end

    def analysis=(value : Pango::Analysis)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_item_get_type
    end

    def initialize
      # pango_item_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_item_new

      # Return value handling
      @pointer = _retval
    end

    def apply_attrs(iter : Pango::AttrIterator) : Nil
      # pango_item_apply_attrs: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_item_apply_attrs(self, iter)

      # Return value handling
    end

    def copy : Pango::Item?
      # pango_item_copy: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_item_copy(self)

      # Return value handling
      Pango::Item.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def free : Nil
      # pango_item_free: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_item_free(self)

      # Return value handling
    end

    def split(split_index : Int32, split_offset : Int32) : Pango::Item
      # pango_item_split: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_item_split(self, split_index, split_offset)

      # Return value handling
      Pango::Item.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
