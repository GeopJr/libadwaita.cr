require "../g_object-2.0/object"

module Gtk
  # `GtkColumnViewColumn` represents the columns being added to `GtkColumnView`.
  #
  # The main ingredient for a `GtkColumnViewColumn` is the `GtkListItemFactory`
  # that tells the columnview how to create cells for this column from items in
  # the model.
  #
  # Columns have a title, and can optionally have a header menu set
  # with `Gtk::ColumnViewColumn#header_menu=`.
  #
  # A sorter can be associated with a column using
  # `Gtk::ColumnViewColumn#sorter=`, to let users influence sorting
  # by clicking on the column header.
  @[GObject::GeneratedWrapper]
  class ColumnViewColumn < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ColumnViewColumnClass), class_init,
        sizeof(LibGtk::ColumnViewColumn), instance_init, 0)
    end

    GICrystal.define_new_method(ColumnViewColumn, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ColumnViewColumn`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, column_view : Gtk::ColumnView? = nil, expand : Bool? = nil, factory : Gtk::ListItemFactory? = nil, fixed_width : Int32? = nil, header_menu : Gio::MenuModel? = nil, resizable : Bool? = nil, sorter : Gtk::Sorter? = nil, title : ::String? = nil, visible : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if !column_view.nil?
        (_names.to_unsafe + _n).value = "column-view".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_view)
        _n += 1
      end
      if !expand.nil?
        (_names.to_unsafe + _n).value = "expand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expand)
        _n += 1
      end
      if !factory.nil?
        (_names.to_unsafe + _n).value = "factory".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, factory)
        _n += 1
      end
      if !fixed_width.nil?
        (_names.to_unsafe + _n).value = "fixed-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fixed_width)
        _n += 1
      end
      if !header_menu.nil?
        (_names.to_unsafe + _n).value = "header-menu".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, header_menu)
        _n += 1
      end
      if !resizable.nil?
        (_names.to_unsafe + _n).value = "resizable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resizable)
        _n += 1
      end
      if !sorter.nil?
        (_names.to_unsafe + _n).value = "sorter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sorter)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ColumnViewColumn.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_column_view_column_get_type
    end

    def column_view : Gtk::ColumnView?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "column-view", pointerof(value), Pointer(Void).null)
      Gtk::ColumnView.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def expand=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "expand", unsafe_value, Pointer(Void).null)
      value
    end

    def expand? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "expand", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def factory=(value : Gtk::ListItemFactory?) : Gtk::ListItemFactory?
      unsafe_value = value

      LibGObject.g_object_set(self, "factory", unsafe_value, Pointer(Void).null)
      value
    end

    def factory : Gtk::ListItemFactory?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "factory", pointerof(value), Pointer(Void).null)
      Gtk::ListItemFactory.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def fixed_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "fixed-width", unsafe_value, Pointer(Void).null)
      value
    end

    def fixed_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "fixed-width", pointerof(value), Pointer(Void).null)
      value
    end

    def header_menu=(value : Gio::MenuModel?) : Gio::MenuModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "header-menu", unsafe_value, Pointer(Void).null)
      value
    end

    def header_menu : Gio::MenuModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "header-menu", pointerof(value), Pointer(Void).null)
      Gio::MenuModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def resizable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "resizable", unsafe_value, Pointer(Void).null)
      value
    end

    def resizable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "resizable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def sorter=(value : Gtk::Sorter?) : Gtk::Sorter?
      unsafe_value = value

      LibGObject.g_object_set(self, "sorter", unsafe_value, Pointer(Void).null)
      value
    end

    def sorter : Gtk::Sorter?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "sorter", pointerof(value), Pointer(Void).null)
      Gtk::Sorter.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def title=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "title", unsafe_value, Pointer(Void).null)
      value
    end

    def title : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "title", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def visible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "visible", unsafe_value, Pointer(Void).null)
      value
    end

    def visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "visible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new `GtkColumnViewColumn` that uses the given @factory for
    # mapping items to widgets.
    #
    # You most likely want to call `Gtk::ColumnView#append_column` next.
    #
    # The function takes ownership of the argument, so you can write code like:
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # column = gtk_column_view_column_new (_("Name"),
    #   gtk_builder_list_item_factory_new_from_resource ("/name.ui"));
    # ```
    def self.new(title : ::String?, factory : Gtk::ListItemFactory?) : self
      # gtk_column_view_column_new: (Constructor)
      # @title: (nullable)
      # @factory: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      title = if title.nil?
                Pointer(LibC::Char).null
              else
                title.to_unsafe
              end
      # Generator::NullableArrayPlan
      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end
      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(factory)
      # C call
      _retval = LibGtk.gtk_column_view_column_new(title, factory)

      # Return value handling

      Gtk::ColumnViewColumn.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the column view that's currently displaying this column.
    #
    # If @self has not been added to a column view yet, %NULL is returned.
    def column_view : Gtk::ColumnView?
      # gtk_column_view_column_get_column_view: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_column_get_column_view(@pointer)

      # Return value handling

      Gtk::ColumnView.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether this column should expand.
    def expand : Bool
      # gtk_column_view_column_get_expand: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_column_get_expand(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the factory that's currently used to populate list items for
    # this column.
    def factory : Gtk::ListItemFactory?
      # gtk_column_view_column_get_factory: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_column_get_factory(@pointer)

      # Return value handling

      Gtk::ListItemFactory.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the fixed width of the column.
    def fixed_width : Int32
      # gtk_column_view_column_get_fixed_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_column_get_fixed_width(@pointer)

      # Return value handling

      _retval
    end

    # Gets the menu model that is used to create the context menu
    # for the column header.
    def header_menu : Gio::MenuModel?
      # gtk_column_view_column_get_header_menu: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_column_get_header_menu(@pointer)

      # Return value handling

      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether this column is resizable.
    def resizable : Bool
      # gtk_column_view_column_get_resizable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_column_get_resizable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the sorter that is associated with the column.
    def sorter : Gtk::Sorter?
      # gtk_column_view_column_get_sorter: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_column_get_sorter(@pointer)

      # Return value handling

      Gtk::Sorter.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the title set with gtk_column_view_column_set_title().
    def title : ::String?
      # gtk_column_view_column_get_title: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_column_get_title(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns whether this column is visible.
    def visible : Bool
      # gtk_column_view_column_get_visible: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_column_view_column_get_visible(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the column to take available extra space.
    #
    # The extra space is shared equally amongst all columns that
    # have the expand set to %TRUE.
    def expand=(expand : Bool) : Nil
      # gtk_column_view_column_set_expand: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_column_set_expand(@pointer, expand)

      # Return value handling
    end

    # Sets the `GtkListItemFactory` to use for populating list items for this
    # column.
    def factory=(factory : Gtk::ListItemFactory?) : Nil
      # gtk_column_view_column_set_factory: (Method | Setter)
      # @factory: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end

      # C call
      LibGtk.gtk_column_view_column_set_factory(@pointer, factory)

      # Return value handling
    end

    # If @fixed_width is not -1, sets the fixed width of @column;
    # otherwise unsets it.
    #
    # Setting a fixed width overrides the automatically calculated
    # width. Interactive resizing also sets the “fixed-width” property.
    def fixed_width=(fixed_width : Int32) : Nil
      # gtk_column_view_column_set_fixed_width: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_column_set_fixed_width(@pointer, fixed_width)

      # Return value handling
    end

    # Sets the menu model that is used to create the context menu
    # for the column header.
    def header_menu=(menu : Gio::MenuModel?) : Nil
      # gtk_column_view_column_set_header_menu: (Method | Setter)
      # @menu: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      menu = if menu.nil?
               Pointer(Void).null
             else
               menu.to_unsafe
             end

      # C call
      LibGtk.gtk_column_view_column_set_header_menu(@pointer, menu)

      # Return value handling
    end

    # Sets whether this column should be resizable by dragging.
    def resizable=(resizable : Bool) : Nil
      # gtk_column_view_column_set_resizable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_column_set_resizable(@pointer, resizable)

      # Return value handling
    end

    # Associates a sorter with the column.
    #
    # If @sorter is %NULL, the column will not let users change
    # the sorting by clicking on its header.
    #
    # This sorter can be made active by clicking on the column
    # header, or by calling `Gtk::ColumnView#sort_by_column`.
    #
    # See `Gtk::ColumnView#sorter` for the necessary steps
    # for setting up customizable sorting for `Gtk#ColumnView`.
    def sorter=(sorter : Gtk::Sorter?) : Nil
      # gtk_column_view_column_set_sorter: (Method | Setter)
      # @sorter: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      sorter = if sorter.nil?
                 Pointer(Void).null
               else
                 sorter.to_unsafe
               end

      # C call
      LibGtk.gtk_column_view_column_set_sorter(@pointer, sorter)

      # Return value handling
    end

    # Sets the title of this column.
    #
    # The title is displayed in the header of a `GtkColumnView`
    # for this column and is therefore user-facing text that should
    # be translated.
    def title=(title : ::String?) : Nil
      # gtk_column_view_column_set_title: (Method | Setter)
      # @title: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      title = if title.nil?
                Pointer(LibC::Char).null
              else
                title.to_unsafe
              end

      # C call
      LibGtk.gtk_column_view_column_set_title(@pointer, title)

      # Return value handling
    end

    # Sets whether this column should be visible in views.
    def visible=(visible : Bool) : Nil
      # gtk_column_view_column_set_visible: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_column_view_column_set_visible(@pointer, visible)

      # Return value handling
    end
  end
end
