require "./layout_child"

module Gtk
  # `GtkLayoutChild` subclass for children in a `GtkOverlayLayout`.
  class OverlayLayoutChild < LayoutChild
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child_widget : Gtk::Widget? = nil, clip_overlay : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, measure : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if child_widget
        (_names.to_unsafe + _n).value = "child-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_widget)
        _n += 1
      end
      if clip_overlay
        (_names.to_unsafe + _n).value = "clip-overlay".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, clip_overlay)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if measure
        (_names.to_unsafe + _n).value = "measure".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, measure)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(OverlayLayoutChild.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_overlay_layout_child_get_type
    end

    def clip_overlay=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "clip-overlay", unsafe_value, Pointer(Void).null)
      value
    end

    def clip_overlay? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "clip-overlay", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def measure=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "measure", unsafe_value, Pointer(Void).null)
      value
    end

    def measure? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "measure", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def clip_overlay : Bool
      # gtk_overlay_layout_child_get_clip_overlay: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_overlay_layout_child_get_clip_overlay(self)
      GICrystal.to_bool(_retval)
    end

    def measure : Bool
      # gtk_overlay_layout_child_get_measure: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_overlay_layout_child_get_measure(self)
      GICrystal.to_bool(_retval)
    end

    def clip_overlay=(clip_overlay : Bool) : Nil
      # gtk_overlay_layout_child_set_clip_overlay: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_overlay_layout_child_set_clip_overlay(self, clip_overlay)
    end

    def measure=(measure : Bool) : Nil
      # gtk_overlay_layout_child_set_measure: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_overlay_layout_child_set_measure(self, measure)
    end
  end
end
