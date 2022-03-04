require "../g_object-2.0/object"

module Pango
  # A `PangoCoverage` structure is a map from Unicode characters
  # to [enum@Pango.CoverageLevel] values.
  #
  # It is often necessary in Pango to determine if a particular
  # font can represent a particular character, and also how well
  # it can represent that character. The `PangoCoverage` is a data
  # structure that is used to represent that information. It is an
  # opaque structure with no public fields.
  class Coverage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_coverage_get_type
    end

    def initialize
      # pango_coverage_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_coverage_new

      # Return value handling
      @pointer = _retval
    end

    def self.from_bytes(bytes : Enumerable(UInt8)) : Pango::Coverage?
      # pango_coverage_from_bytes: (None)
      # @bytes: (array length=n_bytes element-type UInt8)
      # Returns: (transfer full)

      # Handle parameters
      n_bytes = bytes.size
      bytes = bytes.to_a.to_unsafe

      # C call
      _retval = LibPango.pango_coverage_from_bytes(bytes, n_bytes)

      # Return value handling
      Pango::Coverage.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.from_bytes(*bytes : UInt8)
      self.from_bytes(bytes)
    end

    def copy : Pango::Coverage
      # pango_coverage_copy: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_coverage_copy(self)

      # Return value handling
      Pango::Coverage.new(_retval, GICrystal::Transfer::Full)
    end

    def get(index_ : Int32) : Pango::CoverageLevel
      # pango_coverage_get: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibPango.pango_coverage_get(self, index_)

      # Return value handling
      Pango::CoverageLevel.from_value(_retval)
    end

    def max(other : Pango::Coverage) : Nil
      # pango_coverage_max: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_coverage_max(self, other)

      # Return value handling
    end

    def ref : Pango::Coverage
      # pango_coverage_ref: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_coverage_ref(self)

      # Return value handling
      Pango::Coverage.new(_retval, GICrystal::Transfer::Full)
    end

    def set(index_ : Int32, level : Pango::CoverageLevel) : Nil
      # pango_coverage_set: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_coverage_set(self, index_, level)

      # Return value handling
    end

    def to_bytes(bytes : Enumerable(UInt8)) : Nil
      # pango_coverage_to_bytes: (Method)
      # @bytes: (out) (transfer full) (array length=n_bytes element-type UInt8)
      # @n_bytes: (out) (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      n_bytes = bytes.size
      bytes = bytes.to_a.to_unsafe

      # C call
      LibPango.pango_coverage_to_bytes(self, bytes, n_bytes)

      # Return value handling
    end

    def to_bytes(*bytes : UInt8)
      to_bytes(bytes)
    end

    def unref : Nil
      # pango_coverage_unref: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibPango.pango_coverage_unref(self)

      # Return value handling
    end
  end
end
