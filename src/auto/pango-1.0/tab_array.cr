module Pango
  # A `PangoTabArray` contains an array of tab stops.
  #
  # `PangoTabArray` can be used to set tab stops in a `PangoLayout`.
  # Each tab stop has an alignment and a position.
  class TabArray
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(TabArray.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(TabArray.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_tab_array_get_type
    end

    def initialize(initial_size : Int32, positions_in_pixels : Bool)
      # pango_tab_array_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibPango.pango_tab_array_new(initial_size, positions_in_pixels)
      @pointer = _retval
    end

    def copy : Pango::TabArray
      # pango_tab_array_copy: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_tab_array_copy(self)
      Pango::TabArray.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # pango_tab_array_free: (Method)
      # Returns: (transfer none)

      LibPango.pango_tab_array_free(self)
    end

    def positions_in_pixels : Bool
      # pango_tab_array_get_positions_in_pixels: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_tab_array_get_positions_in_pixels(self)
      GICrystal.to_bool(_retval)
    end

    def size : Int32
      # pango_tab_array_get_size: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_tab_array_get_size(self)
      _retval
    end

    def tab(tab_index : Int32) : Nil
      # pango_tab_array_get_tab: (Method)
      # @alignment: (out) (transfer full) (optional)
      # @location: (out) (transfer full) (optional)
      # Returns: (transfer none)

      alignment = Pointer(UInt32).null
      location = Pointer(Int32).null

      LibPango.pango_tab_array_get_tab(self, tab_index, alignment, location)
    end

    def tabs : Nil
      # pango_tab_array_get_tabs: (Method)
      # @alignments: (out) (transfer full) (optional)
      # @locations: (out) (transfer full) (optional) (array element-type Int32)
      # Returns: (transfer none)

      alignments = Pointer(Pointer(UInt32)).null
      locations = Pointer(Pointer(Int32)).null
      locations = locations.to_a.to_unsafe

      LibPango.pango_tab_array_get_tabs(self, alignments, locations)
    end

    def resize(new_size : Int32) : Nil
      # pango_tab_array_resize: (Method)
      # Returns: (transfer none)

      LibPango.pango_tab_array_resize(self, new_size)
    end

    def set_tab(tab_index : Int32, alignment : Pango::TabAlign, location : Int32) : Nil
      # pango_tab_array_set_tab: (Method)
      # Returns: (transfer none)

      LibPango.pango_tab_array_set_tab(self, tab_index, alignment, location)
    end

    def to_unsafe
      @pointer
    end
  end
end
