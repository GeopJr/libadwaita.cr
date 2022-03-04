require "./layout_manager"

module Gtk
  # `GtkFixedLayout` is a layout manager which can place child widgets
  # at fixed positions.
  #
  # Most applications should never use this layout manager; fixed positioning
  # and sizing requires constant recalculations on where children need to be
  # positioned and sized. Other layout managers perform this kind of work
  # internally so that application developers don't need to do it. Specifically,
  # widgets positioned in a fixed layout manager will need to take into account:
  #
  # - Themes, which may change widget sizes.
  #
  # - Fonts other than the one you used to write the app will of course
  #   change the size of widgets containing text; keep in mind that
  #   users may use a larger font because of difficulty reading the
  #   default, or they may be using a different OS that provides different
  #   fonts.
  #
  # - Translation of text into other languages changes its size. Also,
  #   display of non-English text will use a different font in many
  #   cases.
  #
  # In addition, `GtkFixedLayout` does not pay attention to text direction and
  # thus may produce unwanted results if your app is run under right-to-left
  # languages such as Hebrew or Arabic. That is: normally GTK will order
  # containers appropriately depending on the text direction, e.g. to put labels
  # to the right of the thing they label when using an RTL language;
  # `GtkFixedLayout` won't be able to do that for you.
  #
  # Finally, fixed positioning makes it kind of annoying to add/remove UI
  # elements, since you have to reposition all the other  elements. This is a
  # long-term maintenance problem for your application.
  class FixedLayout < LayoutManager
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_fixed_layout_get_type
    end

    def initialize
      # gtk_fixed_layout_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_fixed_layout_new

      # Return value handling
      @pointer = _retval
    end
  end
end
