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
  # [class@GdkPixbuf.Pixbuf], or a Cairo surface, or other pixel data.
  #
  # The ownership of the pixel data is transferred to the `GdkTexture`
  # instance; you can only make a copy of it, via [method@Gdk.Texture.download].
  #
  # `GdkTexture` is an immutable object: That means you cannot change
  # anything about it other than increasing the reference count via
  # [method@GObject.Object.ref], and consequently, it is a thread-safe object.
  class Texture < GObject::Object
    include Paintable
    include Gio::Icon
    include Gio::LoadableIcon

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, height : Int32? = nil, width : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if height
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if width
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Texture.g_type, _n, _names, _values)
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

    def self.new_for_pixbuf(pixbuf : GdkPixbuf::Pixbuf) : self
      # gdk_texture_new_for_pixbuf: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_texture_new_for_pixbuf(pixbuf)

      # Return value handling
      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_bytes(bytes : GLib::Bytes) : self
      # gdk_texture_new_from_bytes: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_texture_new_from_bytes(bytes, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?
      # Return value handling
      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_file(file : Gio::File) : self
      # gdk_texture_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_texture_new_from_file(file, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?
      # Return value handling
      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_filename(path : ::String) : self
      # gdk_texture_new_from_filename: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_texture_new_from_filename(path, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?
      # Return value handling
      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_resource(resource_path : ::String) : self
      # gdk_texture_new_from_resource: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_texture_new_from_resource(resource_path)

      # Return value handling
      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    def download(data : Enumerable(UInt8), stride : UInt64) : Nil
      # gdk_texture_download: (Method)
      # @data: (array element-type UInt8)
      # Returns: (transfer none)

      # Handle parameters
      data = data.to_a.to_unsafe

      # C call
      LibGdk.gdk_texture_download(self, data, stride)

      # Return value handling
    end

    def height : Int32
      # gdk_texture_get_height: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_texture_get_height(self)

      # Return value handling
      _retval
    end

    def width : Int32
      # gdk_texture_get_width: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_texture_get_width(self)

      # Return value handling
      _retval
    end

    def save_to_png(filename : ::String) : Bool
      # gdk_texture_save_to_png: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_texture_save_to_png(self, filename)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def save_to_png_bytes : GLib::Bytes
      # gdk_texture_save_to_png_bytes: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_texture_save_to_png_bytes(self)

      # Return value handling
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def save_to_tiff(filename : ::String) : Bool
      # gdk_texture_save_to_tiff: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_texture_save_to_tiff(self, filename)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def save_to_tiff_bytes : GLib::Bytes
      # gdk_texture_save_to_tiff_bytes: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGdk.gdk_texture_save_to_tiff_bytes(self)

      # Return value handling
      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
