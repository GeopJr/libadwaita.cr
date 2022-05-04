require "./pixbuf_animation"

module GdkPixbuf
  # An opaque struct representing a simple animation.
  @[GObject::GeneratedWrapper]
  class PixbufSimpleAnim < PixbufAnimation
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGdkPixbuf::PixbufSimpleAnimClass), class_init,
        sizeof(LibGdkPixbuf::PixbufSimpleAnim), instance_init, 0)
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

    def initialize(*, loop : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !loop.nil?
        (_names.to_unsafe + _n).value = "loop".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, loop)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(PixbufSimpleAnim.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdkPixbuf.gdk_pixbuf_simple_anim_get_type
    end

    def loop=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "loop", unsafe_value, Pointer(Void).null)
      value
    end

    def loop? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "loop", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new, empty animation.
    def initialize(width : Int32, height : Int32, rate : Float32)
      # gdk_pixbuf_simple_anim_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_simple_anim_new(width, height, rate)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds a new frame to @animation. The @pixbuf must
    # have the dimensions specified when the animation
    # was constructed.
    def add_frame(pixbuf : GdkPixbuf::Pixbuf) : Nil
      # gdk_pixbuf_simple_anim_add_frame: (Method)
      # Returns: (transfer none)

      # C call
      LibGdkPixbuf.gdk_pixbuf_simple_anim_add_frame(self, pixbuf)

      # Return value handling
    end

    # Gets whether @animation should loop indefinitely when it reaches the end.
    def loop : Bool
      # gdk_pixbuf_simple_anim_get_loop: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_simple_anim_get_loop(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets whether @animation should loop indefinitely when it reaches the end.
    def loop=(loop : Bool) : Nil
      # gdk_pixbuf_simple_anim_set_loop: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGdkPixbuf.gdk_pixbuf_simple_anim_set_loop(self, loop)

      # Return value handling
    end
  end
end
