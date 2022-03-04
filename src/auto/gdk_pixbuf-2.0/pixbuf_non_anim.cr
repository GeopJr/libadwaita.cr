require "./pixbuf_animation"

module GdkPixbuf
  class PixbufNonAnim < PixbufAnimation
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdkPixbuf.gdk_pixbuf_non_anim_get_type
    end

    def initialize(pixbuf : GdkPixbuf::Pixbuf)
      # gdk_pixbuf_non_anim_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_non_anim_new(pixbuf)

      # Return value handling
      @pointer = _retval
    end
  end
end
