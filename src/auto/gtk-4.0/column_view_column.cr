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

    def initialize(title : ::String?, factory : Gtk::ListItemFactory?)
      # gtk_column_view_column_new: (Constructor)
      # @title: (nullable)
      # @factory: (transfer full) (nullable)
      # Returns: (transfer full)

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

      _retval = LibGtk.gtk_column_view_column_new(title, factory)
      @pointer = _retval
    end

    def column_view : Gtk::ColumnView?
      # gtk_column_view_column_get_column_view: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_column_view_column_get_column_view(self)
      Gtk::ColumnView.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def expand? : Bool
      # gtk_column_view_column_get_expand: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_column_view_column_get_expand(self)
      GICrystal.to_bool(_retval)
    end

    def factory : Gtk::ListItemFactory?
      # gtk_column_view_column_get_factory: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_column_view_column_get_factory(self)
      Gtk::ListItemFactory.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def fixed_width : Int32
      # gtk_column_view_column_get_fixed_width: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_column_view_column_get_fixed_width(self)
      _retval
    end

    def header_menu : Gio::MenuModel?
      # gtk_column_view_column_get_header_menu: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_column_view_column_get_header_menu(self)
      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def resizable? : Bool
      # gtk_column_view_column_get_resizable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_column_view_column_get_resizable(self)
      GICrystal.to_bool(_retval)
    end

    def sorter : Gtk::Sorter?
      # gtk_column_view_column_get_sorter: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_column_view_column_get_sorter(self)
      Gtk::Sorter.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def title : ::String?
      # gtk_column_view_column_get_title: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_column_view_column_get_title(self)
      ::String.new(_retval) unless _retval.null?
    end

    def visible? : Bool
      # gtk_column_view_column_get_visible: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_column_view_column_get_visible(self)
      GICrystal.to_bool(_retval)
    end

    def expand=(expand : Bool) : Nil
      # gtk_column_view_column_set_expand: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_column_view_column_set_expand(self, expand)
    end

    def factory=(factory : Gtk::ListItemFactory?) : Nil
      # gtk_column_view_column_set_factory: (Method)
      # @factory: (nullable)
      # Returns: (transfer none)

      factory = if factory.nil?
                  Pointer(Void).null
                else
                  factory.to_unsafe
                end

      LibGtk.gtk_column_view_column_set_factory(self, factory)
    end

    def fixed_width=(fixed_width : Int32) : Nil
      # gtk_column_view_column_set_fixed_width: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_column_view_column_set_fixed_width(self, fixed_width)
    end

    def header_menu=(menu : Gio::MenuModel?) : Nil
      # gtk_column_view_column_set_header_menu: (Method)
      # @menu: (nullable)
      # Returns: (transfer none)

      menu = if menu.nil?
               Pointer(Void).null
             else
               menu.to_unsafe
             end

      LibGtk.gtk_column_view_column_set_header_menu(self, menu)
    end

    def resizable=(resizable : Bool) : Nil
      # gtk_column_view_column_set_resizable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_column_view_column_set_resizable(self, resizable)
    end

    def sorter=(sorter : Gtk::Sorter?) : Nil
      # gtk_column_view_column_set_sorter: (Method)
      # @sorter: (nullable)
      # Returns: (transfer none)

      sorter = if sorter.nil?
                 Pointer(Void).null
               else
                 sorter.to_unsafe
               end

      LibGtk.gtk_column_view_column_set_sorter(self, sorter)
    end

    def title=(title : ::String?) : Nil
      # gtk_column_view_column_set_title: (Method)
      # @title: (nullable)
      # Returns: (transfer none)

      title = if title.nil?
                Pointer(LibC::Char).null
              else
                title.to_unsafe
              end

      LibGtk.gtk_column_view_column_set_title(self, title)
    end

    def visible=(visible : Bool) : Nil
      # gtk_column_view_column_set_visible: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_column_view_column_set_visible(self, visible)
    end
  end
end
