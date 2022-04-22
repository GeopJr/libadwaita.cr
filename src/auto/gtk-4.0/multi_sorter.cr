require "./sorter"
require "../gio-2.0/list_model"

require "./buildable"

module Gtk
  # `GtkMultiSorter` combines multiple sorters by trying them
  # in turn.
  #
  # If the first sorter compares two items as equal,
  # the second is tried next, and so on.
  @[GObject::GeneratedWrapper]
  class MultiSorter < Sorter
    include Gio::ListModel
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::MultiSorterClass), class_init,
        sizeof(LibGtk::MultiSorter), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_multi_sorter_get_type
    end

    # Creates a new multi sorter.
    #
    # This sorter compares items by trying each of the sorters
    # in turn, until one returns non-zero. In particular, if
    # no sorter has been added to it, it will always compare
    # items as equal.
    def initialize
      # gtk_multi_sorter_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_multi_sorter_new

      # Return value handling

      @pointer = _retval
    end

    # Add @sorter to @self to use for sorting at the end.
    #
    # @self will consult all existing sorters before it will
    # sort with the given @sorter.
    def append(sorter : Gtk::Sorter) : Nil
      # gtk_multi_sorter_append: (Method)
      # @sorter: (transfer full)
      # Returns: (transfer none)

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(sorter)

      # C call
      LibGtk.gtk_multi_sorter_append(self, sorter)

      # Return value handling
    end

    # Removes the sorter at the given @position from the list of sorter
    # used by @self.
    #
    # If @position is larger than the number of sorters, nothing happens.
    def remove(position : UInt32) : Nil
      # gtk_multi_sorter_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_multi_sorter_remove(self, position)

      # Return value handling
    end
  end
end
