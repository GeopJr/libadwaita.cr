require "./render_node"

module Gsk
  # A render node that can contain other render nodes.
  @[GObject::GeneratedWrapper]
  class ContainerNode < RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::ContainerNode), instance_init, 0)
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
      LibGsk.gsk_container_node_get_type
    end

    # Creates a new `GskRenderNode` instance for holding the given @children.
    #
    # The new node will acquire a reference to each of the children.
    def initialize(children : Enumerable(Gsk::RenderNode))
      # gsk_container_node_new: (Constructor)
      # @children: (array length=n_children element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_children = children.size # Generator::ArrayArgPlan
      children = children.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGsk.gsk_container_node_new(children, n_children)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def initialize(*children : Gsk::RenderNode)
      initialize(children)
    end

    # Gets one of the children of @container.
    def child(idx : UInt32) : Gsk::RenderNode
      # gsk_container_node_get_child: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_container_node_get_child(self, idx)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the number of direct children of @node.
    def n_children : UInt32
      # gsk_container_node_get_n_children: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_container_node_get_n_children(self)

      # Return value handling

      _retval
    end
  end
end
