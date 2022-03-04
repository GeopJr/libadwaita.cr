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
  class TreeModelFilter < GObject::Object
    include TreeDragSource
    include TreeModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child_model : Gtk::TreeModel? = nil, virtual_root : Gtk::TreePath? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if child_model
        (_names.to_unsafe + _n).value = "child-model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child_model)
        _n += 1
      end
      if virtual_root
        (_names.to_unsafe + _n).value = "virtual-root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, virtual_root)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeModelFilter.g_type, _n, _names, _values)
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
      Gtk::TreeModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
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

    def clear_cache : Nil
      # gtk_tree_model_filter_clear_cache: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_model_filter_clear_cache(self)

      # Return value handling
    end

    def convert_child_iter_to_iter(child_iter : Gtk::TreeIter) : Gtk::TreeIter
      # gtk_tree_model_filter_convert_child_iter_to_iter: (Method)
      # @filter_iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      filter_iter = Gtk::TreeIter.new

      # C call
      _retval = LibGtk.gtk_tree_model_filter_convert_child_iter_to_iter(self, filter_iter, child_iter)

      # Return value handling
      filter_iter
    end

    def convert_child_path_to_path(child_path : Gtk::TreePath) : Gtk::TreePath?
      # gtk_tree_model_filter_convert_child_path_to_path: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_model_filter_convert_child_path_to_path(self, child_path)

      # Return value handling
      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def convert_iter_to_child_iter(filter_iter : Gtk::TreeIter) : Gtk::TreeIter
      # gtk_tree_model_filter_convert_iter_to_child_iter: (Method)
      # @child_iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      child_iter = Gtk::TreeIter.new

      # C call
      LibGtk.gtk_tree_model_filter_convert_iter_to_child_iter(self, child_iter, filter_iter)

      # Return value handling
      child_iter
    end

    def convert_path_to_child_path(filter_path : Gtk::TreePath) : Gtk::TreePath?
      # gtk_tree_model_filter_convert_path_to_child_path: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_model_filter_convert_path_to_child_path(self, filter_path)

      # Return value handling
      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def model : Gtk::TreeModel
      # gtk_tree_model_filter_get_model: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_model_filter_get_model(self)

      # Return value handling
      Gtk::TreeModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def refilter : Nil
      # gtk_tree_model_filter_refilter: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_model_filter_refilter(self)

      # Return value handling
    end

    def set_modify_func(types : Enumerable(UInt64), func : Pointer(Void), data : Pointer(Void)?, destroy : Pointer(Void)?) : Nil
      # gtk_tree_model_filter_set_modify_func: (Method)
      # @types: (array length=n_columns element-type Gtype)
      # @data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      n_columns = types.size
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end
      destroy = if destroy.nil?
                  LibGLib::DestroyNotify.null
                else
                  destroy.to_unsafe
                end
      types = types.to_a.to_unsafe

      # C call
      LibGtk.gtk_tree_model_filter_set_modify_func(self, n_columns, types, func, data, destroy)

      # Return value handling
    end

    def visible_column=(column : Int32) : Nil
      # gtk_tree_model_filter_set_visible_column: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_model_filter_set_visible_column(self, column)

      # Return value handling
    end

    def set_visible_func(func : Pointer(Void), data : Pointer(Void)?, destroy : Pointer(Void)?) : Nil
      # gtk_tree_model_filter_set_visible_func: (Method)
      # @data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end
      destroy = if destroy.nil?
                  LibGLib::DestroyNotify.null
                else
                  destroy.to_unsafe
                end

      # C call
      LibGtk.gtk_tree_model_filter_set_visible_func(self, func, data, destroy)

      # Return value handling
    end
  end
end
