require "./render_node"

module Gsk
  # A render node controlling the color matrix of its single child node.
  @[GObject::GeneratedWrapper]
  class ColorMatrixNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(ColorMatrixNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ColorMatrixNode`.
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
      LibGsk.gsk_color_matrix_node_get_type
    end

    # Creates a `GskRenderNode` that will drawn the @child with
    # @color_matrix.
    #
    # In particular, the node will transform the operation
    #
    #     pixel = color_matrix * pixel + color_offset
    #
    # for every pixel.
    def self.new(child : Gsk::RenderNode, color_matrix : Graphene::Matrix, color_offset : Graphene::Vec4) : self
      # gsk_color_matrix_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_color_matrix_node_new(child, color_matrix, color_offset)

      # Return value handling

      Gsk::ColorMatrixNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the child node that is getting its colors modified by the given @node.
    def child : Gsk::RenderNode
      # gsk_color_matrix_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_color_matrix_node_get_child(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the color matrix used by the @node.
    def color_matrix : Graphene::Matrix
      # gsk_color_matrix_node_get_color_matrix: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_color_matrix_node_get_color_matrix(@pointer)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the color offset used by the @node.
    def color_offset : Graphene::Vec4
      # gsk_color_matrix_node_get_color_offset: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_color_matrix_node_get_color_offset(@pointer)

      # Return value handling

      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end
  end
end
