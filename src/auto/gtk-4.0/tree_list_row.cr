require "../g_object-2.0/object"

module Gtk
  # `GtkTreeListRow` is used by `GtkTreeListModel` to represent items.
  #
  # It allows navigating the model as a tree and modify the state of rows.
  #
  # `GtkTreeListRow` instances are created by a `GtkTreeListModel` only
  # when the [property@Gtk.TreeListModel:passthrough] property is not set.
  #
  # There are various support objects that can make use of `GtkTreeListRow`
  # objects, such as the [class@Gtk.TreeExpander] widget that allows displaying
  # an icon to expand or collapse a row or [class@Gtk.TreeListRowSorter] that
  # makes it possible to sort trees properly.
  class TreeListRow < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, children : Gio::ListModel? = nil, depth : UInt32? = nil, expandable : Bool? = nil, expanded : Bool? = nil, item : GObject::Object? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if children
        (_names.to_unsafe + _n).value = "children".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, children)
        _n += 1
      end
      if depth
        (_names.to_unsafe + _n).value = "depth".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, depth)
        _n += 1
      end
      if expandable
        (_names.to_unsafe + _n).value = "expandable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expandable)
        _n += 1
      end
      if expanded
        (_names.to_unsafe + _n).value = "expanded".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expanded)
        _n += 1
      end
      if item
        (_names.to_unsafe + _n).value = "item".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeListRow.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_list_row_get_type
    end

    def children : Gio::ListModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "children", pointerof(value), Pointer(Void).null)
      Gio::ListModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def depth : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "depth", pointerof(value), Pointer(Void).null)
      value
    end

    def expandable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "expandable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def expanded=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "expanded", unsafe_value, Pointer(Void).null)
      value
    end

    def expanded? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "expanded", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def item : GObject::Object?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "item", pointerof(value), Pointer(Void).null)
      GObject::Object.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def child_row(position : UInt32) : Gtk::TreeListRow?
      # gtk_tree_list_row_get_child_row: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_list_row_get_child_row(self, position)
      Gtk::TreeListRow.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def children : Gio::ListModel?
      # gtk_tree_list_row_get_children: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_list_row_get_children(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def depth : UInt32
      # gtk_tree_list_row_get_depth: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_list_row_get_depth(self)
      _retval
    end

    def expanded : Bool
      # gtk_tree_list_row_get_expanded: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_list_row_get_expanded(self)
      GICrystal.to_bool(_retval)
    end

    def item : GObject::Object?
      # gtk_tree_list_row_get_item: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_list_row_get_item(self)
      GObject::Object.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def parent : Gtk::TreeListRow?
      # gtk_tree_list_row_get_parent: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_list_row_get_parent(self)
      Gtk::TreeListRow.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def position : UInt32
      # gtk_tree_list_row_get_position: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_list_row_get_position(self)
      _retval
    end

    def is_expandable : Bool
      # gtk_tree_list_row_is_expandable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_list_row_is_expandable(self)
      GICrystal.to_bool(_retval)
    end

    def expanded=(expanded : Bool) : Nil
      # gtk_tree_list_row_set_expanded: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_tree_list_row_set_expanded(self, expanded)
    end
  end
end
