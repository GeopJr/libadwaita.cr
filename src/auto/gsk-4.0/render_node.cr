module Gsk
  # `GskRenderNode` is the basic block in a scene graph to be
  # rendered using `Gsk#Renderer`.
  #
  # Each node has a parent, except the top-level node; each node may have
  # children nodes.
  #
  # Each node has an associated drawing surface, which has the size of
  # the rectangle set when creating it.
  #
  # Render nodes are meant to be transient; once they have been associated
  # to a `Gsk#Renderer` it's safe to release any reference you have on
  # them. All `Gsk#RenderNode`s are immutable, you can only specify their
  # properties during construction.
  @[GObject::GeneratedWrapper]
  class RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGsk::RenderNode), instance_init, 0)
    end

    GICrystal.define_new_method(RenderNode, g_param_spec_get_qdata, g_param_spec_set_qdata)

    # Initialize a new `RenderNode`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      LibGObject.gsk_render_node_ref(self) if transfer.none?
    end

    # Called by the garbage collector. Decreases the reference count of object.
    # (i.e. its memory is freed).
    def finalize
      {% if flag?(:debugmemory) %}
        LibC.printf("~%s at %p - ref count: %d\n", self.class.name.to_unsafe, self, ref_count)
      {% end %}
      LibGObject.g_param_spec_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).null)
      LibGObject.g_param_spec_set_qdata(self, GICrystal::GC_COLLECTED_QDATA_KEY, Pointer(Void).new(0x1))
      LibGObject.gsk_render_node_unref(self)
    end

    # Returns a pointer to the C object.
    def to_unsafe
      @pointer
    end

    # Cast a `GObject::Object` to `RenderNode`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to RenderNode")
    end

    # Cast a `GObject::Object` to `RenderNode`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGsk.gsk_render_node_get_type
    end

    # Loads data previously created via `Gsk::RenderNode#serialize`.
    #
    # For a discussion of the supported format, see that function.
    def self.deserialize(bytes : GLib::Bytes, error_func : Gsk::ParseErrorFunc?, user_data : Pointer(Void)?) : Gsk::RenderNode?
      # gsk_render_node_deserialize: (None)
      # @error_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGsk.gsk_render_node_deserialize(bytes, error_func, user_data)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Draw the contents of @node to the given cairo context.
    #
    # Typically, you'll use this function to implement fallback rendering
    # of `GskRenderNode`s on an intermediate Cairo context, instead of using
    # the drawing context associated to a `Gdk#Surface`'s rendering buffer.
    #
    # For advanced nodes that cannot be supported using Cairo, in particular
    # for nodes doing 3D operations, this function may fail.
    def draw(cr : Cairo::Context) : Nil
      # gsk_render_node_draw: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_render_node_draw(@pointer, cr)

      # Return value handling
    end

    # Retrieves the boundaries of the @node.
    #
    # The node will not draw outside of its boundaries.
    def bounds : Graphene::Rect
      # gsk_render_node_get_bounds: (Method)
      # @bounds: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      bounds = Graphene::Rect.new
      # C call
      LibGsk.gsk_render_node_get_bounds(@pointer, bounds)

      # Return value handling

      bounds
    end

    # Returns the type of the @node.
    def node_type : Gsk::RenderNodeType
      # gsk_render_node_get_node_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_render_node_get_node_type(@pointer)

      # Return value handling

      Gsk::RenderNodeType.new(_retval)
    end

    # Acquires a reference on the given `GskRenderNode`.
    def ref : Gsk::RenderNode
      # gsk_render_node_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_render_node_ref(@pointer)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Serializes the @node for later deserialization via
    # gsk_render_node_deserialize(). No guarantees are made about the format
    # used other than that the same version of GTK will be able to deserialize
    # the result of a call to gsk_render_node_serialize() and
    # gsk_render_node_deserialize() will correctly reject files it cannot open
    # that were created with previous versions of GTK.
    #
    # The intended use of this functions is testing, benchmarking and debugging.
    # The format is not meant as a permanent storage format.
    def serialize : GLib::Bytes
      # gsk_render_node_serialize: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGsk.gsk_render_node_serialize(@pointer)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    # Releases a reference on the given `GskRenderNode`.
    #
    # If the reference was the last, the resources associated to the @node are
    # freed.
    def unref : Nil
      # gsk_render_node_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGsk.gsk_render_node_unref(@pointer)

      # Return value handling
    end

    # This function is equivalent to calling `Gsk::RenderNode#serialize`
    # followed by `GLib#file_set_contents`.
    #
    # See those two functions for details on the arguments.
    #
    # It is mostly intended for use inside a debugger to quickly dump a render
    # node to a file for later inspection.
    def write_to_file(filename : ::String) : Bool
      # gsk_render_node_write_to_file: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGsk.gsk_render_node_write_to_file(@pointer, filename, pointerof(_error))

      # Error check
      Gsk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
