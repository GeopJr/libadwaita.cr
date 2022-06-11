require "./render_node"

module Gsk
  # A render node for a border.
  @[GObject::GeneratedWrapper]
  class BorderNode < RenderNode
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(BorderNode, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `BorderNode`.
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
      LibGsk.gsk_border_node_get_type
    end

    # Creates a `GskRenderNode` that will stroke a border rectangle inside the
    # given @outline.
    #
    # The 4 sides of the border can have different widths and colors.
    def self.new(outline : Gsk::RoundedRect, border_width : Enumerable(Float32), border_color : Enumerable(Gdk::RGBA)) : self
      # gsk_border_node_new: (Constructor)
      # @border_width: (array fixed-size=4 element-type Float)
      # @border_color: (array fixed-size=4 element-type Interface)
      # Returns: (transfer full)

      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 4") if border_width.size < 4

      border_width = border_width.to_a.to_unsafe
      # Generator::ArrayArgPlan
      raise ArgumentError.new("Enumerable of size < 4") if border_color.size < 4

      border_color = border_color.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGsk.gsk_border_node_new(outline, border_width, border_color)

      # Return value handling

      Gsk::BorderNode.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves the colors of the border.
    def colors : Gdk::RGBA
      # gsk_border_node_get_colors: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_border_node_get_colors(@pointer)

      # Return value handling

      Gdk::RGBA.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the outline of the border.
    def outline : Gsk::RoundedRect
      # gsk_border_node_get_outline: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGsk.gsk_border_node_get_outline(@pointer)

      # Return value handling

      Gsk::RoundedRect.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the stroke widths of the border.
    def widths : Enumerable(Float32)
      # gsk_border_node_get_widths: (Method)
      # Returns: (transfer none) (array fixed-size=4 element-type Float)

      # C call
      _retval = LibGsk.gsk_border_node_get_widths(@pointer)

      # Return value handling

      _retval
    end
  end
end
