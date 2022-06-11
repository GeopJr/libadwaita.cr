module Gio
  # Determines if a string matches a file attribute.
  class FileAttributeMatcher
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(FileAttributeMatcher.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(FileAttributeMatcher.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::FileAttributeMatcher)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_attribute_matcher_get_type
    end

    def self.new(attributes : ::String) : self
      # g_file_attribute_matcher_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_attribute_matcher_new(attributes)

      # Return value handling

      Gio::FileAttributeMatcher.new(_retval, GICrystal::Transfer::Full)
    end

    def enumerate_namespace(ns : ::String) : Bool
      # g_file_attribute_matcher_enumerate_namespace: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_attribute_matcher_enumerate_namespace(@pointer, ns)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def enumerate_next : ::String?
      # g_file_attribute_matcher_enumerate_next: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_attribute_matcher_enumerate_next(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    def matches(attribute : ::String) : Bool
      # g_file_attribute_matcher_matches: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_attribute_matcher_matches(@pointer, attribute)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def matches_only(attribute : ::String) : Bool
      # g_file_attribute_matcher_matches_only: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_attribute_matcher_matches_only(@pointer, attribute)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def ref : Gio::FileAttributeMatcher
      # g_file_attribute_matcher_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_attribute_matcher_ref(@pointer)

      # Return value handling

      Gio::FileAttributeMatcher.new(_retval, GICrystal::Transfer::Full)
    end

    def subtract(subtract : Gio::FileAttributeMatcher?) : Gio::FileAttributeMatcher?
      # g_file_attribute_matcher_subtract: (Method)
      # @subtract: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      subtract = if subtract.nil?
                   Pointer(Void).null
                 else
                   subtract.to_unsafe
                 end

      # C call
      _retval = LibGio.g_file_attribute_matcher_subtract(@pointer, subtract)

      # Return value handling

      Gio::FileAttributeMatcher.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def to_string : ::String
      # g_file_attribute_matcher_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_attribute_matcher_to_string(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def unref : Nil
      # g_file_attribute_matcher_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_attribute_matcher_unref(@pointer)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
