require "./render_node"

module Gsk
  # A render node that emits a debugging message when drawing its
  # child node.
  @[GObject::GeneratedWrapper]
  class DebugNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::DebugNode), instance_init, 0)
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
      LibGsk.gsk_debug_node_get_type
    end

    # Creates a `GskRenderNode` that will add debug information about
    # the given @child.
    #
    # Adding this node has no visual effect.
    def initialize(child : Gsk::RenderNode, message : ::String)
      # gsk_debug_node_new: (Constructor)
      # @message: (transfer full)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_debug_node_new(child, message)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the child node that is getting drawn by the given @node.
    def child : Gsk::RenderNode
      # gsk_debug_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_debug_node_get_child(self)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the debug message that was set on this node
    def message : ::String
      # gsk_debug_node_get_message: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_debug_node_get_message(self)

      # Return value handling

      ::String.new(_retval)
    end
  end
end
