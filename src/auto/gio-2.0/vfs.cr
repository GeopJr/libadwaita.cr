require "../g_object-2.0/object"

module Gio
  # Entry point for using GIO functionality.
  class Vfs < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_vfs_get_type
    end

    def self.default : Gio::Vfs
      # g_vfs_get_default: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_vfs_get_default

      # Return value handling
      Gio::Vfs.new(_retval, GICrystal::Transfer::None)
    end

    def self.local : Gio::Vfs
      # g_vfs_get_local: (None)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_vfs_get_local

      # Return value handling
      Gio::Vfs.new(_retval, GICrystal::Transfer::None)
    end

    def file_for_path(path : ::String) : Gio::File
      # g_vfs_get_file_for_path: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_vfs_get_file_for_path(self, path)

      # Return value handling
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def file_for_uri(uri : ::String) : Gio::File
      # g_vfs_get_file_for_uri: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_vfs_get_file_for_uri(self, uri)

      # Return value handling
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def supported_uri_schemes : Enumerable(::String)
      # g_vfs_get_supported_uri_schemes: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGio.g_vfs_get_supported_uri_schemes(self)

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def is_active : Bool
      # g_vfs_is_active: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_vfs_is_active(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def parse_name(parse_name : ::String) : Gio::File
      # g_vfs_parse_name: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_vfs_parse_name(self, parse_name)

      # Return value handling
      Gio::File__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def register_uri_scheme(scheme : ::String, uri_func : Pointer(Void)?, uri_data : Pointer(Void)?, uri_destroy : Pointer(Void)?, parse_name_func : Pointer(Void)?, parse_name_data : Pointer(Void)?, parse_name_destroy : Pointer(Void)?) : Bool
      # g_vfs_register_uri_scheme: (Method)
      # @uri_func: (nullable)
      # @uri_data: (nullable)
      # @uri_destroy: (nullable)
      # @parse_name_func: (nullable)
      # @parse_name_data: (nullable)
      # @parse_name_destroy: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      uri_func = if uri_func.nil?
                   LibGio::VfsFileLookupFunc.null
                 else
                   uri_func.to_unsafe
                 end
      uri_data = if uri_data.nil?
                   Pointer(Void).null
                 else
                   uri_data.to_unsafe
                 end
      uri_destroy = if uri_destroy.nil?
                      LibGLib::DestroyNotify.null
                    else
                      uri_destroy.to_unsafe
                    end
      parse_name_func = if parse_name_func.nil?
                          LibGio::VfsFileLookupFunc.null
                        else
                          parse_name_func.to_unsafe
                        end
      parse_name_data = if parse_name_data.nil?
                          Pointer(Void).null
                        else
                          parse_name_data.to_unsafe
                        end
      parse_name_destroy = if parse_name_destroy.nil?
                             LibGLib::DestroyNotify.null
                           else
                             parse_name_destroy.to_unsafe
                           end

      # C call
      _retval = LibGio.g_vfs_register_uri_scheme(self, scheme, uri_func, uri_data, uri_destroy, parse_name_func, parse_name_data, parse_name_destroy)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def unregister_uri_scheme(scheme : ::String) : Bool
      # g_vfs_unregister_uri_scheme: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_vfs_unregister_uri_scheme(self, scheme)

      # Return value handling
      GICrystal.to_bool(_retval)
    end
  end
end
