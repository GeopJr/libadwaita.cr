require "../g_object-2.0/object"
require "./tree_drag_source"

require "./tree_model"

require "./tree_sortable"

module Gtk
  # A GtkTreeModel which makes an underlying tree model sortable
  #
  # The `GtkTreeModelSort` is a model which implements the `GtkTreeSortable`
  # interface.  It does not hold any data itself, but rather is created with
  # a child model and proxies its data.  It has identical column types to
  # this child model, and the changes in the child are propagated.  The
  # primary purpose of this model is to provide a way to sort a different
  # model without modifying it. Note that the sort function used by
  # `GtkTreeModelSort` is not guaranteed to be stable.
  #
  # The use of this is best demonstrated through an example.  In the
  # following sample code we create two `GtkTreeView` widgets each with a
  # view of the same data.  As the model is wrapped here by a
  # `GtkTreeModelSort`, the two `GtkTreeView`s can each sort their
  # view of the data without affecting the other.  By contrast, if we
  # simply put the same model in each widget, then sorting the first would
  # sort the second.
  #
  # ## Using a `GtkTreeModelSort`
  #
  # |[<!-- language="C" -->
  # {
  #   GtkTreeView *tree_view1;
  #   GtkTreeView *tree_view2;
  #   GtkTreeModel *sort_model1;
  #   GtkTreeModel *sort_model2;
  #   GtkTreeModel *child_model;
  #
  #   // get the child model
  #   child_model = get_my_model ();
  #
  #   // Create the first tree
  #   sort_model1 = gtk_tree_model_sort_new_with_model (child_model);
  #   tree_view1 = gtk_tree_view_new_with_model (sort_model1);
  #
  #   // Create the second tree
  #   sort_model2 = gtk_tree_model_sort_new_with_model (child_model);
  #   tree_view2 = gtk_tree_view_new_with_model (sort_model2);
  #
  #   // Now we can sort the two models independently
  #   gtk_tree_sortable_set_sort_column_id (GTK_TREE_SORTABLE (sort_model1),
  #                                         COLUMN_1, GTK_SORT_ASCENDING);
  #   gtk_tree_sortable_set_sort_column_id (GTK_TREE_SORTABLE (sort_model2),
  #                                         COLUMN_1, GTK_SORT_DESCENDING);
  # }
  # ]|
  #
  # To demonstrate how to access the underlying child model from the sort
  # model, the next example will be a callback for the `GtkTreeSelection`
  # `GtkTreeSelection::changed` signal.  In this callback, we get a string
  # from COLUMN_1 of the model.  We then modify the string, find the same
  # selected row on the child model, and change the row there.
  #
  # ## Accessing the child model of in a selection changed callback
  #
  # |[<!-- language="C" -->
  # void
  # selection_changed (GtkTreeSelection *selection, gpointer data)
  # {
  #   GtkTreeModel *sort_model = NULL;
  #   GtkTreeModel *child_model;
  #   GtkTreeIter sort_iter;
  #   GtkTreeIter child_iter;
  #   char *some_data = NULL;
  #   char *modified_data;
  #
  #   // Get the current selected row and the model.
  #   if (! gtk_tree_selection_get_selected (selection,
  #                                          &sort_model,
  #                                          &sort_iter))
  #     return;
  #
  #   // Look up the current value on the selected row and get
  #   // a new value to change it to.
  #   gtk_tree_model_get (GTK_TREE_MODEL (sort_model), &sort_iter,
  #                       COLUMN_1, &some_data,
  #                       -1);
  #
  #   modified_data = change_the_data (some_data);
  #   g_free (some_data);
  #
  #   // Get an iterator on the child model, instead of the sort model.
  #   gtk_tree_model_sort_convert_iter_to_child_iter (GTK_TREE_MODEL_SORT (sort_model),
  #                                                   &child_iter,
  #                                                   &sort_iter);
  #
  #   // Get the child model and change the value of the row. In this
  #   // example, the child model is a GtkListStore. It could be any other
  #   // type of model, though.
  #   child_model = gtk_tree_model_sort_get_model (GTK_TREE_MODEL_SORT (sort_model));
  #   gtk_list_store_set (GTK_LIST_STORE (child_model), &child_iter,
  #                       COLUMN_1, &modified_data,
  #                       -1);
  #   g_free (modified_data);
  # }
  # ]|
  class TreeModelSort < GObject::Object
    include TreeDragSource
    include TreeModel
    include TreeSortable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, model : Gtk::TreeModel? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if model
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeModelSort.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_model_sort_get_type
    end

    def model=(value : Gtk::TreeModel?) : Gtk::TreeModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def model : Gtk::TreeModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      Gtk::TreeModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def self.new_with_model(child_model : Gtk::TreeModel) : self
      # gtk_tree_model_sort_new_with_model: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_model_sort_new_with_model(child_model)

      # Return value handling
      Gtk::TreeModelSort.new(_retval, GICrystal::Transfer::Full)
    end

    def clear_cache : Nil
      # gtk_tree_model_sort_clear_cache: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_model_sort_clear_cache(self)

      # Return value handling
    end

    def convert_child_iter_to_iter(child_iter : Gtk::TreeIter) : Gtk::TreeIter
      # gtk_tree_model_sort_convert_child_iter_to_iter: (Method)
      # @sort_iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      sort_iter = Gtk::TreeIter.new

      # C call
      _retval = LibGtk.gtk_tree_model_sort_convert_child_iter_to_iter(self, sort_iter, child_iter)

      # Return value handling
      sort_iter
    end

    def convert_child_path_to_path(child_path : Gtk::TreePath) : Gtk::TreePath?
      # gtk_tree_model_sort_convert_child_path_to_path: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_model_sort_convert_child_path_to_path(self, child_path)

      # Return value handling
      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def convert_iter_to_child_iter(sorted_iter : Gtk::TreeIter) : Gtk::TreeIter
      # gtk_tree_model_sort_convert_iter_to_child_iter: (Method)
      # @child_iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      child_iter = Gtk::TreeIter.new

      # C call
      LibGtk.gtk_tree_model_sort_convert_iter_to_child_iter(self, child_iter, sorted_iter)

      # Return value handling
      child_iter
    end

    def convert_path_to_child_path(sorted_path : Gtk::TreePath) : Gtk::TreePath?
      # gtk_tree_model_sort_convert_path_to_child_path: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_model_sort_convert_path_to_child_path(self, sorted_path)

      # Return value handling
      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def model : Gtk::TreeModel
      # gtk_tree_model_sort_get_model: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_model_sort_get_model(self)

      # Return value handling
      Gtk::TreeModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def iter_is_valid(iter : Gtk::TreeIter) : Bool
      # gtk_tree_model_sort_iter_is_valid: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_model_sort_iter_is_valid(self, iter)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def reset_default_sort_func : Nil
      # gtk_tree_model_sort_reset_default_sort_func: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_model_sort_reset_default_sort_func(self)

      # Return value handling
    end
  end
end
