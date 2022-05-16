module Gtk
  # The `GtkShortcutManager` interface is used to implement
  # shortcut scopes.
  #
  # This is important for `Gtk#Native` widgets that have their
  # own surface, since the event controllers that are used to implement
  # managed and global scopes are limited to the same native.
  #
  # Examples for widgets implementing `GtkShortcutManager` are
  # `Gtk#Window` and `Gtk#Popover`.
  #
  # Every widget that implements `GtkShortcutManager` will be used as a
  # %GTK_SHORTCUT_SCOPE_MANAGED.
  module ShortcutManager
    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractShortcutManager < GObject::Object
    include ShortcutManager

    GICrystal.define_new_method(Gtk::AbstractShortcutManager, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_shortcut_manager_get_type
    end

    # Cast a `GObject::Object` to `ShortcutManager`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to ShortcutManager")
    end

    # Cast a `GObject::Object` to `ShortcutManager`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
