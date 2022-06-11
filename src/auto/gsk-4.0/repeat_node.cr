require "./render_node"

module Gsk
  # A render node repeating its single child node.
  @[GObject::GeneratedWrapper]
  class RepeatNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(RepeatNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `RepeatNode`.
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
      LibGsk.gsk_repeat_node_get_type
    end

    # Creates a `GskRenderNode` that will repeat the drawing of @child across
    # the given @bounds.
    def self.new(bounds : Graphene::Rect, child : Gsk::RenderNode, child_bounds : Graphene::Rect?) : self
      # gsk_repeat_node_new: (Constructor)
      # @child_bounds: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      child_bounds = if child_bounds.nil?
                       Pointer(Void).null
                     else
                       child_bounds.to_unsafe
                     end

      # C call
      _retval = LibGsk.gsk_repeat_node_new(bounds, child, child_bounds)

      # Return value handling

      Gsk::RepeatNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves the child of @node.
    def child : Gsk::RenderNode
      # gsk_repeat_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_repeat_node_get_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the bounding rectangle of the child of @node.
    def child_bounds : Graphene::Rect
      # gsk_repeat_node_get_child_bounds: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_repeat_node_get_child_bounds(@pointer)

      # Return value handling

      Graphene::Rect.new(_retval, GICrystal::Transfer::None)
    end
  end
end
