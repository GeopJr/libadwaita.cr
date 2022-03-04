require "../gdk-4.0/snapshot"

module Gtk
  # `GtkSnapshot` assists in creating `GskRenderNodes` for widgets.
  #
  # It functions in a similar way to a cairo context, and maintains a stack
  # of render nodes and their associated transformations.
  #
  # The node at the top of the stack is the the one that gtk_snapshot_append_…
  # functions operate on. Use the gtk_snapshot_push_… functions and
  # gtk_snapshot_pop() to change the current node.
  #
  # The typical way to obtain a `GtkSnapshot` object is as an argument to
  # the [vfunc@Gtk.Widget.snapshot] vfunc. If you need to create your own
  # `GtkSnapshot`, use [ctor@Gtk.Snapshot.new].
  class Snapshot < Gdk::Snapshot
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_snapshot_get_type
    end

    def initialize
      # gtk_snapshot_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_snapshot_new

      # Return value handling
      @pointer = _retval
    end

    def append_border(outline : Gsk::RoundedRect, border_width : Enumerable(Float32), border_color : Enumerable(Gdk::RGBA)) : Nil
      # gtk_snapshot_append_border: (Method)
      # @border_width: (array fixed-size=4 element-type Float)
      # @border_color: (array fixed-size=4 element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      border_width = border_width.to_a.to_unsafe

      border_color = border_color.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_border(self, outline, border_width, border_color)

      # Return value handling
    end

    def append_cairo(bounds : Graphene::Rect) : Cairo::Context
      # gtk_snapshot_append_cairo: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_snapshot_append_cairo(self, bounds)

      # Return value handling
      Cairo::Context.new(_retval, GICrystal::Transfer::Full)
    end

    def append_color(color : Gdk::RGBA, bounds : Graphene::Rect) : Nil
      # gtk_snapshot_append_color: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_append_color(self, color, bounds)

      # Return value handling
    end

    def append_conic_gradient(bounds : Graphene::Rect, center : Graphene::Point, rotation : Float32, stops : Enumerable(Gsk::ColorStop)) : Nil
      # gtk_snapshot_append_conic_gradient: (Method)
      # @stops: (array length=n_stops element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_stops = stops.size
      stops = stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_conic_gradient(self, bounds, center, rotation, stops, n_stops)

      # Return value handling
    end

    def append_inset_shadow(outline : Gsk::RoundedRect, color : Gdk::RGBA, dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32) : Nil
      # gtk_snapshot_append_inset_shadow: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_append_inset_shadow(self, outline, color, dx, dy, spread, blur_radius)

      # Return value handling
    end

    def append_layout(layout : Pango::Layout, color : Gdk::RGBA) : Nil
      # gtk_snapshot_append_layout: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_append_layout(self, layout, color)

      # Return value handling
    end

    def append_linear_gradient(bounds : Graphene::Rect, start_point : Graphene::Point, end_point : Graphene::Point, stops : Enumerable(Gsk::ColorStop)) : Nil
      # gtk_snapshot_append_linear_gradient: (Method)
      # @stops: (array length=n_stops element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_stops = stops.size
      stops = stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_linear_gradient(self, bounds, start_point, end_point, stops, n_stops)

      # Return value handling
    end

    def append_node(node : Gsk::RenderNode) : Nil
      # gtk_snapshot_append_node: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_append_node(self, node)

      # Return value handling
    end

    def append_outset_shadow(outline : Gsk::RoundedRect, color : Gdk::RGBA, dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32) : Nil
      # gtk_snapshot_append_outset_shadow: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_append_outset_shadow(self, outline, color, dx, dy, spread, blur_radius)

      # Return value handling
    end

    def append_radial_gradient(bounds : Graphene::Rect, center : Graphene::Point, hradius : Float32, vradius : Float32, start : Float32, end _end : Float32, stops : Enumerable(Gsk::ColorStop)) : Nil
      # gtk_snapshot_append_radial_gradient: (Method)
      # @stops: (array length=n_stops element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_stops = stops.size
      stops = stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_radial_gradient(self, bounds, center, hradius, vradius, start, _end, stops, n_stops)

      # Return value handling
    end

    def append_repeating_linear_gradient(bounds : Graphene::Rect, start_point : Graphene::Point, end_point : Graphene::Point, stops : Enumerable(Gsk::ColorStop)) : Nil
      # gtk_snapshot_append_repeating_linear_gradient: (Method)
      # @stops: (array length=n_stops element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_stops = stops.size
      stops = stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_repeating_linear_gradient(self, bounds, start_point, end_point, stops, n_stops)

      # Return value handling
    end

    def append_repeating_radial_gradient(bounds : Graphene::Rect, center : Graphene::Point, hradius : Float32, vradius : Float32, start : Float32, end _end : Float32, stops : Enumerable(Gsk::ColorStop)) : Nil
      # gtk_snapshot_append_repeating_radial_gradient: (Method)
      # @stops: (array length=n_stops element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_stops = stops.size
      stops = stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_repeating_radial_gradient(self, bounds, center, hradius, vradius, start, _end, stops, n_stops)

      # Return value handling
    end

    def append_texture(texture : Gdk::Texture, bounds : Graphene::Rect) : Nil
      # gtk_snapshot_append_texture: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_append_texture(self, texture, bounds)

      # Return value handling
    end

    def gl_shader_pop_texture : Nil
      # gtk_snapshot_gl_shader_pop_texture: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_gl_shader_pop_texture(self)

      # Return value handling
    end

    def perspective(depth : Float32) : Nil
      # gtk_snapshot_perspective: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_perspective(self, depth)

      # Return value handling
    end

    def pop : Nil
      # gtk_snapshot_pop: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_pop(self)

      # Return value handling
    end

    def push_blend(blend_mode : Gsk::BlendMode) : Nil
      # gtk_snapshot_push_blend: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_push_blend(self, blend_mode)

      # Return value handling
    end

    def push_blur(radius : Float64) : Nil
      # gtk_snapshot_push_blur: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_push_blur(self, radius)

      # Return value handling
    end

    def push_clip(bounds : Graphene::Rect) : Nil
      # gtk_snapshot_push_clip: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_push_clip(self, bounds)

      # Return value handling
    end

    def push_color_matrix(color_matrix : Graphene::Matrix, color_offset : Graphene::Vec4) : Nil
      # gtk_snapshot_push_color_matrix: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_push_color_matrix(self, color_matrix, color_offset)

      # Return value handling
    end

    def push_cross_fade(progress : Float64) : Nil
      # gtk_snapshot_push_cross_fade: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_push_cross_fade(self, progress)

      # Return value handling
    end

    def push_gl_shader(shader : Gsk::GLShader, bounds : Graphene::Rect, take_args : GLib::Bytes) : Nil
      # gtk_snapshot_push_gl_shader: (Method)
      # @take_args: (transfer full)
      # Returns: (transfer none)

      # Handle parameters
      LibGObject.g_object_ref(take_args)

      # C call
      LibGtk.gtk_snapshot_push_gl_shader(self, shader, bounds, take_args)

      # Return value handling
    end

    def push_opacity(opacity : Float64) : Nil
      # gtk_snapshot_push_opacity: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_push_opacity(self, opacity)

      # Return value handling
    end

    def push_repeat(bounds : Graphene::Rect, child_bounds : Graphene::Rect?) : Nil
      # gtk_snapshot_push_repeat: (Method)
      # @child_bounds: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      child_bounds = if child_bounds.nil?
                       Pointer(Void).null
                     else
                       child_bounds.to_unsafe
                     end

      # C call
      LibGtk.gtk_snapshot_push_repeat(self, bounds, child_bounds)

      # Return value handling
    end

    def push_rounded_clip(bounds : Gsk::RoundedRect) : Nil
      # gtk_snapshot_push_rounded_clip: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_push_rounded_clip(self, bounds)

      # Return value handling
    end

    def push_shadow(shadow : Gsk::Shadow, n_shadows : UInt64) : Nil
      # gtk_snapshot_push_shadow: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_push_shadow(self, shadow, n_shadows)

      # Return value handling
    end

    def render_background(context : Gtk::StyleContext, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
      # gtk_snapshot_render_background: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_render_background(self, context, x, y, width, height)

      # Return value handling
    end

    def render_focus(context : Gtk::StyleContext, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
      # gtk_snapshot_render_focus: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_render_focus(self, context, x, y, width, height)

      # Return value handling
    end

    def render_frame(context : Gtk::StyleContext, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
      # gtk_snapshot_render_frame: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_render_frame(self, context, x, y, width, height)

      # Return value handling
    end

    def render_insertion_cursor(context : Gtk::StyleContext, x : Float64, y : Float64, layout : Pango::Layout, index : Int32, direction : Pango::Direction) : Nil
      # gtk_snapshot_render_insertion_cursor: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_render_insertion_cursor(self, context, x, y, layout, index, direction)

      # Return value handling
    end

    def render_layout(context : Gtk::StyleContext, x : Float64, y : Float64, layout : Pango::Layout) : Nil
      # gtk_snapshot_render_layout: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_render_layout(self, context, x, y, layout)

      # Return value handling
    end

    def restore : Nil
      # gtk_snapshot_restore: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_restore(self)

      # Return value handling
    end

    def rotate(angle : Float32) : Nil
      # gtk_snapshot_rotate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_rotate(self, angle)

      # Return value handling
    end

    def rotate_3d(angle : Float32, axis : Graphene::Vec3) : Nil
      # gtk_snapshot_rotate_3d: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_rotate_3d(self, angle, axis)

      # Return value handling
    end

    def save : Nil
      # gtk_snapshot_save: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_save(self)

      # Return value handling
    end

    def scale(factor_x : Float32, factor_y : Float32) : Nil
      # gtk_snapshot_scale: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_scale(self, factor_x, factor_y)

      # Return value handling
    end

    def scale_3d(factor_x : Float32, factor_y : Float32, factor_z : Float32) : Nil
      # gtk_snapshot_scale_3d: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_scale_3d(self, factor_x, factor_y, factor_z)

      # Return value handling
    end

    def to_node : Gsk::RenderNode
      # gtk_snapshot_to_node: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_snapshot_to_node(self)

      # Return value handling
      Gsk::RenderNode.new(_retval, GICrystal::Transfer::Full)
    end

    def to_paintable(size : Graphene::Size?) : Gdk::Paintable
      # gtk_snapshot_to_paintable: (Method)
      # @size: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      size = if size.nil?
               Pointer(Void).null
             else
               size.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_snapshot_to_paintable(self, size)

      # Return value handling
      Gdk::Paintable__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def transform(transform : Gsk::Transform?) : Nil
      # gtk_snapshot_transform: (Method)
      # @transform: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      transform = if transform.nil?
                    Pointer(Void).null
                  else
                    transform.to_unsafe
                  end

      # C call
      LibGtk.gtk_snapshot_transform(self, transform)

      # Return value handling
    end

    def transform_matrix(matrix : Graphene::Matrix) : Nil
      # gtk_snapshot_transform_matrix: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_transform_matrix(self, matrix)

      # Return value handling
    end

    def translate(point : Graphene::Point) : Nil
      # gtk_snapshot_translate: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_translate(self, point)

      # Return value handling
    end

    def translate_3d(point : Graphene::Point3D) : Nil
      # gtk_snapshot_translate_3d: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_snapshot_translate_3d(self, point)

      # Return value handling
    end
  end
end
