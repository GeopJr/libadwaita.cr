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
  enum BlendMode : UInt32
    Default    =  0
    Multiply   =  1
    Screen     =  2
    Overlay    =  3
    Darken     =  4
    Lighten    =  5
    ColorDodge =  6
    ColorBurn  =  7
    HardLight  =  8
    SoftLight  =  9
    Difference = 10
    Exclusion  = 11
    Color      = 12
    Hue        = 13
    Saturation = 14
    Luminosity = 15
  end

  enum Corner : UInt32
    TopLeft     = 0
    TopRight    = 1
    BottomRight = 2
    BottomLeft  = 3
  end

  enum GLUniformType : UInt32
    None  = 0
    Float = 1
    Int   = 2
    Uint  = 3
    Bool  = 4
    Vec2  = 5
    Vec3  = 6
    Vec4  = 7
  end

  enum RenderNodeType : UInt32
    NotARenderNode              =  0
    ContainerNode               =  1
    CairoNode                   =  2
    ColorNode                   =  3
    LinearGradientNode          =  4
    RepeatingLinearGradientNode =  5
    RadialGradientNode          =  6
    RepeatingRadialGradientNode =  7
    ConicGradientNode           =  8
    BorderNode                  =  9
    TextureNode                 = 10
    InsetShadowNode             = 11
    OutsetShadowNode            = 12
    TransformNode               = 13
    OpacityNode                 = 14
    ColorMatrixNode             = 15
    RepeatNode                  = 16
    ClipNode                    = 17
    RoundedClipNode             = 18
    ShadowNode                  = 19
    BlendNode                   = 20
    CrossFadeNode               = 21
    TextNode                    = 22
    BlurNode                    = 23
    DebugNode                   = 24
    GlShaderNode                = 25
  end

  enum ScalingFilter : UInt32
    Linear    = 0
    Nearest   = 1
    Trilinear = 2
  end

  enum SerializationError : UInt32
    UnsupportedFormat  = 0
    UnsupportedVersion = 1
    InvalidData        = 2
  end

  enum TransformCategory : UInt32
    Unknown      = 0
    Any          = 1
    G3d          = 2
    G2d          = 3
    G2dAffine    = 4
    G2dTranslate = 5
    Identity     = 6
  end

  extend self
end

# Extra includes
