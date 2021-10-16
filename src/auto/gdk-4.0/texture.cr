require "../g_object-2.0/object"
require "./paintable"

module Gdk
  # `GdkTexture` is the basic element used to refer to pixel data.
  #
  # It is primarily meant for pixel data that will not change over
  # multiple frames, and will be used for a long time.
  #
  # There are various ways to create `GdkTexture` objects from a
  # `GdkPixbuf`, or a Cairo surface, or other pixel data.
  #
  # The ownership of the pixel data is transferred to the `GdkTexture`
  # instance; you can only make a copy of it, via
  # [method@Gdk.Texture.download].
  #
  # `GdkTexture` is an immutable object: That means you cannot change
  # anything about it other than increasing the reference count via
  # g_object_ref().
  class Texture < GObject::Object
    include Paintable

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

    def self.new_for_pixbuf(pixbuf : GdkPixbuf::Pixbuf) : Gdk::Texture
      # gdk_texture_new_for_pixbuf: (Constructor)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_texture_new_for_pixbuf(pixbuf)
      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_file(file : Gio::File) : Gdk::Texture
      # gdk_texture_new_from_file: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_texture_new_from_file(file)
      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_resource(resource_path : ::String) : Gdk::Texture
      # gdk_texture_new_from_resource: (Constructor)
      # Returns: (transfer full)

      _retval = LibGdk.gdk_texture_new_from_resource(resource_path)
      Gdk::Texture.new(_retval, GICrystal::Transfer::Full)
    end

    def download(data : Enumerable(UInt8), stride : UInt64) : Nil
      # gdk_texture_download: (Method)
      # @data: (array element-type UInt8)
      # Returns: (transfer none)

      data = data.to_a.to_unsafe

      LibGdk.gdk_texture_download(self, data, stride)
    end

    def height : Int32
      # gdk_texture_get_height: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_texture_get_height(self)
      _retval
    end

    def width : Int32
      # gdk_texture_get_width: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_texture_get_width(self)
      _retval
    end

    def save_to_png(filename : ::String) : Bool
      # gdk_texture_save_to_png: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_texture_save_to_png(self, filename)
      GICrystal.to_bool(_retval)
    end
  end
end
