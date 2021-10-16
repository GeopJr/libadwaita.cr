module Gtk
  # The interface for sortable models used by GtkTreeView
  #
  # `GtkTreeSortable` is an interface to be implemented by tree models which
  # support sorting. The `GtkTreeView` uses the methods provided by this interface
  # to sort the model.
  module TreeSortable
    def sort_column_id(sort_column_id : Int32, order : Gtk::SortType) : Bool
      # gtk_tree_sortable_get_sort_column_id: (Method)
      # @sort_column_id: (out) (transfer full)
      # @order: (out) (transfer full)
      # Returns: (transfer none)

      LibGObject.g_object_ref(order)

      _retval = LibGtk.gtk_tree_sortable_get_sort_column_id(self, sort_column_id, order)
      GICrystal.to_bool(_retval)
    end

    def has_default_sort_func : Bool
      # gtk_tree_sortable_has_default_sort_func: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_sortable_has_default_sort_func(self)
      GICrystal.to_bool(_retval)
    end

    def set_default_sort_func(sort_func : Pointer(Void), user_data : Pointer(Nil)?, destroy : Pointer(Void)?) : Nil
      # gtk_tree_sortable_set_default_sort_func: (Method)
      # @user_data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      destroy = if destroy.nil?
                  LibGLib::DestroyNotify.null
                else
                  destroy.to_unsafe
                end

      LibGtk.gtk_tree_sortable_set_default_sort_func(self, sort_func, user_data, destroy)
    end

    def set_sort_column_id(sort_column_id : Int32, order : Gtk::SortType) : Nil
      # gtk_tree_sortable_set_sort_column_id: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_sortable_set_sort_column_id(self, sort_column_id, order)
    end

    def set_sort_func(sort_column_id : Int32, sort_func : Pointer(Void), user_data : Pointer(Nil)?, destroy : Pointer(Void)?) : Nil
      # gtk_tree_sortable_set_sort_func: (Method)
      # @user_data: (nullable)
      # @destroy: (nullable)
      # Returns: (transfer none)

      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      destroy = if destroy.nil?
                  LibGLib::DestroyNotify.null
                else
                  destroy.to_unsafe
                end

      LibGtk.gtk_tree_sortable_set_sort_func(self, sort_column_id, sort_func, user_data, destroy)
    end

    def sort_column_changed : Nil
      # gtk_tree_sortable_sort_column_changed: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_tree_sortable_sort_column_changed(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class TreeSortable__Impl
    include TreeSortable

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_sortable_get_type
    end

    # Cast a `GObject::Object` to `TreeSortable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to TreeSortable")
    end

    # Cast a `GObject::Object` to `TreeSortable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
