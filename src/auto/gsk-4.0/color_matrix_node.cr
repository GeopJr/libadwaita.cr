require "./render_node"

module Gsk
  # A render node controlling the color matrix of its single child node.
  @[GObject::GeneratedWrapper]
  class ColorMatrixNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::ColorMatrixNode), instance_init, 0)
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
    def initialize(child : Gsk::RenderNode, color_matrix : Graphene::Matrix, color_offset : Graphene::Vec4)
      # gsk_color_matrix_node_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_color_matrix_node_new(child, color_matrix, color_offset)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the child node that is getting its colors modified by the given @node.
    def child : Gsk::RenderNode
      # gsk_color_matrix_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_color_matrix_node_get_child(self)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the color matrix used by the @node.
    def color_matrix : Graphene::Matrix
      # gsk_color_matrix_node_get_color_matrix: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_color_matrix_node_get_color_matrix(self)

      # Return value handling

      Graphene::Matrix.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the color offset used by the @node.
    def color_offset : Graphene::Vec4
      # gsk_color_matrix_node_get_color_offset: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_color_matrix_node_get_color_offset(self)

      # Return value handling

      Graphene::Vec4.new(_retval, GICrystal::Transfer::None)
    end
  end
end
