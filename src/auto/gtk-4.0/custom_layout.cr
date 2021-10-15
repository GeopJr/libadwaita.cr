require "./layout_manager"

module Gtk
  # `GtkCustomLayout` uses closures for size negotiation.
  #
  # A `GtkCustomLayout `uses closures matching to the old `GtkWidget`
  # virtual functions for size negotiation, as a convenience API to
  # ease the porting towards the corresponding `GtkLayoutManager
  # virtual functions.
  class CustomLayout < LayoutManager
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_custom_layout_get_type
    end

    def initialize(request_mode : Pointer(Void)?, measure : Pointer(Void), allocate : Pointer(Void))
      # gtk_custom_layout_new: (Constructor)
      # @request_mode: (nullable)
      # Returns: (transfer full)

      request_mode = if request_mode.nil?
                       LibGtk::CustomRequestModeFunc.null
                     else
                       request_mode.to_unsafe
                     end

      _retval = LibGtk.gtk_custom_layout_new(request_mode, measure, allocate)
      @pointer = _retval
    end
  end
end
