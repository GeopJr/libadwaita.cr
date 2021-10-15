module Pango
  # A `PangoAttrIterator` is used to iterate through a `PangoAttrList`.
  #
  # A new iterator is created with [method@Pango.AttrList.get_iterator].
  # Once the iterator is created, it can be advanced through the style
  # changes in the text using [method@Pango.AttrIterator.next]. At each
  # style change, the range of the current style segment and the attributes
  # currently in effect can be queried.
  class AttrIterator
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(AttrIterator.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(AttrIterator.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_attr_iterator_get_type
    end

    def copy : Pango::AttrIterator
      # pango_attr_iterator_copy: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_attr_iterator_copy(self)
      Pango::AttrIterator.new(_retval, GICrystal::Transfer::Full)
    end

    def destroy : Nil
      # pango_attr_iterator_destroy: (Method)
      # Returns: (transfer none)

      LibPango.pango_attr_iterator_destroy(self)
    end

    def get(type : Pango::AttrType) : Pango::Attribute?
      # pango_attr_iterator_get: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_attr_iterator_get(self, type)
      Pango::Attribute.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def attrs : GLib::SList
      # pango_attr_iterator_get_attrs: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_attr_iterator_get_attrs(self)
      GLib::SList(Pango::Attribute).new(_retval, GICrystal::Transfer::Full)
    end

    def font(desc : Pango::FontDescription) : Nil
      # pango_attr_iterator_get_font: (Method)
      # @language: (out) (transfer full) (optional)
      # @extra_attrs: (out) (transfer full) (optional)
      # Returns: (transfer none)

      language = Pointer(Pointer(Void)).null
      extra_attrs = Pointer(Pointer(LibGLib::SList)).null

      LibPango.pango_attr_iterator_get_font(self, desc, language, extra_attrs)
    end

    def _next : Bool
      # pango_attr_iterator_next: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_attr_iterator_next(self)
      GICrystal.to_bool(_retval)
    end

    def range(start : Int32, end _end : Int32) : Nil
      # pango_attr_iterator_range: (Method)
      # @start: (out) (transfer full)
      # @end: (out) (transfer full)
      # Returns: (transfer none)

      LibPango.pango_attr_iterator_range(self, start, _end)
    end

    def to_unsafe
      @pointer
    end
  end
end
