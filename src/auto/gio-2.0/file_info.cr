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
  @[GObject::GeneratedWrapper]
  class FileInfo < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::FileInfoClass), class_init,
        sizeof(LibGio::FileInfo), instance_init, 0)
    end

    GICrystal.define_new_method(FileInfo, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `FileInfo`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_info_get_type
    end

    # Clears the status information from @info.
    def clear_status : Nil
      # g_file_info_clear_status: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_clear_status(@pointer)

      # Return value handling
    end

    # First clears all of the [GFileAttribute][gio-GFileAttribute] of @dest_info,
    # and then copies all of the file attributes from @src_info to @dest_info.
    def copy_into(dest_info : Gio::FileInfo) : Nil
      # g_file_info_copy_into: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_copy_into(@pointer, dest_info)

      # Return value handling
    end

    # Duplicates a file info structure.
    def dup : Gio::FileInfo
      # g_file_info_dup: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_info_dup(@pointer)

      # Return value handling

      Gio::FileInfo.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the access time of the current @info and returns it as a
    # #GDateTime.
    #
    # This requires the %G_FILE_ATTRIBUTE_TIME_ACCESS attribute. If
    # %G_FILE_ATTRIBUTE_TIME_ACCESS_USEC is provided, the resulting #GDateTime
    # will have microsecond precision.
    def access_date_time : GLib::DateTime?
      # g_file_info_get_access_date_time: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_info_get_access_date_time(@pointer)

      # Return value handling

      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the value of a attribute, formatted as a string.
    # This escapes things as needed to make the string valid
    # UTF-8.
    def attribute_as_string(attribute : ::String) : ::String?
      # g_file_info_get_attribute_as_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_info_get_attribute_as_string(@pointer, attribute)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Gets the value of a boolean attribute. If the attribute does not
    # contain a boolean value, %FALSE will be returned.
    def attribute_boolean(attribute : ::String) : Bool
      # g_file_info_get_attribute_boolean: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_attribute_boolean(@pointer, attribute)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value of a byte string attribute. If the attribute does
    # not contain a byte string, %NULL will be returned.
    def attribute_byte_string(attribute : ::String) : ::String?
      # g_file_info_get_attribute_byte_string: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_attribute_byte_string(@pointer, attribute)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the attribute type, value and status for an attribute key.
    def attribute_data(attribute : ::String) : Bool
      # g_file_info_get_attribute_data: (Method)
      # @type: (out) (transfer full) (optional)
      # @value_pp: (out) (transfer full) (optional)
      # @status: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      type = Pointer(UInt32).null            # Generator::OutArgUsedInReturnPlan
      value_pp = Pointer(Pointer(Void)).null # Generator::OutArgUsedInReturnPlan
      status = Pointer(UInt32).null
      # C call
      _retval = LibGio.g_file_info_get_attribute_data(@pointer, attribute, type, value_pp, status)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets a signed 32-bit integer contained within the attribute. If the
    # attribute does not contain a signed 32-bit integer, or is invalid,
    # 0 will be returned.
    def attribute_int32(attribute : ::String) : Int32
      # g_file_info_get_attribute_int32: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_attribute_int32(@pointer, attribute)

      # Return value handling

      _retval
    end

    # Gets a signed 64-bit integer contained within the attribute. If the
    # attribute does not contain a signed 64-bit integer, or is invalid,
    # 0 will be returned.
    def attribute_int64(attribute : ::String) : Int64
      # g_file_info_get_attribute_int64: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_attribute_int64(@pointer, attribute)

      # Return value handling

      _retval
    end

    # Gets the value of a #GObject attribute. If the attribute does
    # not contain a #GObject, %NULL will be returned.
    def attribute_object(attribute : ::String) : GObject::Object?
      # g_file_info_get_attribute_object: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_attribute_object(@pointer, attribute)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the attribute status for an attribute key.
    def attribute_status(attribute : ::String) : Gio::FileAttributeStatus
      # g_file_info_get_attribute_status: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_attribute_status(@pointer, attribute)

      # Return value handling

      Gio::FileAttributeStatus.new(_retval)
    end

    # Gets the value of a string attribute. If the attribute does
    # not contain a string, %NULL will be returned.
    def attribute_string(attribute : ::String) : ::String?
      # g_file_info_get_attribute_string: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_attribute_string(@pointer, attribute)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the value of a stringv attribute. If the attribute does
    # not contain a stringv, %NULL will be returned.
    def attribute_stringv(attribute : ::String) : Enumerable(::String)?
      # g_file_info_get_attribute_stringv: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_file_info_get_attribute_stringv(@pointer, attribute)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the attribute type for an attribute key.
    def attribute_type(attribute : ::String) : Gio::FileAttributeType
      # g_file_info_get_attribute_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_attribute_type(@pointer, attribute)

      # Return value handling

      Gio::FileAttributeType.new(_retval)
    end

    # Gets an unsigned 32-bit integer contained within the attribute. If the
    # attribute does not contain an unsigned 32-bit integer, or is invalid,
    # 0 will be returned.
    def attribute_uint32(attribute : ::String) : UInt32
      # g_file_info_get_attribute_uint32: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_attribute_uint32(@pointer, attribute)

      # Return value handling

      _retval
    end

    # Gets a unsigned 64-bit integer contained within the attribute. If the
    # attribute does not contain an unsigned 64-bit integer, or is invalid,
    # 0 will be returned.
    def attribute_uint64(attribute : ::String) : UInt64
      # g_file_info_get_attribute_uint64: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_attribute_uint64(@pointer, attribute)

      # Return value handling

      _retval
    end

    # Gets the file's content type.
    def content_type : ::String?
      # g_file_info_get_content_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_content_type(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the creation time of the current @info and returns it as a
    # #GDateTime.
    #
    # This requires the %G_FILE_ATTRIBUTE_TIME_CREATED attribute. If
    # %G_FILE_ATTRIBUTE_TIME_CREATED_USEC is provided, the resulting #GDateTime
    # will have microsecond precision.
    def creation_date_time : GLib::DateTime?
      # g_file_info_get_creation_date_time: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_info_get_creation_date_time(@pointer)

      # Return value handling

      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Returns the #GDateTime representing the deletion date of the file, as
    # available in G_FILE_ATTRIBUTE_TRASH_DELETION_DATE. If the
    # G_FILE_ATTRIBUTE_TRASH_DELETION_DATE attribute is unset, %NULL is returned.
    def deletion_date : GLib::DateTime?
      # g_file_info_get_deletion_date: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_info_get_deletion_date(@pointer)

      # Return value handling

      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets a display name for a file. This is guaranteed to always be set.
    def display_name : ::String
      # g_file_info_get_display_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_display_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the edit name for a file.
    def edit_name : ::String
      # g_file_info_get_edit_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_edit_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the [entity tag][gfile-etag] for a given
    # #GFileInfo. See %G_FILE_ATTRIBUTE_ETAG_VALUE.
    def etag : ::String?
      # g_file_info_get_etag: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_etag(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets a file's type (whether it is a regular file, symlink, etc).
    # This is different from the file's content type, see g_file_info_get_content_type().
    def file_type : Gio::FileType
      # g_file_info_get_file_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_file_type(@pointer)

      # Return value handling

      Gio::FileType.new(_retval)
    end

    # Gets the icon for a file.
    def icon : Gio::Icon?
      # g_file_info_get_icon: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_icon(@pointer)

      # Return value handling

      Gio::AbstractIcon.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Checks if a file is a backup file.
    def is_backup : Bool
      # g_file_info_get_is_backup: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_is_backup(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if a file is hidden.
    def is_hidden : Bool
      # g_file_info_get_is_hidden: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_is_hidden(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if a file is a symlink.
    def is_symlink : Bool
      # g_file_info_get_is_symlink: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_is_symlink(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the modification time of the current @info and returns it as a
    # #GDateTime.
    #
    # This requires the %G_FILE_ATTRIBUTE_TIME_MODIFIED attribute. If
    # %G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC is provided, the resulting #GDateTime
    # will have microsecond precision.
    def modification_date_time : GLib::DateTime?
      # g_file_info_get_modification_date_time: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_info_get_modification_date_time(@pointer)

      # Return value handling

      GLib::DateTime.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the modification time of the current @info and sets it
    # in @result.
    def modification_time : GLib::TimeVal
      # g_file_info_get_modification_time: (Method)
      # @result: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      result = GLib::TimeVal.new
      # C call
      LibGio.g_file_info_get_modification_time(@pointer, result)

      # Return value handling

      result
    end

    # Gets the name for a file. This is guaranteed to always be set.
    def name : ::Path
      # g_file_info_get_name: (Method)
      # Returns: (transfer none Filename)

      # C call
      _retval = LibGio.g_file_info_get_name(@pointer)

      # Return value handling

      ::Path.new(::String.new(_retval))
    end

    # Gets the file's size (in bytes). The size is retrieved through the value of
    # the %G_FILE_ATTRIBUTE_STANDARD_SIZE attribute and is converted
    # from #guint64 to #goffset before returning the result.
    def size : Int64
      # g_file_info_get_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_size(@pointer)

      # Return value handling

      _retval
    end

    # Gets the value of the sort_order attribute from the #GFileInfo.
    # See %G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER.
    def sort_order : Int32
      # g_file_info_get_sort_order: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_sort_order(@pointer)

      # Return value handling

      _retval
    end

    # Gets the symbolic icon for a file.
    def symbolic_icon : Gio::Icon?
      # g_file_info_get_symbolic_icon: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_symbolic_icon(@pointer)

      # Return value handling

      Gio::AbstractIcon.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the symlink target for a given #GFileInfo.
    def symlink_target : ::String?
      # g_file_info_get_symlink_target: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_get_symlink_target(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Checks if a file info structure has an attribute named @attribute.
    def has_attribute(attribute : ::String) : Bool
      # g_file_info_has_attribute: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_has_attribute(@pointer, attribute)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if a file info structure has an attribute in the
    # specified @name_space.
    def has_namespace(name_space : ::String) : Bool
      # g_file_info_has_namespace: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_has_namespace(@pointer, name_space)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Lists the file info structure's attributes.
    def list_attributes(name_space : ::String?) : Enumerable(::String)?
      # g_file_info_list_attributes: (Method)
      # @name_space: (nullable)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # Generator::NullableArrayPlan
      name_space = if name_space.nil?
                     Pointer(LibC::Char).null
                   else
                     name_space.to_unsafe
                   end

      # C call
      _retval = LibGio.g_file_info_list_attributes(@pointer, name_space)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Removes all cases of @attribute from @info if it exists.
    def remove_attribute(attribute : ::String) : Nil
      # g_file_info_remove_attribute: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_remove_attribute(@pointer, attribute)

      # Return value handling
    end

    # Sets the %G_FILE_ATTRIBUTE_TIME_ACCESS and
    # %G_FILE_ATTRIBUTE_TIME_ACCESS_USEC attributes in the file info to the
    # given date/time value.
    def access_date_time=(atime : GLib::DateTime) : Nil
      # g_file_info_set_access_date_time: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_access_date_time(@pointer, atime)

      # Return value handling
    end

    # Sets the @attribute to contain the given value, if possible. To unset the
    # attribute, use %G_FILE_ATTRIBUTE_TYPE_INVALID for @type.
    def set_attribute(attribute : ::String, type : Gio::FileAttributeType, value_p : Pointer(Void)) : Nil
      # g_file_info_set_attribute: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_attribute(@pointer, attribute, type, value_p)

      # Return value handling
    end

    # Sets the @attribute to contain the given @attr_value,
    # if possible.
    def set_attribute_boolean(attribute : ::String, attr_value : Bool) : Nil
      # g_file_info_set_attribute_boolean: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_attribute_boolean(@pointer, attribute, attr_value)

      # Return value handling
    end

    # Sets the @attribute to contain the given @attr_value,
    # if possible.
    def set_attribute_byte_string(attribute : ::String, attr_value : ::String) : Nil
      # g_file_info_set_attribute_byte_string: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_attribute_byte_string(@pointer, attribute, attr_value)

      # Return value handling
    end

    # Sets the @attribute to contain the given @attr_value,
    # if possible.
    def set_attribute_int32(attribute : ::String, attr_value : Int32) : Nil
      # g_file_info_set_attribute_int32: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_attribute_int32(@pointer, attribute, attr_value)

      # Return value handling
    end

    # Sets the @attribute to contain the given @attr_value,
    # if possible.
    def set_attribute_int64(attribute : ::String, attr_value : Int64) : Nil
      # g_file_info_set_attribute_int64: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_attribute_int64(@pointer, attribute, attr_value)

      # Return value handling
    end

    # Sets @mask on @info to match specific attribute types.
    def attribute_mask=(mask : Gio::FileAttributeMatcher) : Nil
      # g_file_info_set_attribute_mask: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_attribute_mask(@pointer, mask)

      # Return value handling
    end

    # Sets the @attribute to contain the given @attr_value,
    # if possible.
    def set_attribute_object(attribute : ::String, attr_value : GObject::Object) : Nil
      # g_file_info_set_attribute_object: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_attribute_object(@pointer, attribute, attr_value)

      # Return value handling
    end

    # Sets the attribute status for an attribute key. This is only
    # needed by external code that implement g_file_set_attributes_from_info()
    # or similar functions.
    #
    # The attribute must exist in @info for this to work. Otherwise %FALSE
    # is returned and @info is unchanged.
    def set_attribute_status(attribute : ::String, status : Gio::FileAttributeStatus) : Bool
      # g_file_info_set_attribute_status: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_info_set_attribute_status(@pointer, attribute, status)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the @attribute to contain the given @attr_value,
    # if possible.
    def set_attribute_string(attribute : ::String, attr_value : ::String) : Nil
      # g_file_info_set_attribute_string: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_attribute_string(@pointer, attribute, attr_value)

      # Return value handling
    end

    # Sets the @attribute to contain the given @attr_value,
    # if possible.
    #
    # Sinze: 2.22
    def set_attribute_stringv(attribute : ::String, attr_value : Enumerable(::String)) : Nil
      # g_file_info_set_attribute_stringv: (Method)
      # @attr_value: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      attr_value = attr_value.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_file_info_set_attribute_stringv(@pointer, attribute, attr_value)

      # Return value handling
    end

    # Sets the @attribute to contain the given @attr_value,
    # if possible.
    def set_attribute_uint32(attribute : ::String, attr_value : UInt32) : Nil
      # g_file_info_set_attribute_uint32: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_attribute_uint32(@pointer, attribute, attr_value)

      # Return value handling
    end

    # Sets the @attribute to contain the given @attr_value,
    # if possible.
    def set_attribute_uint64(attribute : ::String, attr_value : UInt64) : Nil
      # g_file_info_set_attribute_uint64: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_attribute_uint64(@pointer, attribute, attr_value)

      # Return value handling
    end

    # Sets the content type attribute for a given #GFileInfo.
    # See %G_FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE.
    def content_type=(content_type : ::String) : Nil
      # g_file_info_set_content_type: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_content_type(@pointer, content_type)

      # Return value handling
    end

    # Sets the %G_FILE_ATTRIBUTE_TIME_CREATED and
    # %G_FILE_ATTRIBUTE_TIME_CREATED_USEC attributes in the file info to the
    # given date/time value.
    def creation_date_time=(creation_time : GLib::DateTime) : Nil
      # g_file_info_set_creation_date_time: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_creation_date_time(@pointer, creation_time)

      # Return value handling
    end

    # Sets the display name for the current #GFileInfo.
    # See %G_FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME.
    def display_name=(display_name : ::String) : Nil
      # g_file_info_set_display_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_display_name(@pointer, display_name)

      # Return value handling
    end

    # Sets the edit name for the current file.
    # See %G_FILE_ATTRIBUTE_STANDARD_EDIT_NAME.
    def edit_name=(edit_name : ::String) : Nil
      # g_file_info_set_edit_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_edit_name(@pointer, edit_name)

      # Return value handling
    end

    # Sets the file type in a #GFileInfo to @type.
    # See %G_FILE_ATTRIBUTE_STANDARD_TYPE.
    def file_type=(type : Gio::FileType) : Nil
      # g_file_info_set_file_type: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_file_type(@pointer, type)

      # Return value handling
    end

    # Sets the icon for a given #GFileInfo.
    # See %G_FILE_ATTRIBUTE_STANDARD_ICON.
    def icon=(icon : Gio::Icon) : Nil
      # g_file_info_set_icon: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_icon(@pointer, icon)

      # Return value handling
    end

    # Sets the "is_hidden" attribute in a #GFileInfo according to @is_hidden.
    # See %G_FILE_ATTRIBUTE_STANDARD_IS_HIDDEN.
    def is_hidden=(is_hidden : Bool) : Nil
      # g_file_info_set_is_hidden: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_is_hidden(@pointer, is_hidden)

      # Return value handling
    end

    # Sets the "is_symlink" attribute in a #GFileInfo according to @is_symlink.
    # See %G_FILE_ATTRIBUTE_STANDARD_IS_SYMLINK.
    def is_symlink=(is_symlink : Bool) : Nil
      # g_file_info_set_is_symlink: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_is_symlink(@pointer, is_symlink)

      # Return value handling
    end

    # Sets the %G_FILE_ATTRIBUTE_TIME_MODIFIED and
    # %G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC attributes in the file info to the
    # given date/time value.
    def modification_date_time=(mtime : GLib::DateTime) : Nil
      # g_file_info_set_modification_date_time: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_modification_date_time(@pointer, mtime)

      # Return value handling
    end

    # Sets the %G_FILE_ATTRIBUTE_TIME_MODIFIED and
    # %G_FILE_ATTRIBUTE_TIME_MODIFIED_USEC attributes in the file info to the
    # given time value.
    def modification_time=(mtime : GLib::TimeVal) : Nil
      # g_file_info_set_modification_time: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_modification_time(@pointer, mtime)

      # Return value handling
    end

    # Sets the name attribute for the current #GFileInfo.
    # See %G_FILE_ATTRIBUTE_STANDARD_NAME.
    def name=(name : ::String) : Nil
      # g_file_info_set_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_name(@pointer, name)

      # Return value handling
    end

    # Sets the %G_FILE_ATTRIBUTE_STANDARD_SIZE attribute in the file info
    # to the given size.
    def size=(size : Int64) : Nil
      # g_file_info_set_size: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_size(@pointer, size)

      # Return value handling
    end

    # Sets the sort order attribute in the file info structure. See
    # %G_FILE_ATTRIBUTE_STANDARD_SORT_ORDER.
    def sort_order=(sort_order : Int32) : Nil
      # g_file_info_set_sort_order: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_sort_order(@pointer, sort_order)

      # Return value handling
    end

    # Sets the symbolic icon for a given #GFileInfo.
    # See %G_FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON.
    def symbolic_icon=(icon : Gio::Icon) : Nil
      # g_file_info_set_symbolic_icon: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_symbolic_icon(@pointer, icon)

      # Return value handling
    end

    # Sets the %G_FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET attribute in the file info
    # to the given symlink target.
    def symlink_target=(symlink_target : ::String) : Nil
      # g_file_info_set_symlink_target: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_set_symlink_target(@pointer, symlink_target)

      # Return value handling
    end

    # Unsets a mask set by g_file_info_set_attribute_mask(), if one
    # is set.
    def unset_attribute_mask : Nil
      # g_file_info_unset_attribute_mask: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_info_unset_attribute_mask(@pointer)

      # Return value handling
    end
  end
end
