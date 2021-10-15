require "./multi_filter"
require "../gio-2.0/list_model"

require "./buildable"

module Gtk
  # `GtkAnyFilter` matches an item when at least one of its filters matches.
  #
  # To add filters to a `GtkAnyFilter`, use [method@Gtk.MultiFilter.append].
  class AnyFilter < MultiFilter
    include Gio::ListModel
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_any_filter_get_type
    end

    def initialize
      # gtk_any_filter_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_any_filter_new
      @pointer = _retval
    end
  end
end
