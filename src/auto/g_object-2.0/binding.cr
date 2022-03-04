require "./object"

module GObject
  # #GBinding is the representation of a binding between a property on a
  # #GObject instance (or source) and another property on another #GObject
  # instance (or target).
  #
  # Whenever the source property changes, the same value is applied to the
  # target property; for instance, the following binding:
  #
  # |[<!-- language="C" -->
  #   g_object_bind_property (object1, "property-a",
  #                           object2, "property-b",
  #                           G_BINDING_DEFAULT);
  # ]|
  #
  # will cause the property named "property-b" of @object2 to be updated
  # every time g_object_set() or the specific accessor changes the value of
  # the property "property-a" of @object1.
  #
  # It is possible to create a bidirectional binding between two properties
  # of two #GObject instances, so that if either property changes, the
  # other is updated as well, for instance:
  #
  # |[<!-- language="C" -->
  #   g_object_bind_property (object1, "property-a",
  #                           object2, "property-b",
  #                           G_BINDING_BIDIRECTIONAL);
  # ]|
  #
  # will keep the two properties in sync.
  #
  # It is also possible to set a custom transformation function (in both
  # directions, in case of a bidirectional binding) to apply a custom
  # transformation from the source value to the target value before
  # applying it; for instance, the following binding:
  #
  # |[<!-- language="C" -->
  #   g_object_bind_property_full (adjustment1, "value",
  #                                adjustment2, "value",
  #                                G_BINDING_BIDIRECTIONAL,
  #                                celsius_to_fahrenheit,
  #                                fahrenheit_to_celsius,
  #                                NULL, NULL);
  # ]|
  #
  # will keep the "value" property of the two adjustments in sync; the
  # @celsius_to_fahrenheit function will be called whenever the "value"
  # property of @adjustment1 changes and will transform the current value
  # of the property before applying it to the "value" property of @adjustment2.
  #
  # Vice versa, the @fahrenheit_to_celsius function will be called whenever
  # the "value" property of @adjustment2 changes, and will transform the
  # current value of the property before applying it to the "value" property
  # of @adjustment1.
  #
  # Note that #GBinding does not resolve cycles by itself; a cycle like
  #
  # |[
  #   object1:propertyA -> object2:propertyB
  #   object2:propertyB -> object3:propertyC
  #   object3:propertyC -> object1:propertyA
  # ]|
  #
  # might lead to an infinite loop. The loop, in this particular case,
  # can be avoided if the objects emit the #GObject::notify signal only
  # if the value has effectively been changed. A binding is implemented
  # using the #GObject::notify signal, so it is susceptible to all the
  # various ways of blocking a signal emission, like g_signal_stop_emission()
  # or g_signal_handler_block().
  #
  # A binding will be severed, and the resources it allocates freed, whenever
  # either one of the #GObject instances it refers to are finalized, or when
  # the #GBinding instance loses its last reference.
  #
  # Bindings for languages with garbage collection can use
  # g_binding_unbind() to explicitly release a binding between the source
  # and target properties, instead of relying on the last reference on the
  # binding, source, and target instances to drop.
  #
  # #GBinding is available since GObject 2.26
  class Binding < Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, flags : GObject::BindingFlags? = nil, source : GObject::Object? = nil, source_property : ::String? = nil, target : GObject::Object? = nil, target_property : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if flags
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if source
        (_names.to_unsafe + _n).value = "source".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, source)
        _n += 1
      end
      if source_property
        (_names.to_unsafe + _n).value = "source-property".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, source_property)
        _n += 1
      end
      if target
        (_names.to_unsafe + _n).value = "target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target)
        _n += 1
      end
      if target_property
        (_names.to_unsafe + _n).value = "target-property".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target_property)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Binding.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_binding_get_type
    end

    def flags=(value : GObject::BindingFlags) : GObject::BindingFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "flags", unsafe_value, Pointer(Void).null)
      value
    end

    def flags : GObject::BindingFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "flags", pointerof(value), Pointer(Void).null)
      GObject::BindingFlags.from_value(value)
    end

    def source=(value : GObject::Object?) : GObject::Object?
      unsafe_value = value

      LibGObject.g_object_set(self, "source", unsafe_value, Pointer(Void).null)
      value
    end

    def source : GObject::Object?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "source", pointerof(value), Pointer(Void).null)
      GObject::Object.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def source_property=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "source-property", unsafe_value, Pointer(Void).null)
      value
    end

    def source_property : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "source-property", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def target=(value : GObject::Object?) : GObject::Object?
      unsafe_value = value

      LibGObject.g_object_set(self, "target", unsafe_value, Pointer(Void).null)
      value
    end

    def target : GObject::Object?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "target", pointerof(value), Pointer(Void).null)
      GObject::Object.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def target_property=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "target-property", unsafe_value, Pointer(Void).null)
      value
    end

    def target_property : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "target-property", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def dup_source : GObject::Object?
      # g_binding_dup_source: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGObject.g_binding_dup_source(self)

      # Return value handling
      GObject::Object.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def dup_target : GObject::Object?
      # g_binding_dup_target: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGObject.g_binding_dup_target(self)

      # Return value handling
      GObject::Object.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def flags : GObject::BindingFlags
      # g_binding_get_flags: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_binding_get_flags(self)

      # Return value handling
      GObject::BindingFlags.from_value(_retval)
    end

    def source : GObject::Object?
      # g_binding_get_source: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_binding_get_source(self)

      # Return value handling
      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def source_property : ::String
      # g_binding_get_source_property: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_binding_get_source_property(self)

      # Return value handling
      ::String.new(_retval)
    end

    def target : GObject::Object?
      # g_binding_get_target: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_binding_get_target(self)

      # Return value handling
      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def target_property : ::String
      # g_binding_get_target_property: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_binding_get_target_property(self)

      # Return value handling
      ::String.new(_retval)
    end

    def unbind : Nil
      # g_binding_unbind: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_binding_unbind(self)

      # Return value handling
    end
  end
end
