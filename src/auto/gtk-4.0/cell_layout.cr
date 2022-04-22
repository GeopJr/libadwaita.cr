module Gtk
  # An interface for packing cells
  #
  # `GtkCellLayout` is an interface to be implemented by all objects which
  # want to provide a `GtkTreeViewColumn` like API for packing cells,
  # setting attributes and data funcs.
  #
  # One of the notable features provided by implementations of
  # `GtkCellLayout` are attributes. Attributes let you set the properties
  # in flexible ways. They can just be set to constant values like regular
  # properties. But they can also be mapped to a column of the underlying
  # tree model with gtk_cell_layout_set_attributes(), which means that the value
  # of the attribute can change from cell to cell as they are rendered by
  # the cell renderer. Finally, it is possible to specify a function with
  # gtk_cell_layout_set_cell_data_func() that is called to determine the
  # value of the attribute for each cell that is rendered.
  #
  # # GtkCellLayouts as GtkBuildable
  #
  # Implementations of GtkCellLayout which also implement the GtkBuildable
  # interface (`GtkCellView`, `GtkIconView`, `GtkComboBox`,
  # `GtkEntryCompletion`, `GtkTreeViewColumn`) accept `GtkCellRenderer` objects
  # as `<child>` elements in UI definitions. They support a custom `<attributes>`
  # element for their children, which can contain multiple `<attribute>`
  # elements. Each `<attribute>` element has a name attribute which specifies
  # a property of the cell renderer; the content of the element is the
  # attribute value.
  #
  # This is an example of a UI definition fragment specifying attributes:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkCellView">
  #   <child>
  #     <object class="GtkCellRendererText"/>
  #     <attributes>
  #       <attribute name="text">0</attribute>
  #     </attributes>
  #   </child>
  # </object>
  # ```
  #
  # Furthermore for implementations of `GtkCellLayout` that use a `GtkCellArea`
  # to lay out cells (all `GtkCellLayout`s in GTK use a `GtkCellArea`)
  # [cell properties](class.CellArea.html#cell-properties) can also be defined
  # in the format by specifying the custom `<cell-packing>` attribute which can
  # contain multiple `<property>` elements.
  #
  # Here is a UI definition fragment specifying cell properties:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkTreeViewColumn">
  #   <child>
  #     <object class="GtkCellRendererText"/>
  #     <cell-packing>
  #       <property name="align">True</property>
  #       <property name="expand">False</property>
  #     </cell-packing>
  #   </child>
  # </object>
  # ```
  #
  # # Subclassing GtkCellLayout implementations
  #
  # When subclassing a widget that implements `GtkCellLayout` like
  # `GtkIconView` or `GtkComboBox`, there are some considerations related
  # to the fact that these widgets internally use a `GtkCellArea`.
  # The cell area is exposed as a construct-only property by these
  # widgets. This means that it is possible to e.g. do
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GtkWIdget *combo =
  #   g_object_new (GTK_TYPE_COMBO_BOX, "cell-area", my_cell_area, NULL);
  # ```
  #
  # to use a custom cell area with a combo box. But construct properties
  # are only initialized after instance `init()`
  # functions have run, which means that using functions which rely on
  # the existence of the cell area in your subclass `init()` function will
  # cause the default cell area to be instantiated. In this case, a provided
  # construct property value will be ignored (with a warning, to alert
  # you to the problem).
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # my_combo_box_init (MyComboBox *b)
  # {
  #   GtkCellRenderer *cell;
  #
  #   cell = gtk_cell_renderer_pixbuf_new ();
  #
  #   // The following call causes the default cell area for combo boxes,
  #   // a GtkCellAreaBox, to be instantiated
  #   gtk_cell_layout_pack_start (GTK_CELL_LAYOUT (b), cell, FALSE);
  #   ...
  # }
  #
  # GtkWidget *
  # my_combo_box_new (GtkCellArea *area)
  # {
  #   // This call is going to cause a warning about area being ignored
  #   return g_object_new (MY_TYPE_COMBO_BOX, "cell-area", area, NULL);
  # }
  # ```
  #
  # If supporting alternative cell areas with your derived widget is
  # not important, then this does not have to concern you. If you want
  # to support alternative cell areas, you can do so by moving the
  # problematic calls out of `init()` and into a `constructor()`
  # for your class.
  module CellLayout
    def add_attribute(cell : Gtk::CellRenderer, attribute : ::String, column : Int32) : Nil
      # gtk_cell_layout_add_attribute: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_layout_add_attribute(self, cell, attribute, column)

      # Return value handling
    end

    def clear : Nil
      # gtk_cell_layout_clear: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_layout_clear(self)

      # Return value handling
    end

    def clear_attributes(cell : Gtk::CellRenderer) : Nil
      # gtk_cell_layout_clear_attributes: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_layout_clear_attributes(self, cell)

      # Return value handling
    end

    def area : Gtk::CellArea?
      # gtk_cell_layout_get_area: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_layout_get_area(self)

      # Return value handling

      Gtk::CellArea.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def cells : GLib::List
      # gtk_cell_layout_get_cells: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGtk.gtk_cell_layout_get_cells(self)

      # Return value handling

      GLib::List(Gtk::CellRenderer).new(_retval, GICrystal::Transfer::Container)
    end

    def pack_end(cell : Gtk::CellRenderer, expand : Bool) : Nil
      # gtk_cell_layout_pack_end: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_layout_pack_end(self, cell, expand)

      # Return value handling
    end

    def pack_start(cell : Gtk::CellRenderer, expand : Bool) : Nil
      # gtk_cell_layout_pack_start: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_layout_pack_start(self, cell, expand)

      # Return value handling
    end

    def reorder(cell : Gtk::CellRenderer, position : Int32) : Nil
      # gtk_cell_layout_reorder: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_layout_reorder(self, cell, position)

      # Return value handling
    end

    def set_cell_data_func(cell : Gtk::CellRenderer, func : Pointer(Void)?, func_data : Pointer(Void)?, destroy : Pointer(Void)) : Nil
      # gtk_cell_layout_set_cell_data_func: (Method)
      # @func: (nullable)
      # @func_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      func = if func.nil?
               LibGtk::CellLayoutDataFunc.null
             else
               func.to_unsafe
             end

      # Generator::NullableArrayPlan
      func_data = if func_data.nil?
                    Pointer(Void).null
                  else
                    func_data.to_unsafe
                  end

      # C call
      LibGtk.gtk_cell_layout_set_cell_data_func(self, cell, func, func_data, destroy)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class CellLayout__Impl < GObject::Object
    include CellLayout

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_layout_get_type
    end

    # Cast a `GObject::Object` to `CellLayout`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to CellLayout")
    end

    # Cast a `GObject::Object` to `CellLayout`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
