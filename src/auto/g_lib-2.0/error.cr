module GLib
  # The `GError` structure contains information about
  # an error that has occurred.
  class Error
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGLib.g_error_copy(pointer)
                 else
                   pointer
                 end
    end

    def finalize
      # FIXME: calling g_error_free causes a double free here, but WTF is also freeing this!?
      # LibGLib.g_error_free(self)

    end

    def domain : UInt32
      # Property getter
      _var = (@pointer + 0).as(Pointer(UInt32))
      _var.value
    end

    def domain=(value : UInt32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(UInt32)).value = value
      value
    end

    def code : Int32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Int32))
      _var.value
    end

    def code=(value : Int32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Int32)).value = value
      value
    end

    def message : ::String
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      ::String.new(_var.value)
    end

    def message=(value : ::String)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_error_get_type
    end

    def self.new_literal(domain : UInt32, code : Int32, message : ::String) : self
      # g_error_new_literal: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGLib.g_error_new_literal(domain, code, message)

      # Return value handling
      GLib::Error.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # g_error_free: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGLib.g_error_free(self)

      # Return value handling
    end

    def matches(domain : UInt32, code : Int32) : Bool
      # g_error_matches: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGLib.g_error_matches(self, domain, code)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
