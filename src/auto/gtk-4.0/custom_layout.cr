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
      LibGtk.gtk_custom_layout_get_type
    end

    # Creates a new legacy layout manager.
    #
    # Legacy layout managers map to the old `GtkWidget` size negotiation
    # virtual functions, and are meant to be used during the transition
    # from layout containers to layout manager delegates.
    def initialize(request_mode : Gtk::CustomRequestModeFunc?, measure : Gtk::CustomMeasureFunc, allocate : Gtk::CustomAllocateFunc)
      # gtk_custom_layout_new: (Constructor)
      # @request_mode: (nullable)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_custom_layout_new(request_mode, measure, allocate)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end
