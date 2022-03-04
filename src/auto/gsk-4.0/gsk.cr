# Dependencies
require "../graphene-1.0/graphene.cr"
require "../gdk-4.0/gdk.cr"

# C lib declaration
require "./lib_gsk.cr"

# Wrappers
require "./blend_node.cr"
require "./blur_node.cr"
require "./border_node.cr"
require "./broadway_renderer.cr"
require "./cairo_node.cr"
require "./cairo_renderer.cr"
require "./clip_node.cr"
require "./color_matrix_node.cr"
require "./color_node.cr"
require "./color_stop.cr"
require "./conic_gradient_node.cr"
require "./container_node.cr"
require "./cross_fade_node.cr"
require "./debug_node.cr"
require "./gl_renderer.cr"
require "./gl_shader.cr"
require "./gl_shader_node.cr"
require "./inset_shadow_node.cr"
require "./linear_gradient_node.cr"
require "./ngl_renderer.cr"
require "./opacity_node.cr"
require "./outset_shadow_node.cr"
require "./parse_location.cr"
require "./radial_gradient_node.cr"
require "./render_node.cr"
require "./renderer.cr"
require "./repeat_node.cr"
require "./repeating_linear_gradient_node.cr"
require "./repeating_radial_gradient_node.cr"
require "./rounded_clip_node.cr"
require "./rounded_rect.cr"
require "./shader_args_builder.cr"
require "./shadow.cr"
require "./shadow_node.cr"
require "./text_node.cr"
require "./texture_node.cr"
require "./transform.cr"
require "./transform_node.cr"

