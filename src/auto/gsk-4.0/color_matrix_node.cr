require "./render_node"

module Gsk
  # A render node controlling the color matrix of its single child node.
  class ColorMatrixNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_color_matrix_node_get_type
    end

    def initialize(child : Gsk::RenderNode, color_matrix : Graphene::Matrix, color_offset : Graphene::Vec4)
      # gsk_color_matrix_node_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_color_matrix_node_new(child, color_matrix, color_offset)

      # Return value handling
      @pointer = _retval
    end

    def child : Gsk::RenderNode
      # gsk_color_matrix_node_get_child: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_color_matrix_node_get_child(self)

      # Return value handling
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def color_matrix : Graphene::Matrix
      # gsk_color_matrix_node_get_color_matrix: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_color_matrix_node_get_color_matrix(self)

      # Return value handling
      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    def color_offset : Graphene::Vec4
      # gsk_color_matrix_node_get_color_offset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_color_matrix_node_get_color_offset(self)

      # Return value handling
      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end
  end
end
