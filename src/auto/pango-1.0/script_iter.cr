module Pango
  # A `PangoScriptIter` is used to iterate through a string
  # and identify ranges in different scripts.
  class ScriptIter
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(ScriptIter.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(ScriptIter.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_script_iter_get_type
    end

    def initialize(text : ::String, length : Int32)
      # pango_script_iter_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibPango.pango_script_iter_new(text, length)
      @pointer = _retval
    end

    def free : Nil
      # pango_script_iter_free: (Method)
      # Returns: (transfer none)

      LibPango.pango_script_iter_free(self)
    end

    def range : Nil
      # pango_script_iter_get_range: (Method)
      # @start: (out) (transfer full) (optional)
      # @end: (out) (transfer full) (optional)
      # @script: (out) (transfer full) (optional)
      # Returns: (transfer none)

      start = Pointer(Pointer(LibC::Char)).null
      _end = Pointer(Pointer(LibC::Char)).null
      script = Pointer(Int32).null

      LibPango.pango_script_iter_get_range(self, start, _end, script)
    end

    def _next : Bool
      # pango_script_iter_next: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_script_iter_next(self)
      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
