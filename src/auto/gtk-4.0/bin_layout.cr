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

    GICrystal.define_new_method(BinLayout, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `BinLayout`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
