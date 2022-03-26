require "./object"

module GObject
  # The #GBindingGroup can be used to bind multiple properties
  # from an object collectively.
  #
  # Use the various methods to bind properties from a single source
  # object to multiple destination objects. Properties can be bound
  # bidirectionally and are connected when the source object is set
  # with g_binding_group_set_source().
  class BindingGroup < Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, source : GObject::Object? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if source
        (_names.to_unsafe + _n).value = "source".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, source)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BindingGroup.g_type, _n, _names, _values)
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

    def initialize
      # g_binding_group_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGObject.g_binding_group_new

      # Return value handling
      @pointer = _retval
    end

    def bind(source_property : ::String, target : GObject::Object, target_property : ::String, flags : GObject::BindingFlags) : Nil
      # g_binding_group_bind: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_binding_group_bind(self, source_property, target, target_property, flags)

      # Return value handling
    end

    def bind_full(source_property : ::String, target : GObject::Object, target_property : ::String, flags : GObject::BindingFlags, transform_to : GObject::Closure?, transform_from : GObject::Closure?) : Nil
      # g_binding_group_bind_with_closures: (Method)
      # @transform_to: (nullable)
      # @transform_from: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      transform_to = if transform_to.nil?
                       Pointer(Void).null
                     else
                       transform_to.to_unsafe
                     end
      transform_from = if transform_from.nil?
                         Pointer(Void).null
                       else
                         transform_from.to_unsafe
                       end

      # C call
      LibGObject.g_binding_group_bind_with_closures(self, source_property, target, target_property, flags, transform_to, transform_from)

      # Return value handling
    end

    def dup_source : GObject::Object?
      # g_binding_group_dup_source: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGObject.g_binding_group_dup_source(self)

      # Return value handling
      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def source=(source : GObject::Object?) : Nil
      # g_binding_group_set_source: (Method | Setter)
      # @source: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      source = if source.nil?
                 Pointer(Void).null
               else
                 source.to_unsafe
               end

      # C call
      LibGObject.g_binding_group_set_source(self, source)

      # Return value handling
    end
  end
end
