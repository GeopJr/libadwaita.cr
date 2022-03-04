require "../g_object-2.0/object"

module Gio
  # Functionality for manipulating basic metadata for files. #GFileInfo
  # implements methods for getting information that all files should
  # contain, and allows for manipulation of extended attributes.
  #
  # See [GFileAttribute][gio-GFileAttribute] for more information on how
  # GIO handles file attributes.
  #
  # To obtain a #GFileInfo for a #GFile, use g_file_query_info() (or its
  # async variant). To obtain a #GFileInfo for a file input or output
  # stream, use g_file_input_stream_query_info() or
  # g_file_output_stream_query_info() (or their async variants).
  #
  # To change the actual attributes of a file, you should then set the
  # attribute in the #GFileInfo and call g_file_set_attributes_from_info()
  # or g_file_set_attributes_async() on a GFile.
  #
  # However, not all attributes can be changed in the file. For instance,
  # the actual size of a file cannot be changed via g_file_info_set_size().
  # You may call g_file_query_settable_attributes() and
  # g_file_query_writable_namespaces() to discover the settable attributes
  # of a particular file at runtime.
  #
  # The direct accessors, such as g_file_info_get_name(), are slightly more
  # optimized than the generic attribute accessors, such as
  # g_file_info_get_attribute_byte_string().This optimization will matter
  # only if calling the API in a tight loop.
  #
  # #GFileAttributeMatcher allows for searching through a #GFileInfo for
  # attributes.
  class FileInfo < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_info_get_type
    end

    def initialize
      # g_file_info_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_new

      # Return value handling
      @pointer = _retval
    end

    def clear_status : Nil
      # g_file_info_clear_status: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_clear_status(self)

      # Return value handling
    end

    def copy_into(dest_info : Gio::FileInfo) : Nil
      # g_file_info_copy_into: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_copy_into(self, dest_info)

      # Return value handling
    end

    def dup : Gio::FileInfo
      # g_file_info_dup: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_dup(self)

      # Return value handling
      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def access_date_time : GLib::DateTime?
      # g_file_info_get_access_date_time: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_access_date_time(self)

      # Return value handling
      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def attribute_as_string(attribute : ::String) : ::String?
      # g_file_info_get_attribute_as_string: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_as_string(self, attribute)

      # Return value handling
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def attribute_boolean(attribute : ::String) : Bool
      # g_file_info_get_attribute_boolean: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_boolean(self, attribute)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def attribute_byte_string(attribute : ::String) : ::String?
      # g_file_info_get_attribute_byte_string: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_byte_string(self, attribute)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def attribute_data(attribute : ::String) : Bool
      # g_file_info_get_attribute_data: (Method)
      # @type: (out) (transfer full) (optional)
      # @value_pp: (out) (transfer full) (optional)
      # @status: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      type = Pointer(UInt32).null
      value_pp = Pointer(Pointer(Void)).null
      status = Pointer(UInt32).null

      # C call
      _retval = LibGio.g_file_info_get_attribute_data(self, attribute, type, value_pp, status)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def attribute_int32(attribute : ::String) : Int32
      # g_file_info_get_attribute_int32: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_int32(self, attribute)

      # Return value handling
      _retval
    end

    def attribute_int64(attribute : ::String) : Int64
      # g_file_info_get_attribute_int64: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_int64(self, attribute)

      # Return value handling
      _retval
    end

    def attribute_object(attribute : ::String) : GObject::Object?
      # g_file_info_get_attribute_object: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_object(self, attribute)

      # Return value handling
      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def attribute_status(attribute : ::String) : Gio::FileAttributeStatus
      # g_file_info_get_attribute_status: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_status(self, attribute)

      # Return value handling
      Gio::FileAttributeStatus.from_value(_retval)
    end

    def attribute_string(attribute : ::String) : ::String?
      # g_file_info_get_attribute_string: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_string(self, attribute)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def attribute_stringv(attribute : ::String) : Enumerable(::String)?
      # g_file_info_get_attribute_stringv: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_stringv(self, attribute)

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def attribute_type(attribute : ::String) : Gio::FileAttributeType
      # g_file_info_get_attribute_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_type(self, attribute)

      # Return value handling
      Gio::FileAttributeType.from_value(_retval)
    end

    def attribute_uint32(attribute : ::String) : UInt32
      # g_file_info_get_attribute_uint32: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_uint32(self, attribute)

      # Return value handling
      _retval
    end

    def attribute_uint64(attribute : ::String) : UInt64
      # g_file_info_get_attribute_uint64: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_attribute_uint64(self, attribute)

      # Return value handling
      _retval
    end

    def content_type : ::String?
      # g_file_info_get_content_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_content_type(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def creation_date_time : GLib::DateTime?
      # g_file_info_get_creation_date_time: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_creation_date_time(self)

      # Return value handling
      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def deletion_date : GLib::DateTime?
      # g_file_info_get_deletion_date: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_deletion_date(self)

      # Return value handling
      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def display_name : ::String
      # g_file_info_get_display_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_display_name(self)

      # Return value handling
      ::String.new(_retval)
    end

    def edit_name : ::String
      # g_file_info_get_edit_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_edit_name(self)

      # Return value handling
      ::String.new(_retval)
    end

    def etag : ::String?
      # g_file_info_get_etag: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_etag(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def file_type : Gio::FileType
      # g_file_info_get_file_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_file_type(self)

      # Return value handling
      Gio::FileType.from_value(_retval)
    end

    def icon : Gio::Icon?
      # g_file_info_get_icon: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_icon(self)

      # Return value handling
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def is_backup : Bool
      # g_file_info_get_is_backup: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_is_backup(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_hidden : Bool
      # g_file_info_get_is_hidden: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_is_hidden(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_symlink : Bool
      # g_file_info_get_is_symlink: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_is_symlink(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def modification_date_time : GLib::DateTime?
      # g_file_info_get_modification_date_time: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_modification_date_time(self)

      # Return value handling
      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def modification_time : GLib::TimeVal
      # g_file_info_get_modification_time: (Method)
      # @result: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      result = GLib::TimeVal.new

      # C call
      LibGio.g_file_info_get_modification_time(self, result)

      # Return value handling
      result
    end

    def name : ::Path
      # g_file_info_get_name: (Method)
      # Returns: (transfer none Filename)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_name(self)

      # Return value handling
      ::Path.new(::String.new(_retval))
    end

    def size : Int64
      # g_file_info_get_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_size(self)

      # Return value handling
      _retval
    end

    def sort_order : Int32
      # g_file_info_get_sort_order: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_sort_order(self)

      # Return value handling
      _retval
    end

    def symbolic_icon : Gio::Icon?
      # g_file_info_get_symbolic_icon: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_symbolic_icon(self)

      # Return value handling
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def symlink_target : ::String?
      # g_file_info_get_symlink_target: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_get_symlink_target(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def has_attribute(attribute : ::String) : Bool
      # g_file_info_has_attribute: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_has_attribute(self, attribute)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def has_namespace(name_space : ::String) : Bool
      # g_file_info_has_namespace: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_has_namespace(self, name_space)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def list_attributes(name_space : ::String?) : Enumerable(::String)?
      # g_file_info_list_attributes: (Method)
      # @name_space: (nullable)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # Handle parameters
      name_space = if name_space.nil?
                     Pointer(LibC::Char).null
                   else
                     name_space.to_unsafe
                   end

      # C call
      _retval = LibGio.g_file_info_list_attributes(self, name_space)

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def remove_attribute(attribute : ::String) : Nil
      # g_file_info_remove_attribute: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_remove_attribute(self, attribute)

      # Return value handling
    end

    def access_date_time=(atime : GLib::DateTime) : Nil
      # g_file_info_set_access_date_time: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_access_date_time(self, atime)

      # Return value handling
    end

    def set_attribute(attribute : ::String, type : Gio::FileAttributeType, value_p : Pointer(Void)) : Nil
      # g_file_info_set_attribute: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_attribute(self, attribute, type, value_p)

      # Return value handling
    end

    def set_attribute_boolean(attribute : ::String, attr_value : Bool) : Nil
      # g_file_info_set_attribute_boolean: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_attribute_boolean(self, attribute, attr_value)

      # Return value handling
    end

    def set_attribute_byte_string(attribute : ::String, attr_value : ::String) : Nil
      # g_file_info_set_attribute_byte_string: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_attribute_byte_string(self, attribute, attr_value)

      # Return value handling
    end

    def set_attribute_int32(attribute : ::String, attr_value : Int32) : Nil
      # g_file_info_set_attribute_int32: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_attribute_int32(self, attribute, attr_value)

      # Return value handling
    end

    def set_attribute_int64(attribute : ::String, attr_value : Int64) : Nil
      # g_file_info_set_attribute_int64: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_attribute_int64(self, attribute, attr_value)

      # Return value handling
    end

    def attribute_mask=(mask : Gio::FileAttributeMatcher) : Nil
      # g_file_info_set_attribute_mask: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_attribute_mask(self, mask)

      # Return value handling
    end

    def set_attribute_object(attribute : ::String, attr_value : GObject::Object) : Nil
      # g_file_info_set_attribute_object: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_attribute_object(self, attribute, attr_value)

      # Return value handling
    end

    def set_attribute_status(attribute : ::String, status : Gio::FileAttributeStatus) : Bool
      # g_file_info_set_attribute_status: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_file_info_set_attribute_status(self, attribute, status)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_attribute_string(attribute : ::String, attr_value : ::String) : Nil
      # g_file_info_set_attribute_string: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_attribute_string(self, attribute, attr_value)

      # Return value handling
    end

    def set_attribute_stringv(attribute : ::String, attr_value : Enumerable(::String)) : Nil
      # g_file_info_set_attribute_stringv: (Method)
      # @attr_value: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Handle parameters
      attr_value = attr_value.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_file_info_set_attribute_stringv(self, attribute, attr_value)

      # Return value handling
    end

    def set_attribute_uint32(attribute : ::String, attr_value : UInt32) : Nil
      # g_file_info_set_attribute_uint32: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_attribute_uint32(self, attribute, attr_value)

      # Return value handling
    end

    def set_attribute_uint64(attribute : ::String, attr_value : UInt64) : Nil
      # g_file_info_set_attribute_uint64: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_attribute_uint64(self, attribute, attr_value)

      # Return value handling
    end

    def content_type=(content_type : ::String) : Nil
      # g_file_info_set_content_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_content_type(self, content_type)

      # Return value handling
    end

    def creation_date_time=(creation_time : GLib::DateTime) : Nil
      # g_file_info_set_creation_date_time: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_creation_date_time(self, creation_time)

      # Return value handling
    end

    def display_name=(display_name : ::String) : Nil
      # g_file_info_set_display_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_display_name(self, display_name)

      # Return value handling
    end

    def edit_name=(edit_name : ::String) : Nil
      # g_file_info_set_edit_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_edit_name(self, edit_name)

      # Return value handling
    end

    def file_type=(type : Gio::FileType) : Nil
      # g_file_info_set_file_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_file_type(self, type)

      # Return value handling
    end

    def icon=(icon : Gio::Icon) : Nil
      # g_file_info_set_icon: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_icon(self, icon)

      # Return value handling
    end

    def is_hidden=(is_hidden : Bool) : Nil
      # g_file_info_set_is_hidden: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_is_hidden(self, is_hidden)

      # Return value handling
    end

    def is_symlink=(is_symlink : Bool) : Nil
      # g_file_info_set_is_symlink: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_is_symlink(self, is_symlink)

      # Return value handling
    end

    def modification_date_time=(mtime : GLib::DateTime) : Nil
      # g_file_info_set_modification_date_time: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_modification_date_time(self, mtime)

      # Return value handling
    end

    def modification_time=(mtime : GLib::TimeVal) : Nil
      # g_file_info_set_modification_time: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_modification_time(self, mtime)

      # Return value handling
    end

    def name=(name : ::String) : Nil
      # g_file_info_set_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_name(self, name)

      # Return value handling
    end

    def size=(size : Int64) : Nil
      # g_file_info_set_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_size(self, size)

      # Return value handling
    end

    def sort_order=(sort_order : Int32) : Nil
      # g_file_info_set_sort_order: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_sort_order(self, sort_order)

      # Return value handling
    end

    def symbolic_icon=(icon : Gio::Icon) : Nil
      # g_file_info_set_symbolic_icon: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_symbolic_icon(self, icon)

      # Return value handling
    end

    def symlink_target=(symlink_target : ::String) : Nil
      # g_file_info_set_symlink_target: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_set_symlink_target(self, symlink_target)

      # Return value handling
    end

    def unset_attribute_mask : Nil
      # g_file_info_unset_attribute_mask: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_file_info_unset_attribute_mask(self)

      # Return value handling
    end
  end
end
