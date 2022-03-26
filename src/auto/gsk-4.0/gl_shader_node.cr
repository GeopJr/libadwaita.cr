require "./render_node"

module Gsk
  # A render node using a GL shader when drawing its children nodes.
  class GLShaderNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_gl_shader_node_get_type
    end

    def initialize(shader : Gsk::GLShader, bounds : Graphene::Rect, args : GLib::Bytes, children : Enumerable(Gsk::RenderNode)?)
      # gsk_gl_shader_node_new: (Constructor)
      # @children: (nullable) (array length=n_children element-type Interface)
      # Returns: (transfer full)

      # Handle parameters
      n_children = children.try(&.size) || 0
      children = if children.nil?
                   Pointer(Pointer(Void)).null
                 else
                   children.to_a.map(&.to_unsafe).to_unsafe
                 end

      # C call
      _retval = LibGsk.gsk_gl_shader_node_new(shader, bounds, args, children, n_children)

      # Return value handling
      @pointer = _retval
    end

    def args : GLib::Bytes
      # gsk_gl_shader_node_get_args: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_gl_shader_node_get_args(self)

      # Return value handling
      GLib::Bytes.new(_retval, GICrystal::Transfer::None)
    end

    def child(idx : UInt32) : Gsk::RenderNode
      # gsk_gl_shader_node_get_child: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_gl_shader_node_get_child(self, idx)

      # Return value handling
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def n_children : UInt32
      # gsk_gl_shader_node_get_n_children: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_gl_shader_node_get_n_children(self)

      # Return value handling
      _retval
    end

    def shader : Gsk::GLShader
      # gsk_gl_shader_node_get_shader: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGsk.gsk_gl_shader_node_get_shader(self)

      # Return value handling
      Gsk::GLShader.new(_retval, GICrystal::Transfer::None)
    end
  end
end
