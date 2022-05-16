require "./render_node"

module Gsk
  # A render node cross fading between two child nodes.
  @[GObject::GeneratedWrapper]
  class CrossFadeNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::CrossFadeNode), instance_init, 0)
    end

    GICrystal.define_new_method(CrossFadeNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CrossFadeNode`.
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
      LibGsk.gsk_cross_fade_node_get_type
    end

    # Creates a `GskRenderNode` that will do a cross-fade between @start and @end.
    def initialize(start : Gsk::RenderNode, end _end : Gsk::RenderNode, progress : Float32)
      # gsk_cross_fade_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_cross_fade_node_new(start, _end, progress)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Retrieves the child `GskRenderNode` at the end of the cross-fade.
    def end_child : Gsk::RenderNode
      # gsk_cross_fade_node_get_end_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_cross_fade_node_get_end_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the progress value of the cross fade.
    def progress : Float32
      # gsk_cross_fade_node_get_progress: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_cross_fade_node_get_progress(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the child `GskRenderNode` at the beginning of the cross-fade.
    def start_child : Gsk::RenderNode
      # gsk_cross_fade_node_get_start_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_cross_fade_node_get_start_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end
  end
end
