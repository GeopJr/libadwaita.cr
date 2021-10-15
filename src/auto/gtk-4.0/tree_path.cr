module Gtk
  # An opaque structure representing a path to a row in a model.
  class TreePath
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(TreePath.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(TreePath.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_path_get_type
    end

    def initialize
      # gtk_tree_path_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_path_new
      @pointer = _retval
    end

    def self.new_first : Gtk::TreePath
      # gtk_tree_path_new_first: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_path_new_first
      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_indices(indices : Enumerable(Int32)) : Gtk::TreePath
      # gtk_tree_path_new_from_indicesv: (Constructor)
      # @indices: (array length=length element-type Int32)
      # Returns: (transfer full)

      length = indices.size
      indices = indices.to_a.to_unsafe

      _retval = LibGtk.gtk_tree_path_new_from_indicesv(indices, length)
      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_indices(*indices : Int32)
      self.new_from_indices(indices)
    end

    def self.new_from_string(path : ::String) : Gtk::TreePath?
      # gtk_tree_path_new_from_string: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_path_new_from_string(path)
      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def append_index(index_ : Int32) : Nil
      # gtk_tree_path_append_index: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_path_append_index(self, index_)
    end

    def compare(b : Gtk::TreePath) : Int32
      # gtk_tree_path_compare: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_path_compare(self, b)
      _retval
    end

    def copy : Gtk::TreePath
      # gtk_tree_path_copy: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_path_copy(self)
      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full)
    end

    def down : Nil
      # gtk_tree_path_down: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_path_down(self)
    end

    def free : Nil
      # gtk_tree_path_free: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_path_free(self)
    end

    def depth : Int32
      # gtk_tree_path_get_depth: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_path_get_depth(self)
      _retval
    end

    def indices : Enumerable(Int32)?
      # gtk_tree_path_get_indices_with_depth: (Method)
      # @depth: (out) (transfer full) (optional)
      # Returns: (transfer none)

      depth = Pointer(Int32).null

      _retval = LibGtk.gtk_tree_path_get_indices_with_depth(self, depth)
      _retval unless _retval.null?
    end

    def is_ancestor(descendant : Gtk::TreePath) : Bool
      # gtk_tree_path_is_ancestor: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_path_is_ancestor(self, descendant)
      GICrystal.to_bool(_retval)
    end

    def is_descendant(ancestor : Gtk::TreePath) : Bool
      # gtk_tree_path_is_descendant: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_path_is_descendant(self, ancestor)
      GICrystal.to_bool(_retval)
    end

    def _next : Nil
      # gtk_tree_path_next: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_path_next(self)
    end

    def prepend_index(index_ : Int32) : Nil
      # gtk_tree_path_prepend_index: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_path_prepend_index(self, index_)
    end

    def prev : Bool
      # gtk_tree_path_prev: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_path_prev(self)
      GICrystal.to_bool(_retval)
    end

    def to_string : ::String?
      # gtk_tree_path_to_string: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_tree_path_to_string(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def up : Bool
      # gtk_tree_path_up: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_path_up(self)
      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
