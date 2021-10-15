require "../g_object-2.0/object"
require "./buildable"

require "./tree_drag_dest"

require "./tree_drag_source"

require "./tree_model"

require "./tree_sortable"

module Gtk
  # A tree-like data structure that can be used with the GtkTreeView
  #
  # The `GtkTreeStore` object is a list model for use with a `GtkTreeView`
  # widget.  It implements the `GtkTreeModel` interface, and consequently,
  # can use all of the methods available there.  It also implements the
  # `GtkTreeSortable` interface so it can be sorted by the view.  Finally,
  # it also implements the tree
  # [drag and drop][gtk3-GtkTreeView-drag-and-drop]
  # interfaces.
  #
  # # GtkTreeStore as GtkBuildable
  #
  # The GtkTreeStore implementation of the `GtkBuildable` interface allows
  # to specify the model columns with a <columns> element that may contain
  # multiple <column> elements, each specifying one model column. The “type”
  # attribute specifies the data type for the column.
  #
  # An example of a UI Definition fragment for a tree store:
  # |[
  # <object class="GtkTreeStore">
  #   <columns>
  #     <column type="gchararray"/>
  #     <column type="gchararray"/>
  #     <column type="gint"/>
  #   </columns>
  # </object>
  # ]|
  class TreeStore < GObject::Object
    include Buildable
    include TreeDragDest
    include TreeDragSource
    include TreeModel
    include TreeSortable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_store_get_type
    end

    def initialize(types : Enumerable(UInt64))
      # gtk_tree_store_newv: (Constructor)
      # @types: (array length=n_columns element-type Gtype)
      # Returns: (transfer full)

      n_columns = types.size
      types = types.to_a.to_unsafe

      _retval = LibGtk.gtk_tree_store_newv(n_columns, types)
      @pointer = _retval
    end

    def initialize(*types : UInt64)
      initialize(types)
    end

    def append(parent : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_tree_store_append: (Method)
      # @iter: (out) (caller-allocates)
      # @parent: (nullable)
      # Returns: (transfer none)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end
      iter = Gtk::TreeIter.new

      LibGtk.gtk_tree_store_append(self, iter, parent)
      iter
    end

    def clear : Nil
      # gtk_tree_store_clear: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_store_clear(self)
    end

    def insert(parent : Gtk::TreeIter?, position : Int32) : Gtk::TreeIter
      # gtk_tree_store_insert: (Method)
      # @iter: (out) (caller-allocates)
      # @parent: (nullable)
      # Returns: (transfer none)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end
      iter = Gtk::TreeIter.new

      LibGtk.gtk_tree_store_insert(self, iter, parent, position)
      iter
    end

    def insert_after(parent : Gtk::TreeIter?, sibling : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_tree_store_insert_after: (Method)
      # @iter: (out) (caller-allocates)
      # @parent: (nullable)
      # @sibling: (nullable)
      # Returns: (transfer none)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end
      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end
      iter = Gtk::TreeIter.new

      LibGtk.gtk_tree_store_insert_after(self, iter, parent, sibling)
      iter
    end

    def insert_before(parent : Gtk::TreeIter?, sibling : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_tree_store_insert_before: (Method)
      # @iter: (out) (caller-allocates)
      # @parent: (nullable)
      # @sibling: (nullable)
      # Returns: (transfer none)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end
      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end
      iter = Gtk::TreeIter.new

      LibGtk.gtk_tree_store_insert_before(self, iter, parent, sibling)
      iter
    end

    def insert_with_values(parent : Gtk::TreeIter?, position : Int32, columns : Enumerable(Int32), values : Enumerable(_)) : Gtk::TreeIter
      # gtk_tree_store_insert_with_valuesv: (Method)
      # @iter: (out) (caller-allocates) (optional)
      # @parent: (nullable)
      # @columns: (array length=n_values element-type Int32)
      # @values: (array length=n_values element-type Interface)
      # Returns: (transfer none)

      n_values = columns.size
      n_values = values.size
      iter = Pointer(Void).null
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end
      columns = columns.to_a.to_unsafe

      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      iter = Gtk::TreeIter.new

      LibGtk.gtk_tree_store_insert_with_valuesv(self, iter, parent, position, columns, values, n_values)
      iter
    end

    def is_ancestor(iter : Gtk::TreeIter, descendant : Gtk::TreeIter) : Bool
      # gtk_tree_store_is_ancestor: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_store_is_ancestor(self, iter, descendant)
      GICrystal.to_bool(_retval)
    end

    def iter_depth(iter : Gtk::TreeIter) : Int32
      # gtk_tree_store_iter_depth: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_store_iter_depth(self, iter)
      _retval
    end

    def iter_is_valid(iter : Gtk::TreeIter) : Bool
      # gtk_tree_store_iter_is_valid: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_store_iter_is_valid(self, iter)
      GICrystal.to_bool(_retval)
    end

    def move_after(iter : Gtk::TreeIter, position : Gtk::TreeIter?) : Nil
      # gtk_tree_store_move_after: (Method)
      # @position: (nullable)
      # Returns: (transfer none)

      position = if position.nil?
                   Pointer(Void).null
                 else
                   position.to_unsafe
                 end

      LibGtk.gtk_tree_store_move_after(self, iter, position)
    end

    def move_before(iter : Gtk::TreeIter, position : Gtk::TreeIter?) : Nil
      # gtk_tree_store_move_before: (Method)
      # @position: (nullable)
      # Returns: (transfer none)

      position = if position.nil?
                   Pointer(Void).null
                 else
                   position.to_unsafe
                 end

      LibGtk.gtk_tree_store_move_before(self, iter, position)
    end

    def prepend(parent : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_tree_store_prepend: (Method)
      # @iter: (out) (caller-allocates)
      # @parent: (nullable)
      # Returns: (transfer none)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end
      iter = Gtk::TreeIter.new

      LibGtk.gtk_tree_store_prepend(self, iter, parent)
      iter
    end

    def remove(iter : Gtk::TreeIter) : Bool
      # gtk_tree_store_remove: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_store_remove(self, iter)
      GICrystal.to_bool(_retval)
    end

    def set_column_types(types : Enumerable(UInt64)) : Nil
      # gtk_tree_store_set_column_types: (Method)
      # @types: (array length=n_columns element-type Gtype)
      # Returns: (transfer none)

      n_columns = types.size
      types = types.to_a.to_unsafe

      LibGtk.gtk_tree_store_set_column_types(self, n_columns, types)
    end

    def set_column_types(*types : UInt64)
      set_column_types(types)
    end

    def set_value(iter : Gtk::TreeIter, column : Int32, value : _) : Nil
      # gtk_tree_store_set_value: (Method)
      # Returns: (transfer none)

      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      LibGtk.gtk_tree_store_set_value(self, iter, column, value)
    end

    def set(iter : Gtk::TreeIter, columns : Enumerable(Int32), values : Enumerable(_)) : Nil
      # gtk_tree_store_set_valuesv: (Method)
      # @columns: (array length=n_values element-type Int32)
      # @values: (array length=n_values element-type Interface)
      # Returns: (transfer none)

      n_values = columns.size
      n_values = values.size
      columns = columns.to_a.to_unsafe

      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      LibGtk.gtk_tree_store_set_valuesv(self, iter, columns, values, n_values)
    end

    def swap(a : Gtk::TreeIter, b : Gtk::TreeIter) : Nil
      # gtk_tree_store_swap: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_store_swap(self, a, b)
    end
  end
end
