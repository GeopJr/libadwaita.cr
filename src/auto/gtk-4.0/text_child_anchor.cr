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

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_child_anchor_new

      # Return value handling
      @pointer = _retval
    end

    def deleted : Bool
      # gtk_text_child_anchor_get_deleted: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_child_anchor_get_deleted(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def widgets : Enumerable(Gtk::Widget)
      # gtk_text_child_anchor_get_widgets: (Method)
      # @out_len: (out) (transfer full)
      # Returns: (transfer container) (array length=out_len element-type Interface)

      # Handle parameters
      out_len = 0_u32

      # C call
      _retval = LibGtk.gtk_text_child_anchor_get_widgets(self, pointerof(out_len))

      # Return value handling
      GICrystal.transfer_array(_retval, out_len, GICrystal::Transfer::Container)
    end
  end
end
