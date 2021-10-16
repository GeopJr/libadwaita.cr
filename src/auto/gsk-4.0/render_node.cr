module Gsk
  # `GskRenderNode` is the basic block in a scene graph to be
  # rendered using `GskRenderer`.
  #
  # Each node has a parent, except the top-level node; each node may have
  # children nodes.
  #
  # Each node has an associated drawing surface, which has the size of
  # the rectangle set when creating it.
  #
  # Render nodes are meant to be transient; once they have been associated
  # to a [class@Gsk.Renderer] it's safe to release any reference you have on
  # them. All [class@Gsk.RenderNode]s are immutable, you can only specify their
  # properties during construction.
  class RenderNode
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

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

    def self.deserialize(bytes : GLib::Bytes, error_func : Pointer(Void)?, user_data : Pointer(Nil)?) : Gsk::RenderNode?
      # gsk_render_node_deserialize: (None)
      # @error_func: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer full)

      error_func = if error_func.nil?
                     LibGsk::ParseErrorFunc.null
                   else
                     error_func.to_unsafe
                   end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      _retval = LibGsk.gsk_render_node_deserialize(bytes, error_func, user_data)
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def draw(cr : Cairo::Context) : Nil
      # gsk_render_node_draw: (Method)
      # Returns: (transfer none)

      LibGsk.gsk_render_node_draw(self, cr)
    end

    def bounds : Graphene::Rect
      # gsk_render_node_get_bounds: (Method)
      # @bounds: (out) (caller-allocates)
      # Returns: (transfer none)

      bounds = Graphene::Rect.new

      LibGsk.gsk_render_node_get_bounds(self, bounds)
      bounds
    end

    def node_type : Gsk::RenderNodeType
      # gsk_render_node_get_node_type: (Method)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_render_node_get_node_type(self)
      Gsk::RenderNodeType.from_value(_retval)
    end

    def ref : Gsk::RenderNode
      # gsk_render_node_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGsk.gsk_render_node_ref(self)
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::Full)
    end

    def serialize : GLib::Bytes
      # gsk_render_node_serialize: (Method)
      # Returns: (transfer full)

      _retval = LibGsk.gsk_render_node_serialize(self)
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # gsk_render_node_unref: (Method)
      # Returns: (transfer none)

      LibGsk.gsk_render_node_unref(self)
    end

    def write_to_file(filename : ::String) : Bool
      # gsk_render_node_write_to_file: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGsk.gsk_render_node_write_to_file(self, filename)
      GICrystal.to_bool(_retval)
    end
  end
end
