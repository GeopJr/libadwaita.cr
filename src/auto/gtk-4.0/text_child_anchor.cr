require "../g_object-2.0/object"

module Gtk
  # A `GtkTextChildAnchor` is a spot in a `GtkTextBuffer` where child widgets can
  # be “anchored”.
  #
  # The anchor can have multiple widgets anchored, to allow for multiple views.
  class TextChildAnchor < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_text_child_anchor_get_type
    end

    def initialize
      # gtk_text_child_anchor_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_text_child_anchor_new
      @pointer = _retval
    end

    def deleted? : Bool
      # gtk_text_child_anchor_get_deleted: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_child_anchor_get_deleted(self)
      GICrystal.to_bool(_retval)
    end

    def widgets(out_len : UInt32) : Enumerable(Gtk::Widget)
      # gtk_text_child_anchor_get_widgets: (Method)
      # @out_len: (out) (transfer full)
      # Returns: (transfer container)

      _retval = LibGtk.gtk_text_child_anchor_get_widgets(self, out_len)
      _retval
    end
  end
end
