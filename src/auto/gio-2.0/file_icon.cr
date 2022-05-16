require "../g_object-2.0/object"
require "./icon"

require "./loadable_icon"

module Gio
  # #GFileIcon specifies an icon by pointing to an image file
  # to be used as icon.
  @[GObject::GeneratedWrapper]
  class FileIcon < GObject::Object
    include Icon
    include LoadableIcon

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::FileIconClass), class_init,
        sizeof(LibGio::FileIcon), instance_init, 0)
    end

    GICrystal.define_new_method(FileIcon, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `FileIcon`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, file : Gio::File? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !file.nil?
        (_names.to_unsafe + _n).value = "file".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, file)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FileIcon.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_icon_get_type
    end

    def file=(value : Gio::File?) : Gio::File?
      unsafe_value = value

      LibGObject.g_object_set(self, "file", unsafe_value, Pointer(Void).null)
      value
    end

    def file : Gio::File?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "file", pointerof(value), Pointer(Void).null)
      Gio::AbstractFile.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new icon for a file.
    def initialize(file : Gio::File)
      # g_file_icon_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_icon_new(file)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the #GFile associated with the given @icon.
    def file : Gio::File
      # g_file_icon_get_file: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_icon_get_file(@pointer)

      # Return value handling

      Gio::AbstractFile.new(_retval, GICrystal::Transfer::None)
    end
  end
end
