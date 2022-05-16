require "../g_object-2.0/object"
require "./buildable"

require "./tree_drag_dest"

require "./tree_drag_source"

require "./tree_model"

require "./tree_sortable"

module Gtk
  # A list-like data structure that can be used with the `Gtk#TreeView`.
  #
  # The `GtkListStore` object is a list model for use with a `GtkTreeView`
  # widget.  It implements the `GtkTreeModel` interface, and consequentialy,
  # can use all of the methods available there.  It also implements the
  # `GtkTreeSortable` interface so it can be sorted by the view.
  # Finally, it also implements the tree
  # [drag](iface.TreeDragSource.html) and [drop](iface.TreeDragDest.html)
  # interfaces.
  #
  # The `GtkListStore` can accept most `GType`s as a column type, though
  # it can’t accept all custom types.  Internally, it will keep a copy of
  # data passed in (such as a string or a boxed pointer).  Columns that
  # accept `GObject`s are handled a little differently.  The
  # `GtkListStore` will keep a reference to the object instead of copying the
  # value.  As a result, if the object is modified, it is up to the
  # application writer to call `Gtk::TreeModel#row_changed` to emit the
  # `Gtk::TreeModel::#row_changed` signal. This most commonly affects lists
  # with `Gdk#Texture`s stored.
  #
  # An example for creating a simple list store:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # enum {
  #   COLUMN_STRING,
  #   COLUMN_INT,
  #   COLUMN_BOOLEAN,
  #   N_COLUMNS
  # };
  #
  # {
  #   GtkListStore *list_store;
  #   GtkTreePath *path;
  #   GtkTreeIter iter;
  #   int i;
  #
  #   list_store = gtk_list_store_new (N_COLUMNS,
  #                                    G_TYPE_STRING,
  #                                    G_TYPE_INT,
  #                                    G_TYPE_BOOLEAN);
  #
  #   for (i = 0; i < 10; i++)
  #     {
  #       char *some_data;
  #
  #       some_data = get_some_data (i);
  #
  #       // Add a new row to the model
  #       gtk_list_store_append (list_store, &iter);
  #       gtk_list_store_set (list_store, &iter,
  #                           COLUMN_STRING, some_data,
  #                           COLUMN_INT, i,
  #                           COLUMN_BOOLEAN,  FALSE,
  #                           -1);
  #
  #       // As the store will keep a copy of the string internally,
  #       // we free some_data.
  #       g_free (some_data);
  #     }
  #
  #   // Modify a particular row
  #   path = gtk_tree_path_new_from_string ("4");
  #   gtk_tree_model_get_iter (GTK_TREE_MODEL (list_store),
  #                            &iter,
  #                            path);
  #   gtk_tree_path_free (path);
  #   gtk_list_store_set (list_store, &iter,
  #                       COLUMN_BOOLEAN, TRUE,
  #                       -1);
  # }
  # ```
  #
  # # Performance Considerations
  #
  # Internally, the `GtkListStore` was originally implemented with a linked list
  # with a tail pointer.  As a result, it was fast at data insertion and deletion,
  # and not fast at random data access.  The `GtkListStore` sets the
  # `GTK_TREE_MODEL_ITERS_PERSIST` flag, which means that `GtkTreeIter`s can be
  # cached while the row exists.  Thus, if access to a particular row is needed
  # often and your code is expected to run on older versions of GTK, it is worth
  # keeping the iter around.
  #
  # # Atomic Operations
  #
  # It is important to note that only the methods
  # gtk_list_store_insert_with_values() and gtk_list_store_insert_with_valuesv()
  # are atomic, in the sense that the row is being appended to the store and the
  # values filled in in a single operation with regard to `GtkTreeModel` signaling.
  # In contrast, using e.g. gtk_list_store_append() and then gtk_list_store_set()
  # will first create a row, which triggers the `GtkTreeModel::row-inserted` signal
  # on `GtkListStore`. The row, however, is still empty, and any signal handler
  # connecting to `GtkTreeModel::row-inserted` on this particular store should be prepared
  # for the situation that the row might be empty. This is especially important
  # if you are wrapping the `GtkListStore` inside a `GtkTreeModel`Filter and are
  # using a `GtkTreeModel`FilterVisibleFunc. Using any of the non-atomic operations
  # to append rows to the `GtkListStore` will cause the
  # `GtkTreeModel`FilterVisibleFunc to be visited with an empty row first; the
  # function must be prepared for that.
  #
  # # GtkListStore as GtkBuildable
  #
  # The GtkListStore implementation of the `Gtk#Buildable` interface allows
  # to specify the model columns with a `<columns>` element that may contain
  # multiple `<column>` elements, each specifying one model column. The “type”
  # attribute specifies the data type for the column.
  #
  # Additionally, it is possible to specify content for the list store
  # in the UI definition, with the `<data>` element. It can contain multiple
  # `<row>` elements, each specifying to content for one row of the list model.
  # Inside a `<row>`, the `<col>` elements specify the content for individual cells.
  #
  # Note that it is probably more common to define your models in the code,
  # and one might consider it a layering violation to specify the content of
  # a list store in a UI definition, data, not presentation, and common wisdom
  # is to separate the two, as far as possible.
  #
  # An example of a UI Definition fragment for a list store:
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkListStore">
  #   <columns>
  #     <column type="gchararray"/>
  #     <column type="gchararray"/>
  #     <column type="gint"/>
  #   </columns>
  #   <data>
  #     <row>
  #       <col id="0">John</col>
  #       <col id="1">Doe</col>
  #       <col id="2">25</col>
  #     </row>
  #     <row>
  #       <col id="0">Johan</col>
  #       <col id="1">Dahlin</col>
  #       <col id="2">50</col>
  #     </row>
  #   </data>
  # </object>
  # ```
  @[GObject::GeneratedWrapper]
  class ListStore < GObject::Object
    include Buildable
    include TreeDragDest
    include TreeDragSource
    include TreeModel
    include TreeSortable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ListStoreClass), class_init,
        sizeof(LibGtk::ListStore), instance_init, 0)
    end

    GICrystal.define_new_method(ListStore, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ListStore`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_list_store_get_type
    end

    # Creates a new list store as with @n_columns columns each of the types passed
    # in.  Note that only types derived from standard GObject fundamental types
    # are supported.
    #
    # As an example, `gtk_list_store_new (3, G_TYPE_INT, G_TYPE_STRING,
    # GDK_TYPE_TEXTURE);` will create a new `GtkListStore` with three columns, of type
    # int, string and `GdkTexture`, respectively.
    def initialize(types : Enumerable(UInt64))
      # gtk_list_store_newv: (Constructor)
      # @types: (array length=n_columns element-type Gtype)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      n_columns = types.size # Generator::ArrayArgPlan
      types = types.to_a.to_unsafe

      # C call
      _retval = LibGtk.gtk_list_store_newv(n_columns, types)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def initialize(*types : UInt64)
      initialize(types)
    end

    # Appends a new row to @list_store.  @iter will be changed to point to this new
    # row.  The row will be empty after this function is called.  To fill in
    # values, you need to call gtk_list_store_set() or gtk_list_store_set_value().
    def append : Gtk::TreeIter
      # gtk_list_store_append: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # C call
      LibGtk.gtk_list_store_append(@pointer, iter)

      # Return value handling

      iter
    end

    # Removes all rows from the list store.
    def clear : Nil
      # gtk_list_store_clear: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_store_clear(@pointer)

      # Return value handling
    end

    # Creates a new row at @position.  @iter will be changed to point to this new
    # row.  If @position is -1 or is larger than the number of rows on the list,
    # then the new row will be appended to the list. The row will be empty after
    # this function is called.  To fill in values, you need to call
    # gtk_list_store_set() or gtk_list_store_set_value().
    def insert(position : Int32) : Gtk::TreeIter
      # gtk_list_store_insert: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # C call
      LibGtk.gtk_list_store_insert(@pointer, iter, position)

      # Return value handling

      iter
    end

    # Inserts a new row after @sibling. If @sibling is %NULL, then the row will be
    # prepended to the beginning of the list. @iter will be changed to point to
    # this new row. The row will be empty after this function is called. To fill
    # in values, you need to call gtk_list_store_set() or gtk_list_store_set_value().
    def insert_after(sibling : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_list_store_insert_after: (Method)
      # @iter: (out) (caller-allocates)
      # @sibling: (nullable)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new # Generator::NullableArrayPlan
      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      # C call
      LibGtk.gtk_list_store_insert_after(@pointer, iter, sibling)

      # Return value handling

      iter
    end

    # Inserts a new row before @sibling. If @sibling is %NULL, then the row will
    # be appended to the end of the list. @iter will be changed to point to this
    # new row. The row will be empty after this function is called. To fill in
    # values, you need to call gtk_list_store_set() or gtk_list_store_set_value().
    def insert_before(sibling : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_list_store_insert_before: (Method)
      # @iter: (out) (caller-allocates)
      # @sibling: (nullable)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new # Generator::NullableArrayPlan
      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end

      # C call
      LibGtk.gtk_list_store_insert_before(@pointer, iter, sibling)

      # Return value handling

      iter
    end

    # Creates a new row at @position. @iter will be changed to point to this new
    # row. If @position is -1, or larger than the number of rows in the list, then
    # the new row will be appended to the list. The row will be filled with the
    # values given to this function.
    #
    # Calling
    # `gtk_list_store_insert_with_values (list_store, iter, position...)`
    # has the same effect as calling:
    #
    # |[<!-- language="C" -->
    # static void
    # insert_value (GtkListStore *list_store,
    #               GtkTreeIter  *iter,
    #               int           position)
    # {
    #   gtk_list_store_insert (list_store, iter, position);
    #   gtk_list_store_set (list_store,
    #                       iter
    #                       // ...
    #                       );
    # }
    # ]|
    #
    # with the difference that the former will only emit `GtkTreeModel`::row-inserted
    # once, while the latter will emit `GtkTreeModel`::row-inserted,
    # `GtkTreeModel`::row-changed and, if the list store is sorted,
    # `GtkTreeModel`::rows-reordered for every inserted value.
    #
    # Since emitting the `GtkTreeModel::rows-reordered` signal repeatedly can
    # affect the performance of the program, gtk_list_store_insert_with_values()
    # should generally be preferred when inserting rows in a sorted list store.
    def insert_with_values(position : Int32, columns : Enumerable(Int32), values : Enumerable(_)) : Gtk::TreeIter
      # gtk_list_store_insert_with_valuesv: (Method)
      # @iter: (out) (caller-allocates) (optional)
      # @columns: (array length=n_values element-type Int32)
      # @values: (array length=n_values element-type Interface)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      iter = Pointer(Void).null # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new  # Generator::ArrayLengthArgPlan
      n_values = columns.size   # Generator::ArrayArgPlan
      columns = columns.to_a.to_unsafe
      # Generator::ArrayLengthArgPlan
      n_values = values.size # Generator::ArrayArgPlan
      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      # C call
      LibGtk.gtk_list_store_insert_with_valuesv(@pointer, iter, position, columns, values, n_values)

      # Return value handling

      iter
    end

    # Checks if the given iter is a valid iter for this `GtkListStore`.
    #
    # This function is slow. Only use it for debugging and/or testing
    # purposes.
    def iter_is_valid(iter : Gtk::TreeIter) : Bool
      # gtk_list_store_iter_is_valid: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_store_iter_is_valid(@pointer, iter)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Moves @iter in @store to the position after @position. Note that this
    # function only works with unsorted stores. If @position is %NULL, @iter
    # will be moved to the start of the list.
    def move_after(iter : Gtk::TreeIter, position : Gtk::TreeIter?) : Nil
      # gtk_list_store_move_after: (Method)
      # @position: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      position = if position.nil?
                   Pointer(Void).null
                 else
                   position.to_unsafe
                 end

      # C call
      LibGtk.gtk_list_store_move_after(@pointer, iter, position)

      # Return value handling
    end

    # Moves @iter in @store to the position before @position. Note that this
    # function only works with unsorted stores. If @position is %NULL, @iter
    # will be moved to the end of the list.
    def move_before(iter : Gtk::TreeIter, position : Gtk::TreeIter?) : Nil
      # gtk_list_store_move_before: (Method)
      # @position: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      position = if position.nil?
                   Pointer(Void).null
                 else
                   position.to_unsafe
                 end

      # C call
      LibGtk.gtk_list_store_move_before(@pointer, iter, position)

      # Return value handling
    end

    # Prepends a new row to @list_store. @iter will be changed to point to this new
    # row. The row will be empty after this function is called. To fill in
    # values, you need to call gtk_list_store_set() or gtk_list_store_set_value().
    def prepend : Gtk::TreeIter
      # gtk_list_store_prepend: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new
      # C call
      LibGtk.gtk_list_store_prepend(@pointer, iter)

      # Return value handling

      iter
    end

    # Removes the given row from the list store.  After being removed,
    # @iter is set to be the next valid row, or invalidated if it pointed
    # to the last row in @list_store.
    def remove(iter : Gtk::TreeIter) : Bool
      # gtk_list_store_remove: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_store_remove(@pointer, iter)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Reorders @store to follow the order indicated by @new_order. Note that
    # this function only works with unsorted stores.
    def reorder(new_order : Enumerable(Int32)) : Nil
      # gtk_list_store_reorder: (Method)
      # @new_order: (array zero-terminated=1 element-type Int32)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      new_order = new_order.to_a.to_unsafe

      # C call
      LibGtk.gtk_list_store_reorder(@pointer, new_order)

      # Return value handling
    end

    def reorder(*new_order : Int32)
      reorder(new_order)
    end

    # This function is meant primarily for `GObject`s that inherit from `GtkListStore`,
    # and should only be used when constructing a new `GtkListStore`.  It will not
    # function after a row has been added, or a method on the `GtkTreeModel`
    # interface is called.
    def column_types=(types : Enumerable(UInt64)) : Nil
      # gtk_list_store_set_column_types: (Method)
      # @types: (array length=n_columns element-type Gtype)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_columns = types.size # Generator::ArrayArgPlan
      types = types.to_a.to_unsafe

      # C call
      LibGtk.gtk_list_store_set_column_types(@pointer, n_columns, types)

      # Return value handling
    end

    # Sets the data in the cell specified by @iter and @column.
    # The type of @value must be convertible to the type of the
    # column.
    def set_value(iter : Gtk::TreeIter, column : Int32, value : _) : Nil
      # gtk_list_store_set_value: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGtk.gtk_list_store_set_value(@pointer, iter, column, value)

      # Return value handling
    end

    # Sets the value of one or more cells in the row referenced by @iter.
    # The variable argument list should contain integer column numbers,
    # each column number followed by the value to be set.
    # The list is terminated by a -1. For example, to set column 0 with type
    # %G_TYPE_STRING to “Foo”, you would write `gtk_list_store_set (store, iter,
    # 0, "Foo", -1)`.
    #
    # The value will be referenced by the store if it is a %G_TYPE_OBJECT, and it
    # will be copied if it is a %G_TYPE_STRING or %G_TYPE_BOXED.
    def set(iter : Gtk::TreeIter, columns : Enumerable(Int32), values : Enumerable(_)) : Nil
      # gtk_list_store_set_valuesv: (Method)
      # @columns: (array length=n_values element-type Int32)
      # @values: (array length=n_values element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_values = columns.size # Generator::ArrayArgPlan
      columns = columns.to_a.to_unsafe
      # Generator::ArrayLengthArgPlan
      n_values = values.size # Generator::ArrayArgPlan
      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      # C call
      LibGtk.gtk_list_store_set_valuesv(@pointer, iter, columns, values, n_values)

      # Return value handling
    end

    # Swaps @a and @b in @store. Note that this function only works with
    # unsorted stores.
    def swap(a : Gtk::TreeIter, b : Gtk::TreeIter) : Nil
      # gtk_list_store_swap: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_store_swap(@pointer, a, b)

      # Return value handling
    end
  end
end
