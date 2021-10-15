module Gtk
  # `GtkAppChooser` is an interface for widgets which allow the user to
  # choose an application.
  #
  # The main objects that implement this interface are
  # [class@Gtk.AppChooserWidget],
  # [class@Gtk.AppChooserDialog] and [class@Gtk.AppChooserButton].
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
  # use [method@Gtk.AppChooser.get_app_info].
  module AppChooser
    def content_type=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "content-type", unsafe_value, Pointer(Void).null)
      value
    end

    def app_info : Gio::AppInfo?
      # gtk_app_chooser_get_app_info: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_app_chooser_get_app_info(self)
      Gio::AppInfo__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def content_type : ::String
      # gtk_app_chooser_get_content_type: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_app_chooser_get_content_type(self)
      GICrystal.transfer_full(_retval)
    end

    def refresh : Nil
      # gtk_app_chooser_refresh: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_app_chooser_refresh(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class AppChooser__Impl
    include AppChooser

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_app_chooser_get_type
    end

    # Cast a `GObject::Object` to `AppChooser`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to AppChooser")
    end

    # Cast a `GObject::Object` to `AppChooser`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
