require "../g_object-2.0/object"

module Gio
  # #GMenuLinkIter is an opaque structure type.  You must access it using
  # the functions below.
  class MenuLinkIter < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_menu_link_iter_get_type
    end

    def name : ::String
      # g_menu_link_iter_get_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_menu_link_iter_get_name(self)

      # Return value handling
      ::String.new(_retval)
    end

    def next : Bool
      # g_menu_link_iter_get_next: (Method)
      # @out_link: (out) (optional)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      out_link = Pointer(Pointer(LibC::Char)).null
      value = Pointer(Pointer(Void)).null

      # C call
      _retval = LibGio.g_menu_link_iter_get_next(self, out_link, value)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def value : Gio::MenuModel
      # g_menu_link_iter_get_value: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_menu_link_iter_get_value(self)

      # Return value handling
      Gio::MenuModel.new(_retval, GICrystal::Transfer::Full)
    end

    def _next : Bool
      # g_menu_link_iter_next: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_menu_link_iter_next(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end
  end
end
