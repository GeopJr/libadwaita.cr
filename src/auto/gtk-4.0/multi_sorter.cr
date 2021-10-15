require "./sorter"
require "../gio-2.0/list_model"

require "./buildable"

module Gtk
  # `GtkMultiSorter` combines multiple sorters by trying them
  # in turn.
  #
  # If the first sorter compares two items as equal,
  # the second is tried next, and so on.
  class MultiSorter < Sorter
    include Gio::ListModel
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_multi_sorter_get_type
    end

    def initialize
      # gtk_multi_sorter_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_multi_sorter_new
      @pointer = _retval
    end

    def append(sorter : Gtk::Sorter) : Nil
      # gtk_multi_sorter_append: (Method)
      # @sorter: (transfer full)
      # Returns: (transfer none)

      LibGObject.g_object_ref(sorter)

      LibGtk.gtk_multi_sorter_append(self, sorter)
    end

    def remove(position : UInt32) : Nil
      # gtk_multi_sorter_remove: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_multi_sorter_remove(self, position)
    end
  end
end
