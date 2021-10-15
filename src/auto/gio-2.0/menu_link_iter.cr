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

      _retval = LibGio.g_menu_link_iter_get_name(self)
      ::String.new(_retval)
    end

    def next : Bool
      # g_menu_link_iter_get_next: (Method)
      # @out_link: (out) (optional)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      out_link = Pointer(Pointer(LibC::Char)).null
      value = Pointer(Pointer(Void)).null

      _retval = LibGio.g_menu_link_iter_get_next(self, out_link, value)
      GICrystal.to_bool(_retval)
    end

    def value : Gio::MenuModel
      # g_menu_link_iter_get_value: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_menu_link_iter_get_value(self)
      Gio::MenuModel.new(_retval, GICrystal::Transfer::Full)
    end

    def _next : Bool
      # g_menu_link_iter_next: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_menu_link_iter_next(self)
      GICrystal.to_bool(_retval)
    end
  end
end
