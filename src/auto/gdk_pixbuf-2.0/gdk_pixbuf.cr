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
  # Major version of gdk-pixbuf library, that is the "0" in
  # "0.8.2" for example.
  PIXBUF_MAJOR = 2
  # Micro version of gdk-pixbuf library, that is the "2" in
  # "0.8.2" for example.
  PIXBUF_MICRO = 6
  # Minor version of gdk-pixbuf library, that is the "8" in
  # "0.8.2" for example.
  PIXBUF_MINOR = 42
  # Contains the full version of GdkPixbuf as a string.
  #
  # This is the version being compiled against; contrast with
  # `gdk_pixbuf_version`.
  PIXBUF_VERSION = "2.42.6"

  # Base class for all errors in this module.
  class GdkPixbufError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # This enumeration defines the color spaces that are supported by
  # the gdk-pixbuf library.
  #
  # Currently only RGB is supported.
  enum Colorspace : UInt32
    # Indicates a red/green/blue additive color space.
    Rgb = 0
  end

  # Interpolation modes for scaling functions.
  #
  # The `GDK_INTERP_NEAREST` mode is the fastest scaling method, but has
  # horrible quality when scaling down; `GDK_INTERP_BILINEAR` is the best
  # choice if you aren't sure what to choose, it has a good speed/quality
  # balance.
  #
  # **Note**: Cubic filtering is missing from the list; hyperbolic
  # interpolation is just as fast and results in higher quality.
  enum InterpType : UInt32
    # Nearest neighbor sampling; this is the fastest
    #  and lowest quality mode. Quality is normally unacceptable when scaling
    #  down, but may be OK when scaling up.
    Nearest = 0
    # This is an accurate simulation of the PostScript
    #  image operator without any interpolation enabled.  Each pixel is
    #  rendered as a tiny parallelogram of solid color, the edges of which
    #  are implemented with antialiasing.  It resembles nearest neighbor for
    #  enlargement, and bilinear for reduction.
    Tiles = 1
    # Best quality/speed balance; use this mode by
    #  default. Bilinear interpolation.  For enlargement, it is
    #  equivalent to point-sampling the ideal bilinear-interpolated image.
    #  For reduction, it is equivalent to laying down small tiles and
    #  integrating over the coverage area.
    Bilinear = 2
    # This is the slowest and highest quality
    #  reconstruction function. It is derived from the hyperbolic filters in
    #  Wolberg's "Digital Image Warping", and is formally defined as the
    #  hyperbolic-filter sampling the ideal hyperbolic-filter interpolated
    #  image (the filter is designed to be idempotent for 1:1 pixel mapping).
    #  **Deprecated**: this interpolation filter is deprecated, as in reality
    #  it has a lower quality than the @GDK_INTERP_BILINEAR filter
    #  (Since: 2.38)
    Hyper = 3
  end

  # Control the alpha channel for drawables.
  #
  # These values can be passed to gdk_pixbuf_xlib_render_to_drawable_alpha()
  # in gdk-pixbuf-xlib to control how the alpha channel of an image should
  # be handled.
  #
  # This function can create a bilevel clipping mask (black and white) and use
  # it while painting the image.
  #
  # In the future, when the X Window System gets an alpha channel extension,
  # it will be possible to do full alpha compositing onto arbitrary drawables.
  # For now both cases fall back to a bilevel clipping mask.
  enum PixbufAlphaMode : UInt32
    # A bilevel clipping mask (black and white)
    #  will be created and used to draw the image.  Pixels below 0.5 opacity
    #  will be considered fully transparent, and all others will be
    #  considered fully opaque.
    Bilevel = 0
    # For now falls back to #GDK_PIXBUF_ALPHA_BILEVEL.
    #  In the future it will do full alpha compositing.
    Full = 1
  end

  # The possible rotations which can be passed to gdk_pixbuf_rotate_simple().
  #
  # To make them easier to use, their numerical values are the actual degrees.
  enum PixbufRotation : UInt32
    # No rotation.
    None = 0
    # Rotate by 90 degrees.
    Counterclockwise = 90
    # Rotate by 180 degrees.
    Upsidedown = 180
    # Rotate by 270 degrees.
    Clockwise = 270
  end

  # Flags
  @[Flags]
  enum PixbufFormatFlags : UInt32
    Writable   = 1
    Scalable   = 2
    Threadsafe = 4
  end

  # Errors

  # An error code in the `GDK_PIXBUF_ERROR` domain.
  #
  # Many gdk-pixbuf operations can cause errors in this domain, or in
  # the `G_FILE_ERROR` domain.
  class PixbufError < GdkPixbufError
    class CorruptImage < PixbufError
      def code : Int32
        0
      end
    end

    class InsufficientMemory < PixbufError
      def code : Int32
        1
      end
    end

    class BadOption < PixbufError
      def code : Int32
        2
      end
    end

    class UnknownType < PixbufError
      def code : Int32
        3
      end
    end

    class UnsupportedOperation < PixbufError
      def code : Int32
        4
      end
    end

    class Failed < PixbufError
      def code : Int32
        5
      end
    end

    class IncompleteAnimation < PixbufError
      def code : Int32
        6
      end
    end
  end

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    error_domain = error.value.domain
    error_code = error.value.code

    if error_domain == LibGLib.g_quark_try_string("gdk-pixbuf-error-quark")
      raise PixbufError::CorruptImage.new(error) if error_code == 0
      raise PixbufError::InsufficientMemory.new(error) if error_code == 1
      raise PixbufError::BadOption.new(error) if error_code == 2
      raise PixbufError::UnknownType.new(error) if error_code == 3
      raise PixbufError::UnsupportedOperation.new(error) if error_code == 4
      raise PixbufError::Failed.new(error) if error_code == 5
      raise PixbufError::IncompleteAnimation.new(error) if error_code == 6
    end

    Gio.raise_exception(error)
    GModule.raise_exception(error)
  end

  extend self
end

# Extra includes
