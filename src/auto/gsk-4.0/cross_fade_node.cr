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
      _retval = LibGsk.gsk_cross_fade_node_get_end_child(self)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the progress value of the cross fade.
    def progress : Float32
      # gsk_cross_fade_node_get_progress: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_cross_fade_node_get_progress(self)

      # Return value handling

      _retval
    end

    # Retrieves the child `GskRenderNode` at the beginning of the cross-fade.
    def start_child : Gsk::RenderNode
      # gsk_cross_fade_node_get_start_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_cross_fade_node_get_start_child(self)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end
  end
end
