require "../g_object-2.0/type_module"
require "../g_object-2.0/type_plugin"

module Gio
  # Provides an interface and default functions for loading and unloading
  # modules. This is used internally to make GIO extensible, but can also
  # be used by others to implement module loading.
  @[GObject::GeneratedWrapper]
  class IOModule < GObject::TypeModule
    include GObject::TypePlugin

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::IOModuleClass), class_init,
        sizeof(LibGio::IOModule), instance_init, 0)
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

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_io_module_get_type
    end

    # Creates a new GIOModule that will load the specific
    # shared library when in use.
    def initialize(filename : ::String)
      # g_io_module_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_io_module_new(filename)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Optional API for GIO modules to implement.
    #
    # Should return a list of all the extension points that may be
    # implemented in this module.
    #
    # This method will not be called in normal use, however it may be
    # called when probing existing modules and recording which extension
    # points that this model is used for. This means we won't have to
    # load and initialize this module unless its needed.
    #
    # If this function is not implemented by the module the module will
    # always be loaded, initialized and then unloaded on application
    # startup so that it can register its extension points during init.
    #
    # Note that a module need not actually implement all the extension
    # points that g_io_module_query() returns, since the exact list of
    # extension may depend on runtime issues. However all extension
    # points actually implemented must be returned by g_io_module_query()
    # (if defined).
    #
    # When installing a module that implements g_io_module_query() you must
    # run gio-querymodules in order to build the cache files required for
    # lazy loading.
    #
    # Since 2.56, this function should be named `g_io_<modulename>_query`, where
    # `modulename` is the plugin’s filename with the `lib` or `libgio` prefix and
    # everything after the first dot removed, and with `-` replaced with `_`
    # throughout. For example, `libgiognutls-helper.so` becomes `gnutls_helper`.
    # Using the new symbol names avoids name clashes when building modules
    # statically. The old symbol names continue to be supported, but cannot be used
    # for static builds.
    def self.query : Enumerable(::String)
      # g_io_module_query: (None)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_io_module_query

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Required API for GIO modules to implement.
    #
    # This function is run after the module has been loaded into GIO,
    # to initialize the module. Typically, this function will call
    # g_io_extension_point_implement().
    #
    # Since 2.56, this function should be named `g_io_<modulename>_load`, where
    # `modulename` is the plugin’s filename with the `lib` or `libgio` prefix and
    # everything after the first dot removed, and with `-` replaced with `_`
    # throughout. For example, `libgiognutls-helper.so` becomes `gnutls_helper`.
    # Using the new symbol names avoids name clashes when building modules
    # statically. The old symbol names continue to be supported, but cannot be used
    # for static builds.
    def load : Nil
      # g_io_module_load: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_io_module_load(self)

      # Return value handling
    end

    # Required API for GIO modules to implement.
    #
    # This function is run when the module is being unloaded from GIO,
    # to finalize the module.
    #
    # Since 2.56, this function should be named `g_io_<modulename>_unload`, where
    # `modulename` is the plugin’s filename with the `lib` or `libgio` prefix and
    # everything after the first dot removed, and with `-` replaced with `_`
    # throughout. For example, `libgiognutls-helper.so` becomes `gnutls_helper`.
    # Using the new symbol names avoids name clashes when building modules
    # statically. The old symbol names continue to be supported, but cannot be used
    # for static builds.
    def unload : Nil
      # g_io_module_unload: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_io_module_unload(self)

      # Return value handling
    end
  end
end
