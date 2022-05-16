require "../g_object-2.0/object"
require "./initable"

module Gio
  # #GInetAddressMask represents a range of IPv4 or IPv6 addresses
  # described by a base address and a length indicating how many bits
  # of the base address are relevant for matching purposes. These are
  # often given in string form. Eg, "10.0.0.0/8", or "fe80::/10".
  @[GObject::GeneratedWrapper]
  class InetAddressMask < GObject::Object
    include Initable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::InetAddressMaskClass), class_init,
        sizeof(LibGio::InetAddressMask), instance_init, 0)
    end

    GICrystal.define_new_method(InetAddressMask, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `InetAddressMask`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, address : Gio::InetAddress? = nil, family : Gio::SocketFamily? = nil, length : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !address.nil?
        (_names.to_unsafe + _n).value = "address".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, address)
        _n += 1
      end
      if !family.nil?
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if !length.nil?
        (_names.to_unsafe + _n).value = "length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, length)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(InetAddressMask.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gio::SocketFamily.new(value)
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

    # Creates a new #GInetAddressMask representing all addresses whose
    # first @length bits match @addr.
    def initialize(addr : Gio::InetAddress, length : UInt32)
      # g_inet_address_mask_new: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_inet_address_mask_new(addr, length, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Parses @mask_string as an IP address and (optional) length, and
    # creates a new #GInetAddressMask. The length, if present, is
    # delimited by a "/". If it is not present, then the length is
    # assumed to be the full length of the address.
    def self.new_from_string(mask_string : ::String) : self
      # g_inet_address_mask_new_from_string: (Constructor | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_inet_address_mask_new_from_string(mask_string, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::InetAddressMask.new(_retval, GICrystal::Transfer::Full)
    end

    # Tests if @mask and @mask2 are the same mask.
    def equal(mask2 : Gio::InetAddressMask) : Bool
      # g_inet_address_mask_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_mask_equal(@pointer, mask2)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets @mask's base address
    def address : Gio::InetAddress
      # g_inet_address_mask_get_address: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_mask_get_address(@pointer)

      # Return value handling

      Gio::InetAddress.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the #GSocketFamily of @mask's address
    def family : Gio::SocketFamily
      # g_inet_address_mask_get_family: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_mask_get_family(@pointer)

      # Return value handling

      Gio::SocketFamily.new(_retval)
    end

    # Gets @mask's length
    def length : UInt32
      # g_inet_address_mask_get_length: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_mask_get_length(@pointer)

      # Return value handling

      _retval
    end

    # Tests if @address falls within the range described by @mask.
    def matches(address : Gio::InetAddress) : Bool
      # g_inet_address_mask_matches: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_inet_address_mask_matches(@pointer, address)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Converts @mask back to its corresponding string form.
    def to_string : ::String
      # g_inet_address_mask_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_inet_address_mask_to_string(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end
  end
end
