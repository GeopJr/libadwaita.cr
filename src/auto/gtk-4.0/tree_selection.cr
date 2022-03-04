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
  class TreeSelection < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, mode : Gtk::SelectionMode? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if mode
        (_names.to_unsafe + _n).value = "mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeSelection.g_type, _n, _names, _values)
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
      Gtk::SelectionMode.from_value(value)
    end

    def count_selected_rows : Int32
      # gtk_tree_selection_count_selected_rows: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_selection_count_selected_rows(self)

      # Return value handling
      _retval
    end

    def mode : Gtk::SelectionMode
      # gtk_tree_selection_get_mode: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_selection_get_mode(self)

      # Return value handling
      Gtk::SelectionMode.from_value(_retval)
    end

    def selected : Gtk::TreeIter
      # gtk_tree_selection_get_selected: (Method)
      # @model: (out) (optional)
      # @iter: (out) (caller-allocates) (optional)
      # Returns: (transfer none)

      # Handle parameters
      model = Pointer(Pointer(Void)).null
      iter = Pointer(Void).null
      iter = Gtk::TreeIter.new

      # C call
      _retval = LibGtk.gtk_tree_selection_get_selected(self, model, iter)

      # Return value handling
      iter
    end

    def selected_rows : GLib::List
      # gtk_tree_selection_get_selected_rows: (Method)
      # @model: (out) (optional)
      # Returns: (transfer full)

      # Handle parameters
      model = Pointer(Pointer(Void)).null

      # C call
      _retval = LibGtk.gtk_tree_selection_get_selected_rows(self, model)

      # Return value handling
      GLib::List(Gtk::TreePath).new(_retval, GICrystal::Transfer::Full)
    end

    def tree_view : Gtk::TreeView
      # gtk_tree_selection_get_tree_view: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_selection_get_tree_view(self)

      # Return value handling
      Gtk::TreeView.new(_retval, GICrystal::Transfer::None)
    end

    def iter_is_selected(iter : Gtk::TreeIter) : Bool
      # gtk_tree_selection_iter_is_selected: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_selection_iter_is_selected(self, iter)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def path_is_selected(path : Gtk::TreePath) : Bool
      # gtk_tree_selection_path_is_selected: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_tree_selection_path_is_selected(self, path)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def select_all : Nil
      # gtk_tree_selection_select_all: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_selection_select_all(self)

      # Return value handling
    end

    def select_iter(iter : Gtk::TreeIter) : Nil
      # gtk_tree_selection_select_iter: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_selection_select_iter(self, iter)

      # Return value handling
    end

    def select_path(path : Gtk::TreePath) : Nil
      # gtk_tree_selection_select_path: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_selection_select_path(self, path)

      # Return value handling
    end

    def select_range(start_path : Gtk::TreePath, end_path : Gtk::TreePath) : Nil
      # gtk_tree_selection_select_range: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_selection_select_range(self, start_path, end_path)

      # Return value handling
    end

    def selected_foreach(func : Pointer(Void), data : Pointer(Void)?) : Nil
      # gtk_tree_selection_selected_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGtk.gtk_tree_selection_selected_foreach(self, func, data)

      # Return value handling
    end

    def mode=(type : Gtk::SelectionMode) : Nil
      # gtk_tree_selection_set_mode: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_selection_set_mode(self, type)

      # Return value handling
    end

    def set_select_function(func : Pointer(Void)?, data : Pointer(Void)?, destroy : Pointer(Void)) : Nil
      # gtk_tree_selection_set_select_function: (Method)
      # @func: (nullable)
      # @data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      func = if func.nil?
               LibGtk::TreeSelectionFunc.null
             else
               func.to_unsafe
             end
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGtk.gtk_tree_selection_set_select_function(self, func, data, destroy)

      # Return value handling
    end

    def unselect_all : Nil
      # gtk_tree_selection_unselect_all: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_selection_unselect_all(self)

      # Return value handling
    end

    def unselect_iter(iter : Gtk::TreeIter) : Nil
      # gtk_tree_selection_unselect_iter: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_selection_unselect_iter(self, iter)

      # Return value handling
    end

    def unselect_path(path : Gtk::TreePath) : Nil
      # gtk_tree_selection_unselect_path: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_selection_unselect_path(self, path)

      # Return value handling
    end

    def unselect_range(start_path : Gtk::TreePath, end_path : Gtk::TreePath) : Nil
      # gtk_tree_selection_unselect_range: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tree_selection_unselect_range(self, start_path, end_path)

      # Return value handling
    end

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
