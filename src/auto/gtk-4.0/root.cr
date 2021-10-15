module Gtk
  # `GtkRoot` is the interface implemented by all widgets that can act as a toplevel
  # widget.
  #
  # The root widget takes care of providing the connection to the windowing system
  # and manages layout, drawing and event delivery for its widget hierarchy.
  #
  # The obvious example of a `GtkRoot` is `GtkWindow`.
  #
  # To get the display to which a `GtkRoot` belongs, use
  # [method@Gtk.Root.get_display].
  #
  # `GtkRoot` also maintains the location of keyboard focus inside its widget
  # hierarchy, with [method@Gtk.Root.set_focus] and [method@Gtk.Root.get_focus].
  module Root
    def display : Gdk::Display
      # gtk_root_get_display: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_root_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def focus : Gtk::Widget?
      # gtk_root_get_focus: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_root_get_focus(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def focus=(focus : Gtk::Widget?) : Nil
      # gtk_root_set_focus: (Method)
      # @focus: (nullable)
      # Returns: (transfer none)

      focus = if focus.nil?
                Pointer(Void).null
              else
                focus.to_unsafe
              end

      LibGtk.gtk_root_set_focus(self, focus)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Root__Impl
    include Root

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
      LibGtk.gtk_root_get_type
    end

    # Cast a `GObject::Object` to `Root`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Root")
    end

    # Cast a `GObject::Object` to `Root`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
