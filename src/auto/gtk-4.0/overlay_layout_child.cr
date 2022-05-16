require "./layout_child"

module Gtk
  # `GtkLayoutChild` subclass for children in a `GtkOverlayLayout`.
  @[GObject::GeneratedWrapper]
  class OverlayLayoutChild < LayoutChild
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::OverlayLayoutChildClass), class_init,
        sizeof(LibGtk::OverlayLayoutChild), instance_init, 0)
    end

    GICrystal.define_new_method(OverlayLayoutChild, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `OverlayLayoutChild`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child_widget : Gtk::Widget? = nil, clip_overlay : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, measure : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !child_widget.nil?
        (_names.to_unsafe + _n).value = "child-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_widget)
        _n += 1
      end
      if !clip_overlay.nil?
        (_names.to_unsafe + _n).value = "clip-overlay".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, clip_overlay)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !measure.nil?
        (_names.to_unsafe + _n).value = "measure".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, measure)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(OverlayLayoutChild.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Retrieves whether the child is clipped.
    def clip_overlay : Bool
      # gtk_overlay_layout_child_get_clip_overlay: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_overlay_layout_child_get_clip_overlay(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves whether the child is measured.
    def measure : Bool
      # gtk_overlay_layout_child_get_measure: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_overlay_layout_child_get_measure(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets whether to clip this child.
    def clip_overlay=(clip_overlay : Bool) : Nil
      # gtk_overlay_layout_child_set_clip_overlay: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_overlay_layout_child_set_clip_overlay(@pointer, clip_overlay)

      # Return value handling
    end

    # Sets whether to measure this child.
    def measure=(measure : Bool) : Nil
      # gtk_overlay_layout_child_set_measure: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_overlay_layout_child_set_measure(@pointer, measure)

      # Return value handling
    end
  end
end
