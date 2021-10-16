require "../g_object-2.0/object"
require "../gio-2.0/icon"

require "../gio-2.0/loadable_icon"

module GdkPixbuf
  # A pixel buffer.
  #
  # `GdkPixbuf` contains information about an image's pixel data,
  # its color space, bits per sample, width and height, and the
  # rowstride (the number of bytes between the start of one row
  # and the start of the next).
  #
  # ## Creating new `GdkPixbuf`
  #
  # The most basic way to create a pixbuf is to wrap an existing pixel
  # buffer with a [class@GdkPixbuf.Pixbuf] instance. You can use the
  # [`ctor@GdkPixbuf.Pixbuf.new_from_data`] function to do this.
  #
  # Every time you create a new `GdkPixbuf` instance for some data, you
  # will need to specify the destroy notification function that will be
  # called when the data buffer needs to be freed; this will happen when
  # a `GdkPixbuf` is finalized by the reference counting functions. If
  # you have a chunk of static data compiled into your application, you
  # can pass in `NULL` as the destroy notification function so that the
  # data will not be freed.
  #
  # The [`ctor@GdkPixbuf.Pixbuf.new`] constructor function can be used
  # as a convenience to create a pixbuf with an empty buffer; this is
  # equivalent to allocating a data buffer using `malloc()` and then
  # wrapping it with `gdk_pixbuf_new_from_data()`. The `gdk_pixbuf_new()`
  # function will compute an optimal rowstride so that rendering can be
  # performed with an efficient algorithm.
  #
  # As a special case, you can use the [`ctor@GdkPixbuf.Pixbuf.new_from_xpm_data`]
  # function to create a pixbuf from inline XPM image data.
  #
  # You can also copy an existing pixbuf with the [method@Pixbuf.copy]
  # function. This is not the same as just acquiring a reference to
  # the old pixbuf instance: the copy function will actually duplicate
  # the pixel data in memory and create a new [class@Pixbuf] instance
  # for it.
  #
  # ## Reference counting
  #
  # `GdkPixbuf` structures are reference counted. This means that an
  # application can share a single pixbuf among many parts of the
  # code. When a piece of the program needs to use a pixbuf, it should
  # acquire a reference to it by calling `g_object_ref()`; when it no
  # longer needs the pixbuf, it should release the reference it acquired
  # by calling `g_object_unref()`. The resources associated with a
  # `GdkPixbuf` will be freed when its reference count drops to zero.
  # Newly-created `GdkPixbuf` instances start with a reference count
  # of one.
  #
  # ## Image Data
  #
  # Image data in a pixbuf is stored in memory in an uncompressed,
  # packed format. Rows in the image are stored top to bottom, and
  # in each row pixels are stored from left to right.
  #
  # There may be padding at the end of a row.
  #
  # The "rowstride" value of a pixbuf, as returned by [`method@GdkPixbuf.Pixbuf.get_rowstride`],
  # indicates the number of bytes between rows.
  #
  # **NOTE**: If you are copying raw pixbuf data with `memcpy()` note that the
  # last row in the pixbuf may not be as wide as the full rowstride, but rather
  # just as wide as the pixel data needs to be; that is: it is unsafe to do
  # `memcpy (dest, pixels, rowstride * height)` to copy a whole pixbuf. Use
  # [method@GdkPixbuf.Pixbuf.copy] instead, or compute the width in bytes of the
  # last row as:
  #
  # ```c
  # last_row = width * ((n_channels * bits_per_sample + 7) / 8);
  # ```
  #
  # The same rule applies when iterating over each row of a `GdkPixbuf` pixels
  # array.
  #
  # The following code illustrates a simple `put_pixel()`
  # function for RGB pixbufs with 8 bits per channel with an alpha
  # channel.
  #
  # ```c
  # static void
  # put_pixel (GdkPixbuf *pixbuf,
  #            int x,
  # 	   int y,
  # 	   guchar red,
  # 	   guchar green,
  # 	   guchar blue,
  # 	   guchar alpha)
  # {
  #   int n_channels = gdk_pixbuf_get_n_channels (pixbuf);
  #
  #   // Ensure that the pixbuf is valid
  #   g_assert (gdk_pixbuf_get_colorspace (pixbuf) == GDK_COLORSPACE_RGB);
  #   g_assert (gdk_pixbuf_get_bits_per_sample (pixbuf) == 8);
  #   g_assert (gdk_pixbuf_get_has_alpha (pixbuf));
  #   g_assert (n_channels == 4);
  #
  #   int width = gdk_pixbuf_get_width (pixbuf);
  #   int height = gdk_pixbuf_get_height (pixbuf);
  #
  #   // Ensure that the coordinates are in a valid range
  #   g_assert (x >= 0 && x < width);
  #   g_assert (y >= 0 && y < height);
  #
  #   int rowstride = gdk_pixbuf_get_rowstride (pixbuf);
  #
  #   // The pixel buffer in the GdkPixbuf instance
  #   guchar *pixels = gdk_pixbuf_get_pixels (pixbuf);
  #
  #   // The pixel we wish to modify
  #   guchar *p = pixels + y * rowstride + x * n_channels;
  #   p[0] = red;
  #   p[1] = green;
  #   p[2] = blue;
  #   p[3] = alpha;
  # }
  # ```
  #
  # ## Loading images
  #
  # The `GdkPixBuf` class provides a simple mechanism for loading
  # an image from a file in synchronous and asynchronous fashion.
  #
  # For GUI applications, it is recommended to use the asynchronous
  # stream API to avoid blocking the control flow of the application.
  #
  # Additionally, `GdkPixbuf` provides the [class@GdkPixbuf.PixbufLoader`]
  # API for progressive image loading.
  #
  # ## Saving images
  #
  # The `GdkPixbuf` class provides methods for saving image data in
  # a number of file formats. The formatted data can be written to a
  # file or to a memory buffer. `GdkPixbuf` can also call a user-defined
  # callback on the data, which allows to e.g. write the image
  # to a socket or store it in a database.
  class Pixbuf < GObject::Object
    include Gio::Icon
    include Gio::LoadableIcon

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, bits_per_sample : Int32? = nil, colorspace : GdkPixbuf::Colorspace? = nil, has_alpha : Bool? = nil, height : Int32? = nil, n_channels : Int32? = nil, pixel_bytes : GLib::Bytes? = nil, pixels : Pointer(Nil)? = nil, rowstride : Int32? = nil, width : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if bits_per_sample
        (_names.to_unsafe + _n).value = "bits-per-sample".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, bits_per_sample)
        _n += 1
      end
      if colorspace
        (_names.to_unsafe + _n).value = "colorspace".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, colorspace)
        _n += 1
      end
      if has_alpha
        (_names.to_unsafe + _n).value = "has-alpha".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_alpha)
        _n += 1
      end
      if height
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if n_channels
        (_names.to_unsafe + _n).value = "n-channels".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_channels)
        _n += 1
      end
      if pixel_bytes
        (_names.to_unsafe + _n).value = "pixel-bytes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixel_bytes)
        _n += 1
      end
      if pixels
        (_names.to_unsafe + _n).value = "pixels".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels)
        _n += 1
      end
      if rowstride
        (_names.to_unsafe + _n).value = "rowstride".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rowstride)
        _n += 1
      end
      if width
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Pixbuf.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdkPixbuf.gdk_pixbuf_get_type
    end

    def bits_per_sample=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "bits-per-sample", unsafe_value, Pointer(Void).null)
      value
    end

    def bits_per_sample : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "bits-per-sample", pointerof(value), Pointer(Void).null)
      value
    end

    def colorspace=(value : GdkPixbuf::Colorspace) : GdkPixbuf::Colorspace
      unsafe_value = value

      LibGObject.g_object_set(self, "colorspace", unsafe_value, Pointer(Void).null)
      value
    end

    def colorspace : GdkPixbuf::Colorspace
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "colorspace", pointerof(value), Pointer(Void).null)
      GdkPixbuf::Colorspace.from_value(value)
    end

    def has_alpha=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-alpha", unsafe_value, Pointer(Void).null)
      value
    end

    def has_alpha? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-alpha", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def height=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "height", unsafe_value, Pointer(Void).null)
      value
    end

    def height : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "height", pointerof(value), Pointer(Void).null)
      value
    end

    def n_channels=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "n-channels", unsafe_value, Pointer(Void).null)
      value
    end

    def n_channels : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "n-channels", pointerof(value), Pointer(Void).null)
      value
    end

    def pixel_bytes=(value : GLib::Bytes?) : GLib::Bytes?
      unsafe_value = value

      LibGObject.g_object_set(self, "pixel-bytes", unsafe_value, Pointer(Void).null)
      value
    end

    def pixel_bytes : GLib::Bytes?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pixel-bytes", pointerof(value), Pointer(Void).null)
      GLib::Bytes.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def pixels=(value : Pointer(Nil)) : Pointer(Nil)
      unsafe_value = value

      LibGObject.g_object_set(self, "pixels", unsafe_value, Pointer(Void).null)
      value
    end

    def pixels : Pointer(Nil)
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pixels", pointerof(value), Pointer(Void).null)
      Pointer(Void)
    end

    def rowstride=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "rowstride", unsafe_value, Pointer(Void).null)
      value
    end

    def rowstride : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "rowstride", pointerof(value), Pointer(Void).null)
      value
    end

    def width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "width", unsafe_value, Pointer(Void).null)
      value
    end

    def width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "width", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize(colorspace : GdkPixbuf::Colorspace, has_alpha : Bool, bits_per_sample : Int32, width : Int32, height : Int32)
      # gdk_pixbuf_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_new(colorspace, has_alpha, bits_per_sample, width, height)
      @pointer = _retval unless _retval.null?
    end

    def self.new_from_bytes(data : GLib::Bytes, colorspace : GdkPixbuf::Colorspace, has_alpha : Bool, bits_per_sample : Int32, width : Int32, height : Int32, rowstride : Int32) : GdkPixbuf::Pixbuf
      # gdk_pixbuf_new_from_bytes: (Constructor)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_bytes(data, colorspace, has_alpha, bits_per_sample, width, height, rowstride)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_data(data : Enumerable(UInt8), colorspace : GdkPixbuf::Colorspace, has_alpha : Bool, bits_per_sample : Int32, width : Int32, height : Int32, rowstride : Int32, destroy_fn : Pointer(Void)?, destroy_fn_data : Pointer(Nil)?) : GdkPixbuf::Pixbuf
      # gdk_pixbuf_new_from_data: (Constructor)
      # @data: (array element-type UInt8)
      # @destroy_fn: (nullable)
      # @destroy_fn_data: (nullable)
      # Returns: (transfer full)

      destroy_fn = if destroy_fn.nil?
                     LibGdkPixbuf::PixbufDestroyNotify.null
                   else
                     destroy_fn.to_unsafe
                   end
      destroy_fn_data = if destroy_fn_data.nil?
                          Pointer(Void).null
                        else
                          destroy_fn_data.to_unsafe
                        end
      data = data.to_a.to_unsafe

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_data(data, colorspace, has_alpha, bits_per_sample, width, height, rowstride, destroy_fn, destroy_fn_data)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_file(filename : ::String) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_file(filename)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_file_at_scale(filename : ::String, width : Int32, height : Int32, preserve_aspect_ratio : Bool) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_new_from_file_at_scale: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_file_at_scale(filename, width, height, preserve_aspect_ratio)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_file_at_size(filename : ::String, width : Int32, height : Int32) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_new_from_file_at_size: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_file_at_size(filename, width, height)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_inline(data : Enumerable(UInt8), copy_pixels : Bool) : GdkPixbuf::Pixbuf
      # gdk_pixbuf_new_from_inline: (Constructor | Throws)
      # @data: (array length=data_length element-type UInt8)
      # Returns: (transfer full)

      data_length = data.size
      data = data.to_a.to_unsafe

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_inline(data_length, data, copy_pixels)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_resource(resource_path : ::String) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_new_from_resource: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_resource(resource_path)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_resource_at_scale(resource_path : ::String, width : Int32, height : Int32, preserve_aspect_ratio : Bool) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_new_from_resource_at_scale: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_resource_at_scale(resource_path, width, height, preserve_aspect_ratio)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_stream(stream : Gio::InputStream, cancellable : Gio::Cancellable?) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_new_from_stream: (Constructor | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_stream(stream, cancellable)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_stream_at_scale(stream : Gio::InputStream, width : Int32, height : Int32, preserve_aspect_ratio : Bool, cancellable : Gio::Cancellable?) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_new_from_stream_at_scale: (Constructor | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_stream_at_scale(stream, width, height, preserve_aspect_ratio, cancellable)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_stream_finish(async_result : Gio::AsyncResult) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_new_from_stream_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_stream_finish(async_result)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_xpm_data(data : Enumerable(::String)) : GdkPixbuf::Pixbuf
      # gdk_pixbuf_new_from_xpm_data: (Constructor)
      # @data: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer full)

      data = data.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_xpm_data(data)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_xpm_data(*data : ::String)
      self.new_from_xpm_data(data)
    end

    def self.calculate_rowstride(colorspace : GdkPixbuf::Colorspace, has_alpha : Bool, bits_per_sample : Int32, width : Int32, height : Int32) : Int32
      # gdk_pixbuf_calculate_rowstride: (None)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_calculate_rowstride(colorspace, has_alpha, bits_per_sample, width, height)
      _retval
    end

    def self.file_info(filename : ::String) : GdkPixbuf::PixbufFormat?
      # gdk_pixbuf_get_file_info: (None)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      width = Pointer(Int32).null
      height = Pointer(Int32).null

      _retval = LibGdkPixbuf.gdk_pixbuf_get_file_info(filename, width, height)
      GdkPixbuf::PixbufFormat.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def self.file_info_async(filename : ::String, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # gdk_pixbuf_get_file_info_async: (None)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGdkPixbuf.gdk_pixbuf_get_file_info_async(filename, cancellable, callback, user_data)
    end

    def file_info_finish(async_result : Gio::AsyncResult, width : Int32, height : Int32) : GdkPixbuf::PixbufFormat?
      # gdk_pixbuf_get_file_info_finish: (Throws)
      # @width: (out) (transfer full)
      # @height: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_file_info_finish(async_result, width, height)
      GdkPixbuf::PixbufFormat.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def self.formats : GLib::SList
      # gdk_pixbuf_get_formats: (None)
      # Returns: (transfer container)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_formats
      GLib::SList(GdkPixbuf::PixbufFormat).new(_retval, GICrystal::Transfer::Container)
    end

    def init_modules(path : ::String) : Bool
      # gdk_pixbuf_init_modules: (Throws)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_init_modules(path)
      GICrystal.to_bool(_retval)
    end

    def self.new_from_stream_async(stream : Gio::InputStream, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # gdk_pixbuf_new_from_stream_async: (None)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGdkPixbuf.gdk_pixbuf_new_from_stream_async(stream, cancellable, callback, user_data)
    end

    def self.new_from_stream_at_scale_async(stream : Gio::InputStream, width : Int32, height : Int32, preserve_aspect_ratio : Bool, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # gdk_pixbuf_new_from_stream_at_scale_async: (None)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGdkPixbuf.gdk_pixbuf_new_from_stream_at_scale_async(stream, width, height, preserve_aspect_ratio, cancellable, callback, user_data)
    end

    def save_to_stream_finish(async_result : Gio::AsyncResult) : Bool
      # gdk_pixbuf_save_to_stream_finish: (Throws)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_save_to_stream_finish(async_result)
      GICrystal.to_bool(_retval)
    end

    def add_alpha(substitute_color : Bool, r : UInt8, g : UInt8, b : UInt8) : GdkPixbuf::Pixbuf
      # gdk_pixbuf_add_alpha: (Method)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_add_alpha(self, substitute_color, r, g, b)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    def apply_embedded_orientation : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_apply_embedded_orientation: (Method)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_apply_embedded_orientation(self)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def composite(dest : GdkPixbuf::Pixbuf, dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : GdkPixbuf::InterpType, overall_alpha : Int32) : Nil
      # gdk_pixbuf_composite: (Method)
      # Returns: (transfer none)

      LibGdkPixbuf.gdk_pixbuf_composite(self, dest, dest_x, dest_y, dest_width, dest_height, offset_x, offset_y, scale_x, scale_y, interp_type, overall_alpha)
    end

    def composite_color(dest : GdkPixbuf::Pixbuf, dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : GdkPixbuf::InterpType, overall_alpha : Int32, check_x : Int32, check_y : Int32, check_size : Int32, color1 : UInt32, color2 : UInt32) : Nil
      # gdk_pixbuf_composite_color: (Method)
      # Returns: (transfer none)

      LibGdkPixbuf.gdk_pixbuf_composite_color(self, dest, dest_x, dest_y, dest_width, dest_height, offset_x, offset_y, scale_x, scale_y, interp_type, overall_alpha, check_x, check_y, check_size, color1, color2)
    end

    def composite_color_simple(dest_width : Int32, dest_height : Int32, interp_type : GdkPixbuf::InterpType, overall_alpha : Int32, check_size : Int32, color1 : UInt32, color2 : UInt32) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_composite_color_simple: (Method)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_composite_color_simple(self, dest_width, dest_height, interp_type, overall_alpha, check_size, color1, color2)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def copy : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_copy: (Method)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_copy(self)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def copy_area(src_x : Int32, src_y : Int32, width : Int32, height : Int32, dest_pixbuf : GdkPixbuf::Pixbuf, dest_x : Int32, dest_y : Int32) : Nil
      # gdk_pixbuf_copy_area: (Method)
      # Returns: (transfer none)

      LibGdkPixbuf.gdk_pixbuf_copy_area(self, src_x, src_y, width, height, dest_pixbuf, dest_x, dest_y)
    end

    def copy_options(dest_pixbuf : GdkPixbuf::Pixbuf) : Bool
      # gdk_pixbuf_copy_options: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_copy_options(self, dest_pixbuf)
      GICrystal.to_bool(_retval)
    end

    def fill(pixel : UInt32) : Nil
      # gdk_pixbuf_fill: (Method)
      # Returns: (transfer none)

      LibGdkPixbuf.gdk_pixbuf_fill(self, pixel)
    end

    def flip(horizontal : Bool) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_flip: (Method)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_flip(self, horizontal)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def bits_per_sample : Int32
      # gdk_pixbuf_get_bits_per_sample: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_bits_per_sample(self)
      _retval
    end

    def byte_length : UInt64
      # gdk_pixbuf_get_byte_length: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_byte_length(self)
      _retval
    end

    def colorspace : GdkPixbuf::Colorspace
      # gdk_pixbuf_get_colorspace: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_colorspace(self)
      GdkPixbuf::Colorspace.from_value(_retval)
    end

    def has_alpha : Bool
      # gdk_pixbuf_get_has_alpha: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_has_alpha(self)
      GICrystal.to_bool(_retval)
    end

    def height : Int32
      # gdk_pixbuf_get_height: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_height(self)
      _retval
    end

    def n_channels : Int32
      # gdk_pixbuf_get_n_channels: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_n_channels(self)
      _retval
    end

    def option(key : ::String) : ::String?
      # gdk_pixbuf_get_option: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_option(self, key)
      ::String.new(_retval) unless _retval.null?
    end

    def options : Pointer(Void)
      # gdk_pixbuf_get_options: (Method)
      # Returns: (transfer container)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_options(self)
      _retval
    end

    def pixels(length : UInt32) : Enumerable(UInt8)
      # gdk_pixbuf_get_pixels_with_length: (Method)
      # @length: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_pixels_with_length(self, length)
      _retval
    end

    def rowstride : Int32
      # gdk_pixbuf_get_rowstride: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_rowstride(self)
      _retval
    end

    def width : Int32
      # gdk_pixbuf_get_width: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_get_width(self)
      _retval
    end

    def new_subpixbuf(src_x : Int32, src_y : Int32, width : Int32, height : Int32) : GdkPixbuf::Pixbuf
      # gdk_pixbuf_new_subpixbuf: (Method)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_new_subpixbuf(self, src_x, src_y, width, height)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    def read_pixel_bytes : GLib::Bytes
      # gdk_pixbuf_read_pixel_bytes: (Method)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_read_pixel_bytes(self)
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def read_pixels : Pointer(UInt8)
      # gdk_pixbuf_read_pixels: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_read_pixels(self)
      _retval
    end

    def remove_option(key : ::String) : Bool
      # gdk_pixbuf_remove_option: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_remove_option(self, key)
      GICrystal.to_bool(_retval)
    end

    def rotate_simple(angle : GdkPixbuf::PixbufRotation) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_rotate_simple: (Method)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_rotate_simple(self, angle)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def saturate_and_pixelate(dest : GdkPixbuf::Pixbuf, saturation : Float32, pixelate : Bool) : Nil
      # gdk_pixbuf_saturate_and_pixelate: (Method)
      # Returns: (transfer none)

      LibGdkPixbuf.gdk_pixbuf_saturate_and_pixelate(self, dest, saturation, pixelate)
    end

    def save_to_bufferv(buffer : Enumerable(UInt8), type : ::String, option_keys : Enumerable(::String)?, option_values : Enumerable(::String)?) : Bool
      # gdk_pixbuf_save_to_bufferv: (Method | Throws)
      # @buffer: (out) (transfer full) (array length=buffer_size element-type UInt8)
      # @buffer_size: (out) (transfer full)
      # @option_keys: (nullable) (array zero-terminated=1 element-type Utf8)
      # @option_values: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      buffer_size = buffer.size
      option_keys = if option_keys.nil?
                      Pointer(Pointer(LibC::Char)).null
                    else
                      option_keys.to_a.map(&.to_unsafe).to_unsafe
                    end
      option_values = if option_values.nil?
                        Pointer(Pointer(LibC::Char)).null
                      else
                        option_values.to_a.map(&.to_unsafe).to_unsafe
                      end
      buffer = buffer.to_a.to_unsafe

      _retval = LibGdkPixbuf.gdk_pixbuf_save_to_bufferv(self, buffer, buffer_size, type, option_keys, option_values)
      GICrystal.to_bool(_retval)
    end

    def save_to_callbackv(save_func : Pointer(Void), user_data : Pointer(Nil)?, type : ::String, option_keys : Enumerable(::String)?, option_values : Enumerable(::String)?) : Bool
      # gdk_pixbuf_save_to_callbackv: (Method | Throws)
      # @user_data: (nullable)
      # @option_keys: (nullable) (array zero-terminated=1 element-type Utf8)
      # @option_values: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      option_keys = if option_keys.nil?
                      Pointer(Pointer(LibC::Char)).null
                    else
                      option_keys.to_a.map(&.to_unsafe).to_unsafe
                    end
      option_values = if option_values.nil?
                        Pointer(Pointer(LibC::Char)).null
                      else
                        option_values.to_a.map(&.to_unsafe).to_unsafe
                      end

      _retval = LibGdkPixbuf.gdk_pixbuf_save_to_callbackv(self, save_func, user_data, type, option_keys, option_values)
      GICrystal.to_bool(_retval)
    end

    def save_to_streamv(stream : Gio::OutputStream, type : ::String, option_keys : Enumerable(::String)?, option_values : Enumerable(::String)?, cancellable : Gio::Cancellable?) : Bool
      # gdk_pixbuf_save_to_streamv: (Method | Throws)
      # @option_keys: (nullable) (array zero-terminated=1 element-type Utf8)
      # @option_values: (nullable) (array zero-terminated=1 element-type Utf8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      option_keys = if option_keys.nil?
                      Pointer(Pointer(LibC::Char)).null
                    else
                      option_keys.to_a.map(&.to_unsafe).to_unsafe
                    end
      option_values = if option_values.nil?
                        Pointer(Pointer(LibC::Char)).null
                      else
                        option_values.to_a.map(&.to_unsafe).to_unsafe
                      end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGdkPixbuf.gdk_pixbuf_save_to_streamv(self, stream, type, option_keys, option_values, cancellable)
      GICrystal.to_bool(_retval)
    end

    def save_to_streamv_async(stream : Gio::OutputStream, type : ::String, option_keys : Enumerable(::String)?, option_values : Enumerable(::String)?, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # gdk_pixbuf_save_to_streamv_async: (Method)
      # @option_keys: (nullable) (array zero-terminated=1 element-type Utf8)
      # @option_values: (nullable) (array zero-terminated=1 element-type Utf8)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      option_keys = if option_keys.nil?
                      Pointer(Pointer(LibC::Char)).null
                    else
                      option_keys.to_a.map(&.to_unsafe).to_unsafe
                    end
      option_values = if option_values.nil?
                        Pointer(Pointer(LibC::Char)).null
                      else
                        option_values.to_a.map(&.to_unsafe).to_unsafe
                      end
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGdkPixbuf.gdk_pixbuf_save_to_streamv_async(self, stream, type, option_keys, option_values, cancellable, callback, user_data)
    end

    def savev(filename : ::String, type : ::String, option_keys : Enumerable(::String)?, option_values : Enumerable(::String)?) : Bool
      # gdk_pixbuf_savev: (Method | Throws)
      # @option_keys: (nullable) (array zero-terminated=1 element-type Utf8)
      # @option_values: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      option_keys = if option_keys.nil?
                      Pointer(Pointer(LibC::Char)).null
                    else
                      option_keys.to_a.map(&.to_unsafe).to_unsafe
                    end
      option_values = if option_values.nil?
                        Pointer(Pointer(LibC::Char)).null
                      else
                        option_values.to_a.map(&.to_unsafe).to_unsafe
                      end

      _retval = LibGdkPixbuf.gdk_pixbuf_savev(self, filename, type, option_keys, option_values)
      GICrystal.to_bool(_retval)
    end

    def scale(dest : GdkPixbuf::Pixbuf, dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : GdkPixbuf::InterpType) : Nil
      # gdk_pixbuf_scale: (Method)
      # Returns: (transfer none)

      LibGdkPixbuf.gdk_pixbuf_scale(self, dest, dest_x, dest_y, dest_width, dest_height, offset_x, offset_y, scale_x, scale_y, interp_type)
    end

    def scale_simple(dest_width : Int32, dest_height : Int32, interp_type : GdkPixbuf::InterpType) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_scale_simple: (Method)
      # Returns: (transfer full)

      _retval = LibGdkPixbuf.gdk_pixbuf_scale_simple(self, dest_width, dest_height, interp_type)
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def set_option(key : ::String, value : ::String) : Bool
      # gdk_pixbuf_set_option: (Method)
      # Returns: (transfer none)

      _retval = LibGdkPixbuf.gdk_pixbuf_set_option(self, key, value)
      GICrystal.to_bool(_retval)
    end
  end
end
