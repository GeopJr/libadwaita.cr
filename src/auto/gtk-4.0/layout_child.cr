require "../g_object-2.0/object"

module Gtk
  # `GtkLayoutChild` is the base class for objects that are meant to hold
  # layout properties.
  #
  # If a `GtkLayoutManager` has per-child properties, like their packing type,
  # or the horizontal and vertical span, or the icon name, then the layout
  # manager should use a `GtkLayoutChild` implementation to store those properties.
  #
  # A `GtkLayoutChild` instance is only ever valid while a widget is part
  # of a layout.
  class LayoutChild < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child_widget : Gtk::Widget? = nil, layout_manager : Gtk::LayoutManager? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if child_widget
        (_names.to_unsafe + _n).value = "child-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_widget)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(LayoutChild.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_layout_child_get_type
    end

    def child_widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "child-widget", unsafe_value, Pointer(Void).null)
      value
    end

    def child_widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "child-widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def layout_manager=(value : Gtk::LayoutManager?) : Gtk::LayoutManager?
      unsafe_value = value

      LibGObject.g_object_set(self, "layout-manager", unsafe_value, Pointer(Void).null)
      value
    end

    def layout_manager : Gtk::LayoutManager?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "layout-manager", pointerof(value), Pointer(Void).null)
      Gtk::LayoutManager.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def child_widget : Gtk::Widget
      # gtk_layout_child_get_child_widget: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_layout_child_get_child_widget(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def layout_manager : Gtk::LayoutManager
      # gtk_layout_child_get_layout_manager: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_layout_child_get_layout_manager(self)
      Gtk::LayoutManager.new(_retval, GICrystal::Transfer::None)
    end
  end
end
