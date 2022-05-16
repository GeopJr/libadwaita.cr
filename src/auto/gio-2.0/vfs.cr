require "../g_object-2.0/object"

module Gio
  # Entry point for using GIO functionality.
  @[GObject::GeneratedWrapper]
  class Vfs < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::VfsClass), class_init,
        sizeof(LibGio::Vfs), instance_init, 0)
    end

    GICrystal.define_new_method(Vfs, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Vfs`.
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
      LibGio.g_vfs_get_type
    end

    # Gets the default #GVfs for the system.
    def self.default : Gio::Vfs
      # g_vfs_get_default: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_vfs_get_default

      # Return value handling

      Gio::Vfs.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the local #GVfs for the system.
    def self.local : Gio::Vfs
      # g_vfs_get_local: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_vfs_get_local

      # Return value handling

      Gio::Vfs.new(_retval, GICrystal::Transfer::None)
    end

    # Gets a #GFile for @path.
    def file_for_path(path : ::String) : Gio::File
      # g_vfs_get_file_for_path: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_vfs_get_file_for_path(@pointer, path)

      # Return value handling

      Gio::AbstractFile.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets a #GFile for @uri.
    #
    # This operation never fails, but the returned object
    # might not support any I/O operation if the URI
    # is malformed or if the URI scheme is not supported.
    def file_for_uri(uri : ::String) : Gio::File
      # g_vfs_get_file_for_uri: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_vfs_get_file_for_uri(@pointer, uri)

      # Return value handling

      Gio::AbstractFile.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets a list of URI schemes supported by @vfs.
    def supported_uri_schemes : Enumerable(::String)
      # g_vfs_get_supported_uri_schemes: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_vfs_get_supported_uri_schemes(@pointer)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    # Checks if the VFS is active.
    def is_active : Bool
      # g_vfs_is_active: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_vfs_is_active(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This operation never fails, but the returned object might
    # not support any I/O operations if the @parse_name cannot
    # be parsed by the #GVfs module.
    def parse_name(parse_name : ::String) : Gio::File
      # g_vfs_parse_name: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_vfs_parse_name(@pointer, parse_name)

      # Return value handling

      Gio::AbstractFile.new(_retval, GICrystal::Transfer::Full)
    end

    # Registers @uri_func and @parse_name_func as the #GFile URI and parse name
    # lookup functions for URIs with a scheme matching @scheme.
    # Note that @scheme is registered only within the running application, as
    # opposed to desktop-wide as it happens with GVfs backends.
    #
    # When a #GFile is requested with an URI containing @scheme (e.g. through
    # g_file_new_for_uri()), @uri_func will be called to allow a custom
    # constructor. The implementation of @uri_func should not be blocking, and
    # must not call g_vfs_register_uri_scheme() or g_vfs_unregister_uri_scheme().
    #
    # When g_file_parse_name() is called with a parse name obtained from such file,
    # @parse_name_func will be called to allow the #GFile to be created again. In
    # that case, it's responsibility of @parse_name_func to make sure the parse
    # name matches what the custom #GFile implementation returned when
    # g_file_get_parse_name() was previously called. The implementation of
    # @parse_name_func should not be blocking, and must not call
    # g_vfs_register_uri_scheme() or g_vfs_unregister_uri_scheme().
    #
    # It's an error to call this function twice with the same scheme. To unregister
    # a custom URI scheme, use g_vfs_unregister_uri_scheme().
    def register_uri_scheme(scheme : ::String, uri_func : Gio::VfsFileLookupFunc?, uri_data : Pointer(Void)?, uri_destroy : GLib::DestroyNotify?, parse_name_func : Gio::VfsFileLookupFunc?) : Bool
      # g_vfs_register_uri_scheme: (Method)
      # @uri_func: (nullable)
      # @uri_data: (nullable)
      # @uri_destroy: (nullable)
      # @parse_name_func: (nullable)
      # @parse_name_data: (nullable)
      # @parse_name_destroy: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      uri_data = if uri_data.nil?
                   Pointer(Void).null
                 else
                   uri_data.to_unsafe
                 end
      # Generator::CallbackArgPlan
      if parse_name_func
        _box = ::Box.box(parse_name_func)
        parse_name_func = ->(lib_vfs : Pointer(Void), lib_identifier : Pointer(LibC::Char), lib_user_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          vfs = Gio::Vfs.new(lib_vfs, :none)
          # Generator::BuiltInTypeArgPlan
          identifier = ::String.new(lib_identifier)
          ::Box(Proc(Gio::Vfs, ::String, Gio::File)).unbox(lib_user_data).call(vfs, identifier)
        }.pointer
        parse_name_data = GICrystal::ClosureDataManager.register(_box)
        parse_name_destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        parse_name_func = parse_name_data = parse_name_destroy = Pointer(Void).null
      end

      # C call
      _retval = LibGio.g_vfs_register_uri_scheme(@pointer, scheme, uri_func, uri_data, uri_destroy, parse_name_func, parse_name_data, parse_name_destroy)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Unregisters the URI handler for @scheme previously registered with
    # g_vfs_register_uri_scheme().
    def unregister_uri_scheme(scheme : ::String) : Bool
      # g_vfs_unregister_uri_scheme: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_vfs_unregister_uri_scheme(@pointer, scheme)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
