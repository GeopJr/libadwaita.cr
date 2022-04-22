require "../gdk-4.0/snapshot"

module Gtk
  # `GtkSnapshot` assists in creating `Gsk#RenderNode`s for widgets.
  #
  # It functions in a similar way to a cairo context, and maintains a stack
  # of render nodes and their associated transformations.
  #
  # The node at the top of the stack is the one that `gtk_snapshot_append_…()`
  # functions operate on. Use the `gtk_snapshot_push_…()` functions and
  # `Snapshot#pop` to change the current node.
  #
  # The typical way to obtain a `GtkSnapshot` object is as an argument to
  # the `Gtk::Widget#snapshot` vfunc. If you need to create your own
  # `GtkSnapshot`, use `Gtk::Snapshot.new`.
  @[GObject::GeneratedWrapper]
  class Snapshot < Gdk::Snapshot
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::SnapshotClass), class_init,
        sizeof(LibGtk::Snapshot), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_snapshot_get_type
    end

    # Creates a new `GtkSnapshot`.
    def initialize
      # gtk_snapshot_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_snapshot_new

      # Return value handling

      @pointer = _retval
    end

    # Appends a stroked border rectangle inside the given @outline.
    #
    # The four sides of the border can have different widths and colors.
    def append_border(outline : Gsk::RoundedRect, border_width : Enumerable(Float32), border_color : Enumerable(Gdk::RGBA)) : Nil
      # gtk_snapshot_append_border: (Method)
      # @border_width: (array fixed-size=4 element-type Float)
      # @border_color: (array fixed-size=4 element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      border_width = border_width.to_a.to_unsafe

      # Generator::ArrayArgPlan
      border_color = border_color.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_border(self, outline, border_width, border_color)

      # Return value handling
    end

    # Creates a new `Gsk#CairoNode` and appends it to the current
    # render node of @snapshot, without changing the current node.
    def append_cairo(bounds : Graphene::Rect) : Cairo::Context
      # gtk_snapshot_append_cairo: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_snapshot_append_cairo(self, bounds)

      # Return value handling

      Cairo::Context.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new render node drawing the @color into the
    # given @bounds and appends it to the current render node
    # of @snapshot.
    #
    # You should try to avoid calling this function if
    # @color is transparent.
    def append_color(color : Gdk::RGBA, bounds : Graphene::Rect) : Nil
      # gtk_snapshot_append_color: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_append_color(self, color, bounds)

      # Return value handling
    end

    # Appends a conic gradient node with the given stops to @snapshot.
    def append_conic_gradient(bounds : Graphene::Rect, center : Graphene::Point, rotation : Float32, stops : Enumerable(Gsk::ColorStop)) : Nil
      # gtk_snapshot_append_conic_gradient: (Method)
      # @stops: (array length=n_stops element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_stops = stops.size
      # Generator::ArrayArgPlan
      stops = stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_conic_gradient(self, bounds, center, rotation, stops, n_stops)

      # Return value handling
    end

    # Appends an inset shadow into the box given by @outline.
    def append_inset_shadow(outline : Gsk::RoundedRect, color : Gdk::RGBA, dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32) : Nil
      # gtk_snapshot_append_inset_shadow: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_append_inset_shadow(self, outline, color, dx, dy, spread, blur_radius)

      # Return value handling
    end

    def append_layout(layout : Pango::Layout, color : Gdk::RGBA) : Nil
      # gtk_snapshot_append_layout: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_append_layout(self, layout, color)

      # Return value handling
    end

    # Appends a linear gradient node with the given stops to @snapshot.
    def append_linear_gradient(bounds : Graphene::Rect, start_point : Graphene::Point, end_point : Graphene::Point, stops : Enumerable(Gsk::ColorStop)) : Nil
      # gtk_snapshot_append_linear_gradient: (Method)
      # @stops: (array length=n_stops element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_stops = stops.size
      # Generator::ArrayArgPlan
      stops = stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_linear_gradient(self, bounds, start_point, end_point, stops, n_stops)

      # Return value handling
    end

    # Appends @node to the current render node of @snapshot,
    # without changing the current node.
    #
    # If @snapshot does not have a current node yet, @node
    # will become the initial node.
    def append_node(node : Gsk::RenderNode) : Nil
      # gtk_snapshot_append_node: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_append_node(self, node)

      # Return value handling
    end

    # Appends an outset shadow node around the box given by @outline.
    def append_outset_shadow(outline : Gsk::RoundedRect, color : Gdk::RGBA, dx : Float32, dy : Float32, spread : Float32, blur_radius : Float32) : Nil
      # gtk_snapshot_append_outset_shadow: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_append_outset_shadow(self, outline, color, dx, dy, spread, blur_radius)

      # Return value handling
    end

    # Appends a radial gradient node with the given stops to @snapshot.
    def append_radial_gradient(bounds : Graphene::Rect, center : Graphene::Point, hradius : Float32, vradius : Float32, start : Float32, end _end : Float32, stops : Enumerable(Gsk::ColorStop)) : Nil
      # gtk_snapshot_append_radial_gradient: (Method)
      # @stops: (array length=n_stops element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_stops = stops.size
      # Generator::ArrayArgPlan
      stops = stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_radial_gradient(self, bounds, center, hradius, vradius, start, _end, stops, n_stops)

      # Return value handling
    end

    # Appends a repeating linear gradient node with the given stops to @snapshot.
    def append_repeating_linear_gradient(bounds : Graphene::Rect, start_point : Graphene::Point, end_point : Graphene::Point, stops : Enumerable(Gsk::ColorStop)) : Nil
      # gtk_snapshot_append_repeating_linear_gradient: (Method)
      # @stops: (array length=n_stops element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_stops = stops.size
      # Generator::ArrayArgPlan
      stops = stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_repeating_linear_gradient(self, bounds, start_point, end_point, stops, n_stops)

      # Return value handling
    end

    # Appends a repeating radial gradient node with the given stops to @snapshot.
    def append_repeating_radial_gradient(bounds : Graphene::Rect, center : Graphene::Point, hradius : Float32, vradius : Float32, start : Float32, end _end : Float32, stops : Enumerable(Gsk::ColorStop)) : Nil
      # gtk_snapshot_append_repeating_radial_gradient: (Method)
      # @stops: (array length=n_stops element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_stops = stops.size
      # Generator::ArrayArgPlan
      stops = stops.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_append_repeating_radial_gradient(self, bounds, center, hradius, vradius, start, _end, stops, n_stops)

      # Return value handling
    end

    # Creates a new render node drawing the @texture
    # into the given @bounds and appends it to the
    # current render node of @snapshot.
    def append_texture(texture : Gdk::Texture, bounds : Graphene::Rect) : Nil
      # gtk_snapshot_append_texture: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_append_texture(self, texture, bounds)

      # Return value handling
    end

    # Removes the top element from the stack of render nodes and
    # adds it to the nearest `Gsk#GLShaderNode` below it.
    #
    # This must be called the same number of times as the number
    # of textures is needed for the shader in
    # `Gtk::Snapshot#push_gl_shader`.
    def gl_shader_pop_texture : Nil
      # gtk_snapshot_gl_shader_pop_texture: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_gl_shader_pop_texture(self)

      # Return value handling
    end

    # Applies a perspective projection transform.
    #
    # See `Gsk::Transform#perspective` for a discussion on the details.
    def perspective(depth : Float32) : Nil
      # gtk_snapshot_perspective: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_perspective(self, depth)

      # Return value handling
    end

    # Removes the top element from the stack of render nodes,
    # and appends it to the node underneath it.
    def pop : Nil
      # gtk_snapshot_pop: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_pop(self)

      # Return value handling
    end

    # Blends together two images with the given blend mode.
    #
    # Until the first call to `Gtk::Snapshot#pop`, the
    # bottom image for the blend operation will be recorded.
    # After that call, the top image to be blended will be
    # recorded until the second call to `Gtk::Snapshot#pop`.
    #
    # Calling this function requires two subsequent calls
    # to `Gtk::Snapshot#pop`.
    def push_blend(blend_mode : Gsk::BlendMode) : Nil
      # gtk_snapshot_push_blend: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_push_blend(self, blend_mode)

      # Return value handling
    end

    # Blurs an image.
    #
    # The image is recorded until the next call to `Gtk::Snapshot#pop`.
    def push_blur(radius : Float64) : Nil
      # gtk_snapshot_push_blur: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_push_blur(self, radius)

      # Return value handling
    end

    # Clips an image to a rectangle.
    #
    # The image is recorded until the next call to `Gtk::Snapshot#pop`.
    def push_clip(bounds : Graphene::Rect) : Nil
      # gtk_snapshot_push_clip: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_push_clip(self, bounds)

      # Return value handling
    end

    # Modifies the colors of an image by applying an affine transformation
    # in RGB space.
    #
    # The image is recorded until the next call to `Gtk::Snapshot#pop`.
    def push_color_matrix(color_matrix : Graphene::Matrix, color_offset : Graphene::Vec4) : Nil
      # gtk_snapshot_push_color_matrix: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_push_color_matrix(self, color_matrix, color_offset)

      # Return value handling
    end

    # Snapshots a cross-fade operation between two images with the
    # given @progress.
    #
    # Until the first call to `Gtk::Snapshot#pop`, the start image
    # will be snapshot. After that call, the end image will be recorded
    # until the second call to `Gtk::Snapshot#pop`.
    #
    # Calling this function requires two subsequent calls
    # to `Gtk::Snapshot#pop`.
    def push_cross_fade(progress : Float64) : Nil
      # gtk_snapshot_push_cross_fade: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_push_cross_fade(self, progress)

      # Return value handling
    end

    # Push a `Gsk#GLShaderNode`.
    #
    # The node uses the given `Gsk#GLShader` and uniform values
    # Additionally this takes a list of @n_children other nodes
    # which will be passed to the `Gsk#GLShaderNode`.
    #
    # The @take_args argument is a block of data to use for uniform
    # arguments, as per types and offsets defined by the @shader.
    # Normally this is generated by `Gsk::GLShader#format_args`
    # or `Gsk#ShaderArgsBuilder`.
    #
    # The snapshotter takes ownership of @take_args, so the caller should
    # not free it after this.
    #
    # If the renderer doesn't support GL shaders, or if there is any
    # problem when compiling the shader, then the node will draw pink.
    # You should use `Gsk::GLShader#compile` to ensure the @shader
    # will work for the renderer before using it.
    #
    # If the shader requires textures (see `Gsk::GLShader#n_textures`),
    # then it is expected that you call `Gtk::Snapshot#gl_shader_pop_texture`
    # the number of times that are required. Each of these calls will generate
    # a node that is added as a child to the `GskGLShaderNode`, which in turn
    # will render these offscreen and pass as a texture to the shader.
    #
    # Once all textures (if any) are pop:ed, you must call the regular
    # `Gtk::Snapshot#pop`.
    #
    # If you want to use pre-existing textures as input to the shader rather
    # than rendering new ones, use `Gtk::Snapshot#append_texture` to
    # push a texture node. These will be used directly rather than being
    # re-rendered.
    #
    # For details on how to write shaders, see `Gsk#GLShader`.
    def push_gl_shader(shader : Gsk::GLShader, bounds : Graphene::Rect, take_args : GLib::Bytes) : Nil
      # gtk_snapshot_push_gl_shader: (Method)
      # @take_args: (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_push_gl_shader(self, shader, bounds, take_args)

      # Return value handling
    end

    # Modifies the opacity of an image.
    #
    # The image is recorded until the next call to `Gtk::Snapshot#pop`.
    def push_opacity(opacity : Float64) : Nil
      # gtk_snapshot_push_opacity: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_push_opacity(self, opacity)

      # Return value handling
    end

    # Creates a node that repeats the child node.
    #
    # The child is recorded until the next call to `Gtk::Snapshot#pop`.
    def push_repeat(bounds : Graphene::Rect, child_bounds : Graphene::Rect?) : Nil
      # gtk_snapshot_push_repeat: (Method)
      # @child_bounds: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child_bounds = if child_bounds.nil?
                       Pointer(Void).null
                     else
                       child_bounds.to_unsafe
                     end

      # C call
      LibGtk.gtk_snapshot_push_repeat(self, bounds, child_bounds)

      # Return value handling
    end

    # Clips an image to a rounded rectangle.
    #
    # The image is recorded until the next call to `Gtk::Snapshot#pop`.
    def push_rounded_clip(bounds : Gsk::RoundedRect) : Nil
      # gtk_snapshot_push_rounded_clip: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_push_rounded_clip(self, bounds)

      # Return value handling
    end

    # Applies a shadow to an image.
    #
    # The image is recorded until the next call to `Gtk::Snapshot#pop`.
    def push_shadow(shadow : Enumerable(Gsk::Shadow)) : Nil
      # gtk_snapshot_push_shadow: (Method)
      # @shadow: (array length=n_shadows element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_shadows = shadow.size
      # Generator::ArrayArgPlan
      shadow = shadow.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_snapshot_push_shadow(self, shadow, n_shadows)

      # Return value handling
    end

    def push_shadow(*shadow : Gsk::Shadow)
      push_shadow(shadow)
    end

    # Creates a render node for the CSS background according to @context,
    # and appends it to the current node of @snapshot, without changing
    # the current node.
    def render_background(context : Gtk::StyleContext, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
      # gtk_snapshot_render_background: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_render_background(self, context, x, y, width, height)

      # Return value handling
    end

    # Creates a render node for the focus outline according to @context,
    # and appends it to the current node of @snapshot, without changing
    # the current node.
    def render_focus(context : Gtk::StyleContext, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
      # gtk_snapshot_render_focus: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_render_focus(self, context, x, y, width, height)

      # Return value handling
    end

    # Creates a render node for the CSS border according to @context,
    # and appends it to the current node of @snapshot, without changing
    # the current node.
    def render_frame(context : Gtk::StyleContext, x : Float64, y : Float64, width : Float64, height : Float64) : Nil
      # gtk_snapshot_render_frame: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_render_frame(self, context, x, y, width, height)

      # Return value handling
    end

    # Draws a text caret using @snapshot at the specified index of @layout.
    def render_insertion_cursor(context : Gtk::StyleContext, x : Float64, y : Float64, layout : Pango::Layout, index : Int32, direction : Pango::Direction) : Nil
      # gtk_snapshot_render_insertion_cursor: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_render_insertion_cursor(self, context, x, y, layout, index, direction)

      # Return value handling
    end

    # Creates a render node for rendering @layout according to the style
    # information in @context, and appends it to the current node of @snapshot,
    # without changing the current node.
    def render_layout(context : Gtk::StyleContext, x : Float64, y : Float64, layout : Pango::Layout) : Nil
      # gtk_snapshot_render_layout: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_render_layout(self, context, x, y, layout)

      # Return value handling
    end

    # Restores @snapshot to the state saved by a preceding call to
    # `Snapshot#save` and removes that state from the stack of
    # saved states.
    def restore : Nil
      # gtk_snapshot_restore: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_restore(self)

      # Return value handling
    end

    # Rotates @@snapshot's coordinate system by @angle degrees in 2D space -
    # or in 3D speak, rotates around the Z axis.
    #
    # To rotate around other axes, use [method@Gsk.Transform.rotate_3d].
    def rotate(angle : Float32) : Nil
      # gtk_snapshot_rotate: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_rotate(self, angle)

      # Return value handling
    end

    # Rotates @snapshot's coordinate system by @angle degrees around @axis.
    #
    # For a rotation in 2D space, use `Gsk::Transform#rotate`.
    def rotate_3d(angle : Float32, axis : Graphene::Vec3) : Nil
      # gtk_snapshot_rotate_3d: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_rotate_3d(self, angle, axis)

      # Return value handling
    end

    # Makes a copy of the current state of @snapshot and saves it
    # on an internal stack.
    #
    # When `Gtk::Snapshot#restore` is called, @snapshot will
    # be restored to the saved state. Multiple calls to
    # `Snapshot#save` and `Snapshot#restore` can be nested;
    # each call to `gtk_snapshot_restore()` restores the state from
    # the matching paired `gtk_snapshot_save()`.
    #
    # It is necessary to clear all saved states with corresponding
    # calls to `gtk_snapshot_restore()`.
    def save : Nil
      # gtk_snapshot_save: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_save(self)

      # Return value handling
    end

    # Scales @snapshot's coordinate system in 2-dimensional space by
    # the given factors.
    #
    # Use [method@Gtk.Snapshot.scale_3d] to scale in all 3 dimensions.
    def scale(factor_x : Float32, factor_y : Float32) : Nil
      # gtk_snapshot_scale: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_scale(self, factor_x, factor_y)

      # Return value handling
    end

    # Scales @snapshot's coordinate system by the given factors.
    def scale_3d(factor_x : Float32, factor_y : Float32, factor_z : Float32) : Nil
      # gtk_snapshot_scale_3d: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_scale_3d(self, factor_x, factor_y, factor_z)

      # Return value handling
    end

    # Returns the render node that was constructed
    # by @snapshot.
    #
    # After calling this function, it is no longer possible to
    # add more nodes to @snapshot. The only function that should
    # be called after this is `GObject::Object#unref`.
    def to_node : Gsk::RenderNode?
      # gtk_snapshot_to_node: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_snapshot_to_node(self)

      # Return value handling

      Gsk::RenderNode.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Returns a paintable encapsulating the render node
    # that was constructed by @snapshot.
    #
    # After calling this function, it is no longer possible to
    # add more nodes to @snapshot. The only function that should
    # be called after this is `GObject::Object#unref`.
    def to_paintable(size : Graphene::Size?) : Gdk::Paintable?
      # gtk_snapshot_to_paintable: (Method)
      # @size: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      size = if size.nil?
               Pointer(Void).null
             else
               size.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_snapshot_to_paintable(self, size)

      # Return value handling

      Gdk::Paintable__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Transforms @snapshot's coordinate system with the given @transform.
    def transform(transform : Gsk::Transform?) : Nil
      # gtk_snapshot_transform: (Method)
      # @transform: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      transform = if transform.nil?
                    Pointer(Void).null
                  else
                    transform.to_unsafe
                  end

      # C call
      LibGtk.gtk_snapshot_transform(self, transform)

      # Return value handling
    end

    # Transforms @snapshot's coordinate system with the given @matrix.
    def transform_matrix(matrix : Graphene::Matrix) : Nil
      # gtk_snapshot_transform_matrix: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_transform_matrix(self, matrix)

      # Return value handling
    end

    # Translates @snapshot's coordinate system by @point in 2-dimensional space.
    def translate(point : Graphene::Point) : Nil
      # gtk_snapshot_translate: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_translate(self, point)

      # Return value handling
    end

    # Translates @snapshot's coordinate system by @point.
    def translate_3d(point : Graphene::Point3D) : Nil
      # gtk_snapshot_translate_3d: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_snapshot_translate_3d(self, point)

      # Return value handling
    end
  end
end
