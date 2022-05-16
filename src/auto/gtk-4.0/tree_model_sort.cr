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
  @[GObject::GeneratedWrapper]
  class TreeModelSort < GObject::Object
    include TreeDragSource
    include TreeModel
    include TreeSortable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TreeModelSortClass), class_init,
        sizeof(LibGtk::TreeModelSort), instance_init, 0)
    end

    GICrystal.define_new_method(TreeModelSort, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TreeModelSort`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, model : Gtk::TreeModel? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeModelSort.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gtk::AbstractTreeModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkTreeModelSort`, with @child_model as the child model.
    def self.new_with_model(child_model : Gtk::TreeModel) : self
      # gtk_tree_model_sort_new_with_model: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_model_sort_new_with_model(child_model)

      # Return value handling

      Gtk::TreeModelSort.new(_retval, GICrystal::Transfer::Full)
    end

    # This function should almost never be called.  It clears the @tree_model_sort
    # of any cached iterators that haven’t been reffed with
    # gtk_tree_model_ref_node().  This might be useful if the child model being
    # sorted is static (and doesn’t change often) and there has been a lot of
    # unreffed access to nodes.  As a side effect of this function, all unreffed
    # iters will be invalid.
    def clear_cache : Nil
      # gtk_tree_model_sort_clear_cache: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_model_sort_clear_cache(@pointer)

      # Return value handling
    end

    # Sets @sort_iter to point to the row in @tree_model_sort that corresponds to
    # the row pointed at by @child_iter.  If @sort_iter was not set, %FALSE
    # is returned.  Note: a boolean is only returned since 2.14.
    def convert_child_iter_to_iter(child_iter : Gtk::TreeIter) : Gtk::TreeIter
      # gtk_tree_model_sort_convert_child_iter_to_iter: (Method)
      # @sort_iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      sort_iter = Gtk::TreeIter.new
      # C call
      _retval = LibGtk.gtk_tree_model_sort_convert_child_iter_to_iter(@pointer, sort_iter, child_iter)

      # Return value handling

      sort_iter
    end

    # Converts @child_path to a path relative to @tree_model_sort.  That is,
    # @child_path points to a path in the child model.  The returned path will
    # point to the same row in the sorted model.  If @child_path isn’t a valid
    # path on the child model, then %NULL is returned.
    def convert_child_path_to_path(child_path : Gtk::TreePath) : Gtk::TreePath?
      # gtk_tree_model_sort_convert_child_path_to_path: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_model_sort_convert_child_path_to_path(@pointer, child_path)

      # Return value handling

      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Sets @child_iter to point to the row pointed to by @sorted_iter.
    def convert_iter_to_child_iter(sorted_iter : Gtk::TreeIter) : Gtk::TreeIter
      # gtk_tree_model_sort_convert_iter_to_child_iter: (Method)
      # @child_iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      child_iter = Gtk::TreeIter.new
      # C call
      LibGtk.gtk_tree_model_sort_convert_iter_to_child_iter(@pointer, child_iter, sorted_iter)

      # Return value handling

      child_iter
    end

    # Converts @sorted_path to a path on the child model of @tree_model_sort.
    # That is, @sorted_path points to a location in @tree_model_sort.  The
    # returned path will point to the same location in the model not being
    # sorted.  If @sorted_path does not point to a location in the child model,
    # %NULL is returned.
    def convert_path_to_child_path(sorted_path : Gtk::TreePath) : Gtk::TreePath?
      # gtk_tree_model_sort_convert_path_to_child_path: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_model_sort_convert_path_to_child_path(@pointer, sorted_path)

      # Return value handling

      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Returns the model the `GtkTreeModelSort` is sorting.
    def model : Gtk::TreeModel
      # gtk_tree_model_sort_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_model_sort_get_model(@pointer)

      # Return value handling

      Gtk::AbstractTreeModel.new(_retval, GICrystal::Transfer::None)
    end

    # > This function is slow. Only use it for debugging and/or testing
    # > purposes.
    #
    # Checks if the given iter is a valid iter for this `GtkTreeModelSort`.
    def iter_is_valid(iter : Gtk::TreeIter) : Bool
      # gtk_tree_model_sort_iter_is_valid: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_model_sort_iter_is_valid(@pointer, iter)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # This resets the default sort function to be in the “unsorted” state.  That
    # is, it is in the same order as the child model. It will re-sort the model
    # to be in the same order as the child model only if the `GtkTreeModelSort`
    # is in “unsorted” state.
    def reset_default_sort_func : Nil
      # gtk_tree_model_sort_reset_default_sort_func: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_model_sort_reset_default_sort_func(@pointer)

      # Return value handling
    end
  end
end
