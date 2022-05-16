module Gio
  # #GDesktopAppInfoLookup is an opaque data structure and can only be accessed
  # using the following functions.
  module DesktopAppInfoLookup
    def default_for_uri_scheme(uri_scheme : ::String) : Gio::AppInfo?
      # g_desktop_app_info_lookup_get_default_for_uri_scheme: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_desktop_app_info_lookup_get_default_for_uri_scheme(@pointer, uri_scheme)

      # Return value handling

      Gio::AbstractAppInfo.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractDesktopAppInfoLookup < GObject::Object
    include DesktopAppInfoLookup

    GICrystal.define_new_method(Gio::AbstractDesktopAppInfoLookup, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_desktop_app_info_lookup_get_type
    end

    # Cast a `GObject::Object` to `DesktopAppInfoLookup`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DesktopAppInfoLookup")
    end

    # Cast a `GObject::Object` to `DesktopAppInfoLookup`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
