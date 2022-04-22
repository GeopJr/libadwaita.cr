module Gtk
  # A GtkTreeRowReference tracks model changes so that it always refers to the
  # same row (a `GtkTreePath` refers to a position, not a fixed row). Create a
  # new GtkTreeRowReference with gtk_tree_row_reference_new().
  class TreeRowReference
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(TreeRowReference.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(TreeRowReference.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGtk::TreeRowReference)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_row_reference_get_type
    end

    def initialize(model : Gtk::TreeModel, path : Gtk::TreePath)
      # gtk_tree_row_reference_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_row_reference_new(model, path)

      # Return value handling

      @pointer = _retval unless _retval.null?
    end

    def self.new_proxy(proxy : GObject::Object, model : Gtk::TreeModel, path : Gtk::TreePath) : self?
      # gtk_tree_row_reference_new_proxy: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_row_reference_new_proxy(proxy, model, path)

      # Return value handling

      Gtk::TreeRowReference.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def copy : Gtk::TreeRowReference
      # gtk_tree_row_reference_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_row_reference_copy(self)

      # Return value handling

      Gtk::TreeRowReference.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # gtk_tree_row_reference_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_row_reference_free(self)

      # Return value handling
    end

    def model : Gtk::TreeModel
      # gtk_tree_row_reference_get_model: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_row_reference_get_model(self)

      # Return value handling

      Gtk::TreeModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def path : Gtk::TreePath?
      # gtk_tree_row_reference_get_path: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_row_reference_get_path(self)

      # Return value handling

      Gtk::TreePath.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def valid : Bool
      # gtk_tree_row_reference_valid: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_row_reference_valid(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def self.deleted(proxy : GObject::Object, path : Gtk::TreePath) : Nil
      # gtk_tree_row_reference_deleted: (None)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_row_reference_deleted(proxy, path)

      # Return value handling
    end

    def self.inserted(proxy : GObject::Object, path : Gtk::TreePath) : Nil
      # gtk_tree_row_reference_inserted: (None)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_row_reference_inserted(proxy, path)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
