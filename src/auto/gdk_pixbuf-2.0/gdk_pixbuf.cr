# Dependencies
require "../gio-2.0/gio.cr"
require "../g_module-2.0/g_module.cr"

# C lib declaration
require "./lib_gdk_pixbuf.cr"

# Wrappers
require "./pixbuf.cr"
require "./pixbuf_animation.cr"
require "./pixbuf_animation_iter.cr"
require "./pixbuf_format.cr"
require "./pixbuf_loader.cr"
require "./pixbuf_module.cr"
require "./pixbuf_module_pattern.cr"
require "./pixbuf_non_anim.cr"
require "./pixbuf_simple_anim.cr"
require "./pixbuf_simple_anim_iter.cr"

module GdkPixbuf
  PIXBUF_MAJOR   =  2
  PIXBUF_MICRO   =  6
  PIXBUF_MINOR   = 42
  PIXBUF_VERSION = "2.42.6"

  enum Colorspace : UInt32
    Rgb = 0
  end

  enum InterpType : UInt32
    Nearest  = 0
    Tiles    = 1
    Bilinear = 2
    Hyper    = 3
  end

  enum PixbufAlphaMode : UInt32
    Bilevel = 0
    Full    = 1
  end

  enum PixbufError : UInt32
    CorruptImage         = 0
    InsufficientMemory   = 1
    BadOption            = 2
    UnknownType          = 3
    UnsupportedOperation = 4
    Failed               = 5
    IncompleteAnimation  = 6
  end

  enum PixbufRotation : UInt32
    None             =   0
    Counterclockwise =  90
    Upsidedown       = 180
    Clockwise        = 270
  end

  @[Flags]
  enum PixbufFormatFlags : UInt32
    Writable   = 1
    Scalable   = 2
    Threadsafe = 4
  end

  extend self
end

# Extra includes
