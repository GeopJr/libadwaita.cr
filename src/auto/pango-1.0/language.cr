module Pango
  # The `PangoLanguage` structure is used to
  # represent a language.
  #
  # `PangoLanguage` pointers can be efficiently
  # copied and compared with each other.
  class Language
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(Language.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(Language.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibPango::Language)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_language_get_type
    end

    def sample_string : ::String
      # pango_language_get_sample_string: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_language_get_sample_string(self)

      # Return value handling

      ::String.new(_retval)
    end

    def scripts : Int32
      # pango_language_get_scripts: (Method)
      # @num_scripts: (out) (transfer full) (caller-allocates) (optional)
      # Returns: (transfer none) (array length=num_scripts element-type Interface)

      # Generator::OutArgUsedInReturnPlan
      num_scripts = 0
      # Generator::CallerAllocatesPlan
      num_scripts = Int32.new

      # C call
      _retval = LibPango.pango_language_get_scripts(self, pointerof(num_scripts))

      # Return value handling

      num_scripts unless _retval.null?
    end

    def includes_script(script : Pango::Script) : Bool
      # pango_language_includes_script: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_language_includes_script(self, script)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def matches(range_list : ::String) : Bool
      # pango_language_matches: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_language_matches(self, range_list)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def to_string : ::String
      # pango_language_to_string: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_language_to_string(self)

      # Return value handling

      ::String.new(_retval)
    end

    def self.from_string(language : ::String?) : Pango::Language?
      # pango_language_from_string: (None)
      # @language: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      language = if language.nil?
                   Pointer(LibC::Char).null
                 else
                   language.to_unsafe
                 end

      # C call
      _retval = LibPango.pango_language_from_string(language)

      # Return value handling

      Pango::Language.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def self.default : Pango::Language
      # pango_language_get_default: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_language_get_default

      # Return value handling

      Pango::Language.new(_retval, GICrystal::Transfer::None)
    end

    def self.preferred : Pango::Language?
      # pango_language_get_preferred: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibPango.pango_language_get_preferred

      # Return value handling

      Pango::Language.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def to_unsafe
      @pointer
    end
  end
end
