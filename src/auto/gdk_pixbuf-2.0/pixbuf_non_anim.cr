require "./pixbuf_animation"

module GdkPixbuf
  @[GObject::GeneratedWrapper]
  class PixbufNonAnim < PixbufAnimation
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdkPixbuf::PixbufNonAnim), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

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

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_non_anim_new(pixbuf)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end
