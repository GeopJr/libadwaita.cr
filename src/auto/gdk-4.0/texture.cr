require "../g_object-2.0/object"
require "./paintable"

require "../gio-2.0/icon"

require "../gio-2.0/loadable_icon"

module Gdk
  # `GdkTexture` is the basic element used to refer to pixel data.
  #
  # It is primarily meant for pixel data that will not change over
  # multiple frames, and will be used for a long time.
  #
  # There are various ways to create `GdkTexture` objects from a
  # `GdkPixbuf#Pixbuf`, or a Cairo surface, or other pixel data.
  #
  # The ownership of the pixel data is transferred to the `GdkTexture`
  # instance; you can only make a copy of it, via `Gdk::Texture#download`.
  #
  # `GdkTexture` is an immutable object: That means you cannot change
  # anything about it other than increasing the reference count via
  # `GObject::Object#ref`, and consequently, it is a thread-safe object.
  @[GObject::GeneratedWrapper]
  class Texture < GObject::Object
    include Paintable
    include Gio::Icon
    include Gio::LoadableIcon

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGdk::TextureClass), class_init,
        sizeof(LibGdk::Texture), instance_init, 0)
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

    def initialize(*, height : Int32? = nil, width : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !height.nil?
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if !width.nil?
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Texture.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_texture_get_type
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

    # Creates a new texture object representing the `GdkPixbuf`.
    #
    # This function is threadsafe, so that you can e.g. use GTask
    # and `Gio::Task#run_in_thread` to avoid blocking the main thread
    # while loading a big image.
    def self.new_for_pixbuf(pixbuf : GdkPixbuf::Pixbuf) : self
      # gdk_texture_new_for_pixbuf: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_texture_new_for_pixbuf(pixbuf)

      # Return value handling

      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new texture by loading an image from memory,
    #
    # The file format is detected automatically. The supported formats
    # are PNG and JPEG, though more formats might be available.
    #
    # If %NULL is returned, then @error will be set.
    #
    # This function is threadsafe, so that you can e.g. use GTask
    # and `Gio::Task#run_in_thread` to avoid blocking the main thread
    # while loading a big image.
    def self.new_from_bytes(bytes : GLib::Bytes) : self
      # gdk_texture_new_from_bytes: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_texture_new_from_bytes(bytes, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new texture by loading an image from a file.
    #
    # The file format is detected automatically. The supported formats
    # are PNG and JPEG, though more formats might be available.
    #
    # If %NULL is returned, then @error will be set.
    #
    # This function is threadsafe, so that you can e.g. use GTask
    # and `Gio::Task#run_in_thread` to avoid blocking the main thread
    # while loading a big image.
    def self.new_from_file(file : Gio::File) : self
      # gdk_texture_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_texture_new_from_file(file, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new texture by loading an image from a file.
    #
    # The file format is detected automatically. The supported formats
    # are PNG and JPEG, though more formats might be available.
    #
    # If %NULL is returned, then @error will be set.
    #
    # This function is threadsafe, so that you can e.g. use GTask
    # and `Gio::Task#run_in_thread` to avoid blocking the main thread
    # while loading a big image.
    def self.new_from_filename(path : ::String) : self
      # gdk_texture_new_from_filename: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_texture_new_from_filename(path, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new texture by loading an image from a resource.
    #
    # The file format is detected automatically. The supported formats
    # are PNG and JPEG, though more formats might be available.
    #
    # It is a fatal error if @resource_path does not specify a valid
    # image resource and the program will abort if that happens.
    # If you are unsure about the validity of a resource, use
    # `Gdk::Texture#new_from_file` to load it.
    #
    # This function is threadsafe, so that you can e.g. use GTask
    # and `Gio::Task#run_in_thread` to avoid blocking the main thread
    # while loading a big image.
    def self.new_from_resource(resource_path : ::String) : self
      # gdk_texture_new_from_resource: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_texture_new_from_resource(resource_path)

      # Return value handling

      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    # Downloads the @texture into local memory.
    #
    # This may be an expensive operation, as the actual texture data
    # may reside on a GPU or on a remote display server.
    #
    # The data format of the downloaded data is equivalent to
    # %CAIRO_FORMAT_ARGB32, so every downloaded pixel requires
    # 4 bytes of memory.
    #
    # Downloading a texture into a Cairo image surface:
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # surface = cairo_image_surface_create (CAIRO_FORMAT_ARGB32,
    #                                       gdk_texture_get_width (texture),
    #                                       gdk_texture_get_height (texture));
    # gdk_texture_download (texture,
    #                       cairo_image_surface_get_data (surface),
    #                       cairo_image_surface_get_stride (surface));
    # cairo_surface_mark_dirty (surface);
    # ```
    def download(data : Enumerable(UInt8), stride : UInt64) : Nil
      # gdk_texture_download: (Method)
      # @data: (array element-type UInt8)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      data = data.to_a.to_unsafe

      # C call
      LibGdk.gdk_texture_download(self, data, stride)

      # Return value handling
    end

    # Returns the height of the @texture, in pixels.
    def height : Int32
      # gdk_texture_get_height: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_texture_get_height(self)

      # Return value handling

      _retval
    end

    # Returns the width of @texture, in pixels.
    def width : Int32
      # gdk_texture_get_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_texture_get_width(self)

      # Return value handling

      _retval
    end

    # Store the given @texture to the @filename as a PNG file.
    #
    # This is a utility function intended for debugging and testing.
    # If you want more control over formats, proper error handling or
    # want to store to a `Gio#File` or other location, you might want to
    # use `Gdk::Texture#save_to_png_bytes` or look into the
    # gdk-pixbuf library.
    def save_to_png(filename : ::String) : Bool
      # gdk_texture_save_to_png: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_texture_save_to_png(self, filename)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Store the given @texture in memory as a PNG file.
    #
    # Use `Gdk::Texture#new_from_bytes` to read it back.
    #
    # If you want to serialize a texture, this is a convenient and
    # portable way to do that.
    #
    # If you need more control over the generated image, such as
    # attaching metadata, you should look into an image handling
    # library such as the gdk-pixbuf library.
    #
    # If you are dealing with high dynamic range float data, you
    # might also want to consider `Gdk::Texture#save_to_tiff_bytes`
    # instead.
    def save_to_png_bytes : GLib::Bytes
      # gdk_texture_save_to_png_bytes: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_texture_save_to_png_bytes(self)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    # Store the given @texture to the @filename as a TIFF file.
    #
    # GTK will attempt to store data without loss.
    def save_to_tiff(filename : ::String) : Bool
      # gdk_texture_save_to_tiff: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_texture_save_to_tiff(self, filename)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Store the given @texture in memory as a TIFF file.
    #
    # Use `Gdk::Texture#new_from_bytes` to read it back.
    #
    # This function is intended to store a representation of the
    # texture's data that is as accurate as possible. This is
    # particularly relevant when working with high dynamic range
    # images and floating-point texture data.
    #
    # If that is not your concern and you are interested in a
    # smaller size and a more portable format, you might want to
    # use `Gdk::Texture#save_to_png_bytes`.
    def save_to_tiff_bytes : GLib::Bytes
      # gdk_texture_save_to_tiff_bytes: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_texture_save_to_tiff_bytes(self)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
