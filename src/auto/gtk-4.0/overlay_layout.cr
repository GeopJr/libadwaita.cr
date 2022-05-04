require "./layout_manager"

module Gtk
  # `GtkOverlayLayout` is the layout manager used by `GtkOverlay`.
  #
  # It places widgets as overlays on top of the main child.
  #
  # This is not a reusable layout manager, since it expects its widget
  # to be a `GtkOverlay`. It only listed here so that its layout
  # properties get documented.
  @[GObject::GeneratedWrapper]
  class OverlayLayout < LayoutManager
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::OverlayLayoutClass), class_init,
        sizeof(LibGtk::OverlayLayout), instance_init, 0)
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
      LibGtk.gtk_overlay_layout_get_type
    end

    # Creates a new `GtkOverlayLayout` instance.
    def initialize
      # gtk_overlay_layout_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_overlay_layout_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end
