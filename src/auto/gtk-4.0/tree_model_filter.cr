require "../g_object-2.0/object"
require "./tree_drag_source"

require "./tree_model"

module Gtk
  # A `GtkTreeModel` which hides parts of an underlying tree model
  #
  # A `GtkTreeModelFilter` is a tree model which wraps another tree model,
  # and can do the following things:
  #
  # - Filter specific rows, based on data from a “visible column”, a column
  #   storing booleans indicating whether the row should be filtered or not,
  #   or based on the return value of a “visible function”, which gets a
  #   model, iter and user_data and returns a boolean indicating whether the
  #   row should be filtered or not.
  #
  # - Modify the “appearance” of the model, using a modify function.
  #   This is extremely powerful and allows for just changing some
  #   values and also for creating a completely different model based
  #   on the given child model.
  #
  # - Set a different root node, also known as a “virtual root”. You can pass
  #   in a `GtkTreePath` indicating the root node for the filter at construction
  #   time.
  #
  # The basic API is similar to `GtkTreeModelSort`. For an example on its usage,
  # see the section on `GtkTreeModelSort`.
  #
  # When using `GtkTreeModelFilter`, it is important to realize that
  # `GtkTreeModelFilter` maintains an internal cache of all nodes which are
  # visible in its clients. The cache is likely to be a subtree of the tree
  # exposed by the child model. `GtkTreeModelFilter` will not cache the entire
  # child model when unnecessary to not compromise the caching mechanism
  # that is exposed by the reference counting scheme. If the child model
  # implements reference counting, unnecessary signals may not be emitted
  # because of reference counting rule 3, see the `GtkTreeModel`
  # documentation. (Note that e.g. `GtkTreeStore` does not implement
  # reference counting and will always emit all signals, even when
  # the receiving node is not visible).
  #
  # Because of this, limitations for possible visible functions do apply.
  # In general, visible functions should only use data or properties from
  # the node for which the visibility state must be determined, its siblings
  # or its parents. Usually, having a dependency on the state of any child
  # node is not possible, unless references are taken on these explicitly.
  # When no such reference exists, no signals may be received for these child
  # nodes (see reference counting rule number 3 in the `GtkTreeModel` section).
  #
  # Determining the visibility state of a given node based on the state
  # of its child nodes is a frequently occurring use case. Therefore,
  # `GtkTreeModelFilter` explicitly supports this. For example, when a node
  # does not have any children, you might not want the node to be visible.
  # As soon as the first row is added to the node’s child level (or the
  # last row removed), the node’s visibility should be updated.
  #
  # This introduces a dependency from the node on its child nodes. In order
  # to accommodate this, `GtkTreeModelFilter` must make sure the necessary
  # signals are received from the child model. This is achieved by building,
  # for all nodes which are exposed as visible nodes to `GtkTreeModelFilter`'s
  # clients, the child level (if any) and take a reference on the first node
  # in this level. Furthermore, for every row-inserted, row-changed or
  # row-deleted signal (also these which were not handled because the node
  # was not cached), `GtkTreeModelFilter` will check if the visibility state
  # of any parent node has changed.
  #
  # Beware, however, that this explicit support is limited to these two
  # cases. For example, if you want a node to be visible only if two nodes
  # in a child’s child level (2 levels deeper) are visible, you are on your
  # own. In this case, either rely on `GtkTreeStore` to emit all signals
  # because it does not implement reference counting, or for models that
  # do implement reference counting, obtain references on these child levels
  # yourself.
  @[GObject::GeneratedWrapper]
  class TreeModelFilter < GObject::Object
    include TreeDragSource
    include TreeModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TreeModelFilterClass), class_init,
        sizeof(LibGtk::TreeModelFilter), instance_init, 0)
    end

    GICrystal.define_new_method(TreeModelFilter, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TreeModelFilter`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child_model : Gtk::TreeModel? = nil, virtual_root : Gtk::TreePath? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !child_model.nil?
        (_names.to_unsafe + _n).value = "child-model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_model)
        _n += 1
      end
      if !virtual_root.nil?
        (_names.to_unsafe + _n).value = "virtual-root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, virtual_root)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeModelFilter.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_model_filter_get_type
    end

    def child_model=(value : Gtk::TreeModel?) : Gtk::TreeModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "child-model", unsafe_value, Pointer(Void).null)
      value
    end

    def child_model : Gtk::TreeModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "child-model", pointerof(value), Pointer(Void).null)
      Gtk::AbstractTreeModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def virtual_root=(value : Gtk::TreePath?) : Gtk::TreePath?
      unsafe_value = value

      LibGObject.g_object_set(self, "virtual-root", unsafe_value, Pointer(Void).null)
      value
    end

    def virtual_root : Gtk::TreePath?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "virtual-root", pointerof(value), Pointer(Void).null)
      Gtk::TreePath.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # This function should almost never be called. It clears the @filter
    # of any cached iterators that haven’t been reffed with
    # gtk_tree_model_ref_node(). This might be useful if the child model
    # being filtered is static (and doesn’t change often) and there has been
    # a lot of unreffed access to nodes. As a side effect of this function,
    # all unreffed iters will be invalid.
    def clear_cache : Nil
      # gtk_tree_model_filter_clear_cache: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_model_filter_clear_cache(@pointer)

      # Return value handling
    end

    # Sets @filter_iter to point to the row in @filter that corresponds to the
    # row pointed at by @child_iter.  If @filter_iter was not set, %FALSE is
    # returned.
    def convert_child_iter_to_iter(child_iter : Gtk::TreeIter) : Gtk::TreeIter
      # gtk_tree_model_filter_convert_child_iter_to_iter: (Method)
      # @filter_iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      filter_iter = Gtk::TreeIter.new
      # C call
      _retval = LibGtk.gtk_tree_model_filter_convert_child_iter_to_iter(@pointer, filter_iter, child_iter)

      # Return value handling

      filter_iter
    end

    # Converts @child_path to a path relative to @filter. That is, @child_path
    # points to a path in the child model. The rerturned path will point to the
    # same row in the filtered model. If @child_path isn’t a valid path on the
    # child model or points to a row which is not visible in @filter, then %NULL
    # is returned.
    def convert_child_path_to_path(child_path : Gtk::TreePath) : Gtk::TreePath?
      # gtk_tree_model_filter_convert_child_path_to_path: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_model_filter_convert_child_path_to_path(@pointer, child_path)

      # Return value handling

      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Sets @child_iter to point to the row pointed to by @filter_iter.
    def convert_iter_to_child_iter(filter_iter : Gtk::TreeIter) : Gtk::TreeIter
      # gtk_tree_model_filter_convert_iter_to_child_iter: (Method)
      # @child_iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      child_iter = Gtk::TreeIter.new
      # C call
      LibGtk.gtk_tree_model_filter_convert_iter_to_child_iter(@pointer, child_iter, filter_iter)

      # Return value handling

      child_iter
    end

    # Converts @filter_path to a path on the child model of @filter. That is,
    # @filter_path points to a location in @filter. The returned path will
    # point to the same location in the model not being filtered. If @filter_path
    # does not point to a location in the child model, %NULL is returned.
    def convert_path_to_child_path(filter_path : Gtk::TreePath) : Gtk::TreePath?
      # gtk_tree_model_filter_convert_path_to_child_path: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_model_filter_convert_path_to_child_path(@pointer, filter_path)

      # Return value handling

      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Returns a pointer to the child model of @filter.
    def model : Gtk::TreeModel
      # gtk_tree_model_filter_get_model: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_model_filter_get_model(@pointer)

      # Return value handling

      Gtk::AbstractTreeModel.new(_retval, GICrystal::Transfer::None)
    end

    # Emits ::row_changed for each row in the child model, which causes
    # the filter to re-evaluate whether a row is visible or not.
    def refilter : Nil
      # gtk_tree_model_filter_refilter: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_model_filter_refilter(@pointer)

      # Return value handling
    end

    # With the @n_columns and @types parameters, you give an array of column
    # types for this model (which will be exposed to the parent model/view).
    # The @func, @data and @destroy parameters are for specifying the modify
    # function. The modify function will get called for each
    # data access, the goal of the modify function is to return the data which
    # should be displayed at the location specified using the parameters of the
    # modify function.
    #
    # Note that gtk_tree_model_filter_set_modify_func()
    # can only be called once for a given filter model.
    def set_modify_func(types : Enumerable(UInt64), func : Gtk::TreeModelFilterModifyFunc) : Nil
      # gtk_tree_model_filter_set_modify_func: (Method)
      # @types: (array length=n_columns element-type Gtype)
      # @data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_columns = types.size # Generator::ArrayArgPlan
      types = types.to_a.to_unsafe
      # Generator::CallbackArgPlan
      if func
        _box = ::Box.box(func)
        func = ->(lib_model : Pointer(Void), lib_iter : Pointer(Void), lib_value : Void, lib_column : Int32, lib_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          model = Gtk::TreeModel.new(lib_model, :none)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          # Generator::CallerAllocatesPlan
          column = lib_column
          ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Int32, Nil)).unbox(lib_data).call(model, iter, column)
        }.pointer
        data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        func = data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_tree_model_filter_set_modify_func(@pointer, n_columns, types, func, data, destroy)

      # Return value handling
    end

    # Sets @column of the child_model to be the column where @filter should
    # look for visibility information. @columns should be a column of type
    # %G_TYPE_BOOLEAN, where %TRUE means that a row is visible, and %FALSE
    # if not.
    #
    # Note that gtk_tree_model_filter_set_visible_func() or
    # gtk_tree_model_filter_set_visible_column() can only be called
    # once for a given filter model.
    def visible_column=(column : Int32) : Nil
      # gtk_tree_model_filter_set_visible_column: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_model_filter_set_visible_column(@pointer, column)

      # Return value handling
    end

    # Sets the visible function used when filtering the @filter to be @func.
    # The function should return %TRUE if the given row should be visible and
    # %FALSE otherwise.
    #
    # If the condition calculated by the function changes over time (e.g.
    # because it depends on some global parameters), you must call
    # gtk_tree_model_filter_refilter() to keep the visibility information
    # of the model up-to-date.
    #
    # Note that @func is called whenever a row is inserted, when it may still
    # be empty. The visible function should therefore take special care of empty
    # rows, like in the example below.
    #
    # |[<!-- language="C" -->
    # static gboolean
    # visible_func (GtkTreeModel *model,
    #               GtkTreeIter  *iter,
    #               gpointer      data)
    # {
    #   // Visible if row is non-empty and first column is “HI”
    #   char *str;
    #   gboolean visible = FALSE;
    #
    #   gtk_tree_model_get (model, iter, 0, &str, -1);
    #   if (str && strcmp (str, "HI") == 0)
    #     visible = TRUE;
    #   g_free (str);
    #
    #   return visible;
    # }
    # ]|
    #
    # Note that gtk_tree_model_filter_set_visible_func() or
    # gtk_tree_model_filter_set_visible_column() can only be called
    # once for a given filter model.
    def visible_func=(func : Gtk::TreeModelFilterVisibleFunc) : Nil
      # gtk_tree_model_filter_set_visible_func: (Method)
      # @data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if func
        _box = ::Box.box(func)
        func = ->(lib_model : Pointer(Void), lib_iter : Pointer(Void), lib_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          model = Gtk::TreeModel.new(lib_model, :none)
          # Generator::BuiltInTypeArgPlan
          iter = Gtk::TreeIter.new(lib_iter, :none)
          ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Bool)).unbox(lib_data).call(model, iter)
        }.pointer
        data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        func = data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_tree_model_filter_set_visible_func(@pointer, func, data, destroy)

      # Return value handling
    end
  end
end
