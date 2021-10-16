require "../g_object-2.0/object"
require "./initable"

module Gio
  # #GInetAddressMask represents a range of IPv4 or IPv6 addresses
  # described by a base address and a length indicating how many bits
  # of the base address are relevant for matching purposes. These are
  # often given in string form. Eg, "10.0.0.0/8", or "fe80::/10".
  class InetAddressMask < GObject::Object
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, address : Gio::InetAddress? = nil, family : Gio::SocketFamily? = nil, length : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if address
        (_names.to_unsafe + _n).value = "address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, address)
        _n += 1
      end
      if family
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if length
        (_names.to_unsafe + _n).value = "length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, length)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(InetAddressMask.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_inet_address_mask_get_type
    end

    def address=(value : Gio::InetAddress?) : Gio::InetAddress?
      unsafe_value = value

      LibGObject.g_object_set(self, "address", unsafe_value, Pointer(Void).null)
      value
    end

    def address : Gio::InetAddress?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "address", pointerof(value), Pointer(Void).null)
      Gio::InetAddress.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def family : Gio::SocketFamily
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "family", pointerof(value), Pointer(Void).null)
      Gio::SocketFamily.from_value(value)
    end

    def length=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "length", unsafe_value, Pointer(Void).null)
      value
    end

    def length : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "length", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize(addr : Gio::InetAddress, length : UInt32)
      # g_inet_address_mask_new: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_inet_address_mask_new(addr, length)
      @pointer = _retval
    end

    def self.new_from_string(mask_string : ::String) : Gio::InetAddressMask
      # g_inet_address_mask_new_from_string: (Constructor | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_inet_address_mask_new_from_string(mask_string)
      Gio::InetAddressMask.new(_retval, GICrystal::Transfer::Full)
    end

    def equal(mask2 : Gio::InetAddressMask) : Bool
      # g_inet_address_mask_equal: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_inet_address_mask_equal(self, mask2)
      GICrystal.to_bool(_retval)
    end

    def address : Gio::InetAddress
      # g_inet_address_mask_get_address: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_inet_address_mask_get_address(self)
      Gio::InetAddress.new(_retval, GICrystal::Transfer::None)
    end

    def family : Gio::SocketFamily
      # g_inet_address_mask_get_family: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_inet_address_mask_get_family(self)
      Gio::SocketFamily.from_value(_retval)
    end

    def length : UInt32
      # g_inet_address_mask_get_length: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_inet_address_mask_get_length(self)
      _retval
    end

    def matches(address : Gio::InetAddress) : Bool
      # g_inet_address_mask_matches: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_inet_address_mask_matches(self, address)
      GICrystal.to_bool(_retval)
    end

    def to_string : ::String
      # g_inet_address_mask_to_string: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_inet_address_mask_to_string(self)
      GICrystal.transfer_full(_retval)
    end
  end
end
