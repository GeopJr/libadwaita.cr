module Gtk
  # `GtkAppChooser` is an interface for widgets which allow the user to
  # choose an application.
  #
  # The main objects that implement this interface are
  # `Gtk#AppChooserWidget`,
  # `Gtk#AppChooserDialog` and `Gtk#AppChooserButton`.
  #
  # Applications are represented by GIO `GAppInfo` objects here.
  # GIO has a concept of recommended and fallback applications for a
  # given content type. Recommended applications are those that claim
  # to handle the content type itself, while fallback also includes
  # applications that handle a more generic content type. GIO also
  # knows the default and last-used application for a given content
  # type. The `GtkAppChooserWidget` provides detailed control over
  # whether the shown list of applications should include default,
  # recommended or fallback applications.
  #
  # To obtain the application that has been selected in a `GtkAppChooser`,
  # use `Gtk::AppChooser#app_info`.
  module AppChooser
    def content_type=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "content-type", unsafe_value, Pointer(Void).null)
      value
    end

    def content_type : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "content-type", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def app_info : Gio::AppInfo?
      # gtk_app_chooser_get_app_info: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_app_chooser_get_app_info(@pointer)

      # Return value handling

      Gio::AbstractAppInfo.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def content_type : ::String
      # gtk_app_chooser_get_content_type: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_app_chooser_get_content_type(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def refresh : Nil
      # gtk_app_chooser_refresh: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_app_chooser_refresh(@pointer)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractAppChooser < GObject::Object
    include AppChooser

    GICrystal.define_new_method(Gtk::AbstractAppChooser, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_app_chooser_get_type
    end

    # Cast a `GObject::Object` to `AppChooser`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to AppChooser")
    end

    # Cast a `GObject::Object` to `AppChooser`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
