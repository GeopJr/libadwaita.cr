require "./cell_area"
require "./buildable"

require "./cell_layout"

require "./orientable"

module Gtk
  # A cell area that renders GtkCellRenderers into a row or a column
  #
  # The `GtkCellAreaBox` renders cell renderers into a row or a column
  # depending on its `GtkOrientation`.
  #
  # GtkCellAreaBox uses a notion of packing. Packing
  # refers to adding cell renderers with reference to a particular position
  # in a `GtkCellAreaBox`. There are two reference positions: the
  # start and the end of the box.
  # When the `GtkCellAreaBox` is oriented in the %GTK_ORIENTATION_VERTICAL
  # orientation, the start is defined as the top of the box and the end is
  # defined as the bottom. In the %GTK_ORIENTATION_HORIZONTAL orientation
  # start is defined as the left side and the end is defined as the right
  # side.
  #
  # Alignments of `GtkCellRenderer`s rendered in adjacent rows can be
  # configured by configuring the `GtkCellAreaBox` align child cell property
  # with gtk_cell_area_cell_set_property() or by specifying the "align"
  # argument to gtk_cell_area_box_pack_start() and gtk_cell_area_box_pack_end().
  class CellAreaBox < CellArea
    include Buildable
    include CellLayout
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, edit_widget : Gtk::CellEditable? = nil, edited_cell : Gtk::CellRenderer? = nil, focus_cell : Gtk::CellRenderer? = nil, orientation : Gtk::Orientation? = nil, spacing : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if edit_widget
        (_names.to_unsafe + _n).value = "edit-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, edit_widget)
        _n += 1
      end
      if edited_cell
        (_names.to_unsafe + _n).value = "edited-cell".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, edited_cell)
        _n += 1
      end
      if focus_cell
        (_names.to_unsafe + _n).value = "focus-cell".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_cell)
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

      @pointer = LibGObject.g_object_new_with_properties(CellAreaBox.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_area_box_get_type
    end

    def initialize
      # gtk_cell_area_box_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_box_new
      @pointer = _retval
    end

    def spacing : Int32
      # gtk_cell_area_box_get_spacing: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_cell_area_box_get_spacing(self)
      _retval
    end

    def pack_end(renderer : Gtk::CellRenderer, expand : Bool, align : Bool, fixed : Bool) : Nil
      # gtk_cell_area_box_pack_end: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_box_pack_end(self, renderer, expand, align, fixed)
    end

    def pack_start(renderer : Gtk::CellRenderer, expand : Bool, align : Bool, fixed : Bool) : Nil
      # gtk_cell_area_box_pack_start: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_box_pack_start(self, renderer, expand, align, fixed)
    end

    def spacing=(spacing : Int32) : Nil
      # gtk_cell_area_box_set_spacing: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_cell_area_box_set_spacing(self, spacing)
    end
  end
end
