require "./filter"
require "../gio-2.0/list_model"

require "./buildable"

module Gtk
  # `GtkMultiFilter` is the base class for filters that combine multiple filters.
  @[GObject::GeneratedWrapper]
  class MultiFilter < Filter
    include Gio::ListModel
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::MultiFilterClass), class_init,
        sizeof(LibGtk::MultiFilter), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_multi_filter_get_type
    end

    # Adds a @filter to @self to use for matching.
    def append(filter : Gtk::Filter) : Nil
      # gtk_multi_filter_append: (Method)
      # @filter: (transfer full)
      # Returns: (transfer none)

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(filter)
      # C call
      LibGtk.gtk_multi_filter_append(self, filter)

      # Return value handling
    end

    # Removes the filter at the given @position from the list of filters used
    # by @self.
    #
    # If @position is larger than the number of filters, nothing happens and
    # the function returns.
    def remove(position : UInt32) : Nil
      # gtk_multi_filter_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_multi_filter_remove(self, position)

      # Return value handling
    end
  end
end
