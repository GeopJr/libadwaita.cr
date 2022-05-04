require "../g_object-2.0/object"

module Gio
  # #GMenuAttributeIter is an opaque structure type.  You must access it
  # using the functions below.
  @[GObject::GeneratedWrapper]
  class MenuAttributeIter < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::MenuAttributeIterClass), class_init,
        sizeof(LibGio::MenuAttributeIter), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_menu_attribute_iter_get_type
    end

    # Gets the name of the attribute at the current iterator position, as
    # a string.
    #
    # The iterator is not advanced.
    def name : ::String
      # g_menu_attribute_iter_get_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_menu_attribute_iter_get_name(self)

      # Return value handling

      ::String.new(_retval)
    end

    # This function combines g_menu_attribute_iter_next() with
    # g_menu_attribute_iter_get_name() and g_menu_attribute_iter_get_value().
    #
    # First the iterator is advanced to the next (possibly first) attribute.
    # If that fails, then %FALSE is returned and there are no other
    # effects.
    #
    # If successful, @name and @value are set to the name and value of the
    # attribute that has just been advanced to.  At this point,
    # g_menu_attribute_iter_get_name() and g_menu_attribute_iter_get_value() will
    # return the same values again.
    #
    # The value returned in @name remains valid for as long as the iterator
    # remains at the current position.  The value returned in @value must
    # be unreffed using g_variant_unref() when it is no longer in use.
    def next : Bool
      # g_menu_attribute_iter_get_next: (Method)
      # @out_name: (out) (optional)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      out_name = Pointer(Pointer(LibC::Char)).null # Generator::OutArgUsedInReturnPlan
      value = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGio.g_menu_attribute_iter_get_next(self, out_name, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value of the attribute at the current iterator position.
    #
    # The iterator is not advanced.
    def value : GLib::Variant
      # g_menu_attribute_iter_get_value: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_menu_attribute_iter_get_value(self)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::Full)
    end

    # Attempts to advance the iterator to the next (possibly first)
    # attribute.
    #
    # %TRUE is returned on success, or %FALSE if there are no more
    # attributes.
    #
    # You must call this function when you first acquire the iterator
    # to advance it to the first attribute (and determine if the first
    # attribute exists at all).
    def _next : Bool
      # g_menu_attribute_iter_next: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_menu_attribute_iter_next(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
