require "./multi_filter"
require "../gio-2.0/list_model"

require "./buildable"

module Gtk
  # `GtkEveryFilter` matches an item when each of its filters matches.
  #
  # To add filters to a `GtkEveryFilter`, use `Gtk::MultiFilter#append`.
  @[GObject::GeneratedWrapper]
  class EveryFilter < MultiFilter
    include Gio::ListModel
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::EveryFilterClass), class_init,
        sizeof(LibGtk::EveryFilter), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_every_filter_get_type
    end

    # Creates a new empty "every" filter.
    #
    # Use `Gtk::MultiFilter#append` to add filters to it.
    #
    # This filter matches an item if each of the filters added to it
    # matches the item. In particular, this means that if no filter
    # has been added to it, the filter matches every item.
    def initialize
      # gtk_every_filter_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_every_filter_new

      # Return value handling

      @pointer = _retval
    end
  end
end
