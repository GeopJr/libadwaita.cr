require "./layout_manager"
require "./orientable"

module Gtk
  # `GtkBoxLayout` is a layout manager that arranges children in a single
  # row or column.
  #
  # Whether it is a row or column depends on the value of its
  # [property@Gtk.Orientable:orientation] property. Within the other dimension
  # all children all allocated the same size. The `GtkBoxLayout` will respect
  # the [property@Gtk.Widget:halign] and [property@Gtk.Widget:valign]
  # properties of each child widget.
  #
  # If you want all children to be assigned the same size, you can use
  # the [property@Gtk.BoxLayout:homogeneous] property.
  #
  # If you want to specify the amount of space placed between each child,
  # you can use the [property@Gtk.BoxLayout:spacing] property.
  class BoxLayout < LayoutManager
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, baseline_position : Gtk::BaselinePosition? = nil, homogeneous : Bool? = nil, orientation : Gtk::Orientation? = nil, spacing : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if baseline_position
        (_names.to_unsafe + _n).value = "baseline-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, baseline_position)
        _n += 1
      end
      if homogeneous
        (_names.to_unsafe + _n).value = "homogeneous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, homogeneous)
        _n += 1
      end
      if orientation
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if spacing
        (_names.to_unsafe + _n).value = "spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, spacing)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BoxLayout.g_type, _n, _names, _values)
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
      Gtk::BaselinePosition.from_value(value)
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

    def initialize(orientation : Gtk::Orientation)
      # gtk_box_layout_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_box_layout_new(orientation)
      @pointer = _retval
    end

    def baseline_position : Gtk::BaselinePosition
      # gtk_box_layout_get_baseline_position: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_box_layout_get_baseline_position(self)
      Gtk::BaselinePosition.from_value(_retval)
    end

    def homogeneous : Bool
      # gtk_box_layout_get_homogeneous: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_box_layout_get_homogeneous(self)
      GICrystal.to_bool(_retval)
    end

    def spacing : UInt32
      # gtk_box_layout_get_spacing: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_box_layout_get_spacing(self)
      _retval
    end

    def baseline_position=(position : Gtk::BaselinePosition) : Nil
      # gtk_box_layout_set_baseline_position: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_box_layout_set_baseline_position(self, position)
    end

    def homogeneous=(homogeneous : Bool) : Nil
      # gtk_box_layout_set_homogeneous: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_box_layout_set_homogeneous(self, homogeneous)
    end

    def spacing=(spacing : UInt32) : Nil
      # gtk_box_layout_set_spacing: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_box_layout_set_spacing(self, spacing)
    end
  end
end
