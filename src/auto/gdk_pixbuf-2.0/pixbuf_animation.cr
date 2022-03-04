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
  class PixbufAnimation < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdkPixbuf.gdk_pixbuf_animation_get_type
    end

    def self.new_from_file(filename : ::String) : self?
      # gdk_pixbuf_animation_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_new_from_file(filename, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?
      # Return value handling
      GdkPixbuf::PixbufAnimation.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_resource(resource_path : ::String) : self?
      # gdk_pixbuf_animation_new_from_resource: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_new_from_resource(resource_path, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?
      # Return value handling
      GdkPixbuf::PixbufAnimation.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_stream(stream : Gio::InputStream, cancellable : Gio::Cancellable?) : self?
      # gdk_pixbuf_animation_new_from_stream: (Constructor | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters
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

    def self.new_from_stream_finish(async_result : Gio::AsyncResult) : self?
      # gdk_pixbuf_animation_new_from_stream_finish: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_new_from_stream_finish(async_result, pointerof(_error))

      # Error check
      GdkPixbuf.raise_exception(_error) unless _error.null?
      # Return value handling
      GdkPixbuf::PixbufAnimation.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.new_from_stream_async(stream : Gio::InputStream, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # gdk_pixbuf_animation_new_from_stream_async: (None)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
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

      # C call
      LibGdkPixbuf.gdk_pixbuf_animation_new_from_stream_async(stream, cancellable, callback, user_data)

      # Return value handling
    end

    def height : Int32
      # gdk_pixbuf_animation_get_height: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_get_height(self)

      # Return value handling
      _retval
    end

    def iter(start_time : GLib::TimeVal?) : GdkPixbuf::PixbufAnimationIter
      # gdk_pixbuf_animation_get_iter: (Method)
      # @start_time: (nullable)
      # Returns: (transfer full)

      # Handle parameters
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

    def static_image : GdkPixbuf::Pixbuf
      # gdk_pixbuf_animation_get_static_image: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_get_static_image(self)

      # Return value handling
      GdkPixbuf::Pixbuf.new(_retval, GICrystal::Transfer::None)
    end

    def width : Int32
      # gdk_pixbuf_animation_get_width: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_get_width(self)

      # Return value handling
      _retval
    end

    def is_static_image : Bool
      # gdk_pixbuf_animation_is_static_image: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_animation_is_static_image(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end
  end
end
