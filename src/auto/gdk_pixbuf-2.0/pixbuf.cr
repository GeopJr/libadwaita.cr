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
  # buffer with a `GdkPixbuf#Pixbuf` instance. You can use the
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
  # You can also copy an existing pixbuf with the `Pixbuf#copy`
  # function. This is not the same as just acquiring a reference to
  # the old pixbuf instance: the copy function will actually duplicate
  # the pixel data in memory and create a new `#Pixbuf` instance
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
  # `GdkPixbuf::Pixbuf#copy` instead, or compute the width in bytes of the
  # last row as:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  @[GObject::GeneratedWrapper]
  class Pixbuf < GObject::Object
    include Gio::Icon
    include Gio::LoadableIcon

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Pixbuf, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Pixbuf`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, bits_per_sample : Int32? = nil, colorspace : GdkPixbuf::Colorspace? = nil, has_alpha : Bool? = nil, height : Int32? = nil, n_channels : Int32? = nil, pixel_bytes : GLib::Bytes? = nil, pixels : Pointer(Void)? = nil, rowstride : Int32? = nil, width : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if !bits_per_sample.nil?
        (_names.to_unsafe + _n).value = "bits-per-sample".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, bits_per_sample)
        _n += 1
      end
      if !colorspace.nil?
        (_names.to_unsafe + _n).value = "colorspace".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, colorspace)
        _n += 1
      end
      if !has_alpha.nil?
        (_names.to_unsafe + _n).value = "has-alpha".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_alpha)
        _n += 1
      end
      if !height.nil?
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if !n_channels.nil?
        (_names.to_unsafe + _n).value = "n-channels".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_channels)
        _n += 1
      end
      if !pixel_bytes.nil?
        (_names.to_unsafe + _n).value = "pixel-bytes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixel_bytes)
        _n += 1
      end
      if !pixels.nil?
        (_names.to_unsafe + _n).value = "pixels".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels)
        _n += 1
      end
      if !rowstride.nil?
        (_names.to_unsafe + _n).value = "rowstride".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rowstride)
        _n += 1
      end
      if !width.nil?
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Pixbuf.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      GdkPixbuf::Colorspace.new(value)
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

    def pixels=(value : Pointer(Void)) : Pointer(Void)
      unsafe_value = value

      LibGObject.g_object_set(self, "pixels", unsafe_value, Pointer(Void).null)
      value
    end

    def pixels : Pointer(Void)
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pixels", pointerof(value), Pointer(Void).null)
      value
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

    # Creates a new `GdkPixbuf` structure and allocates a buffer for it.
    #
    # If the allocation of the buffer failed, this function will return `NULL`.
    #
    # The buffer has an optimal rowstride. Note that the buffer is not cleared;
    # you will have to fill it completely yourself.
    def self.new(colorspace : GdkPixbuf::Colorspace, has_alpha : Bool, bits_per_sample : Int32, width : Int32, height : Int32) : self?
      # gdk_pixbuf_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new(colorspace, has_alpha, bits_per_sample, width, height)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new #GdkPixbuf out of in-memory readonly image data.
    #
    # Currently only RGB images with 8 bits per sample are supported.
    #
    # This is the `GBytes` variant of gdk_pixbuf_new_from_data(), useful
    # for language bindings.
    def self.new_from_bytes(data : GLib::Bytes, colorspace : GdkPixbuf::Colorspace, has_alpha : Bool, bits_per_sample : Int32, width : Int32, height : Int32, rowstride : Int32) : self
      # gdk_pixbuf_new_from_bytes: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_bytes(data, colorspace, has_alpha, bits_per_sample, width, height, rowstride)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GdkPixbuf out of in-memory image data.
    #
    # Currently only RGB images with 8 bits per sample are supported.
    #
    # Since you are providing a pre-allocated pixel buffer, you must also
    # specify a way to free that data.  This is done with a function of
    # type `GdkPixbufDestroyNotify`.  When a pixbuf created with is
    # finalized, your destroy notification function will be called, and
    # it is its responsibility to free the pixel array.
    #
    # See also: `GdkPixbuf::Pixbuf#new_from_bytes`
    def self.new_from_data(data : Enumerable(UInt8), colorspace : GdkPixbuf::Colorspace, has_alpha : Bool, bits_per_sample : Int32, width : Int32, height : Int32, rowstride : Int32, destroy_fn : GdkPixbuf::PixbufDestroyNotify?, destroy_fn_data : Pointer(Void)?) : self
      # gdk_pixbuf_new_from_data: (Constructor)
      # @data: (array element-type UInt8)
      # @destroy_fn: (nullable)
      # @destroy_fn_data: (nullable)
      # Returns: (transfer full)

      # Generator::ArrayArgPlan
      data = data.to_a.to_unsafe
      # Generator::NullableArrayPlan
      destroy_fn_data = if destroy_fn_data.nil?
                          Pointer(Void).null
                        else
                          destroy_fn_data.to_unsafe
                        end

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_data(data, colorspace, has_alpha, bits_per_sample, width, height, rowstride, destroy_fn, destroy_fn_data)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new pixbuf by loading an image from a file.
    #
    # The file format is detected automatically.
    #
    # If `NULL` is returned, then @error will be set. Possible errors are:
    #
    #  - the file could not be opened
    #  - there is no loader for the file's format
    #  - there is not enough memory to allocate the image buffer
    #  - the image buffer contains invalid data
    #
    # The error domains are `GDK_PIXBUF_ERROR` and `G_FILE_ERROR`.
    def self.new_from_file(filename : ::String) : self?
      # gdk_pixbuf_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_file(filename, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new pixbuf by loading an image from a file.
    #
    # The file format is detected automatically.
    #
    # If `NULL` is returned, then @error will be set. Possible errors are:
    #
    #  - the file could not be opened
    #  - there is no loader for the file's format
    #  - there is not enough memory to allocate the image buffer
    #  - the image buffer contains invalid data
    #
    # The error domains are `GDK_PIXBUF_ERROR` and `G_FILE_ERROR`.
    #
    # The image will be scaled to fit in the requested size, optionally preserving
    # the image's aspect ratio.
    #
    # When preserving the aspect ratio, a `width` of -1 will cause the image
    # to be scaled to the exact given height, and a `height` of -1 will cause
    # the image to be scaled to the exact given width. When not preserving
    # aspect ratio, a `width` or `height` of -1 means to not scale the image
    # at all in that dimension. Negative values for `width` and `height` are
    # allowed since 2.8.
    def self.new_from_file_at_scale(filename : ::String, width : Int32, height : Int32, preserve_aspect_ratio : Bool) : self?
      # gdk_pixbuf_new_from_file_at_scale: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_file_at_scale(filename, width, height, preserve_aspect_ratio, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new pixbuf by loading an image from a file.
    #
    # The file format is detected automatically.
    #
    # If `NULL` is returned, then @error will be set. Possible errors are:
    #
    #  - the file could not be opened
    #  - there is no loader for the file's format
    #  - there is not enough memory to allocate the image buffer
    #  - the image buffer contains invalid data
    #
    # The error domains are `GDK_PIXBUF_ERROR` and `G_FILE_ERROR`.
    #
    # The image will be scaled to fit in the requested size, preserving
    # the image's aspect ratio. Note that the returned pixbuf may be smaller
    # than `width` x `height`, if the aspect ratio requires it. To load
    # and image at the requested size, regardless of aspect ratio, use
    # `GdkPixbuf::Pixbuf#new_from_file_at_scale`.
    def self.new_from_file_at_size(filename : ::String, width : Int32, height : Int32) : self?
      # gdk_pixbuf_new_from_file_at_size: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_file_at_size(filename, width, height, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a `GdkPixbuf` from a flat representation that is suitable for
    # storing as inline data in a program.
    #
    # This is useful if you want to ship a program with images, but don't want
    # to depend on any external files.
    #
    # GdkPixbuf ships with a program called `gdk-pixbuf-csource`, which allows
    # for conversion of `GdkPixbuf`s into such a inline representation.
    #
    # In almost all cases, you should pass the `--raw` option to
    # `gdk-pixbuf-csource`. A sample invocation would be:
    #
    # ```
    # gdk-pixbuf-csource --raw --name=myimage_inline myimage.png
    # ```
    #
    # For the typical case where the inline pixbuf is read-only static data,
    # you don't need to copy the pixel data unless you intend to write to
    # it, so you can pass `FALSE` for `copy_pixels`. If you pass `--rle` to
    # `gdk-pixbuf-csource`, a copy will be made even if `copy_pixels` is `FALSE`,
    # so using this option is generally a bad idea.
    #
    # If you create a pixbuf from const inline data compiled into your
    # program, it's probably safe to ignore errors and disable length checks,
    # since things will always succeed:
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # pixbuf = gdk_pixbuf_new_from_inline (-1, myimage_inline, FALSE, NULL);
    # ```
    #
    # For non-const inline data, you could get out of memory. For untrusted
    # inline data located at runtime, you could have corrupt inline data in
    # addition.
    def self.new_from_inline(data : Enumerable(UInt8), copy_pixels : Bool) : self
      # gdk_pixbuf_new_from_inline: (Constructor | Throws)
      # @data: (array length=data_length element-type UInt8)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      data_length = data.size # Generator::ArrayArgPlan
      data = data.to_a.to_unsafe

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_inline(data_length, data, copy_pixels, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new pixbuf by loading an image from an resource.
    #
    # The file format is detected automatically. If `NULL` is returned, then
    # @error will be set.
    def self.new_from_resource(resource_path : ::String) : self?
      # gdk_pixbuf_new_from_resource: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_resource(resource_path, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new pixbuf by loading an image from an resource.
    #
    # The file format is detected automatically. If `NULL` is returned, then
    # @error will be set.
    #
    # The image will be scaled to fit in the requested size, optionally
    # preserving the image's aspect ratio. When preserving the aspect ratio,
    # a @width of -1 will cause the image to be scaled to the exact given
    # height, and a @height of -1 will cause the image to be scaled to the
    # exact given width. When not preserving aspect ratio, a @width or
    # @height of -1 means to not scale the image at all in that dimension.
    #
    # The stream is not closed.
    def self.new_from_resource_at_scale(resource_path : ::String, width : Int32, height : Int32, preserve_aspect_ratio : Bool) : self?
      # gdk_pixbuf_new_from_resource_at_scale: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_resource_at_scale(resource_path, width, height, preserve_aspect_ratio, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new pixbuf by loading an image from an input stream.
    #
    # The file format is detected automatically.
    #
    # If `NULL` is returned, then `error` will be set.
    #
    # The `cancellable` can be used to abort the operation from another thread.
    # If the operation was cancelled, the error `G_IO_ERROR_CANCELLED` will be
    # returned. Other possible errors are in the `GDK_PIXBUF_ERROR` and
    # `G_IO_ERROR` domains.
    #
    # The stream is not closed.
    def self.new_from_stream(stream : Gio::InputStream, cancellable : Gio::Cancellable?) : self?
      # gdk_pixbuf_new_from_stream: (Constructor | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_stream(stream, cancellable, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new pixbuf by loading an image from an input stream.
    #
    # The file format is detected automatically. If `NULL` is returned, then
    # @error will be set. The @cancellable can be used to abort the operation
    # from another thread. If the operation was cancelled, the error
    # `G_IO_ERROR_CANCELLED` will be returned. Other possible errors are in
    # the `GDK_PIXBUF_ERROR` and `G_IO_ERROR` domains.
    #
    # The image will be scaled to fit in the requested size, optionally
    # preserving the image's aspect ratio.
    #
    # When preserving the aspect ratio, a `width` of -1 will cause the image to be
    # scaled to the exact given height, and a `height` of -1 will cause the image
    # to be scaled to the exact given width. If both `width` and `height` are
    # given, this function will behave as if the smaller of the two values
    # is passed as -1.
    #
    # When not preserving aspect ratio, a `width` or `height` of -1 means to not
    # scale the image at all in that dimension.
    #
    # The stream is not closed.
    def self.new_from_stream_at_scale(stream : Gio::InputStream, width : Int32, height : Int32, preserve_aspect_ratio : Bool, cancellable : Gio::Cancellable?) : self?
      # gdk_pixbuf_new_from_stream_at_scale: (Constructor | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_stream_at_scale(stream, width, height, preserve_aspect_ratio, cancellable, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Finishes an asynchronous pixbuf creation operation started with
    # gdk_pixbuf_new_from_stream_async().
    def self.new_from_stream_finish(async_result : Gio::AsyncResult) : self?
      # gdk_pixbuf_new_from_stream_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_stream_finish(async_result, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new pixbuf by parsing XPM data in memory.
    #
    # This data is commonly the result of including an XPM file into a
    # program's C source.
    def self.new_from_xpm_data(data : Enumerable(::String)) : self
      # gdk_pixbuf_new_from_xpm_data: (Constructor)
      # @data: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer full)

      # Generator::ArrayArgPlan
      data = data.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_from_xpm_data(data)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_xpm_data(*data : ::String)
      self.new_from_xpm_data(data)
    end

    # Calculates the rowstride that an image created with those values would
    # have.
    #
    # This function is useful for front-ends and backends that want to check
    # image values without needing to create a `GdkPixbuf`.
    def self.calculate_rowstride(colorspace : GdkPixbuf::Colorspace, has_alpha : Bool, bits_per_sample : Int32, width : Int32, height : Int32) : Int32
      # gdk_pixbuf_calculate_rowstride: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_calculate_rowstride(colorspace, has_alpha, bits_per_sample, width, height)

      # Return value handling

      _retval
    end

    # Parses an image file far enough to determine its format and size.
    def self.file_info(filename : ::String) : GdkPixbuf::PixbufFormat?
      # gdk_pixbuf_get_file_info: (None)
      # @width: (out) (transfer full) (optional)
      # @height: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      width = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      height = Pointer(Int32).null
      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_file_info(filename, width, height)

      # Return value handling

      GdkPixbuf::PixbufFormat.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Asynchronously parses an image file far enough to determine its
    # format and size.
    #
    # For more details see gdk_pixbuf_get_file_info(), which is the synchronous
    # version of this function.
    #
    # When the operation is finished, @callback will be called in the
    # main thread. You can then call gdk_pixbuf_get_file_info_finish() to
    # get the result of the operation.
    def self.file_info_async(filename : ::String, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_pixbuf_get_file_info_async: (None)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGdkPixbuf.gdk_pixbuf_get_file_info_async(filename, cancellable, callback, user_data)

      # Return value handling
    end

    def file_info_finish(async_result : Gio::AsyncResult, width : Int32, height : Int32) : GdkPixbuf::PixbufFormat?
      # gdk_pixbuf_get_file_info_finish: (Throws)
      # @width: (out) (transfer full)
      # @height: (out) (transfer full)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_file_info_finish(async_result, width, height, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::PixbufFormat.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Obtains the available information about the image formats supported
    # by GdkPixbuf.
    def self.formats : GLib::SList
      # gdk_pixbuf_get_formats: (None)
      # Returns: (transfer container)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_formats

      # Return value handling

      GLib::SList(GdkPixbuf::PixbufFormat).new(_retval, GICrystal::Transfer::Container)
    end

    def init_modules(path : ::String) : Bool
      # gdk_pixbuf_init_modules: (Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_init_modules(path, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates a new pixbuf by asynchronously loading an image from an input stream.
    #
    # For more details see gdk_pixbuf_new_from_stream(), which is the synchronous
    # version of this function.
    #
    # When the operation is finished, @callback will be called in the main thread.
    # You can then call gdk_pixbuf_new_from_stream_finish() to get the result of
    # the operation.
    def self.new_from_stream_async(stream : Gio::InputStream, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_pixbuf_new_from_stream_async: (None)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGdkPixbuf.gdk_pixbuf_new_from_stream_async(stream, cancellable, callback, user_data)

      # Return value handling
    end

    # Creates a new pixbuf by asynchronously loading an image from an input stream.
    #
    # For more details see gdk_pixbuf_new_from_stream_at_scale(), which is the synchronous
    # version of this function.
    #
    # When the operation is finished, @callback will be called in the main thread.
    # You can then call gdk_pixbuf_new_from_stream_finish() to get the result of the operation.
    def self.new_from_stream_at_scale_async(stream : Gio::InputStream, width : Int32, height : Int32, preserve_aspect_ratio : Bool, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_pixbuf_new_from_stream_at_scale_async: (None)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGdkPixbuf.gdk_pixbuf_new_from_stream_at_scale_async(stream, width, height, preserve_aspect_ratio, cancellable, callback, user_data)

      # Return value handling
    end

    def save_to_stream_finish(async_result : Gio::AsyncResult) : Bool
      # gdk_pixbuf_save_to_stream_finish: (Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_save_to_stream_finish(async_result, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Takes an existing pixbuf and adds an alpha channel to it.
    #
    # If the existing pixbuf already had an alpha channel, the channel
    # values are copied from the original; otherwise, the alpha channel
    # is initialized to 255 (full opacity).
    #
    # If `substitute_color` is `TRUE`, then the color specified by the
    # (`r`, `g`, `b`) arguments will be assigned zero opacity. That is,
    # if you pass `(255, 255, 255)` for the substitute color, all white
    # pixels will become fully transparent.
    #
    # If `substitute_color` is `FALSE`, then the (`r`, `g`, `b`) arguments
    # will be ignored.
    def add_alpha(substitute_color : Bool, r : UInt8, g : UInt8, b : UInt8) : GdkPixbuf::Pixbuf
      # gdk_pixbuf_add_alpha: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_add_alpha(@pointer, substitute_color, r, g, b)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    # Takes an existing pixbuf and checks for the presence of an
    # associated "orientation" option.
    #
    # The orientation option may be provided by the JPEG loader (which
    # reads the exif orientation tag) or the TIFF loader (which reads
    # the TIFF orientation tag, and compensates it for the partial
    # transforms performed by libtiff).
    #
    # If an orientation option/tag is present, the appropriate transform
    # will be performed so that the pixbuf is oriented correctly.
    def apply_embedded_orientation : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_apply_embedded_orientation: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_apply_embedded_orientation(@pointer)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a transformation of the source image @src by scaling by
    # @scale_x and @scale_y then translating by @offset_x and @offset_y.
    #
    # This gives an image in the coordinates of the destination pixbuf.
    # The rectangle (@dest_x, @dest_y, @dest_width, @dest_height)
    # is then alpha blended onto the corresponding rectangle of the
    # original destination image.
    #
    # When the destination rectangle contains parts not in the source
    # image, the data at the edges of the source image is replicated
    # to infinity.
    #
    # ![](composite.png)
    def composite(dest : GdkPixbuf::Pixbuf, dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : GdkPixbuf::InterpType, overall_alpha : Int32) : Nil
      # gdk_pixbuf_composite: (Method)
      # Returns: (transfer none)

      # C call
      LibGdkPixbuf.gdk_pixbuf_composite(@pointer, dest, dest_x, dest_y, dest_width, dest_height, offset_x, offset_y, scale_x, scale_y, interp_type, overall_alpha)

      # Return value handling
    end

    # Creates a transformation of the source image @src by scaling by
    # @scale_x and @scale_y then translating by @offset_x and @offset_y,
    # then alpha blends the rectangle (@dest_x ,@dest_y, @dest_width,
    # @dest_height) of the resulting image with a checkboard of the
    # colors @color1 and @color2 and renders it onto the destination
    # image.
    #
    # If the source image has no alpha channel, and @overall_alpha is 255, a fast
    # path is used which omits the alpha blending and just performs the scaling.
    #
    # See gdk_pixbuf_composite_color_simple() for a simpler variant of this
    # function suitable for many tasks.
    def composite_color(dest : GdkPixbuf::Pixbuf, dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : GdkPixbuf::InterpType, overall_alpha : Int32, check_x : Int32, check_y : Int32, check_size : Int32, color1 : UInt32, color2 : UInt32) : Nil
      # gdk_pixbuf_composite_color: (Method)
      # Returns: (transfer none)

      # C call
      LibGdkPixbuf.gdk_pixbuf_composite_color(@pointer, dest, dest_x, dest_y, dest_width, dest_height, offset_x, offset_y, scale_x, scale_y, interp_type, overall_alpha, check_x, check_y, check_size, color1, color2)

      # Return value handling
    end

    # Creates a new pixbuf by scaling `src` to `dest_width` x `dest_height`
    # and alpha blending the result with a checkboard of colors `color1`
    # and `color2`.
    def composite_color_simple(dest_width : Int32, dest_height : Int32, interp_type : GdkPixbuf::InterpType, overall_alpha : Int32, check_size : Int32, color1 : UInt32, color2 : UInt32) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_composite_color_simple: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_composite_color_simple(@pointer, dest_width, dest_height, interp_type, overall_alpha, check_size, color1, color2)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new `GdkPixbuf` with a copy of the information in the specified
    # `pixbuf`.
    #
    # Note that this does not copy the options set on the original `GdkPixbuf`,
    # use gdk_pixbuf_copy_options() for this.
    def copy : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_copy(@pointer)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Copies a rectangular area from `src_pixbuf` to `dest_pixbuf`.
    #
    # Conversion of pixbuf formats is done automatically.
    #
    # If the source rectangle overlaps the destination rectangle on the
    # same pixbuf, it will be overwritten during the copy operation.
    # Therefore, you can not use this function to scroll a pixbuf.
    def copy_area(src_x : Int32, src_y : Int32, width : Int32, height : Int32, dest_pixbuf : GdkPixbuf::Pixbuf, dest_x : Int32, dest_y : Int32) : Nil
      # gdk_pixbuf_copy_area: (Method)
      # Returns: (transfer none)

      # C call
      LibGdkPixbuf.gdk_pixbuf_copy_area(@pointer, src_x, src_y, width, height, dest_pixbuf, dest_x, dest_y)

      # Return value handling
    end

    # Copies the key/value pair options attached to a `GdkPixbuf` to another
    # `GdkPixbuf`.
    #
    # This is useful to keep original metadata after having manipulated
    # a file. However be careful to remove metadata which you've already
    # applied, such as the "orientation" option after rotating the image.
    def copy_options(dest_pixbuf : GdkPixbuf::Pixbuf) : Bool
      # gdk_pixbuf_copy_options: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_copy_options(@pointer, dest_pixbuf)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Clears a pixbuf to the given RGBA value, converting the RGBA value into
    # the pixbuf's pixel format.
    #
    # The alpha component will be ignored if the pixbuf doesn't have an alpha
    # channel.
    def fill(pixel : UInt32) : Nil
      # gdk_pixbuf_fill: (Method)
      # Returns: (transfer none)

      # C call
      LibGdkPixbuf.gdk_pixbuf_fill(@pointer, pixel)

      # Return value handling
    end

    # Flips a pixbuf horizontally or vertically and returns the
    # result in a new pixbuf.
    def flip(horizontal : Bool) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_flip: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_flip(@pointer, horizontal)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Queries the number of bits per color sample in a pixbuf.
    def bits_per_sample : Int32
      # gdk_pixbuf_get_bits_per_sample: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_bits_per_sample(@pointer)

      # Return value handling

      _retval
    end

    # Returns the length of the pixel data, in bytes.
    def byte_length : UInt64
      # gdk_pixbuf_get_byte_length: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_byte_length(@pointer)

      # Return value handling

      _retval
    end

    # Queries the color space of a pixbuf.
    def colorspace : GdkPixbuf::Colorspace
      # gdk_pixbuf_get_colorspace: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_colorspace(@pointer)

      # Return value handling

      GdkPixbuf::Colorspace.new(_retval)
    end

    # Queries whether a pixbuf has an alpha channel (opacity information).
    def has_alpha : Bool
      # gdk_pixbuf_get_has_alpha: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_has_alpha(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Queries the height of a pixbuf.
    def height : Int32
      # gdk_pixbuf_get_height: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_height(@pointer)

      # Return value handling

      _retval
    end

    # Queries the number of channels of a pixbuf.
    def n_channels : Int32
      # gdk_pixbuf_get_n_channels: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_n_channels(@pointer)

      # Return value handling

      _retval
    end

    # Looks up @key in the list of options that may have been attached to the
    # @pixbuf when it was loaded, or that may have been attached by another
    # function using gdk_pixbuf_set_option().
    #
    # For instance, the ANI loader provides "Title" and "Artist" options.
    # The ICO, XBM, and XPM loaders provide "x_hot" and "y_hot" hot-spot
    # options for cursor definitions. The PNG loader provides the tEXt ancillary
    # chunk key/value pairs as options. Since 2.12, the TIFF and JPEG loaders
    # return an "orientation" option string that corresponds to the embedded
    # TIFF/Exif orientation tag (if present). Since 2.32, the TIFF loader sets
    # the "multipage" option string to "yes" when a multi-page TIFF is loaded.
    # Since 2.32 the JPEG and PNG loaders set "x-dpi" and "y-dpi" if the file
    # contains image density information in dots per inch.
    # Since 2.36.6, the JPEG loader sets the "comment" option with the comment
    # EXIF tag.
    def option(key : ::String) : ::String?
      # gdk_pixbuf_get_option: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_option(@pointer, key)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns a `GHashTable` with a list of all the options that may have been
    # attached to the `pixbuf` when it was loaded, or that may have been
    # attached by another function using `GdkPixbuf::Pixbuf#option=`.
    def options : Pointer(Void)
      # gdk_pixbuf_get_options: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_options(@pointer)

      # Return value handling

      _retval
    end

    # Queries a pointer to the pixel data of a pixbuf.
    #
    # This function will cause an implicit copy of the pixbuf data if the
    # pixbuf was created from read-only data.
    #
    # Please see the section on [image data](class.Pixbuf.html#image-data) for information
    # about how the pixel data is stored in memory.
    def pixels : Enumerable(UInt8)
      # gdk_pixbuf_get_pixels_with_length: (Method)
      # @length: (out) (transfer full)
      # Returns: (transfer none) (array length=length element-type UInt8)

      # Generator::OutArgUsedInReturnPlan
      length = 0_u32
      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_pixels_with_length(@pointer, pointerof(length))

      # Return value handling

      GICrystal.transfer_array(_retval, length, GICrystal::Transfer::None)
    end

    # Queries the rowstride of a pixbuf, which is the number of bytes between
    # the start of a row and the start of the next row.
    def rowstride : Int32
      # gdk_pixbuf_get_rowstride: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_rowstride(@pointer)

      # Return value handling

      _retval
    end

    # Queries the width of a pixbuf.
    def width : Int32
      # gdk_pixbuf_get_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_get_width(@pointer)

      # Return value handling

      _retval
    end

    # Creates a new pixbuf which represents a sub-region of `src_pixbuf`.
    #
    # The new pixbuf shares its pixels with the original pixbuf, so
    # writing to one affects both.  The new pixbuf holds a reference to
    # `src_pixbuf`, so `src_pixbuf` will not be finalized until the new
    # pixbuf is finalized.
    #
    # Note that if `src_pixbuf` is read-only, this function will force it
    # to be mutable.
    def new_subpixbuf(src_x : Int32, src_y : Int32, width : Int32, height : Int32) : GdkPixbuf::Pixbuf
      # gdk_pixbuf_new_subpixbuf: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_new_subpixbuf(@pointer, src_x, src_y, width, height)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full)
    end

    # Provides a #GBytes buffer containing the raw pixel data; the data
    # must not be modified.
    #
    # This function allows skipping the implicit copy that must be made
    # if gdk_pixbuf_get_pixels() is called on a read-only pixbuf.
    def read_pixel_bytes : GLib::Bytes
      # gdk_pixbuf_read_pixel_bytes: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_read_pixel_bytes(@pointer)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    # Provides a read-only pointer to the raw pixel data.
    #
    # This function allows skipping the implicit copy that must be made
    # if gdk_pixbuf_get_pixels() is called on a read-only pixbuf.
    def read_pixels : Pointer(UInt8)
      # gdk_pixbuf_read_pixels: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_read_pixels(@pointer)

      # Return value handling

      _retval
    end

    # Removes the key/value pair option attached to a `GdkPixbuf`.
    def remove_option(key : ::String) : Bool
      # gdk_pixbuf_remove_option: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_remove_option(@pointer, key)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Rotates a pixbuf by a multiple of 90 degrees, and returns the
    # result in a new pixbuf.
    #
    # If `angle` is 0, this function will return a copy of `src`.
    def rotate_simple(angle : GdkPixbuf::PixbufRotation) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_rotate_simple: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_rotate_simple(@pointer, angle)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Modifies saturation and optionally pixelates `src`, placing the result in
    # `dest`.
    #
    # The `src` and `dest` pixbufs must have the same image format, size, and
    # rowstride.
    #
    # The `src` and `dest` arguments may be the same pixbuf with no ill effects.
    #
    # If `saturation` is 1.0 then saturation is not changed. If it's less than 1.0,
    # saturation is reduced (the image turns toward grayscale); if greater than
    # 1.0, saturation is increased (the image gets more vivid colors).
    #
    # If `pixelate` is `TRUE`, then pixels are faded in a checkerboard pattern to
    # create a pixelated image.
    def saturate_and_pixelate(dest : GdkPixbuf::Pixbuf, saturation : Float32, pixelate : Bool) : Nil
      # gdk_pixbuf_saturate_and_pixelate: (Method)
      # Returns: (transfer none)

      # C call
      LibGdkPixbuf.gdk_pixbuf_saturate_and_pixelate(@pointer, dest, saturation, pixelate)

      # Return value handling
    end

    # Vector version of `gdk_pixbuf_save_to_buffer()`.
    #
    # Saves pixbuf to a new buffer in format @type, which is currently "jpeg",
    # "tiff", "png", "ico" or "bmp".
    #
    # See `GdkPixbuf::Pixbuf#save_to_buffer` for more details.
    def save_to_bufferv(buffer : Enumerable(UInt8), type : ::String, option_keys : Enumerable(::String)?, option_values : Enumerable(::String)?) : Bool
      # gdk_pixbuf_save_to_bufferv: (Method | Throws)
      # @buffer: (out) (transfer full) (array length=buffer_size element-type UInt8)
      # @buffer_size: (out) (transfer full)
      # @option_keys: (nullable) (array zero-terminated=1 element-type Utf8)
      # @option_values: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      buffer_size = buffer.size # Generator::ArrayArgPlan
      buffer = buffer.to_a.to_unsafe
      # Generator::NullableArrayPlan
      option_keys = if option_keys.nil?
                      Pointer(Pointer(LibC::Char)).null
                    else
                      option_keys.to_a.map(&.to_unsafe).to_unsafe
                    end
      # Generator::NullableArrayPlan
      option_values = if option_values.nil?
                        Pointer(Pointer(LibC::Char)).null
                      else
                        option_values.to_a.map(&.to_unsafe).to_unsafe
                      end

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_save_to_bufferv(@pointer, buffer, buffer_size, type, option_keys, option_values, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Vector version of `gdk_pixbuf_save_to_callback()`.
    #
    # Saves pixbuf to a callback in format @type, which is currently "jpeg",
    # "png", "tiff", "ico" or "bmp".
    #
    # If @error is set, `FALSE` will be returned.
    #
    # See `GdkPixbuf::Pixbuf#save_to_callback` for more details.
    def save_to_callbackv(save_func : GdkPixbuf::PixbufSaveFunc, user_data : Pointer(Void)?, type : ::String, option_keys : Enumerable(::String)?, option_values : Enumerable(::String)?) : Bool
      # gdk_pixbuf_save_to_callbackv: (Method | Throws)
      # @user_data: (nullable)
      # @option_keys: (nullable) (array zero-terminated=1 element-type Utf8)
      # @option_values: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      # Generator::NullableArrayPlan
      option_keys = if option_keys.nil?
                      Pointer(Pointer(LibC::Char)).null
                    else
                      option_keys.to_a.map(&.to_unsafe).to_unsafe
                    end
      # Generator::NullableArrayPlan
      option_values = if option_values.nil?
                        Pointer(Pointer(LibC::Char)).null
                      else
                        option_values.to_a.map(&.to_unsafe).to_unsafe
                      end

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_save_to_callbackv(@pointer, save_func, user_data, type, option_keys, option_values, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Saves `pixbuf` to an output stream.
    #
    # Supported file formats are currently "jpeg", "tiff", "png", "ico" or
    # "bmp".
    #
    # See `GdkPixbuf::Pixbuf#save_to_stream` for more details.
    def save_to_streamv(stream : Gio::OutputStream, type : ::String, option_keys : Enumerable(::String)?, option_values : Enumerable(::String)?, cancellable : Gio::Cancellable?) : Bool
      # gdk_pixbuf_save_to_streamv: (Method | Throws)
      # @option_keys: (nullable) (array zero-terminated=1 element-type Utf8)
      # @option_values: (nullable) (array zero-terminated=1 element-type Utf8)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      option_keys = if option_keys.nil?
                      Pointer(Pointer(LibC::Char)).null
                    else
                      option_keys.to_a.map(&.to_unsafe).to_unsafe
                    end
      # Generator::NullableArrayPlan
      option_values = if option_values.nil?
                        Pointer(Pointer(LibC::Char)).null
                      else
                        option_values.to_a.map(&.to_unsafe).to_unsafe
                      end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_save_to_streamv(@pointer, stream, type, option_keys, option_values, cancellable, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Saves `pixbuf` to an output stream asynchronously.
    #
    # For more details see gdk_pixbuf_save_to_streamv(), which is the synchronous
    # version of this function.
    #
    # When the operation is finished, `callback` will be called in the main thread.
    #
    # You can then call gdk_pixbuf_save_to_stream_finish() to get the result of
    # the operation.
    def save_to_streamv_async(stream : Gio::OutputStream, type : ::String, option_keys : Enumerable(::String)?, option_values : Enumerable(::String)?, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_pixbuf_save_to_streamv_async: (Method)
      # @option_keys: (nullable) (array zero-terminated=1 element-type Utf8)
      # @option_values: (nullable) (array zero-terminated=1 element-type Utf8)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      option_keys = if option_keys.nil?
                      Pointer(Pointer(LibC::Char)).null
                    else
                      option_keys.to_a.map(&.to_unsafe).to_unsafe
                    end
      # Generator::NullableArrayPlan
      option_values = if option_values.nil?
                        Pointer(Pointer(LibC::Char)).null
                      else
                        option_values.to_a.map(&.to_unsafe).to_unsafe
                      end
      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGdkPixbuf.gdk_pixbuf_save_to_streamv_async(@pointer, stream, type, option_keys, option_values, cancellable, callback, user_data)

      # Return value handling
    end

    # Vector version of `gdk_pixbuf_save()`.
    #
    # Saves pixbuf to a file in `type`, which is currently "jpeg", "png", "tiff", "ico" or "bmp".
    #
    # If @error is set, `FALSE` will be returned.
    #
    # See `GdkPixbuf::Pixbuf#save` for more details.
    def savev(filename : ::String, type : ::String, option_keys : Enumerable(::String)?, option_values : Enumerable(::String)?) : Bool
      # gdk_pixbuf_savev: (Method | Throws)
      # @option_keys: (nullable) (array zero-terminated=1 element-type Utf8)
      # @option_values: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      option_keys = if option_keys.nil?
                      Pointer(Pointer(LibC::Char)).null
                    else
                      option_keys.to_a.map(&.to_unsafe).to_unsafe
                    end
      # Generator::NullableArrayPlan
      option_values = if option_values.nil?
                        Pointer(Pointer(LibC::Char)).null
                      else
                        option_values.to_a.map(&.to_unsafe).to_unsafe
                      end

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_savev(@pointer, filename, type, option_keys, option_values, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates a transformation of the source image @src by scaling by
    # @scale_x and @scale_y then translating by @offset_x and @offset_y,
    # then renders the rectangle (@dest_x, @dest_y, @dest_width,
    # @dest_height) of the resulting image onto the destination image
    # replacing the previous contents.
    #
    # Try to use gdk_pixbuf_scale_simple() first; this function is
    # the industrial-strength power tool you can fall back to, if
    # gdk_pixbuf_scale_simple() isn't powerful enough.
    #
    # If the source rectangle overlaps the destination rectangle on the
    # same pixbuf, it will be overwritten during the scaling which
    # results in rendering artifacts.
    def scale(dest : GdkPixbuf::Pixbuf, dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : GdkPixbuf::InterpType) : Nil
      # gdk_pixbuf_scale: (Method)
      # Returns: (transfer none)

      # C call
      LibGdkPixbuf.gdk_pixbuf_scale(@pointer, dest, dest_x, dest_y, dest_width, dest_height, offset_x, offset_y, scale_x, scale_y, interp_type)

      # Return value handling
    end

    # Create a new pixbuf containing a copy of `src` scaled to
    # `dest_width` x `dest_height`.
    #
    # This function leaves `src` unaffected.
    #
    # The `interp_type` should be `GDK_INTERP_NEAREST` if you want maximum
    # speed (but when scaling down `GDK_INTERP_NEAREST` is usually unusably
    # ugly). The default `interp_type` should be `GDK_INTERP_BILINEAR` which
    # offers reasonable quality and speed.
    #
    # You can scale a sub-portion of `src` by creating a sub-pixbuf
    # pointing into `src`; see `GdkPixbuf::Pixbuf#new_subpixbuf`.
    #
    # If `dest_width` and `dest_height` are equal to the width and height of
    # `src`, this function will return an unscaled copy of `src`.
    #
    # For more complicated scaling/alpha blending see `GdkPixbuf::Pixbuf#scale`
    # and `GdkPixbuf::Pixbuf#composite`.
    def scale_simple(dest_width : Int32, dest_height : Int32, interp_type : GdkPixbuf::InterpType) : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_scale_simple: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_scale_simple(@pointer, dest_width, dest_height, interp_type)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Attaches a key/value pair as an option to a `GdkPixbuf`.
    #
    # If `key` already exists in the list of options attached to the `pixbuf`,
    # the new value is ignored and `FALSE` is returned.
    def set_option(key : ::String, value : ::String) : Bool
      # gdk_pixbuf_set_option: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_set_option(@pointer, key, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
