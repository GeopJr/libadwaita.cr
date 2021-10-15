require "../g_object-2.0/object"
require "./action"

module Gio
  # A #GPropertyAction is a way to get a #GAction with a state value
  # reflecting and controlling the value of a #GObject property.
  #
  # The state of the action will correspond to the value of the property.
  # Changing it will change the property (assuming the requested value
  # matches the requirements as specified in the #GParamSpec).
  #
  # Only the most common types are presently supported.  Booleans are
  # mapped to booleans, strings to strings, signed/unsigned integers to
  # int32/uint32 and floats and doubles to doubles.
  #
  # If the property is an enum then the state will be string-typed and
  # conversion will automatically be performed between the enum value and
  # "nick" string as per the #GEnumValue table.
  #
  # Flags types are not currently supported.
  #
  # Properties of object types, boxed types and pointer types are not
  # supported and probably never will be.
  #
  # Properties of #GVariant types are not currently supported.
  #
  # If the property is boolean-valued then the action will have a NULL
  # parameter type, and activating the action (with no parameter) will
  # toggle the value of the property.
  #
  # In all other cases, the parameter type will correspond to the type of
  # the property.
  #
  # The general idea here is to reduce the number of locations where a
  # particular piece of state is kept (and therefore has to be synchronised
  # between). #GPropertyAction does not have a separate state that is kept
  # in sync with the property value -- its state is the property value.
  #
  # For example, it might be useful to create a #GAction corresponding to
  # the "visible-child-name" property of a #GtkStack so that the current
  # page can be switched from a menu.  The active radio indication in the
  # menu is then directly determined from the active page of the
  # #GtkStack.
  #
  # An anti-example would be binding the "active-id" property on a
  # #GtkComboBox.  This is because the state of the combobox itself is
  # probably uninteresting and is actually being used to control
  # something else.
  #
  # Another anti-example would be to bind to the "visible-child-name"
  # property of a #GtkStack if this value is actually stored in
  # #GSettings.  In that case, the real source of the value is
  # #GSettings.  If you want a #GAction to control a setting stored in
  # #GSettings, see g_settings_create_action() instead, and possibly
  # combine its use with g_settings_bind().
  class PropertyAction < GObject::Object
    include Action

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, enabled : Bool? = nil, invert_boolean : Bool? = nil, name : ::String? = nil, object : GObject::Object? = nil, parameter_type : GLib::VariantType? = nil, property_name : ::String? = nil, state : GLib::Variant? = nil, state_type : GLib::VariantType? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
      _n = 0

      if enabled
        (_names.to_unsafe + _n).value = "enabled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enabled)
        _n += 1
      end
      if invert_boolean
        (_names.to_unsafe + _n).value = "invert-boolean".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, invert_boolean)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if object
        (_names.to_unsafe + _n).value = "object".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, object)
        _n += 1
      end
      if parameter_type
        (_names.to_unsafe + _n).value = "parameter-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parameter_type)
        _n += 1
      end
      if property_name
        (_names.to_unsafe + _n).value = "property-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, property_name)
        _n += 1
      end
      if state
        (_names.to_unsafe + _n).value = "state".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, state)
        _n += 1
      end
      if state_type
        (_names.to_unsafe + _n).value = "state-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, state_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(PropertyAction.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_property_action_get_type
    end

    def enabled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enabled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def invert_boolean=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "invert-boolean", unsafe_value, Pointer(Void).null)
      value
    end

    def invert_boolean? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "invert-boolean", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def object=(value : Object?) : Object?
      unsafe_value = value

      LibGObject.g_object_set(self, "object", unsafe_value, Pointer(Void).null)
      value
    end

    def parameter_type : VariantType?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "parameter-type", pointerof(value), Pointer(Void).null)
      GLib::VariantType.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def property_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "property-name", unsafe_value, Pointer(Void).null)
      value
    end

    def state : Variant?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "state", pointerof(value), Pointer(Void).null)
      GLib::Variant.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def state_type : VariantType?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "state-type", pointerof(value), Pointer(Void).null)
      GLib::VariantType.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize(name : ::String, object : GObject::Object, property_name : ::String)
      # g_property_action_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_property_action_new(name, object, property_name)
      @pointer = _retval
    end
  end
end
