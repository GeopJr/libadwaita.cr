module GdkPixbuf
  # A `GdkPixbufFormat` contains information about the image format accepted
  # by a module.
  #
  # Only modules should access the fields directly, applications should
  # use the `gdk_pixbuf_format_*` family of functions.
  class PixbufFormat
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGdkPixbuf::PixbufFormat))
      @pointer.copy_from(pointer, sizeof(LibGdkPixbuf::PixbufFormat))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(name : ::String? = nil, signature : GdkPixbuf::PixbufModulePattern? = nil, domain : ::String? = nil, description : ::String? = nil, mime_types : Enumerable(::String)? = nil, extensions : Enumerable(::String)? = nil, flags : UInt32? = nil, disabled : Bool? = nil, license : ::String? = nil)
      _ptr = Pointer(Void).malloc(64)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.name = name unless name.nil?
      _instance.signature = signature unless signature.nil?
      _instance.domain = domain unless domain.nil?
      _instance.description = description unless description.nil?
      _instance.mime_types = mime_types unless mime_types.nil?
      _instance.extensions = extensions unless extensions.nil?
      _instance.flags = flags unless flags.nil?
      _instance.disabled = disabled unless disabled.nil?
      _instance.license = license unless license.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGdkPixbuf::PixbufFormat)).zero?
    end

    def name!
      self.name.not_nil!
    end

    def name : ::String?
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def name=(value : ::String?)
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def signature!
      self.signature.not_nil!
    end

    def signature : GdkPixbuf::PixbufModulePattern?
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      GdkPixbuf::PixbufModulePattern.new(_var.value, GICrystal::Transfer::None)
    end

    def signature=(value : GdkPixbuf::PixbufModulePattern?)
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def domain!
      self.domain.not_nil!
    end

    def domain : ::String?
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def domain=(value : ::String?)
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def description!
      self.description.not_nil!
    end

    def description : ::String?
      _var = (@pointer + 24).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def description=(value : ::String?)
      _var = (@pointer + 24).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def mime_types!
      self.mime_types.not_nil!
    end

    def mime_types : Enumerable(::String)?
      _var = (@pointer + 32).as(Pointer(Pointer(Pointer(LibC::Char))))
      return if _var.value.null?
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def mime_types=(value : Enumerable(::String)?)
      _var = (@pointer + 32).as(Pointer(Pointer(Pointer(LibC::Char)))).value = value.nil? ? Pointer(Pointer(LibC::Char)).null : value
      value
    end

    def extensions!
      self.extensions.not_nil!
    end

    def extensions : Enumerable(::String)?
      _var = (@pointer + 40).as(Pointer(Pointer(Pointer(LibC::Char))))
      return if _var.value.null?
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::None)
    end

    def extensions=(value : Enumerable(::String)?)
      _var = (@pointer + 40).as(Pointer(Pointer(Pointer(LibC::Char)))).value = value.nil? ? Pointer(Pointer(LibC::Char)).null : value
      value
    end

    def flags : UInt32
      _var = (@pointer + 48).as(Pointer(UInt32))
      _var.value
    end

    def flags=(value : UInt32)
      _var = (@pointer + 48).as(Pointer(UInt32)).value = value
      value
    end

    def disabled : Bool
      _var = (@pointer + 52).as(Pointer(LibC::Int))
      GICrystal.to_bool(_var.value)
    end

    def disabled=(value : Bool)
      _var = (@pointer + 52).as(Pointer(LibC::Int)).value = value
      value
    end

    def license!
      self.license.not_nil!
    end

    def license : ::String?
      _var = (@pointer + 56).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def license=(value : ::String?)
      _var = (@pointer + 56).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdkPixbuf.gdk_pixbuf_format_get_type
    end

    def copy : GdkPixbuf::PixbufFormat
      # gdk_pixbuf_format_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_format_copy(@pointer)

      # Return value handling

      GdkPixbuf::PixbufFormat.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # gdk_pixbuf_format_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGdkPixbuf.gdk_pixbuf_format_free(@pointer)

      # Return value handling
    end

    def description : ::String
      # gdk_pixbuf_format_get_description: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_format_get_description(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def extensions : Enumerable(::String)
      # gdk_pixbuf_format_get_extensions: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_format_get_extensions(@pointer)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def license : ::String
      # gdk_pixbuf_format_get_license: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_format_get_license(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def mime_types : Enumerable(::String)
      # gdk_pixbuf_format_get_mime_types: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_format_get_mime_types(@pointer)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    def name : ::String
      # gdk_pixbuf_format_get_name: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_format_get_name(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def is_disabled : Bool
      # gdk_pixbuf_format_is_disabled: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_format_is_disabled(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_save_option_supported(option_key : ::String) : Bool
      # gdk_pixbuf_format_is_save_option_supported: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_format_is_save_option_supported(@pointer, option_key)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_scalable : Bool
      # gdk_pixbuf_format_is_scalable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_format_is_scalable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def is_writable : Bool
      # gdk_pixbuf_format_is_writable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdkPixbuf.gdk_pixbuf_format_is_writable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def disabled=(disabled : Bool) : Nil
      # gdk_pixbuf_format_set_disabled: (Method)
      # Returns: (transfer none)

      # C call
      LibGdkPixbuf.gdk_pixbuf_format_set_disabled(@pointer, disabled)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
