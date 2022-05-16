require "./layout_child"

module Gtk
  # `GtkLayoutChild` subclass for children in a `GtkConstraintLayout`.
  @[GObject::GeneratedWrapper]
  class ConstraintLayoutChild < LayoutChild
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ConstraintLayoutChildClass), class_init,
        sizeof(LibGtk::ConstraintLayoutChild), instance_init, 0)
    end

    GICrystal.define_new_method(ConstraintLayoutChild, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ConstraintLayoutChild`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child_widget : Gtk::Widget? = nil, layout_manager : Gtk::LayoutManager? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !child_widget.nil?
        (_names.to_unsafe + _n).value = "child-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_widget)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ConstraintLayoutChild.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_constraint_layout_child_get_type
    end
  end
end
