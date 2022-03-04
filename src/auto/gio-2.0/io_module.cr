require "../g_object-2.0/type_module"
require "../g_object-2.0/type_plugin"

module Gio
  # Provides an interface and default functions for loading and unloading
  # modules. This is used internally to make GIO extensible, but can also
  # be used by others to implement module loading.
  class IOModule < GObject::TypeModule
    include GObject::TypePlugin

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_io_module_get_type
    end

    def initialize(filename : ::String)
      # g_io_module_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_io_module_new(filename)

      # Return value handling
      @pointer = _retval
    end

    def self.query : Enumerable(::String)
      # g_io_module_query: (None)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGio.g_io_module_query

      # Return value handling
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def load : Nil
      # g_io_module_load: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_io_module_load(self)

      # Return value handling
    end

    def unload : Nil
      # g_io_module_unload: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_io_module_unload(self)

      # Return value handling
    end
  end
end
