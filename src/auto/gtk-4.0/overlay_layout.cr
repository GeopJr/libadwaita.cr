require "./layout_manager"

module Gtk
  # `GtkOverlayLayout` is the layout manager used by `GtkOverlay`.
  #
  # It places widgets as overlays on top of the main child.
  #
  # This is not a reusable layout manager, since it expects its widget
  # to be a `GtkOverlay`. It only listed here so that its layout
  # properties get documented.
  class OverlayLayout < LayoutManager
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_overlay_layout_get_type
    end

    def initialize
      # gtk_overlay_layout_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_overlay_layout_new
      @pointer = _retval
    end
  end
end
