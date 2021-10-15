require "./sorter"

module Gtk
  # `GtkTreeListRowSorter` is a special-purpose sorter that will apply a given
  # sorter to the levels in a tree.
  #
  # Here is an example for setting up a column view with a tree model and
  # a `GtkTreeListSorter`:
  #
  # ```c
  # column_sorter = gtk_column_view_get_sorter (view);
  # sorter = gtk_tree_list_row_sorter_new (g_object_ref (column_sorter));
  # sort_model = gtk_sort_list_model_new (tree_model, sorter);
  # selection = gtk_single_selection_new (sort_model);
  # gtk_column_view_set_model (view, G_LIST_MODEL (selection));
  # ```
  class TreeListRowSorter < Sorter
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, sorter : Gtk::Sorter? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if sorter
        (_names.to_unsafe + _n).value = "sorter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sorter)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeListRowSorter.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_list_row_sorter_get_type
    end

    def initialize(sorter : Gtk::Sorter?)
      # gtk_tree_list_row_sorter_new: (Constructor)
      # @sorter: (transfer full) (nullable)
      # Returns: (transfer full)

      sorter = if sorter.nil?
                 Pointer(Void).null
               else
                 sorter.to_unsafe
               end
      LibGObject.g_object_ref(sorter)

      _retval = LibGtk.gtk_tree_list_row_sorter_new(sorter)
      @pointer = _retval
    end

    def sorter : Gtk::Sorter?
      # gtk_tree_list_row_sorter_get_sorter: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_tree_list_row_sorter_get_sorter(self)
      Gtk::Sorter.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def sorter=(sorter : Gtk::Sorter?) : Nil
      # gtk_tree_list_row_sorter_set_sorter: (Method)
      # @sorter: (nullable)
      # Returns: (transfer none)

      sorter = if sorter.nil?
                 Pointer(Void).null
               else
                 sorter.to_unsafe
               end

      LibGtk.gtk_tree_list_row_sorter_set_sorter(self, sorter)
    end
  end
end
