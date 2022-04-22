require "./layout_manager"

module Gtk
  # `GtkCustomLayout` uses closures for size negotiation.
  #
  # A `GtkCustomLayout `uses closures matching to the old `GtkWidget`
  # virtual functions for size negotiation, as a convenience API to
  # ease the porting towards the corresponding `GtkLayoutManager
  # virtual functions.
  @[GObject::GeneratedWrapper]
  class CustomLayout < LayoutManager
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::CustomLayoutClass), class_init,
        sizeof(LibGtk::CustomLayout), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_custom_layout_get_type
    end

    # Creates a new legacy layout manager.
    #
    # Legacy layout managers map to the old `GtkWidget` size negotiation
    # virtual functions, and are meant to be used during the transition
    # from layout containers to layout manager delegates.
    def initialize(request_mode : Pointer(Void)?, measure : Pointer(Void), allocate : Pointer(Void))
      # gtk_custom_layout_new: (Constructor)
      # @request_mode: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      request_mode = if request_mode.nil?
                       LibGtk::CustomRequestModeFunc.null
                     else
                       request_mode.to_unsafe
                     end

      # C call
      _retval = LibGtk.gtk_custom_layout_new(request_mode, measure, allocate)

      # Return value handling

      @pointer = _retval
    end
  end
end
