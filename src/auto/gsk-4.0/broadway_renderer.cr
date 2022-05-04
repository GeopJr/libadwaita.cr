require "./renderer"

module Gsk
  @[GObject::GeneratedWrapper]
  class BroadwayRenderer < Renderer
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGsk::BroadwayRendererClass), class_init,
        sizeof(LibGsk::BroadwayRenderer), instance_init, 0)
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

    def initialize(*, realized : Bool? = nil, surface : Gdk::Surface? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !realized.nil?
        (_names.to_unsafe + _n).value = "realized".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, realized)
        _n += 1
      end
      if !surface.nil?
        (_names.to_unsafe + _n).value = "surface".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, surface)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BroadwayRenderer.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_broadway_renderer_get_type
    end

    # Creates a new Broadway renderer.
    #
    # The Broadway renderer is the default renderer for the broadway backend.
    # It will only work with broadway surfaces, otherwise it will fail the
    # call to gsk_renderer_realize().
    #
    # This function is only available when GTK was compiled with Broadway
    # support.
    def initialize
      # gsk_broadway_renderer_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_broadway_renderer_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end
