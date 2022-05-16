require "./render_node"

module Gsk
  # A render node using a GL shader when drawing its children nodes.
  @[GObject::GeneratedWrapper]
  class GLShaderNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::GLShaderNode), instance_init, 0)
    end

    GICrystal.define_new_method(GLShaderNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `GLShaderNode`.
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
      LibGsk.gsk_gl_shader_node_get_type
    end

    # Creates a `GskRenderNode` that will render the given @shader into the
    # area given by @bounds.
    #
    # The @args is a block of data to use for uniform input, as per types and
    # offsets defined by the @shader. Normally this is generated by
    # `Gsk::GLShader#format_args` or `Gsk#ShaderArgsBuilder`.
    #
    # See `Gsk#GLShader` for details about how the shader should be written.
    #
    # All the children will be rendered into textures (if they aren't already
    # `GskTextureNodes`, which will be used directly). These textures will be
    # sent as input to the shader.
    #
    # If the renderer doesn't support GL shaders, or if there is any problem
    # when compiling the shader, then the node will draw pink. You should use
    # `Gsk::GLShader#compile` to ensure the @shader will work for the
    # renderer before using it.
    def initialize(shader : Gsk::GLShader, bounds : Graphene::Rect, args : GLib::Bytes, children : Enumerable(Gsk::RenderNode)?)
      # gsk_gl_shader_node_new: (Constructor)
      # @children: (nullable) (array length=n_children element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_children = children.try(&.size) || 0 # Generator::NullableArrayPlan
      children = if children.nil?
                   Pointer(Pointer(Void)).null
                 else
                   children.to_a.map(&.to_unsafe).to_unsafe
                 end

      # C call
      _retval = LibGsk.gsk_gl_shader_node_new(shader, bounds, args, children, n_children)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets args for the node.
    def args : GLib::Bytes
      # gsk_gl_shader_node_get_args: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_gl_shader_node_get_args(@pointer)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::None)
    end

    # Gets one of the children.
    def child(idx : UInt32) : Gsk::RenderNode
      # gsk_gl_shader_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_gl_shader_node_get_child(@pointer, idx)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the number of children
    def n_children : UInt32
      # gsk_gl_shader_node_get_n_children: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_gl_shader_node_get_n_children(@pointer)

      # Return value handling

      _retval
    end

    # Gets shader code for the node.
    def shader : Gsk::GLShader
      # gsk_gl_shader_node_get_shader: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_gl_shader_node_get_shader(@pointer)

      # Return value handling

      Gsk::GLShader.new(_retval, GICrystal::Transfer::None)
    end
  end
end
