module GLib
  # The GKeyFile struct contains only private data
  # and should not be accessed directly.
  class KeyFile
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(KeyFile.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(KeyFile.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_key_file_get_type
    end

    def initialize
      # g_key_file_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGLib.g_key_file_new
      @pointer = _retval
    end

    def boolean(group_name : ::String, key : ::String) : Bool
      # g_key_file_get_boolean: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_get_boolean(self, group_name, key)
      GICrystal.to_bool(_retval)
    end

    def boolean_list(group_name : ::String, key : ::String, length : UInt64) : Enumerable(Bool)
      # g_key_file_get_boolean_list: (Method | Throws)
      # @length: (out) (transfer full)
      # Returns: (transfer container)

      _retval = LibGLib.g_key_file_get_boolean_list(self, group_name, key, length)
      _retval
    end

    def comment(group_name : ::String?, key : ::String?) : ::String
      # g_key_file_get_comment: (Method | Throws)
      # @group_name: (nullable)
      # @key: (nullable)
      # Returns: (transfer full)

      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end
      key = if key.nil?
              Pointer(LibC::Char).null
            else
              key.to_unsafe
            end

      _retval = LibGLib.g_key_file_get_comment(self, group_name, key)
      GICrystal.transfer_full(_retval)
    end

    def double(group_name : ::String, key : ::String) : Float64
      # g_key_file_get_double: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_get_double(self, group_name, key)
      _retval
    end

    def double_list(group_name : ::String, key : ::String, length : UInt64) : Enumerable(Float64)
      # g_key_file_get_double_list: (Method | Throws)
      # @length: (out) (transfer full)
      # Returns: (transfer container)

      _retval = LibGLib.g_key_file_get_double_list(self, group_name, key, length)
      _retval
    end

    def groups : Enumerable(::String)
      # g_key_file_get_groups: (Method)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      length = Pointer(UInt64).null

      _retval = LibGLib.g_key_file_get_groups(self, length)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def int64(group_name : ::String, key : ::String) : Int64
      # g_key_file_get_int64: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_get_int64(self, group_name, key)
      _retval
    end

    def integer(group_name : ::String, key : ::String) : Int32
      # g_key_file_get_integer: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_get_integer(self, group_name, key)
      _retval
    end

    def integer_list(group_name : ::String, key : ::String, length : UInt64) : Enumerable(Int32)
      # g_key_file_get_integer_list: (Method | Throws)
      # @length: (out) (transfer full)
      # Returns: (transfer container)

      _retval = LibGLib.g_key_file_get_integer_list(self, group_name, key, length)
      _retval
    end

    def keys(group_name : ::String) : Enumerable(::String)
      # g_key_file_get_keys: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      length = Pointer(UInt64).null

      _retval = LibGLib.g_key_file_get_keys(self, group_name, length)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def locale_for_key(group_name : ::String, key : ::String, locale : ::String?) : ::String?
      # g_key_file_get_locale_for_key: (Method)
      # @locale: (nullable)
      # Returns: (transfer full)

      locale = if locale.nil?
                 Pointer(LibC::Char).null
               else
                 locale.to_unsafe
               end

      _retval = LibGLib.g_key_file_get_locale_for_key(self, group_name, key, locale)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def locale_string(group_name : ::String, key : ::String, locale : ::String?) : ::String
      # g_key_file_get_locale_string: (Method | Throws)
      # @locale: (nullable)
      # Returns: (transfer full)

      locale = if locale.nil?
                 Pointer(LibC::Char).null
               else
                 locale.to_unsafe
               end

      _retval = LibGLib.g_key_file_get_locale_string(self, group_name, key, locale)
      GICrystal.transfer_full(_retval)
    end

    def locale_string_list(group_name : ::String, key : ::String, locale : ::String?) : Enumerable(::String)
      # g_key_file_get_locale_string_list: (Method | Throws)
      # @locale: (nullable)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      length = Pointer(UInt64).null
      locale = if locale.nil?
                 Pointer(LibC::Char).null
               else
                 locale.to_unsafe
               end

      _retval = LibGLib.g_key_file_get_locale_string_list(self, group_name, key, locale, length)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def start_group : ::String?
      # g_key_file_get_start_group: (Method)
      # Returns: (transfer full)

      _retval = LibGLib.g_key_file_get_start_group(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def string(group_name : ::String, key : ::String) : ::String
      # g_key_file_get_string: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGLib.g_key_file_get_string(self, group_name, key)
      GICrystal.transfer_full(_retval)
    end

    def string_list(group_name : ::String, key : ::String) : Enumerable(::String)
      # g_key_file_get_string_list: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      length = Pointer(UInt64).null

      _retval = LibGLib.g_key_file_get_string_list(self, group_name, key, length)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def uint64(group_name : ::String, key : ::String) : UInt64
      # g_key_file_get_uint64: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_get_uint64(self, group_name, key)
      _retval
    end

    def value(group_name : ::String, key : ::String) : ::String
      # g_key_file_get_value: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGLib.g_key_file_get_value(self, group_name, key)
      GICrystal.transfer_full(_retval)
    end

    def has_group(group_name : ::String) : Bool
      # g_key_file_has_group: (Method)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_has_group(self, group_name)
      GICrystal.to_bool(_retval)
    end

    def load_from_data(data : ::String, length : UInt64, flags : GLib::KeyFileFlags) : Bool
      # g_key_file_load_from_data: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_load_from_data(self, data, length, flags)
      GICrystal.to_bool(_retval)
    end

    def load_from_data_dirs(file : ::String, flags : GLib::KeyFileFlags) : Bool
      # g_key_file_load_from_data_dirs: (Method | Throws)
      # @full_path: (out) (transfer full) (optional)
      # Returns: (transfer none)

      full_path = Pointer(Pointer(LibC::Char)).null

      _retval = LibGLib.g_key_file_load_from_data_dirs(self, file, full_path, flags)
      GICrystal.to_bool(_retval)
    end

    def load_from_dirs(file : ::String, search_dirs : Enumerable(::String), flags : GLib::KeyFileFlags) : Bool
      # g_key_file_load_from_dirs: (Method | Throws)
      # @search_dirs: (array zero-terminated=1 element-type Filename)
      # @full_path: (out) (transfer full) (optional)
      # Returns: (transfer none)

      full_path = Pointer(Pointer(LibC::Char)).null
      search_dirs = search_dirs.to_a.map(&.to_unsafe).to_unsafe

      _retval = LibGLib.g_key_file_load_from_dirs(self, file, search_dirs, full_path, flags)
      GICrystal.to_bool(_retval)
    end

    def load_from_file(file : ::String, flags : GLib::KeyFileFlags) : Bool
      # g_key_file_load_from_file: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_load_from_file(self, file, flags)
      GICrystal.to_bool(_retval)
    end

    def remove_comment(group_name : ::String?, key : ::String?) : Bool
      # g_key_file_remove_comment: (Method | Throws)
      # @group_name: (nullable)
      # @key: (nullable)
      # Returns: (transfer none)

      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end
      key = if key.nil?
              Pointer(LibC::Char).null
            else
              key.to_unsafe
            end

      _retval = LibGLib.g_key_file_remove_comment(self, group_name, key)
      GICrystal.to_bool(_retval)
    end

    def remove_group(group_name : ::String) : Bool
      # g_key_file_remove_group: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_remove_group(self, group_name)
      GICrystal.to_bool(_retval)
    end

    def remove_key(group_name : ::String, key : ::String) : Bool
      # g_key_file_remove_key: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_remove_key(self, group_name, key)
      GICrystal.to_bool(_retval)
    end

    def save_to_file(filename : ::String) : Bool
      # g_key_file_save_to_file: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_save_to_file(self, filename)
      GICrystal.to_bool(_retval)
    end

    def set_boolean(group_name : ::String, key : ::String, value : Bool) : Nil
      # g_key_file_set_boolean: (Method)
      # Returns: (transfer none)

      LibGLib.g_key_file_set_boolean(self, group_name, key, value)
    end

    def set_boolean_list(group_name : ::String, key : ::String, list : Enumerable(Bool)) : Nil
      # g_key_file_set_boolean_list: (Method)
      # @list: (array length=length element-type Boolean)
      # Returns: (transfer none)

      length = list.size
      list = list.to_a.to_unsafe

      LibGLib.g_key_file_set_boolean_list(self, group_name, key, list, length)
    end

    def set_comment(group_name : ::String?, key : ::String?, comment : ::String) : Bool
      # g_key_file_set_comment: (Method | Throws)
      # @group_name: (nullable)
      # @key: (nullable)
      # Returns: (transfer none)

      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end
      key = if key.nil?
              Pointer(LibC::Char).null
            else
              key.to_unsafe
            end

      _retval = LibGLib.g_key_file_set_comment(self, group_name, key, comment)
      GICrystal.to_bool(_retval)
    end

    def set_double(group_name : ::String, key : ::String, value : Float64) : Nil
      # g_key_file_set_double: (Method)
      # Returns: (transfer none)

      LibGLib.g_key_file_set_double(self, group_name, key, value)
    end

    def set_double_list(group_name : ::String, key : ::String, list : Enumerable(Float64)) : Nil
      # g_key_file_set_double_list: (Method)
      # @list: (array length=length element-type Double)
      # Returns: (transfer none)

      length = list.size
      list = list.to_a.to_unsafe

      LibGLib.g_key_file_set_double_list(self, group_name, key, list, length)
    end

    def set_int64(group_name : ::String, key : ::String, value : Int64) : Nil
      # g_key_file_set_int64: (Method)
      # Returns: (transfer none)

      LibGLib.g_key_file_set_int64(self, group_name, key, value)
    end

    def set_integer(group_name : ::String, key : ::String, value : Int32) : Nil
      # g_key_file_set_integer: (Method)
      # Returns: (transfer none)

      LibGLib.g_key_file_set_integer(self, group_name, key, value)
    end

    def set_integer_list(group_name : ::String, key : ::String, list : Enumerable(Int32)) : Nil
      # g_key_file_set_integer_list: (Method)
      # @list: (array length=length element-type Int32)
      # Returns: (transfer none)

      length = list.size
      list = list.to_a.to_unsafe

      LibGLib.g_key_file_set_integer_list(self, group_name, key, list, length)
    end

    def list_separator=(separator : Int8) : Nil
      # g_key_file_set_list_separator: (Method)
      # Returns: (transfer none)

      LibGLib.g_key_file_set_list_separator(self, separator)
    end

    def set_locale_string(group_name : ::String, key : ::String, locale : ::String, string : ::String) : Nil
      # g_key_file_set_locale_string: (Method)
      # Returns: (transfer none)

      LibGLib.g_key_file_set_locale_string(self, group_name, key, locale, string)
    end

    def set_locale_string_list(group_name : ::String, key : ::String, locale : ::String, list : Enumerable(::String)) : Nil
      # g_key_file_set_locale_string_list: (Method)
      # @list: (array length=length zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      length = list.size
      list = list.to_a.map(&.to_unsafe).to_unsafe

      LibGLib.g_key_file_set_locale_string_list(self, group_name, key, locale, list, length)
    end

    def set_string(group_name : ::String, key : ::String, string : ::String) : Nil
      # g_key_file_set_string: (Method)
      # Returns: (transfer none)

      LibGLib.g_key_file_set_string(self, group_name, key, string)
    end

    def set_string_list(group_name : ::String, key : ::String, list : Enumerable(::String)) : Nil
      # g_key_file_set_string_list: (Method)
      # @list: (array length=length zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      length = list.size
      list = list.to_a.map(&.to_unsafe).to_unsafe

      LibGLib.g_key_file_set_string_list(self, group_name, key, list, length)
    end

    def set_uint64(group_name : ::String, key : ::String, value : UInt64) : Nil
      # g_key_file_set_uint64: (Method)
      # Returns: (transfer none)

      LibGLib.g_key_file_set_uint64(self, group_name, key, value)
    end

    def set_value(group_name : ::String, key : ::String, value : ::String) : Nil
      # g_key_file_set_value: (Method)
      # Returns: (transfer none)

      LibGLib.g_key_file_set_value(self, group_name, key, value)
    end

    def to_data : ::String
      # g_key_file_to_data: (Method | Throws)
      # @length: (out) (transfer full) (optional)
      # Returns: (transfer full)

      length = Pointer(UInt64).null

      _retval = LibGLib.g_key_file_to_data(self, length)
      GICrystal.transfer_full(_retval)
    end

    def unref : Nil
      # g_key_file_unref: (Method)
      # Returns: (transfer none)

      LibGLib.g_key_file_unref(self)
    end

    def self.error_quark : UInt32
      # g_key_file_error_quark: (None)
      # Returns: (transfer none)

      _retval = LibGLib.g_key_file_error_quark
      _retval
    end

    def to_unsafe
      @pointer
    end
  end
end
