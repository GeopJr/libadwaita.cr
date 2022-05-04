require "../g_object-2.0/object"

module GdkPixbuf
  # Incremental image loader.
  #
  # `GdkPixbufLoader` provides a way for applications to drive the
  # process of loading an image, by letting them send the image data
  # directly to the loader instead of having the loader read the data
  # from a file. Applications can use this functionality instead of
  # `gdk_pixbuf_new_from_file()` or `gdk_pixbuf_animation_new_from_file()`
  # when they need to parse image data in small chunks. For example,
  # it should be used when reading an image from a (potentially) slow
  # network connection, or when loading an extremely large file.
  #
  # To use `GdkPixbufLoader` to load an image, create a new instance,
  # and call `GdkPixbuf::PixbufLoader#write` to send the data
  # to it. When done, `GdkPixbuf::PixbufLoader#close` should be
  # called to end the stream and finalize everything.
  #
  # The loader will emit three important signals throughout the process:
  #
  #  - [signal@GdkPixbuf.PixbufLoader::size-prepared] will be emitted as
  #    soon as the image has enough information to determine the size of
  #    the image to be used. If you want to scale the image while loading
  #    it, you can call `GdkPixbuf::PixbufLoader#size=` in
  #    response to this signal.
  #  - [signal@GdkPixbuf.PixbufLoader::area-prepared] will be emitted as
  #    soon as the pixbuf of the desired has been allocated. You can obtain
  #    the `GdkPixbuf` instance by calling `GdkPixbuf::PixbufLoader#pixbuf`.
  #    If you want to use it, simply acquire a reference to it. You can
  #    also call `gdk_pixbuf_loader_get_pixbuf()` later to get the same
  #    pixbuf.
  #  - [signal@GdkPixbuf.PixbufLoader::area-updated] will be emitted every
  #    time a region is updated. This way you can update a partially
  #    completed image. Note that you do not know anything about the
  #    completeness of an image from the updated area. For example, in an
  #    interlaced image you will need to make several passes before the
  #    image is done loading.
  #
  # ## Loading an animation
  #
  # Loading an animation is almost as easy as loading an image. Once the
  # first [signal@GdkPixbuf.PixbufLoader::area-prepared] signal has been
  # emitted, you can call `GdkPixbuf::PixbufLoader#animation` to
  # get the `GdkPixbuf#PixbufAnimation` instance, and then call
  # and `GdkPixbuf::PixbufAnimation#iter` to get a
  # `GdkPixbuf#PixbufAnimationIter` to retrieve the pixbuf for the
  # desired time stamp.
  @[GObject::GeneratedWrapper]
  class PixbufLoader < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGdkPixbuf::PixbufLoaderClass), class_init,
        sizeof(LibGdkPixbuf::PixbufLoader), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdkPixbuf.gdk_pixbuf_loader_get_type
    end

    # Creates a new pixbuf loader object.
    def initialize
      # gdk_pixbuf_loader_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_loader_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new pixbuf loader object that always attempts to parse
    # image data as if it were an image of MIME type @mime_type, instead of
    # identifying the type automatically.
    #
    # This function is useful if you want an error if the image isn't the
    # expected MIME type; for loading image formats that can't be reliably
    # identified by looking at the data; or if the user manually forces a
    # specific MIME type.
    #
    # The list of supported mime types depends on what image loaders
    # are installed, but typically "image/png", "image/jpeg", "image/gif",
    # "image/tiff" and "image/x-xpixmap" are among the supported mime types.
    # To obtain the full list of supported mime types, call
    # gdk_pixbuf_format_get_mime_types() on each of the #GdkPixbufFormat
    # structs returned by gdk_pixbuf_get_formats().
    def self.new_with_mime_type(mime_type : ::String) : self
      # gdk_pixbuf_loader_new_with_mime_type: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_loader_new_with_mime_type(mime_type, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::PixbufLoader.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new pixbuf loader object that always attempts to parse
    # image data as if it were an image of type @image_type, instead of
    # identifying the type automatically.
    #
    # This function is useful if you want an error if the image isn't the
    # expected type; for loading image formats that can't be reliably
    # identified by looking at the data; or if the user manually forces
    # a specific type.
    #
    # The list of supported image formats depends on what image loaders
    # are installed, but typically "png", "jpeg", "gif", "tiff" and
    # "xpm" are among the supported formats. To obtain the full list of
    # supported image formats, call gdk_pixbuf_format_get_name() on each
    # of the #GdkPixbufFormat structs returned by gdk_pixbuf_get_formats().
    def self.new_with_type(image_type : ::String) : self
      # gdk_pixbuf_loader_new_with_type: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_loader_new_with_type(image_type, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::PixbufLoader.new(_retval, GICrystal::Transfer::Full)
    end

    # Informs a pixbuf loader that no further writes with
    # gdk_pixbuf_loader_write() will occur, so that it can free its
    # internal loading structures.
    #
    # This function also tries to parse any data that hasn't yet been parsed;
    # if the remaining data is partial or corrupt, an error will be returned.
    #
    # If `FALSE` is returned, `error` will be set to an error from the
    # `GDK_PIXBUF_ERROR` or `G_FILE_ERROR` domains.
    #
    # If you're just cancelling a load rather than expecting it to be finished,
    # passing `NULL` for `error` to ignore it is reasonable.
    #
    # Remember that this function does not release a reference on the loader, so
    # you will need to explicitly release any reference you hold.
    def close : Bool
      # gdk_pixbuf_loader_close: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_loader_close(self, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Queries the #GdkPixbufAnimation that a pixbuf loader is currently creating.
    #
    # In general it only makes sense to call this function after the
    # [signal@GdkPixbuf.PixbufLoader::area-prepared] signal has been emitted by
    # the loader.
    #
    # If the loader doesn't have enough bytes yet, and hasn't emitted the `area-prepared`
    # signal, this function will return `NULL`.
    def animation : GdkPixbuf::PixbufAnimation?
      # gdk_pixbuf_loader_get_animation: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_loader_get_animation(self)

      # Return value handling

      GdkPixbuf::PixbufAnimation.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Obtains the available information about the format of the
    # currently loading image file.
    def format : GdkPixbuf::PixbufFormat?
      # gdk_pixbuf_loader_get_format: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_loader_get_format(self)

      # Return value handling

      GdkPixbuf::PixbufFormat.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Queries the #GdkPixbuf that a pixbuf loader is currently creating.
    #
    # In general it only makes sense to call this function after the
    # [signal@GdkPixbuf.PixbufLoader::area-prepared] signal has been
    # emitted by the loader; this means that enough data has been read
    # to know the size of the image that will be allocated.
    #
    # If the loader has not received enough data via gdk_pixbuf_loader_write(),
    # then this function returns `NULL`.
    #
    # The returned pixbuf will be the same in all future calls to the loader,
    # so if you want to keep using it, you should acquire a reference to it.
    #
    # Additionally, if the loader is an animation, it will return the "static
    # image" of the animation (see gdk_pixbuf_animation_get_static_image()).
    def pixbuf : GdkPixbuf::Pixbuf?
      # gdk_pixbuf_loader_get_pixbuf: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_loader_get_pixbuf(self)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Causes the image to be scaled while it is loaded.
    #
    # The desired image size can be determined relative to the original
    # size of the image by calling gdk_pixbuf_loader_set_size() from a
    # signal handler for the ::size-prepared signal.
    #
    # Attempts to set the desired image size  are ignored after the
    # emission of the ::size-prepared signal.
    def set_size(width : Int32, height : Int32) : Nil
      # gdk_pixbuf_loader_set_size: (Method)
      # Returns: (transfer none)

      # C call
      LibGdkPixbuf.gdk_pixbuf_loader_set_size(self, width, height)

      # Return value handling
    end

    # Parses the next `count` bytes in the given image buffer.
    def write(buf : Enumerable(UInt8)) : Bool
      # gdk_pixbuf_loader_write: (Method | Throws)
      # @buf: (array length=count element-type UInt8)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      count = buf.size # Generator::ArrayArgPlan
      buf = buf.to_a.to_unsafe

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_loader_write(self, buf, count, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def write(*buf : UInt8)
      write(buf)
    end

    # Parses the next contents of the given image buffer.
    def write_bytes(buffer : GLib::Bytes) : Bool
      # gdk_pixbuf_loader_write_bytes: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_loader_write_bytes(self, buffer, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This signal is emitted when the pixbuf loader has allocated the
    # pixbuf in the desired size.
    #
    # After this signal is emitted, applications can call
    # gdk_pixbuf_loader_get_pixbuf() to fetch the partially-loaded
    # pixbuf.
    struct AreaPreparedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "area-prepared::#{@detail}" : "area-prepared"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(GdkPixbuf::PixbufLoader, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = GdkPixbuf::PixbufLoader.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GdkPixbuf::PixbufLoader, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(GdkPixbuf::PixbufLoader, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = GdkPixbuf::PixbufLoader.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GdkPixbuf::PixbufLoader, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "area-prepared")
      end
    end

    def area_prepared_signal
      AreaPreparedSignal.new(self)
    end

    # This signal is emitted when a significant area of the image being
    # loaded has been updated.
    #
    # Normally it means that a complete scanline has been read in, but
    # it could be a different area as well.
    #
    # Applications can use this signal to know when to repaint
    # areas of an image that is being loaded.
    struct AreaUpdatedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "area-updated::#{@detail}" : "area-updated"
      end

      def connect(&block : Proc(Int32, Int32, Int32, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Int32, Int32, Int32, Nil))
        connect(block)
      end

      def connect(handler : Proc(Int32, Int32, Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Int32, lib_y : Int32, lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          width = lib_width
          height = lib_height
          ::Box(Proc(Int32, Int32, Int32, Int32, Nil)).unbox(_lib_box).call(x, y, width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Int32, Int32, Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Int32, lib_y : Int32, lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          x = lib_x
          y = lib_y
          width = lib_width
          height = lib_height
          ::Box(Proc(Int32, Int32, Int32, Int32, Nil)).unbox(_lib_box).call(x, y, width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Int32, lib_y : Int32, lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          _sender = GdkPixbuf::PixbufLoader.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          width = lib_width
          height = lib_height
          ::Box(Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Int32, Int32, Nil)).unbox(_lib_box).call(_sender, x, y, width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_x : Int32, lib_y : Int32, lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          _sender = GdkPixbuf::PixbufLoader.new(_lib_sender, GICrystal::Transfer::None)
          x = lib_x
          y = lib_y
          width = lib_width
          height = lib_height
          ::Box(Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Int32, Int32, Nil)).unbox(_lib_box).call(_sender, x, y, width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(x : Int32, y : Int32, width : Int32, height : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "area-updated", x, y, width, height)
      end
    end

    def area_updated_signal
      AreaUpdatedSignal.new(self)
    end

    # This signal is emitted when gdk_pixbuf_loader_close() is called.
    #
    # It can be used by different parts of an application to receive
    # notification when an image loader is closed by the code that
    # drives it.
    struct ClosedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "closed::#{@detail}" : "closed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(GdkPixbuf::PixbufLoader, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = GdkPixbuf::PixbufLoader.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GdkPixbuf::PixbufLoader, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(GdkPixbuf::PixbufLoader, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = GdkPixbuf::PixbufLoader.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GdkPixbuf::PixbufLoader, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "closed")
      end
    end

    def closed_signal
      ClosedSignal.new(self)
    end

    # This signal is emitted when the pixbuf loader has been fed the
    # initial amount of data that is required to figure out the size
    # of the image that it will create.
    #
    # Applications can call gdk_pixbuf_loader_set_size() in response
    # to this signal to set the desired size to which the image
    # should be scaled.
    struct SizePreparedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "size-prepared::#{@detail}" : "size-prepared"
      end

      def connect(&block : Proc(Int32, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Int32, Nil))
        connect(block)
      end

      def connect(handler : Proc(Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          width = lib_width
          height = lib_height
          ::Box(Proc(Int32, Int32, Nil)).unbox(_lib_box).call(width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          width = lib_width
          height = lib_height
          ::Box(Proc(Int32, Int32, Nil)).unbox(_lib_box).call(width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          _sender = GdkPixbuf::PixbufLoader.new(_lib_sender, GICrystal::Transfer::None)
          width = lib_width
          height = lib_height
          ::Box(Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Nil)).unbox(_lib_box).call(_sender, width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_width : Int32, lib_height : Int32, _lib_box : Pointer(Void)) {
          _sender = GdkPixbuf::PixbufLoader.new(_lib_sender, GICrystal::Transfer::None)
          width = lib_width
          height = lib_height
          ::Box(Proc(GdkPixbuf::PixbufLoader, Int32, Int32, Nil)).unbox(_lib_box).call(_sender, width, height)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(width : Int32, height : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "size-prepared", width, height)
      end
    end

    def size_prepared_signal
      SizePreparedSignal.new(self)
    end
  end
end
