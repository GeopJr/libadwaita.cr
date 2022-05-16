module Gtk
  # `GtkBuildable` allows objects to extend and customize their deserialization
  # from ui files.
  #
  # The interface includes methods for setting names and properties of objects,
  # parsing custom tags and constructing child objects.
  #
  # The `GtkBuildable` interface is implemented by all widgets and
  # many of the non-widget objects that are provided by GTK. The
  # main user of this interface is `Gtk#Builder`. There should be
  # very little need for applications to call any of these functions directly.
  #
  # An object only needs to implement this interface if it needs to extend the
  # `GtkBuilder` XML format or run any extra routines at deserialization time.
  module Buildable
    def buildable_id : ::String?
      # gtk_buildable_get_buildable_id: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_buildable_get_buildable_id(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractBuildable < GObject::Object
    include Buildable

    GICrystal.define_new_method(Gtk::AbstractBuildable, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_buildable_get_type
    end

    # Cast a `GObject::Object` to `Buildable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Buildable")
    end

    # Cast a `GObject::Object` to `Buildable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
