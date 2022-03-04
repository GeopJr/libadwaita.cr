module Gio
  # #GIOExtension is an opaque data structure and can only be accessed
  # using the following functions.
  class IOExtension
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = pointer
    end

    def finalize
    end

    def name : ::String
      # g_io_extension_get_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_io_extension_get_name(self)

      # Return value handling
      ::String.new(_retval)
    end

    def priority : Int32
      # g_io_extension_get_priority: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_io_extension_get_priority(self)

      # Return value handling
      _retval
    end

    def type : UInt64
      # g_io_extension_get_type: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_io_extension_get_type(self)

      # Return value handling
      _retval
    end

    def to_unsafe
      @pointer
    end
  end
end
