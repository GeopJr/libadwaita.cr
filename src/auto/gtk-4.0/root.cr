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

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_root_get_display(self)

      # Return value handling
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def focus : Gtk::Widget?
      # gtk_root_get_focus: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_root_get_focus(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def focus=(focus : Gtk::Widget?) : Nil
      # gtk_root_set_focus: (Method)
      # @focus: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      focus = if focus.nil?
                Pointer(Void).null
              else
                focus.to_unsafe
              end

      # C call
      LibGtk.gtk_root_set_focus(self, focus)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Root__Impl < GObject::Object
    include Root

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_root_get_type
    end

    # Cast a `GObject::Object` to `Root`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Root")
    end

    # Cast a `GObject::Object` to `Root`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
