require "./render_node"

module Gsk
  # A render node drawing one or more shadows behind its single child node.
  @[GObject::GeneratedWrapper]
  class ShadowNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(ShadowNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ShadowNode`.
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
      LibGsk.gsk_shadow_node_get_type
    end

    # Creates a `GskRenderNode` that will draw a @child with the given
    # @shadows below it.
    def self.new(child : Gsk::RenderNode, shadows : Enumerable(Gsk::Shadow)) : self
      # gsk_shadow_node_new: (Constructor)
      # @shadows: (array length=n_shadows element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_shadows = shadows.size # Generator::ArrayArgPlan
      shadows = shadows.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGsk.gsk_shadow_node_new(child, shadows, n_shadows)

      # Return value handling

      Gsk::ShadowNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves the child `GskRenderNode` of the shadow @node.
    def child : Gsk::RenderNode
      # gsk_shadow_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_shadow_node_get_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the number of shadows in the @node.
    def n_shadows : UInt64
      # gsk_shadow_node_get_n_shadows: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_shadow_node_get_n_shadows(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the shadow data at the given index @i.
    def shadow(i : UInt64) : Gsk::Shadow
      # gsk_shadow_node_get_shadow: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_shadow_node_get_shadow(@pointer, i)

      # Return value handling

      Gsk::Shadow.new(_retval, GICrystal::Transfer::None)
    end
  end
end
