require "../g_object-2.0/object"

module Gtk
  # The selection object for GtkTreeView
  #
  # The `GtkTreeSelection` object is a helper object to manage the selection
  # for a `GtkTreeView` widget.  The `GtkTreeSelection` object is
  # automatically created when a new `GtkTreeView` widget is created, and
  # cannot exist independently of this widget.  The primary reason the
  # `GtkTreeSelection` objects exists is for cleanliness of code and API.
  # That is, there is no conceptual reason all these functions could not be
  # methods on the `GtkTreeView` widget instead of a separate function.
  #
  # The `GtkTreeSelection` object is gotten from a `GtkTreeView` by calling
  # gtk_tree_view_get_selection().  It can be manipulated to check the
  # selection status of the tree, as well as select and deselect individual
  # rows.  Selection is done completely view side.  As a result, multiple
  # views of the same model can have completely different selections.
  # Additionally, you cannot change the selection of a row on the model that
  # is not currently displayed by the view without expanding its parents
  # first.
  #
  # One of the important things to remember when monitoring the selection of
  # a view is that the `GtkTreeSelection`::changed signal is mostly a hint.
  # That is, it may only emit one signal when a range of rows is selected.
  # Additionally, it may on occasion emit a `GtkTreeSelection`::changed signal
  # when nothing has happened (mostly as a result of programmers calling
  # select_row on an already selected row).
  @[GObject::GeneratedWrapper]
  class TreeSelection < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::TreeSelection), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, mode : Gtk::SelectionMode? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !mode.nil?
        (_names.to_unsafe + _n).value = "mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeSelection.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_selection_get_type
    end

    def mode=(value : Gtk::SelectionMode) : Gtk::SelectionMode
      unsafe_value = value

      LibGObject.g_object_set(self, "mode", unsafe_value, Pointer(Void).null)
      value
    end

    def mode : Gtk::SelectionMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "mode", pointerof(value), Pointer(Void).null)
      Gtk::SelectionMode.new(value)
    end

    # Returns the number of rows that have been selected in @tree.
    def count_selected_rows : Int32
      # gtk_tree_selection_count_selected_rows: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_selection_count_selected_rows(self)

      # Return value handling

      _retval
    end

    # Gets the selection mode for @selection. See
    # gtk_tree_selection_set_mode().
    def mode : Gtk::SelectionMode
      # gtk_tree_selection_get_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_selection_get_mode(self)

      # Return value handling

      Gtk::SelectionMode.new(_retval)
    end

    # Sets @iter to the currently selected node if @selection is set to
    # %GTK_SELECTION_SINGLE or %GTK_SELECTION_BROWSE.  @iter may be NULL if you
    # just want to test if @selection has any selected nodes.  @model is filled
    # with the current model as a convenience.  This function will not work if you
    # use @selection is %GTK_SELECTION_MULTIPLE.
    def selected : Gtk::TreeIter
      # gtk_tree_selection_get_selected: (Method)
      # @model: (out) (optional)
      # @iter: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      model = Pointer(Pointer(Void)).null
      # Generator::OutArgUsedInReturnPlan
      iter = Pointer(Void).null
      # Generator::CallerAllocatesPlan
      iter = Gtk::TreeIter.new

      # C call
      _retval = LibGtk.gtk_tree_selection_get_selected(self, model, iter)

      # Return value handling

      iter
    end

    # Creates a list of path of all selected rows. Additionally, if you are
    # planning on modifying the model after calling this function, you may
    # want to convert the returned list into a list of `GtkTreeRowReference`s.
    # To do this, you can use gtk_tree_row_reference_new().
    #
    # To free the return value, use:
    # |[<!-- language="C" -->
    # g_list_free_full (list, (GDestroyNotify) gtk_tree_path_free);
    # ]|
    def selected_rows : GLib::List
      # gtk_tree_selection_get_selected_rows: (Method)
      # @model: (out) (optional)
      # Returns: (transfer full)

      # Generator::OutArgUsedInReturnPlan
      model = Pointer(Pointer(Void)).null

      # C call
      _retval = LibGtk.gtk_tree_selection_get_selected_rows(self, model)

      # Return value handling

      GLib::List(Gtk::TreePath).new(_retval, GICrystal::Transfer::Full)
    end

    # Returns the tree view associated with @selection.
    def tree_view : Gtk::TreeView
      # gtk_tree_selection_get_tree_view: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_selection_get_tree_view(self)

      # Return value handling

      Gtk::TreeView.new(_retval, GICrystal::Transfer::None)
    end

    # Returns %TRUE if the row at @iter is currently selected.
    def iter_is_selected(iter : Gtk::TreeIter) : Bool
      # gtk_tree_selection_iter_is_selected: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_selection_iter_is_selected(self, iter)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE if the row pointed to by @path is currently selected.  If @path
    # does not point to a valid location, %FALSE is returned
    def path_is_selected(path : Gtk::TreePath) : Bool
      # gtk_tree_selection_path_is_selected: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_selection_path_is_selected(self, path)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Selects all the nodes. @selection must be set to %GTK_SELECTION_MULTIPLE
    # mode.
    def select_all : Nil
      # gtk_tree_selection_select_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_selection_select_all(self)

      # Return value handling
    end

    # Selects the specified iterator.
    def select_iter(iter : Gtk::TreeIter) : Nil
      # gtk_tree_selection_select_iter: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_selection_select_iter(self, iter)

      # Return value handling
    end

    # Select the row at @path.
    def select_path(path : Gtk::TreePath) : Nil
      # gtk_tree_selection_select_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_selection_select_path(self, path)

      # Return value handling
    end

    # Selects a range of nodes, determined by @start_path and @end_path inclusive.
    # @selection must be set to %GTK_SELECTION_MULTIPLE mode.
    def select_range(start_path : Gtk::TreePath, end_path : Gtk::TreePath) : Nil
      # gtk_tree_selection_select_range: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_selection_select_range(self, start_path, end_path)

      # Return value handling
    end

    # Calls a function for each selected node. Note that you cannot modify
    # the tree or selection from within this function. As a result,
    # gtk_tree_selection_get_selected_rows() might be more useful.
    def selected_foreach(func : Pointer(Void), data : Pointer(Void)?) : Nil
      # gtk_tree_selection_selected_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGtk.gtk_tree_selection_selected_foreach(self, func, data)

      # Return value handling
    end

    # Sets the selection mode of the @selection.  If the previous type was
    # %GTK_SELECTION_MULTIPLE, then the anchor is kept selected, if it was
    # previously selected.
    def mode=(type : Gtk::SelectionMode) : Nil
      # gtk_tree_selection_set_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_selection_set_mode(self, type)

      # Return value handling
    end

    # Sets the selection function.
    #
    # If set, this function is called before any node is selected or unselected,
    # giving some control over which nodes are selected. The select function
    # should return %TRUE if the state of the node may be toggled, and %FALSE
    # if the state of the node should be left unchanged.
    def set_select_function(func : Pointer(Void)?, data : Pointer(Void)?, destroy : Pointer(Void)) : Nil
      # gtk_tree_selection_set_select_function: (Method)
      # @func: (nullable)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      func = if func.nil?
               LibGtk::TreeSelectionFunc.null
             else
               func.to_unsafe
             end

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGtk.gtk_tree_selection_set_select_function(self, func, data, destroy)

      # Return value handling
    end

    # Unselects all the nodes.
    def unselect_all : Nil
      # gtk_tree_selection_unselect_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_selection_unselect_all(self)

      # Return value handling
    end

    # Unselects the specified iterator.
    def unselect_iter(iter : Gtk::TreeIter) : Nil
      # gtk_tree_selection_unselect_iter: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_selection_unselect_iter(self, iter)

      # Return value handling
    end

    # Unselects the row at @path.
    def unselect_path(path : Gtk::TreePath) : Nil
      # gtk_tree_selection_unselect_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_selection_unselect_path(self, path)

      # Return value handling
    end

    # Unselects a range of nodes, determined by @start_path and @end_path
    # inclusive.
    def unselect_range(start_path : Gtk::TreePath, end_path : Gtk::TreePath) : Nil
      # gtk_tree_selection_unselect_range: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_selection_unselect_range(self, start_path, end_path)

      # Return value handling
    end

    # Emitted whenever the selection has (possibly) changed. Please note that
    # this signal is mostly a hint.  It may only be emitted once when a range
    # of rows are selected, and it may occasionally be emitted when nothing
    # has happened.
    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TreeSelection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeSelection.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeSelection, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeSelection, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TreeSelection.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TreeSelection, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end
