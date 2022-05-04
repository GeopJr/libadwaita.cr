require "../g_object-2.0/object"

module Gio
  # #GMenuLinkIter is an opaque structure type.  You must access it using
  # the functions below.
  @[GObject::GeneratedWrapper]
  class MenuLinkIter < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::MenuLinkIterClass), class_init,
        sizeof(LibGio::MenuLinkIter), instance_init, 0)
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
      LibGio.g_menu_link_iter_get_type
    end

    # Gets the name of the link at the current iterator position.
    #
    # The iterator is not advanced.
    def name : ::String
      # g_menu_link_iter_get_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_menu_link_iter_get_name(self)

      # Return value handling

      ::String.new(_retval)
    end

    # This function combines g_menu_link_iter_next() with
    # g_menu_link_iter_get_name() and g_menu_link_iter_get_value().
    #
    # First the iterator is advanced to the next (possibly first) link.
    # If that fails, then %FALSE is returned and there are no other effects.
    #
    # If successful, @out_link and @value are set to the name and #GMenuModel
    # of the link that has just been advanced to.  At this point,
    # g_menu_link_iter_get_name() and g_menu_link_iter_get_value() will return the
    # same values again.
    #
    # The value returned in @out_link remains valid for as long as the iterator
    # remains at the current position.  The value returned in @value must
    # be unreffed using g_object_unref() when it is no longer in use.
    def next : Bool
      # g_menu_link_iter_get_next: (Method)
      # @out_link: (out) (optional)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      out_link = Pointer(Pointer(LibC::Char)).null # Generator::OutArgUsedInReturnPlan
      value = Pointer(Pointer(Void)).null
      # C call
      _retval = LibGio.g_menu_link_iter_get_next(self, out_link, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the linked #GMenuModel at the current iterator position.
    #
    # The iterator is not advanced.
    def value : Gio::MenuModel
      # g_menu_link_iter_get_value: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_menu_link_iter_get_value(self)

      # Return value handling

      Gio::MenuModel.new(_retval, GICrystal::Transfer::Full)
    end

    # Attempts to advance the iterator to the next (possibly first)
    # link.
    #
    # %TRUE is returned on success, or %FALSE if there are no more links.
    #
    # You must call this function when you first acquire the iterator to
    # advance it to the first link (and determine if the first link exists
    # at all).
    def _next : Bool
      # g_menu_link_iter_next: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_menu_link_iter_next(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
