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

    GICrystal.define_new_method(MultiSorter, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `MultiSorter`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_multi_sorter_get_type
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
      LibGtk.gtk_multi_sorter_append(@pointer, sorter)

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
      LibGtk.gtk_multi_sorter_remove(@pointer, position)

      # Return value handling
    end
  end
end
