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

    GICrystal.define_new_method(EveryFilter, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `EveryFilter`.
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
      LibGtk.gtk_every_filter_get_type
    end
  end
end
