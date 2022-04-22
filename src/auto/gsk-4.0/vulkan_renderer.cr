require "./renderer"

module Gsk
  # A GSK renderer that is using Vulkan.
  @[GObject::GeneratedWrapper]
  class VulkanRenderer < Renderer
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGsk::VulkanRendererClass), class_init,
        sizeof(LibGsk::VulkanRenderer), instance_init, 0)
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

      @pointer = LibGObject.g_object_new_with_properties(VulkanRenderer.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_vulkan_renderer_get_type
    end

    def initialize
      # gsk_vulkan_renderer_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_vulkan_renderer_new

      # Return value handling

      @pointer = _retval
    end
  end
end
