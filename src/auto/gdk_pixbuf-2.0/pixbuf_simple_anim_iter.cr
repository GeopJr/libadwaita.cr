require "./pixbuf_animation_iter"

module GdkPixbuf
  class PixbufSimpleAnimIter < PixbufAnimationIter
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdkPixbuf.gdk_pixbuf_simple_anim_iter_get_type
    end
  end
end
