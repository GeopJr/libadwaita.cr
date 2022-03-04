require "./permission"

module Gio
  # #GSimplePermission is a trivial implementation of #GPermission that
  # represents a permission that is either always or never allowed.  The
  # value is given at construction and doesn't change.
  #
  # Calling request or release will result in errors.
  class SimplePermission < Permission
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, allowed : Bool? = nil, can_acquire : Bool? = nil, can_release : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if allowed
        (_names.to_unsafe + _n).value = "allowed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allowed)
        _n += 1
      end
      if can_acquire
        (_names.to_unsafe + _n).value = "can-acquire".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_acquire)
        _n += 1
      end
      if can_release
        (_names.to_unsafe + _n).value = "can-release".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_release)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SimplePermission.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_simple_permission_get_type
    end

    def initialize(allowed : Bool)
      # g_simple_permission_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_simple_permission_new(allowed)

      # Return value handling
      @pointer = _retval
    end
  end
end
