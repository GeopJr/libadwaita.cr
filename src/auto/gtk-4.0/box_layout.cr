require "./layout_manager"
require "./orientable"

module Gtk
  # `GtkBoxLayout` is a layout manager that arranges children in a single
  # row or column.
  #
  # Whether it is a row or column depends on the value of its
  # `Gtk::Orientable#orientation` property. Within the other dimension
  # all children all allocated the same size. The `GtkBoxLayout` will respect
  # the `Gtk::Widget#halign` and `Gtk::Widget#valign`
  # properties of each child widget.
  #
  # If you want all children to be assigned the same size, you can use
  # the `Gtk::BoxLayout#homogeneous` property.
  #
  # If you want to specify the amount of space placed between each child,
  # you can use the `Gtk::BoxLayout#spacing` property.
  @[GObject::GeneratedWrapper]
  class BoxLayout < LayoutManager
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::BoxLayoutClass), class_init,
        sizeof(LibGtk::BoxLayout), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, baseline_position : Gtk::BaselinePosition? = nil, homogeneous : Bool? = nil, orientation : Gtk::Orientation? = nil, spacing : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !baseline_position.nil?
        (_names.to_unsafe + _n).value = "baseline-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, baseline_position)
        _n += 1
      end
      if !homogeneous.nil?
        (_names.to_unsafe + _n).value = "homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, homogeneous)
        _n += 1
      end
      if !orientation.nil?
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if !spacing.nil?
        (_names.to_unsafe + _n).value = "spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, spacing)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BoxLayout.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_box_layout_get_type
    end

    def baseline_position=(value : Gtk::BaselinePosition) : Gtk::BaselinePosition
      unsafe_value = value

      LibGObject.g_object_set(self, "baseline-position", unsafe_value, Pointer(Void).null)
      value
    end

    def baseline_position : Gtk::BaselinePosition
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "baseline-position", pointerof(value), Pointer(Void).null)
      Gtk::BaselinePosition.new(value)
    end

    def homogeneous=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "homogeneous", unsafe_value, Pointer(Void).null)
      value
    end

    def homogeneous? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "homogeneous", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def spacing=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "spacing", unsafe_value, Pointer(Void).null)
      value
    end

    def spacing : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "spacing", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new `GtkBoxLayout`.
    def initialize(orientation : Gtk::Orientation)
      # gtk_box_layout_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_box_layout_new(orientation)

      # Return value handling

      @pointer = _retval
    end

    # Gets the value set by gtk_box_layout_set_baseline_position().
    def baseline_position : Gtk::BaselinePosition
      # gtk_box_layout_get_baseline_position: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_box_layout_get_baseline_position(self)

      # Return value handling

      Gtk::BaselinePosition.new(_retval)
    end

    # Returns whether the layout is set to be homogeneous.
    def homogeneous : Bool
      # gtk_box_layout_get_homogeneous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_box_layout_get_homogeneous(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the space that @box_layout puts between children.
    def spacing : UInt32
      # gtk_box_layout_get_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_box_layout_get_spacing(self)

      # Return value handling

      _retval
    end

    # Sets the baseline position of a box layout.
    #
    # The baseline position affects only horizontal boxes with at least one
    # baseline aligned child. If there is more vertical space available than
    # requested, and the baseline is not allocated by the parent then the
    # given @position is used to allocate the baseline within the extra
    # space available.
    def baseline_position=(position : Gtk::BaselinePosition) : Nil
      # gtk_box_layout_set_baseline_position: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_box_layout_set_baseline_position(self, position)

      # Return value handling
    end

    # Sets whether the box layout will allocate the same
    # size to all children.
    def homogeneous=(homogeneous : Bool) : Nil
      # gtk_box_layout_set_homogeneous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_box_layout_set_homogeneous(self, homogeneous)

      # Return value handling
    end

    # Sets how much spacing to put between children.
    def spacing=(spacing : UInt32) : Nil
      # gtk_box_layout_set_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_box_layout_set_spacing(self, spacing)

      # Return value handling
    end
  end
end
