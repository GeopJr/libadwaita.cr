require "./render_node"

module Gsk
  # A render node that emits a debugging message when drawing its
  # child node.
  @[GObject::GeneratedWrapper]
  class DebugNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(DebugNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DebugNode`.
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
      LibGsk.gsk_debug_node_get_type
    end

    # Creates a `GskRenderNode` that will add debug information about
    # the given @child.
    #
    # Adding this node has no visual effect.
    def self.new(child : Gsk::RenderNode, message : ::String) : self
      # gsk_debug_node_new: (Constructor)
      # @message: (transfer full)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_debug_node_new(child, message)

      # Return value handling

      Gsk::DebugNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the child node that is getting drawn by the given @node.
    def child : Gsk::RenderNode
      # gsk_debug_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_debug_node_get_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the debug message that was set on this node
    def message : ::String
      # gsk_debug_node_get_message: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_debug_node_get_message(@pointer)

      # Return value handling

      ::String.new(_retval)
    end
  end
end
