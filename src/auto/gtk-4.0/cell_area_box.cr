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
  @[GObject::GeneratedWrapper]
  class CellAreaBox < CellArea
    include Buildable
    include CellLayout
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::CellAreaBox), instance_init, 0)
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

    def initialize(*, edit_widget : Gtk::CellEditable? = nil, edited_cell : Gtk::CellRenderer? = nil, focus_cell : Gtk::CellRenderer? = nil, orientation : Gtk::Orientation? = nil, spacing : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !edit_widget.nil?
        (_names.to_unsafe + _n).value = "edit-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, edit_widget)
        _n += 1
      end
      if !edited_cell.nil?
        (_names.to_unsafe + _n).value = "edited-cell".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, edited_cell)
        _n += 1
      end
      if !focus_cell.nil?
        (_names.to_unsafe + _n).value = "focus-cell".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_cell)
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

      @pointer = LibGObject.g_object_new_with_properties(CellAreaBox.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_area_box_get_type
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

    # Creates a new `GtkCellAreaBox`.
    def initialize
      # gtk_cell_area_box_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_box_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the spacing added between cell renderers.
    def spacing : Int32
      # gtk_cell_area_box_get_spacing: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_area_box_get_spacing(self)

      # Return value handling

      _retval
    end

    # Adds @renderer to @box, packed with reference to the end of @box.
    #
    # The @renderer is packed after (away from end of) any other
    # `GtkCellRenderer` packed with reference to the end of @box.
    def pack_end(renderer : Gtk::CellRenderer, expand : Bool, align : Bool, fixed : Bool) : Nil
      # gtk_cell_area_box_pack_end: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_box_pack_end(self, renderer, expand, align, fixed)

      # Return value handling
    end

    # Adds @renderer to @box, packed with reference to the start of @box.
    #
    # The @renderer is packed after any other `GtkCellRenderer` packed
    # with reference to the start of @box.
    def pack_start(renderer : Gtk::CellRenderer, expand : Bool, align : Bool, fixed : Bool) : Nil
      # gtk_cell_area_box_pack_start: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_box_pack_start(self, renderer, expand, align, fixed)

      # Return value handling
    end

    # Sets the spacing to add between cell renderers in @box.
    def spacing=(spacing : Int32) : Nil
      # gtk_cell_area_box_set_spacing: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_area_box_set_spacing(self, spacing)

      # Return value handling
    end
  end
end
