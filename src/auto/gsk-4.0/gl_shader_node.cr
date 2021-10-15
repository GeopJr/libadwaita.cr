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

    def initialize(shader : Gsk::GLShader, bounds : Graphene::Rect, args : GLib::Bytes, children : Enumerable(Gsk::RenderNode))
      # gsk_gl_shader_node_new: (Constructor)
      # @children: (array length=n_children element-type Interface)
      # Returns: (transfer full)

      n_children = children.size
      children = children.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGsk.gsk_gl_shader_node_new(shader, bounds, args, children, n_children)
      @pointer = _retval
    end

    def args : GLib::Bytes
      # gsk_gl_shader_node_get_args: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_node_get_args(self)
      GLib::Bytes.new(_retval, GICrystal::Transfer::None)
    end

    def child(idx : UInt32) : Gsk::RenderNode
      # gsk_gl_shader_node_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_node_get_child(self, idx)
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    def n_children : UInt32
      # gsk_gl_shader_node_get_n_children: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_node_get_n_children(self)
      _retval
    end

    def shader : Gsk::GLShader
      # gsk_gl_shader_node_get_shader: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_gl_shader_node_get_shader(self)
      Gsk::GLShader.new(_retval, GICrystal::Transfer::None)
    end
  end
end
