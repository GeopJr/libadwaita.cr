require "./render_node"

module Gsk
  # A render node for a solid color.
  @[GObject::GeneratedWrapper]
  class ColorNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::ColorNode), instance_init, 0)
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
      LibGsk.gsk_color_node_get_type
    end

    # Creates a `GskRenderNode` that will render the color specified by @rgba into
    # the area given by @bounds.
    def initialize(rgba : Gdk::RGBA, bounds : Graphene::Rect)
      # gsk_color_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_color_node_new(rgba, bounds)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Retrieves the color of the given @node.
    def color : Gdk::RGBA
      # gsk_color_node_get_color: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_color_node_get_color(self)

      # Return value handling

      Gdk::RGBA.new(_retval, GICrystal::Transfer::None)
    end
  end
end
