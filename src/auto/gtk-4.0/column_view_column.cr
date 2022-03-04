require "../g_object-2.0/object"

module Gtk
  # `GtkColumnViewColumn` represents the columns being added to `GtkColumnView`.
  #
  # The main ingredient for a `GtkColumnViewColumn` is the `GtkListItemFactory`
  # that tells the columnview how to create cells for this column from items in
  # the model.
  #
  # Columns have a title, and can optionally have a header menu set
  # with [method@Gtk.ColumnViewColumn.set_header_menu].
  #
  # A sorter can be associated with a column using
  # [method@Gtk.ColumnViewColumn.set_sorter], to let users influence sorting
  # by clicking on the column header.
  class ColumnViewColumn < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, column_view : Gtk::ColumnView? = nil, expand : Bool? = nil, factory : Gtk::ListItemFactory? = nil, fixed_width : Int32? = nil, header_menu : Gio::MenuModel? = nil, resizable : Bool? = nil, sorter : Gtk::Sorter? = nil, title : ::String? = nil, visible : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if column_view
        (_names.to_unsafe + _n).value = "column-view".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, column_view)
        _n += 1
      end
      if expand
        (_names.to_unsafe + _n).value = "expand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expand)
        _n += 1
      end
      if factory
        (_names.to_unsafe + _n).value = "factory".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, factory)
        _n += 1
      end
      if fixed_width
        (_names.to_unsafe + _n).value = "fixed-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fixed_width)
        _n += 1
      end
      if header_menu
        (_names.to_unsafe + _n).value = "header-menu".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, header_menu)
        _n += 1
      end
      if resizable
        (_names.to_unsafe + _n).value = "resizable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resizable)
        _n += 1
      end
      if sorter
        (_names.to_unsafe + _n).value = "sorter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sorter)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ColumnViewColumn.g_type, _n, _names, _values)
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

    def initialize(title : ::String?, factory : Gtk::ListItemFactory?)
      # gtk_column_view_column_new: (Constructor)
      # @title: (nullable)
      # @factory: (transfer full) (nullable)
      # Returns: (transfer full)

      # Handle parameters
      title = if title.nil?
                Pointer(LibC::Char).null
              else
                title.to_unsafe
              end
      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end
      LibGObject.g_object_ref(factory)

      # C call
      _retval = LibGtk.gtk_column_view_column_new(title, factory)

      # Return value handling
      @pointer = _retval
    end

    def column_view : Gtk::ColumnView?
      # gtk_column_view_column_get_column_view: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_column_view_column_get_column_view(self)

      # Return value handling
      Gtk::ColumnView.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def expand : Bool
      # gtk_column_view_column_get_expand: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_column_view_column_get_expand(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def factory : Gtk::ListItemFactory?
      # gtk_column_view_column_get_factory: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_column_view_column_get_factory(self)

      # Return value handling
      Gtk::ListItemFactory.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def fixed_width : Int32
      # gtk_column_view_column_get_fixed_width: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_column_view_column_get_fixed_width(self)

      # Return value handling
      _retval
    end

    def header_menu : Gio::MenuModel?
      # gtk_column_view_column_get_header_menu: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_column_view_column_get_header_menu(self)

      # Return value handling
      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def resizable : Bool
      # gtk_column_view_column_get_resizable: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_column_view_column_get_resizable(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def sorter : Gtk::Sorter?
      # gtk_column_view_column_get_sorter: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_column_view_column_get_sorter(self)

      # Return value handling
      Gtk::Sorter.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def title : ::String?
      # gtk_column_view_column_get_title: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_column_view_column_get_title(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def visible : Bool
      # gtk_column_view_column_get_visible: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_column_view_column_get_visible(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def expand=(expand : Bool) : Nil
      # gtk_column_view_column_set_expand: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_column_view_column_set_expand(self, expand)

      # Return value handling
    end

    def factory=(factory : Gtk::ListItemFactory?) : Nil
      # gtk_column_view_column_set_factory: (Method | Setter)
      # @factory: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end

      # C call
      LibGtk.gtk_column_view_column_set_factory(self, factory)

      # Return value handling
    end

    def fixed_width=(fixed_width : Int32) : Nil
      # gtk_column_view_column_set_fixed_width: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_column_view_column_set_fixed_width(self, fixed_width)

      # Return value handling
    end

    def header_menu=(menu : Gio::MenuModel?) : Nil
      # gtk_column_view_column_set_header_menu: (Method | Setter)
      # @menu: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      menu = if menu.nil?
               Pointer(Void).null
             else
               menu.to_unsafe
             end

      # C call
      LibGtk.gtk_column_view_column_set_header_menu(self, menu)

      # Return value handling
    end

    def resizable=(resizable : Bool) : Nil
      # gtk_column_view_column_set_resizable: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_column_view_column_set_resizable(self, resizable)

      # Return value handling
    end

    def sorter=(sorter : Gtk::Sorter?) : Nil
      # gtk_column_view_column_set_sorter: (Method | Setter)
      # @sorter: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      sorter = if sorter.nil?
                 Pointer(Void).null
               else
                 sorter.to_unsafe
               end

      # C call
      LibGtk.gtk_column_view_column_set_sorter(self, sorter)

      # Return value handling
    end

    def title=(title : ::String?) : Nil
      # gtk_column_view_column_set_title: (Method | Setter)
      # @title: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      title = if title.nil?
                Pointer(LibC::Char).null
              else
                title.to_unsafe
              end

      # C call
      LibGtk.gtk_column_view_column_set_title(self, title)

      # Return value handling
    end

    def visible=(visible : Bool) : Nil
      # gtk_column_view_column_set_visible: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_column_view_column_set_visible(self, visible)

      # Return value handling
    end
  end
end
