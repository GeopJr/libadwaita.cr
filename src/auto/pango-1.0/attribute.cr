module Pango
  # The `PangoAttribute` structure represents the common portions of all
  # attributes.
  #
  # Particular types of attributes include this structure as their initial
  # portion. The common portion of the attribute holds the range to which
  # the value in the type-specific part of the attribute applies and should
  # be initialized using [method@Pango.Attribute.init]. By default, an attribute
  # will have an all-inclusive range of [0,%G_MAXUINT].
  class Attribute
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::Attribute))
      @pointer.copy_from(pointer, sizeof(LibPango::Attribute))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(klass : Pango::AttrClass? = nil, start_index : UInt32? = nil, end_index : UInt32? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.klass = klass unless klass.nil?
      _instance.start_index = start_index unless start_index.nil?
      _instance.end_index = end_index unless end_index.nil?
      _instance
    end

    def finalize
    end

    def klass : Pango::AttrClass
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      Pango::AttrClass.new(_var.value, GICrystal::Transfer::None)
    end

    def klass=(value : Pango::AttrClass)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value.to_unsafe
      value
    end

    def start_index : UInt32
      # Property getter
      _var = (@pointer + 8).as(Pointer(UInt32))
      _var.value
    end

    def start_index=(value : UInt32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(UInt32)).value = value
      value
    end

    def end_index : UInt32
      # Property getter
      _var = (@pointer + 12).as(Pointer(UInt32))
      _var.value
    end

    def end_index=(value : UInt32)
      # Property setter
      _var = (@pointer + 12).as(Pointer(UInt32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_attribute_get_type
    end

    def as_color : Pango::AttrColor?
      # pango_attribute_as_color: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attribute_as_color(self)

      # Return value handling
      Pango::AttrColor.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def as_float : Pango::AttrFloat?
      # pango_attribute_as_float: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attribute_as_float(self)

      # Return value handling
      Pango::AttrFloat.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def as_font_desc : Pango::AttrFontDesc?
      # pango_attribute_as_font_desc: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attribute_as_font_desc(self)

      # Return value handling
      Pango::AttrFontDesc.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def as_font_features : Pango::AttrFontFeatures?
      # pango_attribute_as_font_features: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attribute_as_font_features(self)

      # Return value handling
      Pango::AttrFontFeatures.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def as_int : Pango::AttrInt?
      # pango_attribute_as_int: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attribute_as_int(self)

      # Return value handling
      Pango::AttrInt.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def as_language : Pango::AttrLanguage?
      # pango_attribute_as_language: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attribute_as_language(self)

      # Return value handling
      Pango::AttrLanguage.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def as_shape : Pango::AttrShape?
      # pango_attribute_as_shape: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attribute_as_shape(self)

      # Return value handling
      Pango::AttrShape.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def as_size : Pango::AttrSize?
      # pango_attribute_as_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attribute_as_size(self)

      # Return value handling
      Pango::AttrSize.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def as_string : Pango::AttrString?
      # pango_attribute_as_string: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attribute_as_string(self)

      # Return value handling
      Pango::AttrString.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def copy : Pango::Attribute
      # pango_attribute_copy: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attribute_copy(self)

      # Return value handling
      Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
    end

    def destroy : Nil
      # pango_attribute_destroy: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_attribute_destroy(self)

      # Return value handling
    end

    def equal(attr2 : Pango::Attribute) : Bool
      # pango_attribute_equal: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attribute_equal(self, attr2)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def init(klass : Pango::AttrClass) : Nil
      # pango_attribute_init: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_attribute_init(self, klass)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
