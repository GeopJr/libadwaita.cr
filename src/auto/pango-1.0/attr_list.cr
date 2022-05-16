module Pango
  # A `PangoAttrList` represents a list of attributes that apply to a section
  # of text.
  #
  # The attributes in a `PangoAttrList` are, in general, allowed to overlap in
  # an arbitrary fashion. However, if the attributes are manipulated only through
  # `Pango::AttrList#change`, the overlap between properties will meet
  # stricter criteria.
  #
  # Since the `PangoAttrList` structure is stored as a linear list, it is not
  # suitable for storing attributes for large amounts of text. In general, you
  # should not use a single `PangoAttrList` for more than one paragraph of text.
  class AttrList
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(AttrList.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(AttrList.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::AttrList)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_attr_list_get_type
    end

    def initialize
      # pango_attr_list_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_attr_list_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def change(attr : Pango::Attribute) : Nil
      # pango_attr_list_change: (Method)
      # @attr: (transfer full)
      # Returns: (transfer none)

      # C call
      LibPango.pango_attr_list_change(@pointer, attr)

      # Return value handling
    end

    def copy : Pango::AttrList?
      # pango_attr_list_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_attr_list_copy(@pointer)

      # Return value handling

      Pango::AttrList.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def equal(other_list : Pango::AttrList) : Bool
      # pango_attr_list_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_attr_list_equal(@pointer, other_list)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def filter(func : Pango::AttrFilterFunc, data : Pointer(Void)?) : Pango::AttrList?
      # pango_attr_list_filter: (Method)
      # @data: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      _retval = LibPango.pango_attr_list_filter(@pointer, func, data)

      # Return value handling

      Pango::AttrList.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def attributes : GLib::SList
      # pango_attr_list_get_attributes: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_attr_list_get_attributes(@pointer)

      # Return value handling

      GLib::SList(Pango::Attribute).new(_retval, GICrystal::Transfer::Full)
    end

    def iterator : Pango::AttrIterator
      # pango_attr_list_get_iterator: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_attr_list_get_iterator(@pointer)

      # Return value handling

      Pango::AttrIterator.new(_retval, GICrystal::Transfer::Full)
    end

    def insert(attr : Pango::Attribute) : Nil
      # pango_attr_list_insert: (Method)
      # @attr: (transfer full)
      # Returns: (transfer none)

      # C call
      LibPango.pango_attr_list_insert(@pointer, attr)

      # Return value handling
    end

    def insert_before(attr : Pango::Attribute) : Nil
      # pango_attr_list_insert_before: (Method)
      # @attr: (transfer full)
      # Returns: (transfer none)

      # C call
      LibPango.pango_attr_list_insert_before(@pointer, attr)

      # Return value handling
    end

    def ref : Pango::AttrList
      # pango_attr_list_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_attr_list_ref(@pointer)

      # Return value handling

      Pango::AttrList.new(_retval, GICrystal::Transfer::Full)
    end

    def splice(other : Pango::AttrList, pos : Int32, len : Int32) : Nil
      # pango_attr_list_splice: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_attr_list_splice(@pointer, other, pos, len)

      # Return value handling
    end

    def to_string : ::String
      # pango_attr_list_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_attr_list_to_string(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def unref : Nil
      # pango_attr_list_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_attr_list_unref(@pointer)

      # Return value handling
    end

    def update(pos : Int32, remove : Int32, add : Int32) : Nil
      # pango_attr_list_update: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_attr_list_update(@pointer, pos, remove, add)

      # Return value handling
    end

    def self.from_string(text : ::String) : Pango::AttrList?
      # pango_attr_list_from_string: (None)
      # Returns: (transfer full)

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