module Gsk
  # Base class for all errors in this module.
  class GskError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # The blend modes available for render nodes.
  #
  # The implementation of each blend mode is deferred to the
  # rendering pipeline.
  #
  # See <https://www.w3.org/TR/compositing-1/#blending> for more information
  # on blending and blend modes.
  enum BlendMode : UInt32
    # The default blend mode, which specifies no blending
    Default = 0
    # The source color is multiplied by the destination
    #   and replaces the destination
    Multiply = 1
    # Multiplies the complements of the destination and source
    #   color values, then complements the result.
    Screen = 2
    # Multiplies or screens the colors, depending on the
    #   destination color value. This is the inverse of hard-list
    Overlay = 3
    # Selects the darker of the destination and source colors
    Darken = 4
    # Selects the lighter of the destination and source colors
    Lighten = 5
    # Brightens the destination color to reflect the source color
    ColorDodge = 6
    # Darkens the destination color to reflect the source color
    ColorBurn = 7
    # Multiplies or screens the colors, depending on the source color value
    HardLight = 8
    # Darkens or lightens the colors, depending on the source color value
    SoftLight = 9
    # Subtracts the darker of the two constituent colors from the lighter color
    Difference = 10
    # Produces an effect similar to that of the difference mode but lower in contrast
    Exclusion = 11
    # Creates a color with the hue and saturation of the source color and the luminosity of the destination color
    Color = 12
    # Creates a color with the hue of the source color and the saturation and luminosity of the destination color
    Hue = 13
    # Creates a color with the saturation of the source color and the hue and luminosity of the destination color
    Saturation = 14
    # Creates a color with the luminosity of the source color and the hue and saturation of the destination color
    Luminosity = 15
  end

  # The corner indices used by `GskRoundedRect`.
  enum Corner : UInt32
    # The top left corner
    TopLeft = 0
    # The top right corner
    TopRight = 1
    # The bottom right corner
    BottomRight = 2
    # The bottom left corner
    BottomLeft = 3
  end

  # This defines the types of the uniforms that `GskGLShaders`
  # declare.
  #
  # It defines both what the type is called in the GLSL shader
  # code, and what the corresponding C type is on the Gtk side.
  enum GLUniformType : UInt32
    # No type, used for uninitialized or unspecified values.
    None = 0
    # A float uniform
    Float = 1
    # A GLSL int / gint32 uniform
    Int = 2
    # A GLSL uint / guint32 uniform
    Uint = 3
    # A GLSL bool / gboolean uniform
    Bool = 4
    # A GLSL vec2 / graphene_vec2_t uniform
    Vec2 = 5
    # A GLSL vec3 / graphene_vec3_t uniform
    Vec3 = 6
    # A GLSL vec4 / graphene_vec4_t uniform
    Vec4 = 7
  end

  # The type of a node determines what the node is rendering.
  enum RenderNodeType : UInt32
    # Error type. No node will ever have this type.
    NotARenderNode = 0
    # A node containing a stack of children
    ContainerNode = 1
    # A node drawing a `cairo_surface_t`
    CairoNode = 2
    # A node drawing a single color rectangle
    ColorNode = 3
    # A node drawing a linear gradient
    LinearGradientNode = 4
    # A node drawing a repeating linear gradient
    RepeatingLinearGradientNode = 5
    # A node drawing a radial gradient
    RadialGradientNode = 6
    # A node drawing a repeating radial gradient
    RepeatingRadialGradientNode = 7
    # A node drawing a conic gradient
    ConicGradientNode = 8
    # A node stroking a border around an area
    BorderNode = 9
    # A node drawing a `GdkTexture`
    TextureNode = 10
    # A node drawing an inset shadow
    InsetShadowNode = 11
    # A node drawing an outset shadow
    OutsetShadowNode = 12
    # A node that renders its child after applying a matrix transform
    TransformNode = 13
    # A node that changes the opacity of its child
    OpacityNode = 14
    # A node that applies a color matrix to every pixel
    ColorMatrixNode = 15
    # A node that repeats the child's contents
    RepeatNode = 16
    # A node that clips its child to a rectangular area
    ClipNode = 17
    # A node that clips its child to a rounded rectangle
    RoundedClipNode = 18
    # A node that draws a shadow below its child
    ShadowNode = 19
    # A node that blends two children together
    BlendNode = 20
    # A node that cross-fades between two children
    CrossFadeNode = 21
    # A node containing a glyph string
    TextNode = 22
    # A node that applies a blur
    BlurNode = 23
    # Debug information that does not affect the rendering
    DebugNode = 24
    # A node that uses OpenGL fragment shaders to render
    GlShaderNode = 25
  end

  # The filters used when scaling texture data.
  #
  # The actual implementation of each filter is deferred to the
  # rendering pipeline.
  enum ScalingFilter : UInt32
    # linear interpolation filter
    Linear = 0
    # nearest neighbor interpolation filter
    Nearest = 1
    # linear interpolation along each axis,
    #   plus mipmap generation, with linear interpolation along the mipmap
    #   levels
    Trilinear = 2
  end

  # The categories of matrices relevant for GSK and GTK.
  #
  # Note that any category includes matrices of all later categories.
  # So if you want to for example check if a matrix is a 2D matrix,
  # `category >= GSK_TRANSFORM_CATEGORY_2D` is the way to do this.
  #
  # Also keep in mind that rounding errors may cause matrices to not
  # conform to their categories. Otherwise, matrix operations done via
  # multiplication will not worsen categories. So for the matrix
  # multiplication `C = A * B`, `category(C) = MIN (category(A), category(B))`.
  enum TransformCategory : UInt32
    # The category of the matrix has not been
    #   determined.
    Unknown = 0
    # Analyzing the matrix concluded that it does
    #   not fit in any other category.
    Any = 1
    # The matrix is a 3D matrix. This means that
    #   the w column (the last column) has the values (0, 0, 0, 1).
    G3d = 2
    # The matrix is a 2D matrix. This is equivalent
    #   to graphene_matrix_is_2d() returning %TRUE. In particular, this
    #   means that Cairo can deal with the matrix.
    G2d = 3
    # The matrix is a combination of 2D scale
    #   and 2D translation operations. In particular, this means that any
    #   rectangle can be transformed exactly using this matrix.
    G2dAffine = 4
    # The matrix is a 2D translation.
    G2dTranslate = 5
    # The matrix is the identity matrix.
    Identity = 6
  end

  # Flags

  # Errors

  # Errors that can happen during (de)serialization.
  class SerializationError < GskError
    class UnsupportedFormat < SerializationError
      def code : Int32
        0
      end
    end

    class UnsupportedVersion < SerializationError
      def code : Int32
        1
      end
    end

    class InvalidData < SerializationError
      def code : Int32
        2
      end
    end
  end

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    error_domain = error.value.domain
    error_code = error.value.code

    if error_domain == LibGLib.g_quark_try_string("gsk-serialization-error-quark")
      raise SerializationError::UnsupportedFormat.new(error) if error_code == 0
      raise SerializationError::UnsupportedVersion.new(error) if error_code == 1
      raise SerializationError::InvalidData.new(error) if error_code == 2
    end

    Graphene.raise_exception(error)
    Gdk.raise_exception(error)
  end

  extend self
end

# Extra includes
