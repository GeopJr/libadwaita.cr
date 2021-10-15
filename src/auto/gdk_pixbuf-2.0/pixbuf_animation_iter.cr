require "../g_object-2.0/object"

module GdkPixbuf
  # An opaque object representing an iterator which points to a
  # certain position in an animation.
  class PixbufAnimationIter < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdkPixbuf.gdk_pixbuf_animation_iter_get_type
    end

    def advance(current_time : GLib::TimeVal?) : Bool
      # gdk_pixbuf_animation_iter_advance: (Method)
      # @current_time: (nullable)
      # Returns: (transfer none)

      current_time = if current_time.nil?
                       Pointer(Void).null
                     else
                       current_time.to_unsafe
                     end

      _retval = LibGdkPixbuf.gdk_pixbuf_animation_iter_advance(self, current_time)
      GICrystal.to_bool(_retval)
    end

    def delay_time : Int32
      # gdk_pixbuf_animation_iter_get_delay_time: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_animation_iter_get_delay_time(self)
      _retval
    end

    def pixbuf : GdkPixbuf::Pixbuf
      # gdk_pixbuf_animation_iter_get_pixbuf: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_animation_iter_get_pixbuf(self)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::None)
    end

    def on_currently_loading_frame : Bool
      # gdk_pixbuf_animation_iter_on_currently_loading_frame: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_animation_iter_on_currently_loading_frame(self)
      GICrystal.to_bool(_retval)
    end
  end
end
