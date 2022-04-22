require "../g_object-2.0/object"

module Pango
  # A `PangoCoverage` structure is a map from Unicode characters
  # to `Pango#CoverageLevel` values.
  #
  # It is often necessary in Pango to determine if a particular
  # font can represent a particular character, and also how well
  # it can represent that character. The `PangoCoverage` is a data
  # structure that is used to represent that information. It is an
  # opaque structure with no public fields.
  @[GObject::GeneratedWrapper]
  class Coverage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibPango::Coverage), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_coverage_get_type
    end

    # Create a new `PangoCoverage`
    def initialize
      # pango_coverage_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_coverage_new

      # Return value handling

      @pointer = _retval
    end

    # Convert data generated from `Pango::Coverage#to_bytes`
    # back to a `PangoCoverage`.
    def self.from_bytes(bytes : Enumerable(UInt8)) : Pango::Coverage?
      # pango_coverage_from_bytes: (None)
      # @bytes: (array length=n_bytes element-type UInt8)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_bytes = bytes.size
      # Generator::ArrayArgPlan
      bytes = bytes.to_a.to_unsafe

      # C call
      _retval = LibPango.pango_coverage_from_bytes(bytes, n_bytes)

      # Return value handling

      Pango::Coverage.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.from_bytes(*bytes : UInt8)
      self.from_bytes(bytes)
    end

    # Copy an existing `PangoCoverage`.
    def copy : Pango::Coverage
      # pango_coverage_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_coverage_copy(self)

      # Return value handling

      Pango::Coverage.new(_retval, GICrystal::Transfer::Full)
    end

    # Determine whether a particular index is covered by @coverage.
    def get(index_ : Int32) : Pango::CoverageLevel
      # pango_coverage_get: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_coverage_get(self, index_)

      # Return value handling

      Pango::CoverageLevel.new(_retval)
    end

    # Set the coverage for each index in @coverage to be the max (better)
    # value of the current coverage for the index and the coverage for
    # the corresponding index in @other.
    def max(other : Pango::Coverage) : Nil
      # pango_coverage_max: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_coverage_max(self, other)

      # Return value handling
    end

    # Increase the reference count on the `PangoCoverage` by one.
    def ref : Pango::Coverage
      # pango_coverage_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibPango.pango_coverage_ref(self)

      # Return value handling

      Pango::Coverage.new(_retval, GICrystal::Transfer::Full)
    end

    # Modify a particular index within @coverage
    def set(index_ : Int32, level : Pango::CoverageLevel) : Nil
      # pango_coverage_set: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_coverage_set(self, index_, level)

      # Return value handling
    end

    # Convert a `PangoCoverage` structure into a flat binary format.
    def to_bytes(bytes : Enumerable(UInt8)) : Nil
      # pango_coverage_to_bytes: (Method)
      # @bytes: (out) (transfer full) (array length=n_bytes element-type UInt8)
      # @n_bytes: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_bytes = bytes.size
      # Generator::ArrayArgPlan
      bytes = bytes.to_a.to_unsafe

      # C call
      LibPango.pango_coverage_to_bytes(self, bytes, n_bytes)

      # Return value handling
    end

    def to_bytes(*bytes : UInt8)
      to_bytes(bytes)
    end

    # Decrease the reference count on the `PangoCoverage` by one.
    #
    # If the result is zero, free the coverage and all associated memory.
    def unref : Nil
      # pango_coverage_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibPango.pango_coverage_unref(self)

      # Return value handling
    end
  end
end
