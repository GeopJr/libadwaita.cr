require "../g_object-2.0/object"
require "./buildable"

require "./tree_drag_dest"

require "./tree_drag_source"

require "./tree_model"

require "./tree_sortable"

module Gtk
  # A list-like data structure that can be used with the [class@Gtk.TreeView].
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
  # application writer to call [method@Gtk.TreeModel.row_changed] to emit the
  # [signal@Gtk.TreeModel::row_changed] signal. This most commonly affects lists
  # with [class@Gdk.Texture]s stored.
  #
  # An example for creating a simple list store:
  #
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
  # The GtkListStore implementation of the [iface@Gtk.Buildable] interface allows
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
  class ListStore < GObject::Object
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
      LibGtk.gtk_list_store_get_type
    end

    def initialize(types : Enumerable(UInt64))
      # gtk_list_store_newv: (Constructor)
      # @types: (array length=n_columns element-type Gtype)
      # Returns: (transfer full)

      # Handle parameters
      n_columns = types.size
      types = types.to_a.to_unsafe

      # C call
      _retval = LibGtk.gtk_list_store_newv(n_columns, types)

      # Return value handling
      @pointer = _retval
    end

    def initialize(*types : UInt64)
      initialize(types)
    end

    def append : Gtk::TreeIter
      # gtk_list_store_append: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      iter = Gtk::TreeIter.new

      # C call
      LibGtk.gtk_list_store_append(self, iter)

      # Return value handling
      iter
    end

    def clear : Nil
      # gtk_list_store_clear: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_list_store_clear(self)

      # Return value handling
    end

    def insert(position : Int32) : Gtk::TreeIter
      # gtk_list_store_insert: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      iter = Gtk::TreeIter.new

      # C call
      LibGtk.gtk_list_store_insert(self, iter, position)

      # Return value handling
      iter
    end

    def insert_after(sibling : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_list_store_insert_after: (Method)
      # @iter: (out) (caller-allocates)
      # @sibling: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end
      iter = Gtk::TreeIter.new

      # C call
      LibGtk.gtk_list_store_insert_after(self, iter, sibling)

      # Return value handling
      iter
    end

    def insert_before(sibling : Gtk::TreeIter?) : Gtk::TreeIter
      # gtk_list_store_insert_before: (Method)
      # @iter: (out) (caller-allocates)
      # @sibling: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      sibling = if sibling.nil?
                  Pointer(Void).null
                else
                  sibling.to_unsafe
                end
      iter = Gtk::TreeIter.new

      # C call
      LibGtk.gtk_list_store_insert_before(self, iter, sibling)

      # Return value handling
      iter
    end

    def insert_with_values(position : Int32, columns : Enumerable(Int32), values : Enumerable(_)) : Gtk::TreeIter
      # gtk_list_store_insert_with_valuesv: (Method)
      # @iter: (out) (caller-allocates) (optional)
      # @columns: (array length=n_values element-type Int32)
      # @values: (array length=n_values element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_values = columns.size
      n_values = values.size
      iter = Pointer(Void).null
      columns = columns.to_a.to_unsafe

      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      iter = Gtk::TreeIter.new

      # C call
      LibGtk.gtk_list_store_insert_with_valuesv(self, iter, position, columns, values, n_values)

      # Return value handling
      iter
    end

    def iter_is_valid(iter : Gtk::TreeIter) : Bool
      # gtk_list_store_iter_is_valid: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_list_store_iter_is_valid(self, iter)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def move_after(iter : Gtk::TreeIter, position : Gtk::TreeIter?) : Nil
      # gtk_list_store_move_after: (Method)
      # @position: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      position = if position.nil?
                   Pointer(Void).null
                 else
                   position.to_unsafe
                 end

      # C call
      LibGtk.gtk_list_store_move_after(self, iter, position)

      # Return value handling
    end

    def move_before(iter : Gtk::TreeIter, position : Gtk::TreeIter?) : Nil
      # gtk_list_store_move_before: (Method)
      # @position: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      position = if position.nil?
                   Pointer(Void).null
                 else
                   position.to_unsafe
                 end

      # C call
      LibGtk.gtk_list_store_move_before(self, iter, position)

      # Return value handling
    end

    def prepend : Gtk::TreeIter
      # gtk_list_store_prepend: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      iter = Gtk::TreeIter.new

      # C call
      LibGtk.gtk_list_store_prepend(self, iter)

      # Return value handling
      iter
    end

    def remove(iter : Gtk::TreeIter) : Bool
      # gtk_list_store_remove: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_list_store_remove(self, iter)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def reorder(new_order : Enumerable(Int32)) : Nil
      # gtk_list_store_reorder: (Method)
      # @new_order: (array zero-terminated=1 element-type Int32)
      # Returns: (transfer none)

      # Handle parameters
      new_order = new_order.to_a.to_unsafe

      # C call
      LibGtk.gtk_list_store_reorder(self, new_order)

      # Return value handling
    end

    def reorder(*new_order : Int32)
      reorder(new_order)
    end

    def set_column_types(types : Enumerable(UInt64)) : Nil
      # gtk_list_store_set_column_types: (Method)
      # @types: (array length=n_columns element-type Gtype)
      # Returns: (transfer none)

      # Handle parameters
      n_columns = types.size
      types = types.to_a.to_unsafe

      # C call
      LibGtk.gtk_list_store_set_column_types(self, n_columns, types)

      # Return value handling
    end

    def set_column_types(*types : UInt64)
      set_column_types(types)
    end

    def set_value(iter : Gtk::TreeIter, column : Int32, value : _) : Nil
      # gtk_list_store_set_value: (Method)
      # Returns: (transfer none)

      # Handle parameters
      value = GObject::Value.new(value) unless value.is_a?(GObject::Value)

      # C call
      LibGtk.gtk_list_store_set_value(self, iter, column, value)

      # Return value handling
    end

    def set(iter : Gtk::TreeIter, columns : Enumerable(Int32), values : Enumerable(_)) : Nil
      # gtk_list_store_set_valuesv: (Method)
      # @columns: (array length=n_values element-type Int32)
      # @values: (array length=n_values element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_values = columns.size
      n_values = values.size
      columns = columns.to_a.to_unsafe

      values = values.to_a.map { |_i| GObject::Value.new(_i).to_unsafe.as(Pointer(LibGObject::Value)).value }.to_unsafe

      # C call
      LibGtk.gtk_list_store_set_valuesv(self, iter, columns, values, n_values)

      # Return value handling
    end

    def swap(a : Gtk::TreeIter, b : Gtk::TreeIter) : Nil
      # gtk_list_store_swap: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_list_store_swap(self, a, b)

      # Return value handling
    end
  end
end
