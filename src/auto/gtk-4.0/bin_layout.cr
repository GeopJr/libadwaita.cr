require "./layout_manager"

module Gtk
  # `GtkBinLayout` is a `GtkLayoutManager` subclass useful for create "bins" of
  # widgets.
  #
  # `GtkBinLayout` will stack each child of a widget on top of each other,
  # using the `Gtk::Widget#hexpand`, `Gtk::Widget#vexpand`,
  # `Gtk::Widget#halign`, and `Gtk::Widget#valign` properties
  # of each child to determine where they should be positioned.
  @[GObject::GeneratedWrapper]
  class BinLayout < LayoutManager
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::BinLayoutClass), class_init,
        sizeof(LibGtk::BinLayout), instance_init, 0)
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
      LibGtk.gtk_bin_layout_get_type
    end

    # Creates a new `GtkBinLayout` instance.
    def initialize
      # gtk_bin_layout_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_bin_layout_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end
