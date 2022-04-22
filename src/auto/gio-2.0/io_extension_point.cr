module Gio
  # #GIOExtensionPoint is an opaque data structure and can only be accessed
  # using the following functions.
  class IOExtensionPoint
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = pointer
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::IOExtensionPoint)).zero?
    end

    def extension_by_name(name : ::String) : Gio::IOExtension
      # g_io_extension_point_get_extension_by_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_io_extension_point_get_extension_by_name(self, name)

      # Return value handling

      Gio::IOExtension.new(_retval, GICrystal::Transfer::None)
    end

    def extensions : GLib::List
      # g_io_extension_point_get_extensions: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_io_extension_point_get_extensions(self)

      # Return value handling

      GLib::List(Gio::IOExtension).new(_retval, GICrystal::Transfer::None)
    end

    def required_type : UInt64
      # g_io_extension_point_get_required_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_io_extension_point_get_required_type(self)

      # Return value handling

      _retval
    end

    def required_type=(type : UInt64) : Nil
      # g_io_extension_point_set_required_type: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_io_extension_point_set_required_type(self, type)

      # Return value handling
    end

    def self.implement(extension_point_name : ::String, type : UInt64, extension_name : ::String, priority : Int32) : Gio::IOExtension
      # g_io_extension_point_implement: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_io_extension_point_implement(extension_point_name, type, extension_name, priority)

      # Return value handling

      Gio::IOExtension.new(_retval, GICrystal::Transfer::None)
    end

    def self.lookup(name : ::String) : Gio::IOExtensionPoint
      # g_io_extension_point_lookup: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_io_extension_point_lookup(name)

      # Return value handling

      Gio::IOExtensionPoint.new(_retval, GICrystal::Transfer::None)
    end

    def self.register(name : ::String) : Gio::IOExtensionPoint
      # g_io_extension_point_register: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_io_extension_point_register(name)

      # Return value handling

      Gio::IOExtensionPoint.new(_retval, GICrystal::Transfer::None)
    end

    def to_unsafe
      @pointer
    end
  end
end
