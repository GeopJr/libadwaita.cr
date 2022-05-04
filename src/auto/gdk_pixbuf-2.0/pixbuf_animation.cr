require "../g_object-2.0/object"

module GdkPixbuf
  # An opaque object representing an animation.
  #
  # The GdkPixBuf library provides a simple mechanism to load and
  # represent animations. An animation is conceptually a series of
  # frames to be displayed over time.
  #
  # The animation may not be represented as a series of frames
  # internally; for example, it may be stored as a sprite and
  # instructions for moving the sprite around a background.
  #
  # To display an animation you don't need to understand its
  # representation, however; you just ask `GdkPixbuf` what should
  # be displayed at a given point in time.
  @[GObject::GeneratedWrapper]
  class PixbufAnimation < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGdkPixbuf::PixbufAnimationClass), class_init,
        sizeof(LibGdkPixbuf::PixbufAnimation), instance_init, 0)
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
      LibGdkPixbuf.gdk_pixbuf_animation_get_type
    end

    # Creates a new animation by loading it from a file.
    #
    # The file format is detected automatically.
    #
    # If the file's format does not support multi-frame images, then an animation
    # with a single frame will be created.
    #
    # Possible errors are in the `GDK_PIXBUF_ERROR` and `G_FILE_ERROR` domains.
    def self.new_from_file(filename : ::String) : self?
      # gdk_pixbuf_animation_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_new_from_file(filename, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::PixbufAnimation.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new pixbuf animation by loading an image from an resource.
    #
    # The file format is detected automatically. If `NULL` is returned, then
    # @error will be set.
    def self.new_from_resource(resource_path : ::String) : self?
      # gdk_pixbuf_animation_new_from_resource: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_new_from_resource(resource_path, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::PixbufAnimation.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new animation by loading it from an input stream.
    #
    # The file format is detected automatically.
    #
    # If `NULL` is returned, then @error will be set.
    #
    # The @cancellable can be used to abort the operation from another thread.
    # If the operation was cancelled, the error `G_IO_ERROR_CANCELLED` will be
    # returned. Other possible errors are in the `GDK_PIXBUF_ERROR` and
    # `G_IO_ERROR` domains.
    #
    # The stream is not closed.
    def self.new_from_stream(stream : Gio::InputStream, cancellable : Gio::Cancellable?) : self?
      # gdk_pixbuf_animation_new_from_stream: (Constructor | Throws)
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
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_new_from_stream(stream, cancellable, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::PixbufAnimation.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Finishes an asynchronous pixbuf animation creation operation started with
    # `GdkPixbuf::PixbufAnimation#new_from_stream_async`.
    def self.new_from_stream_finish(async_result : Gio::AsyncResult) : self?
      # gdk_pixbuf_animation_new_from_stream_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_new_from_stream_finish(async_result, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?

      # Return value handling

      GdkPixbuf::PixbufAnimation.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Creates a new animation by asynchronously loading an image from an input stream.
    #
    # For more details see gdk_pixbuf_new_from_stream(), which is the synchronous
    # version of this function.
    #
    # When the operation is finished, `callback` will be called in the main thread.
    # You can then call gdk_pixbuf_animation_new_from_stream_finish() to get the
    # result of the operation.
    def self.new_from_stream_async(stream : Gio::InputStream, cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # gdk_pixbuf_animation_new_from_stream_async: (None)
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
      LibGdkPixbuf.gdk_pixbuf_animation_new_from_stream_async(stream, cancellable, callback, user_data)

      # Return value handling
    end

    # Queries the height of the bounding box of a pixbuf animation.
    def height : Int32
      # gdk_pixbuf_animation_get_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_get_height(self)

      # Return value handling

      _retval
    end

    # Get an iterator for displaying an animation.
    #
    # The iterator provides the frames that should be displayed at a
    # given time.
    #
    # @start_time would normally come from g_get_current_time(), and marks
    # the beginning of animation playback. After creating an iterator, you
    # should immediately display the pixbuf returned by
    # gdk_pixbuf_animation_iter_get_pixbuf(). Then, you should install
    # a timeout (with g_timeout_add()) or by some other mechanism ensure
    # that you'll update the image after
    # gdk_pixbuf_animation_iter_get_delay_time() milliseconds. Each time
    # the image is updated, you should reinstall the timeout with the new,
    # possibly-changed delay time.
    #
    # As a shortcut, if @start_time is `NULL`, the result of
    # g_get_current_time() will be used automatically.
    #
    # To update the image (i.e. possibly change the result of
    # gdk_pixbuf_animation_iter_get_pixbuf() to a new frame of the animation),
    # call gdk_pixbuf_animation_iter_advance().
    #
    # If you're using #GdkPixbufLoader, in addition to updating the image
    # after the delay time, you should also update it whenever you
    # receive the area_updated signal and
    # gdk_pixbuf_animation_iter_on_currently_loading_frame() returns
    # `TRUE`. In this case, the frame currently being fed into the loader
    # has received new data, so needs to be refreshed. The delay time for
    # a frame may also be modified after an area_updated signal, for
    # example if the delay time for a frame is encoded in the data after
    # the frame itself. So your timeout should be reinstalled after any
    # area_updated signal.
    #
    # A delay time of -1 is possible, indicating "infinite".
    def iter(start_time : GLib::TimeVal?) : GdkPixbuf::PixbufAnimationIter
      # gdk_pixbuf_animation_get_iter: (Method)
      # @start_time: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      start_time = if start_time.nil?
                     Pointer(Void).null
                   else
                     start_time.to_unsafe
                   end

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_get_iter(self, start_time)

      # Return value handling

      GdkPixbuf::PixbufAnimationIter.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves a static image for the animation.
    #
    # If an animation is really just a plain image (has only one frame),
    # this function returns that image.
    #
    # If the animation is an animation, this function returns a reasonable
    # image to use as a static unanimated image, which might be the first
    # frame, or something more sophisticated depending on the file format.
    #
    # If an animation hasn't loaded any frames yet, this function will
    # return `NULL`.
    def static_image : GdkPixbuf::Pixbuf
      # gdk_pixbuf_animation_get_static_image: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_get_static_image(self)

      # Return value handling

      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::None)
    end

    # Queries the width of the bounding box of a pixbuf animation.
    def width : Int32
      # gdk_pixbuf_animation_get_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_get_width(self)

      # Return value handling

      _retval
    end

    # Checks whether the animation is a static image.
    #
    # If you load a file with gdk_pixbuf_animation_new_from_file() and it
    # turns out to be a plain, unanimated image, then this function will
    # return `TRUE`. Use gdk_pixbuf_animation_get_static_image() to retrieve
    # the image.
    def is_static_image : Bool
      # gdk_pixbuf_animation_is_static_image: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_is_static_image(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
