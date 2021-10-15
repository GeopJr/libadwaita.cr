module Pango
  # The `PangoLanguage` structure is used to
  # represent a language.
  #
  # `PangoLanguage` pointers can be efficiently
  # copied and compared with each other.
  class Language
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(Language.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(Language.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_language_get_type
    end

    def sample_string : ::String
      # pango_language_get_sample_string: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_language_get_sample_string(self)
      ::String.new(_retval)
    end

    def scripts : Int32
      # pango_language_get_scripts: (Method)
      # @num_scripts: (out) (transfer full) (caller-allocates) (optional)
      # Returns: (transfer none)

      num_scripts = Pointer(Int32).null
      num_scripts = Int32.new

      _retval = LibPango.pango_language_get_scripts(self, num_scripts)
      num_scripts unless _retval.null?
    end

    def includes_script(script : Pango::Script) : Bool
      # pango_language_includes_script: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_language_includes_script(self, script)
      GICrystal.to_bool(_retval)
    end

    def matches(range_list : ::String) : Bool
      # pango_language_matches: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_language_matches(self, range_list)
      GICrystal.to_bool(_retval)
    end

    def to_string : ::String
      # pango_language_to_string: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_language_to_string(self)
      ::String.new(_retval)
    end

    def self.from_string(language : ::String?) : Pango::Language?
      # pango_language_from_string: (None)
      # @language: (nullable)
      # Returns: (transfer none)

      language = if language.nil?
                   Pointer(LibC::Char).null
                 else
                   language.to_unsafe
                 end

      _retval = LibPango.pango_language_from_string(language)
      Pango::Language.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def self.default : Pango::Language
      # pango_language_get_default: (None)
      # Returns: (transfer none)

      _retval = LibPango.pango_language_get_default
      Pango::Language.new(_retval, GICrystal::Transfer::None)
    end

    def self.preferred : Pango::Language?
      # pango_language_get_preferred: (None)
      # Returns: (transfer none)

      _retval = LibPango.pango_language_get_preferred
      Pango::Language.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def to_unsafe
      @pointer
    end
  end
end
