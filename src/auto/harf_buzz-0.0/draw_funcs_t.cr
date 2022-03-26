module HarfBuzz
  # Glyph draw callbacks.
  #
  # #hb_draw_move_to_func_t, #hb_draw_line_to_func_t and
  # #hb_draw_cubic_to_func_t calls are necessary to be defined but we translate
  # #hb_draw_quadratic_to_func_t calls to #hb_draw_cubic_to_func_t if the
  # callback isn't defined.
  class DrawFuncsT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(DrawFuncsT.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(DrawFuncsT.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibHarfBuzz.hb_gobject_draw_funcs_get_type
    end

    def to_unsafe
      @pointer
    end
  end
end
