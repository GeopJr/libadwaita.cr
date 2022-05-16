module Gio
  # #GStaticResource is an opaque data structure and can only be accessed
  # using the following functions.
  class StaticResource
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::StaticResource))
      @pointer.copy_from(pointer, sizeof(LibGio::StaticResource))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(data : Pointer(UInt8)? = nil, data_len : UInt64? = nil, resource : Gio::Resource? = nil, next _next : Gio::StaticResource? = nil, padding : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(40)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.data = data unless data.nil?
      _instance.data_len = data_len unless data_len.nil?
      _instance.resource = resource unless resource.nil?
      _instance.next = _next unless _next.nil?
      _instance.padding = padding unless padding.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::StaticResource)).zero?
    end

    def data!
      self.data.not_nil!
    end

    def data : Pointer(UInt8)?
      _var = (@pointer + 0).as(Pointer(Pointer(UInt8)))
      return if _var.value.null?
      _var.value
    end

    def data=(value : Pointer(UInt8)?)
      _var = (@pointer + 0).as(Pointer(Pointer(UInt8))).value = value.nil? ? Pointer(UInt8).null : value
      value
    end

    def data_len : UInt64
      _var = (@pointer + 8).as(Pointer(UInt64))
      _var.value
    end

    def data_len=(value : UInt64)
      _var = (@pointer + 8).as(Pointer(UInt64)).value = value
      value
    end

    def resource!
      self.resource.not_nil!
    end

    def resource : Gio::Resource?
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      Gio::Resource.new(_var.value, GICrystal::Transfer::None)
    end

    def resource=(value : Gio::Resource?)
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def next!
      self.next.not_nil!
    end

    def next : Gio::StaticResource?
      _var = (@pointer + 24).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      Gio::StaticResource.new(_var.value, GICrystal::Transfer::None)
    end

    def next=(value : Gio::StaticResource?)
      _var = (@pointer + 24).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def padding!
      self.padding.not_nil!
    end

    def padding : Pointer(Void)?
      _var = (@pointer + 32).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def padding=(value : Pointer(Void)?)
      _var = (@pointer + 32).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def fini : Nil
      # g_static_resource_fini: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_static_resource_fini(@pointer)

      # Return value handling
    end

    def resource : Gio::Resource
      # g_static_resource_get_resource: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_static_resource_get_resource(@pointer)

      # Return value handling

      Gio::Resource.new(_retval, GICrystal::Transfer::None)
    end

    def init : Nil
      # g_static_resource_init: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_static_resource_init(@pointer)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
