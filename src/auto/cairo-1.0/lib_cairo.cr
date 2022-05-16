@[Link("cairo-gobject", pkg_config: "cairo-gobject")]
lib LibCairo
  # Flags

  # Enums
  type Status = UInt32
  type Content = UInt32
  type Operator = UInt32
  type Antialias = UInt32
  type FillRule = UInt32
  type LineCap = UInt32
  type LineJoin = UInt32
  type TextClusterFlags = UInt32
  type FontSlant = UInt32
  type FontWeight = UInt32
  type SubpixelOrder = UInt32
  type HintStyle = UInt32
  type HintMetrics = UInt32
  type FontType = UInt32
  type PathDataType = UInt32
  type DeviceType = Int32
  type SurfaceType = UInt32
  type Format = Int32
  type PatternType = UInt32
  type Extend = UInt32
  type Filter = UInt32
  type RegionOverlap = UInt32

  # Callbacks

  # Interface types

  # Structs
  type Context = Void # Struct with zero bytes

  type Device = Void # Struct with zero bytes

  type Surface = Void # Struct with zero bytes

  type Matrix = Void # Struct with zero bytes

  type Pattern = Void # Struct with zero bytes

  type Region = Void # Struct with zero bytes

  type FontOptions = Void # Struct with zero bytes

  type FontFace = Void # Struct with zero bytes

  type ScaledFont = Void # Struct with zero bytes

  type Path = Void # Struct with zero bytes

  struct Rectangle # 32 bytes long
    x : Float64
    y : Float64
    width : Float64
    height : Float64
  end

  struct RectangleInt # 16 bytes long
    x : Int32
    y : Int32
    width : Int32
    height : Int32
  end

  # Unions

  # Objects

  # All C Functions
  fun cairo_gobject_context_get_type : UInt64
  fun cairo_gobject_device_get_type : UInt64
  fun cairo_gobject_font_face_get_type : UInt64
  fun cairo_gobject_font_options_get_type : UInt64
  fun cairo_gobject_pattern_get_type : UInt64
  fun cairo_gobject_rectangle_get_type : UInt64
  fun cairo_gobject_rectangle_int_get_type : UInt64
  fun cairo_gobject_region_get_type : UInt64
  fun cairo_gobject_scaled_font_get_type : UInt64
  fun cairo_gobject_surface_get_type : UInt64
  fun cairo_image_surface_create : Void
end
