module Pango
  # A `PangoTabArray` contains an array of tab stops.
  #
  # `PangoTabArray` can be used to set tab stops in a `PangoLayout`.
  # Each tab stop has an alignment, a position, and optionally
  # a character to use as decimal point.
  class TabArray
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(TabArray.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(TabArray.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::TabArray)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_tab_array_get_type
    end

    def initialize(initial_size : Int32, positions_in_pixels : Bool)
      # pango_tab_array_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_tab_array_new(initial_size, positions_in_pixels)

      # Return value handling

      @pointer = _retval
    end

    def copy : Pango::TabArray
      # pango_tab_array_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_tab_array_copy(self)

      # Return value handling

      Pango::TabArray.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # pango_tab_array_free: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_tab_array_free(self)

      # Return value handling
    end

    def decimal_point(tab_index : Int32) : UInt32
      # pango_tab_array_get_decimal_point: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_tab_array_get_decimal_point(self, tab_index)

      # Return value handling

      _retval
    end

    def positions_in_pixels : Bool
      # pango_tab_array_get_positions_in_pixels: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_tab_array_get_positions_in_pixels(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def size : Int32
      # pango_tab_array_get_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_tab_array_get_size(self)

      # Return value handling

      _retval
    end

    def tab(tab_index : Int32) : Nil
      # pango_tab_array_get_tab: (Method)
      # @alignment: (out) (transfer full) (optional)
      # @location: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      alignment = Pointer(UInt32).null
      # Generator::OutArgUsedInReturnPlan
      location = Pointer(Int32).null

      # C call
      LibPango.pango_tab_array_get_tab(self, tab_index, alignment, location)

      # Return value handling
    end

    def tabs : Nil
      # pango_tab_array_get_tabs: (Method)
      # @alignments: (out) (transfer full) (optional)
      # @locations: (out) (transfer full) (optional) (array element-type Int32)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      alignments = Pointer(Pointer(UInt32)).null
      # Generator::OutArgUsedInReturnPlan
      locations = Pointer(Pointer(Int32)).null
      # Generator::ArrayArgPlan
      locations = locations.to_a.to_unsafe

      # C call
      LibPango.pango_tab_array_get_tabs(self, alignments, locations)

      # Return value handling
    end

    def resize(new_size : Int32) : Nil
      # pango_tab_array_resize: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_tab_array_resize(self, new_size)

      # Return value handling
    end

    def set_decimal_point(tab_index : Int32, decimal_point : UInt32) : Nil
      # pango_tab_array_set_decimal_point: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_tab_array_set_decimal_point(self, tab_index, decimal_point)

      # Return value handling
    end

    def positions_in_pixels=(positions_in_pixels : Bool) : Nil
      # pango_tab_array_set_positions_in_pixels: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_tab_array_set_positions_in_pixels(self, positions_in_pixels)

      # Return value handling
    end

    def set_tab(tab_index : Int32, alignment : Pango::TabAlign, location : Int32) : Nil
      # pango_tab_array_set_tab: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_tab_array_set_tab(self, tab_index, alignment, location)

      # Return value handling
    end

    def sort : Nil
      # pango_tab_array_sort: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_tab_array_sort(self)

      # Return value handling
    end

    def to_string : ::String
      # pango_tab_array_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_tab_array_to_string(self)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def self.from_string(text : ::String) : Pango::TabArray?
      # pango_tab_array_from_string: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_tab_array_from_string(text)

      # Return value handling

      Pango::TabArray.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def to_unsafe
      @pointer
    end
  end
end
