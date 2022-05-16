require "./layout_child"

module Gtk
  # `GtkLayoutChild` subclass for children in a `GtkFixedLayout`.
  @[GObject::GeneratedWrapper]
  class FixedLayoutChild < LayoutChild
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::FixedLayoutChildClass), class_init,
        sizeof(LibGtk::FixedLayoutChild), instance_init, 0)
    end

    GICrystal.define_new_method(FixedLayoutChild, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `FixedLayoutChild`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child_widget : Gtk::Widget? = nil, layout_manager : Gtk::LayoutManager? = nil, transform : Gsk::Transform? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
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
      if !transform.nil?
        (_names.to_unsafe + _n).value = "transform".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transform)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FixedLayoutChild.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Retrieves the transformation of the child.
    def transform : Gsk::Transform?
      # gtk_fixed_layout_child_get_transform: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_fixed_layout_child_get_transform(@pointer)

      # Return value handling

      Gsk::Transform.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the transformation of the child of a `GtkFixedLayout`.
    def transform=(transform : Gsk::Transform) : Nil
      # gtk_fixed_layout_child_set_transform: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_fixed_layout_child_set_transform(@pointer, transform)

      # Return value handling
    end
  end
end
