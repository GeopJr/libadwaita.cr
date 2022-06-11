require "./permission"

module Gio
  # #GSimplePermission is a trivial implementation of #GPermission that
  # represents a permission that is either always or never allowed.  The
  # value is given at construction and doesn't change.
  #
  # Calling request or release will result in errors.
  @[GObject::GeneratedWrapper]
  class SimplePermission < Permission
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(SimplePermission, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SimplePermission`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, allowed : Bool? = nil, can_acquire : Bool? = nil, can_release : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !allowed.nil?
        (_names.to_unsafe + _n).value = "allowed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allowed)
        _n += 1
      end
      if !can_acquire.nil?
        (_names.to_unsafe + _n).value = "can-acquire".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_acquire)
        _n += 1
      end
      if !can_release.nil?
        (_names.to_unsafe + _n).value = "can-release".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_release)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SimplePermission.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_simple_permission_get_type
    end

    # Creates a new #GPermission instance that represents an action that is
    # either always or never allowed.
    def self.new(allowed : Bool) : self
      # g_simple_permission_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_simple_permission_new(allowed)

      # Return value handling

      Gio::SimplePermission.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
