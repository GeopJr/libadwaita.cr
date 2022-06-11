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
  PIXBUF_MICRO = 8
  # Minor version of gdk-pixbuf library, that is the "8" in
  # "0.8.2" for example.
  PIXBUF_MINOR = 42
  # Contains the full version of GdkPixbuf as a string.
  #
  # This is the version being compiled against; contrast with
  # `gdk_pixbuf_version`.
  PIXBUF_VERSION = "2.42.8"

  # Callbacks

  # A function of this type is responsible for freeing the pixel array
  # of a pixbuf.
  #
  # The gdk_pixbuf_new_from_data() function lets you pass in a pre-allocated
  # pixel array so that a pixbuf can be created from it; in this case you
  # will need to pass in a function of type `GdkPixbufDestroyNotify` so that
  # the pixel data can be freed when the pixbuf is finalized.
  alias PixbufDestroyNotify = Proc(Enumerable(UInt8), Nil)

  # Defines the type of the function used to fill a
  # #GdkPixbufFormat structure with information about a module.
  alias PixbufModuleFillInfoFunc = Proc(Nil)

  # Defines the type of the function used to set the vtable of a
  # #GdkPixbufModule when it is loaded.
  alias PixbufModuleFillVtableFunc = Proc(Nil)

  # Incrementally loads a buffer into the image data.
  alias PixbufModuleIncrementLoadFunc = Proc(Pointer(Void)?, Enumerable(UInt8), Bool)

  # Loads a file from a standard C file stream into a new `GdkPixbufAnimation`.
  #
  # In case of error, this function should return `NULL` and set the `error` argument.
  alias PixbufModuleLoadAnimationFunc = Proc(GdkPixbuf::PixbufAnimation)

  # Loads a file from a standard C file stream into a new `GdkPixbuf`.
  #
  # In case of error, this function should return `NULL` and set the `error` argument.
  alias PixbufModuleLoadFunc = Proc(GdkPixbuf::Pixbuf)

  # Loads XPM data into a new `GdkPixbuf`.
  alias PixbufModuleLoadXpmDataFunc = Proc(GdkPixbuf::Pixbuf)

  # Defines the type of the function that gets called once the initial
  # setup of @pixbuf is done.
  #
  # #GdkPixbufLoader uses a function of this type to emit the
  # "<link linkend="GdkPixbufLoader-area-prepared">area_prepared</link>"
  # signal.
  alias PixbufModulePreparedFunc = Proc(GdkPixbuf::Pixbuf, GdkPixbuf::PixbufAnimation, Nil)

  # Saves a `GdkPixbuf` into a standard C file stream.
  #
  # The optional `param_keys` and `param_values` arrays contain the keys and
  # values (in the same order) for attributes to be saved alongside the image
  # data.
  alias PixbufModuleSaveFunc = Proc(Pointer(Void)?, GdkPixbuf::Pixbuf, Enumerable(::String)?, Bool)

  # Checks whether the given `option_key` is supported when saving.
  alias PixbufModuleSaveOptionSupportedFunc = Proc(Bool)

  # Defines the type of the function that gets called once the size
  # of the loaded image is known.
  #
  # The function is expected to set @width and @height to the desired
  # size to which the image should be scaled. If a module has no efficient
  # way to achieve the desired scaling during the loading of the image, it may
  # either ignore the size request, or only approximate it - gdk-pixbuf will
  # then perform the required scaling on the completely loaded image.
  #
  # If the function sets @width or @height to zero, the module should interpret
  # this as a hint that it will be closed soon and shouldn't allocate further
  # resources. This convention is used to implement gdk_pixbuf_get_file_info()
  # efficiently.
  alias PixbufModuleSizeFunc = Proc(Pointer(Int32), Pointer(Int32), Nil)

  # Finalizes the image loading state.
  #
  # This function is called on success and error states.
  alias PixbufModuleStopLoadFunc = Proc(Bool)

  # Defines the type of the function that gets called every time a region
  # of @pixbuf is updated.
  #
  # #GdkPixbufLoader uses a function of this type to emit the
  # "<link linkend="GdkPixbufLoader-area-updated">area_updated</link>"
  # signal.
  alias PixbufModuleUpdatedFunc = Proc(GdkPixbuf::Pixbuf, Int32, Int32, Int32, Int32, Nil)

  # Save functions used by `GdkPixbuf::Pixbuf#save_to_callback`.
  #
  # This function is called once for each block of bytes that is "written"
  # by `gdk_pixbuf_save_to_callback()`.
  #
  # If successful it should return `TRUE`; if an error occurs it should set
  # `error` and return `FALSE`, in which case `gdk_pixbuf_save_to_callback()`
  # will fail with the same error.
  alias PixbufSaveFunc = Proc(Enumerable(UInt8), UInt64, GLib::Error, Bool)

  # Base class for all errors in this module.
  class GdkPixbufError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end

    # :inherit:
    def initialize(message : String)
      super
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

  def self.pixbuf_error_quark : UInt32
    # gdk_pixbuf_error_quark: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibGdkPixbuf.gdk_pixbuf_error_quark

    # Return value handling

    _retval
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
