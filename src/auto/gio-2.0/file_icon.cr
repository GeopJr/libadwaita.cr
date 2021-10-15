require "../g_object-2.0/object"
require "./icon"

require "./loadable_icon"

module Gio
  # #GFileIcon specifies an icon by pointing to an image file
  # to be used as icon.
  class FileIcon < GObject::Object
    include Icon
    include LoadableIcon

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, file : Gio::File? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if file
        (_names.to_unsafe + _n).value = "file".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, file)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FileIcon.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_icon_get_type
    end

    def file=(value : File?) : File?
      unsafe_value = value

      LibGObject.g_object_set(self, "file", unsafe_value, Pointer(Void).null)
      value
    end

    def initialize(file : Gio::File)
      # g_file_icon_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_file_icon_new(file)
      @pointer = _retval
    end

    def file : Gio::File
      # g_file_icon_get_file: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_file_icon_get_file(self)
      Gio::File__Impl.new(_retval, GICrystal::Transfer::None)
    end
  end
end
