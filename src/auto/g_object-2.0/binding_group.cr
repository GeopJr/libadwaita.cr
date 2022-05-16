require "./object"

module GObject
  # The #GBindingGroup can be used to bind multiple properties
  # from an object collectively.
  #
  # Use the various methods to bind properties from a single source
  # object to multiple destination objects. Properties can be bound
  # bidirectionally and are connected when the source object is set
  # with g_binding_group_set_source().
  @[GObject::GeneratedWrapper]
  class BindingGroup < Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGObject::BindingGroup), instance_init, 0)
    end

    GICrystal.define_new_method(BindingGroup, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `BindingGroup`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, source : GObject::Object? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !source.nil?
        (_names.to_unsafe + _n).value = "source".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, source)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BindingGroup.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_binding_group_get_type
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

    # Creates a new #GBindingGroup.
    def initialize
      # g_binding_group_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGObject.g_binding_group_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a binding between @source_property on the source object
    # and @target_property on @target. Whenever the @source_property
    # is changed the @target_property is updated using the same value.
    # The binding flag %G_BINDING_SYNC_CREATE is automatically specified.
    #
    # See g_object_bind_property() for more information.
    def bind(source_property : ::String, target : GObject::Object, target_property : ::String, flags : GObject::BindingFlags) : Nil
      # g_binding_group_bind: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_binding_group_bind(@pointer, source_property, target, target_property, flags)

      # Return value handling
    end

    # Creates a binding between @source_property on the source object and
    # @target_property on @target, allowing you to set the transformation
    # functions to be used by the binding. The binding flag
    # %G_BINDING_SYNC_CREATE is automatically specified.
    #
    # See g_object_bind_property_full() for more information.
    def bind_full(source_property : ::String, target : GObject::Object, target_property : ::String, flags : GObject::BindingFlags, transform_to : GObject::Closure?, transform_from : GObject::Closure?) : Nil
      # g_binding_group_bind_with_closures: (Method)
      # @transform_to: (nullable)
      # @transform_from: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      transform_to = if transform_to.nil?
                       Pointer(Void).null
                     else
                       transform_to.to_unsafe
                     end
      # Generator::NullableArrayPlan
      transform_from = if transform_from.nil?
                         Pointer(Void).null
                       else
                         transform_from.to_unsafe
                       end

      # C call
      LibGObject.g_binding_group_bind_with_closures(@pointer, source_property, target, target_property, flags, transform_to, transform_from)

      # Return value handling
    end

    # Gets the source object used for binding properties.
    def dup_source : GObject::Object?
      # g_binding_group_dup_source: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_binding_group_dup_source(@pointer)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets @source as the source object used for creating property
    # bindings. If there is already a source object all bindings from it
    # will be removed.
    #
    # Note that all properties that have been bound must exist on @source.
    def source=(source : GObject::Object?) : Nil
      # g_binding_group_set_source: (Method | Setter)
      # @source: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      source = if source.nil?
                 Pointer(Void).null
               else
                 source.to_unsafe
               end

      # C call
      LibGObject.g_binding_group_set_source(@pointer, source)

      # Return value handling
    end
  end
end
