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
  @[GObject::GeneratedWrapper]
  class TreeStore < GObject::Object
    include Buildable
    include TreeDragDest
    include TreeDragSource
    include TreeModel
    include TreeSortable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TreeStoreClass), class_init,
        sizeof(LibGtk::TreeStore), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_store_get_type
    end

    # Creates a new tree store as with @n_columns columns each of the types passed
    # in.  Note that only types derived from standard GObject fundamental types
    # are supported.
    #
    # As an example,
    #
    # ```
    # gtk_tree_store_new (3, G_TYPE_INT, G_TYPE_STRING, GDK_TYPE_TEXTURE);
    # ```
    #
    # will create a new `GtkTreeStore` with three columns, of type
    # `int`, `gchararray`, and `GdkTexture` respectively.
    def initialize(types : Enumerable(UInt64))
      # gtk_tree_store_newv: (Constructor)
      # @types: (array length=n_columns element-type Gtype)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_columns = types.size
      # Generator::ArrayArgPlan
      types = types.to_a.to_unsafe

      # C call
      _retval = LibGtk.gtk_tree_store_newv(n_columns, types)

      # Return value handling

      @pointer = _retval
    end

    def initialize(*types : UInt64)
      initialize(types)
    end

    # Appends a new row to @tree_store.  If @parent is non-%NULL, then it will append the
    # new row after the last child of @parent, otherwise it will append a row to
    # the top level.  @iter will be changed to point to this new row.  The row will
    # be empty after this function is called.  To fill in values, you need to call
    # gtk_tree_store_set() or gtk_tree_store_set_value().
    def append(parent : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_tree_store_append: (Method)
      # @iter: (out) (caller-allocates)
      # @parent: (nullable)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # C call
      LibGtk.gtk_tree_store_append(self, iter, parent)

      # Return value handling

      iter
    end

    # Removes all rows from @tree_store
    def clear : Nil
      # gtk_tree_store_clear: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_store_clear(self)

      # Return value handling
    end

    # Creates a new row at @position.  If parent is non-%NULL, then the row will be
    # made a child of @parent.  Otherwise, the row will be created at the toplevel.
    # If @position is -1 or is larger than the number of rows at that level, then
    # the new row will be inserted to the end of the list.  @iter will be changed
    # to point to this new row.  The row will be empty after this function is
    # called.  To fill in values, you need to call gtk_tree_store_set() or
    # gtk_tree_store_set_value().
    def insert(parent : Gtk::TreeIter?, position : Int32) : Gtk::TreeIter
      # gtk_tree_store_insert: (Method)
      # @iter: (out) (caller-allocates)
      # @parent: (nullable)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # C call
      LibGtk.gtk_tree_store_insert(self, iter, parent, position)

      # Return value handling

      iter
    end

    # Inserts a new row after @sibling.  If @sibling is %NULL, then the row will be
    # prepended to @parent ’s children.  If @parent and @sibling are %NULL, then
    # the row will be prepended to the toplevel.  If both @sibling and @parent are
    # set, then @parent must be the parent of @sibling.  When @sibling is set,
    # @parent is optional.
    #
    # @iter will be changed to point to this new row.  The row will be empty after
    # this function is called.  To fill in values, you need to call
    # gtk_tree_store_set() or gtk_tree_store_set_value().
    def insert_after(parent : Gtk::TreeIter?, sibling : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_tree_store_insert_after: (Method)
      # @iter: (out) (caller-allocates)
      # @parent: (nullable)
      # @sibling: (nullable)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # Generator::NullableArrayPlan
      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      # C call
      LibGtk.gtk_tree_store_insert_after(self, iter, parent, sibling)

      # Return value handling

      iter
    end

    # Inserts a new row before @sibling.  If @sibling is %NULL, then the row will
    # be appended to @parent ’s children.  If @parent and @sibling are %NULL, then
    # the row will be appended to the toplevel.  If both @sibling and @parent are
    # set, then @parent must be the parent of @sibling.  When @sibling is set,
    # @parent is optional.
    #
    # @iter will be changed to point to this new row.  The row will be empty after
    # this function is called.  To fill in values, you need to call
    # gtk_tree_store_set() or gtk_tree_store_set_value().
    def insert_before(parent : Gtk::TreeIter?, sibling : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_tree_store_insert_before: (Method)
      # @iter: (out) (caller-allocates)
      # @parent: (nullable)
      # @sibling: (nullable)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # Generator::NullableArrayPlan
      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      # C call
      LibGtk.gtk_tree_store_insert_before(self, iter, parent, sibling)

      # Return value handling

      iter
    end

    # Creates a new row at @position. @iter will be changed to point to this
    # new row. If @position is -1, or larger than the number of rows on the list, then
    # the new row will be appended to the list. The row will be filled with
    # the values given to this function.
    #
    # Calling
    # `gtk_tree_store_insert_with_values (tree_store, iter, position, ...)`
    # has the same effect as calling
    # |[<!-- language="C" -->
    # gtk_tree_store_insert (tree_store, iter, position);
    # gtk_tree_store_set (tree_store, iter, ...);
    # ]|
    # with the different that the former will only emit a row_inserted signal,
    # while the latter will emit row_inserted, row_changed and if the tree store
    # is sorted, rows_reordered.  Since emitting the rows_reordered signal
    # repeatedly can affect the performance of the program,
    # gtk_tree_store_insert_with_values() should generally be preferred when
    # inserting rows in a sorted tree store.
    def insert_with_values(parent : Gtk::TreeIter?, position : Int32, columns : Enumerable(Int32), values : Enumerable(_)) : Gtk::TreeIter
      # gtk_tree_store_insert_with_valuesv: (Method)
      # @iter: (out) (caller-allocates) (optional)
      # @parent: (nullable)
      # @columns: (array length=n_values element-type Int32)
      # @values: (array length=n_values element-type Interface)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      iter = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # Generator::ArrayLengthArgPlan
      n_values = columns.size
      # Generator::ArrayArgPlan
      columns = columns.to_a.to_unsafe

      # Generator::ArrayLengthArgPlan
      n_values = values.size
      # Generator::ArrayArgPlan
      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      # C call
      LibGtk.gtk_tree_store_insert_with_valuesv(self, iter, parent, position, columns, values, n_values)

      # Return value handling

      iter
    end

    # Returns %TRUE if @iter is an ancestor of @descendant.  That is, @iter is the
    # parent (or grandparent or great-grandparent) of @descendant.
    def is_ancestor(iter : Gtk::TreeIter, descendant : Gtk::TreeIter) : Bool
      # gtk_tree_store_is_ancestor: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_store_is_ancestor(self, iter, descendant)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the depth of @iter.  This will be 0 for anything on the root level, 1
    # for anything down a level, etc.
    def iter_depth(iter : Gtk::TreeIter) : Int32
      # gtk_tree_store_iter_depth: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_store_iter_depth(self, iter)

      # Return value handling

      _retval
    end

    # Checks if the given iter is a valid iter for this `GtkTreeStore`.
    #
    # This function is slow. Only use it for debugging and/or testing
    # purposes.
    def iter_is_valid(iter : Gtk::TreeIter) : Bool
      # gtk_tree_store_iter_is_valid: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_store_iter_is_valid(self, iter)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Moves @iter in @tree_store to the position after @position. @iter and
    # @position should be in the same level. Note that this function only
    # works with unsorted stores. If @position is %NULL, @iter will be moved
    # to the start of the level.
    def move_after(iter : Gtk::TreeIter, position : Gtk::TreeIter?) : Nil
      # gtk_tree_store_move_after: (Method)
      # @position: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      position = if position.nil?
                   Pointer(Void).null
                 else
                   position.to_unsafe
                 end

      # C call
      LibGtk.gtk_tree_store_move_after(self, iter, position)

      # Return value handling
    end

    # Moves @iter in @tree_store to the position before @position. @iter and
    # @position should be in the same level. Note that this function only
    # works with unsorted stores. If @position is %NULL, @iter will be
    # moved to the end of the level.
    def move_before(iter : Gtk::TreeIter, position : Gtk::TreeIter?) : Nil
      # gtk_tree_store_move_before: (Method)
      # @position: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      position = if position.nil?
                   Pointer(Void).null
                 else
                   position.to_unsafe
                 end

      # C call
      LibGtk.gtk_tree_store_move_before(self, iter, position)

      # Return value handling
    end

    # Prepends a new row to @tree_store.  If @parent is non-%NULL, then it will prepend
    # the new row before the first child of @parent, otherwise it will prepend a row
    # to the top level.  @iter will be changed to point to this new row.  The row
    # will be empty after this function is called.  To fill in values, you need to
    # call gtk_tree_store_set() or gtk_tree_store_set_value().
    def prepend(parent : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_tree_store_prepend: (Method)
      # @iter: (out) (caller-allocates)
      # @parent: (nullable)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # C call
      LibGtk.gtk_tree_store_prepend(self, iter, parent)

      # Return value handling

      iter
    end

    # Removes @iter from @tree_store.  After being removed, @iter is set to the
    # next valid row at that level, or invalidated if it previously pointed to the
    # last one.
    def remove(iter : Gtk::TreeIter) : Bool
      # gtk_tree_store_remove: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_store_remove(self, iter)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This function is meant primarily for `GObjects` that inherit from
    # `GtkTreeStore`, and should only be used when constructing a new
    # `GtkTreeStore`.  It will not function after a row has been added,
    # or a method on the `GtkTreeModel` interface is called.
    def set_column_types(types : Enumerable(UInt64)) : Nil
      # gtk_tree_store_set_column_types: (Method)
      # @types: (array length=n_columns element-type Gtype)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_columns = types.size
      # Generator::ArrayArgPlan
      types = types.to_a.to_unsafe

      # C call
      LibGtk.gtk_tree_store_set_column_types(self, n_columns, types)

      # Return value handling
    end

    def set_column_types(*types : UInt64)
      set_column_types(types)
    end

    # Sets the data in the cell specified by @iter and @column.
    # The type of @value must be convertible to the type of the
    # column.
    def set_value(iter : Gtk::TreeIter, column : Int32, value : _) : Nil
      # gtk_tree_store_set_value: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGtk.gtk_tree_store_set_value(self, iter, column, value)

      # Return value handling
    end

    # Sets the value of one or more cells in the row referenced by @iter.
    # The variable argument list should contain integer column numbers,
    # each column number followed by the value to be set.
    # The list is terminated by a -1. For example, to set column 0 with type
    # %G_TYPE_STRING to “Foo”, you would write
    # `gtk_tree_store_set (store, iter, 0, "Foo", -1)`.
    #
    # The value will be referenced by the store if it is a %G_TYPE_OBJECT, and it
    # will be copied if it is a %G_TYPE_STRING or %G_TYPE_BOXED.
    def set(iter : Gtk::TreeIter, columns : Enumerable(Int32), values : Enumerable(_)) : Nil
      # gtk_tree_store_set_valuesv: (Method)
      # @columns: (array length=n_values element-type Int32)
      # @values: (array length=n_values element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_values = columns.size
      # Generator::ArrayArgPlan
      columns = columns.to_a.to_unsafe

      # Generator::ArrayLengthArgPlan
      n_values = values.size
      # Generator::ArrayArgPlan
      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      # C call
      LibGtk.gtk_tree_store_set_valuesv(self, iter, columns, values, n_values)

      # Return value handling
    end

    # Swaps @a and @b in the same level of @tree_store. Note that this function
    # only works with unsorted stores.
    def swap(a : Gtk::TreeIter, b : Gtk::TreeIter) : Nil
      # gtk_tree_store_swap: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_store_swap(self, a, b)

      # Return value handling
    end
  end
end
