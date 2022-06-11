require "./pixbuf_animation"

module GdkPixbuf
  @[GObject::GeneratedWrapper]
  class PixbufNonAnim < PixbufAnimation
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(PixbufNonAnim, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `PixbufNonAnim`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdkPixbuf.gdk_pixbuf_non_anim_get_type
    end

    def self.new(pixbuf : GdkPixbuf::Pixbuf) : self
      # gdk_pixbuf_non_anim_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_non_anim_new(pixbuf)

      # Return value handling

      GdkPixbuf::PixbufNonAnim.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
