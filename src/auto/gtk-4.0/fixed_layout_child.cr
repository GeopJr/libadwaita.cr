require "./layout_child"

module Gtk
  # `GtkLayoutChild` subclass for children in a `GtkFixedLayout`.
  class FixedLayoutChild < LayoutChild
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child_widget : Gtk::Widget? = nil, layout_manager : Gtk::LayoutManager? = nil, transform : Gsk::Transform? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
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
      if transform
        (_names.to_unsafe + _n).value = "transform".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transform)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FixedLayoutChild.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_fixed_layout_child_get_type
    end

    def transform=(value : Gsk::Transform?) : Gsk::Transform?
      unsafe_value = value

      LibGObject.g_object_set(self, "transform", unsafe_value, Pointer(Void).null)
      value
    end

    def transform : Gsk::Transform?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "transform", pointerof(value), Pointer(Void).null)
      Gsk::Transform.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def transform : Gsk::Transform?
      # gtk_fixed_layout_child_get_transform: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_fixed_layout_child_get_transform(self)
      Gsk::Transform.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def transform=(transform : Gsk::Transform) : Nil
      # gtk_fixed_layout_child_set_transform: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_fixed_layout_child_set_transform(self, transform)
    end
  end
end
