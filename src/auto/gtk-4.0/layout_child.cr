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
  @[GObject::GeneratedWrapper]
  class LayoutChild < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::LayoutChildClass), class_init,
        sizeof(LibGtk::LayoutChild), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
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

      @pointer = LibGObject.g_object_new_with_properties(LayoutChild.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Retrieves the `GtkWidget` associated to the given @layout_child.
    def child_widget : Gtk::Widget
      # gtk_layout_child_get_child_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_layout_child_get_child_widget(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the `GtkLayoutManager` instance that created the
    # given @layout_child.
    def layout_manager : Gtk::LayoutManager
      # gtk_layout_child_get_layout_manager: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_layout_child_get_layout_manager(self)

      # Return value handling

      Gtk::LayoutManager.new(_retval, GICrystal::Transfer::None)
    end
  end
end
