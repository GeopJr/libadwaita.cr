require "./layout_manager"

module Gtk
  # `GtkBinLayout` is a `GtkLayoutManager` subclass useful for create "bins" of
  # widgets.
  #
  # `GtkBinLayout` will stack each child of a widget on top of each other,
  # using the [property@Gtk.Widget:hexpand], [property@Gtk.Widget:vexpand],
  # [property@Gtk.Widget:halign], and [property@Gtk.Widget:valign] properties
  # of each child to determine where they should be positioned.
  class BinLayout < LayoutManager
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_bin_layout_get_type
    end

    def initialize
      # gtk_bin_layout_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_bin_layout_new
      @pointer = _retval
    end
  end
end
