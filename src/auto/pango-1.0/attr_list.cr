module Pango
  # A `PangoAttrList` represents a list of attributes that apply to a section
  # of text.
  #
  # The attributes in a `PangoAttrList` are, in general, allowed to overlap in
  # an arbitrary fashion. However, if the attributes are manipulated only through
  # [method@Pango.AttrList.change], the overlap between properties will meet
  # stricter criteria.
  #
  # Since the `PangoAttrList` structure is stored as a linear list, it is not
  # suitable for storing attributes for large amounts of text. In general, you
  # should not use a single `PangoAttrList` for more than one paragraph of text.
  class AttrList
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(AttrList.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(AttrList.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_attr_list_get_type
    end

    def initialize
      # pango_attr_list_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attr_list_new

      # Return value handling
      @pointer = _retval
    end

    def change(attr : Pango::Attribute) : Nil
      # pango_attr_list_change: (Method)
      # @attr: (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      LibGObject.g_object_ref(attr)

      # C call
      LibPango.pango_attr_list_change(self, attr)

      # Return value handling
    end

    def copy : Pango::AttrList?
      # pango_attr_list_copy: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attr_list_copy(self)

      # Return value handling
      Pango::AttrList.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def equal(other_list : Pango::AttrList) : Bool
      # pango_attr_list_equal: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attr_list_equal(self, other_list)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def filter(func : Pointer(Void), data : Pointer(Void)?) : Pango::AttrList?
      # pango_attr_list_filter: (Method)
      # @data: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      _retval = LibPango.pango_attr_list_filter(self, func, data)

      # Return value handling
      Pango::AttrList.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def attributes : GLib::SList
      # pango_attr_list_get_attributes: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attr_list_get_attributes(self)

      # Return value handling
      GLib::SList(Pango::Attribute).new(_retval, GICrystal::Transfer::Full)
    end

    def iterator : Pango::AttrIterator
      # pango_attr_list_get_iterator: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attr_list_get_iterator(self)

      # Return value handling
      Pango::AttrIterator.new(_retval, GICrystal::Transfer::Full)
    end

    def insert(attr : Pango::Attribute) : Nil
      # pango_attr_list_insert: (Method)
      # @attr: (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      LibGObject.g_object_ref(attr)

      # C call
      LibPango.pango_attr_list_insert(self, attr)

      # Return value handling
    end

    def insert_before(attr : Pango::Attribute) : Nil
      # pango_attr_list_insert_before: (Method)
      # @attr: (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      LibGObject.g_object_ref(attr)

      # C call
      LibPango.pango_attr_list_insert_before(self, attr)

      # Return value handling
    end

    def ref : Pango::AttrList
      # pango_attr_list_ref: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attr_list_ref(self)

      # Return value handling
      Pango::AttrList.new(_retval, GICrystal::Transfer::Full)
    end

    def splice(other : Pango::AttrList, pos : Int32, len : Int32) : Nil
      # pango_attr_list_splice: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_attr_list_splice(self, other, pos, len)

      # Return value handling
    end

    def to_string : ::String
      # pango_attr_list_to_string: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attr_list_to_string(self)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def unref : Nil
      # pango_attr_list_unref: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_attr_list_unref(self)

      # Return value handling
    end

    def update(pos : Int32, remove : Int32, add : Int32) : Nil
      # pango_attr_list_update: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_attr_list_update(self, pos, remove, add)

      # Return value handling
    end

    def self.from_string(text : ::String) : Pango::AttrList?
      # pango_attr_list_from_string: (None)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attr_list_from_string(text)

      # Return value handling
      Pango::AttrList.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def to_unsafe
      @pointer
    end
  end
end
