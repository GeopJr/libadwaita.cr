require "./sorter"

module Gtk
  # `GtkTreeListRowSorter` is a special-purpose sorter that will apply a given
  # sorter to the levels in a tree.
  #
  # Here is an example for setting up a column view with a tree model and
  # a `GtkTreeListSorter`:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # column_sorter = gtk_column_view_get_sorter (view);
  # sorter = gtk_tree_list_row_sorter_new (g_object_ref (column_sorter));
  # sort_model = gtk_sort_list_model_new (tree_model, sorter);
  # selection = gtk_single_selection_new (sort_model);
  # gtk_column_view_set_model (view, G_LIST_MODEL (selection));
  # ```
  @[GObject::GeneratedWrapper]
  class TreeListRowSorter < Sorter
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TreeListRowSorterClass), class_init,
        sizeof(LibGtk::TreeListRowSorter), instance_init, 0)
    end

    GICrystal.define_new_method(TreeListRowSorter, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TreeListRowSorter`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, sorter : Gtk::Sorter? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !sorter.nil?
        (_names.to_unsafe + _n).value = "sorter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sorter)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeListRowSorter.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_list_row_sorter_get_type
    end

    def sorter=(value : Gtk::Sorter?) : Gtk::Sorter?
      unsafe_value = value

      LibGObject.g_object_set(self, "sorter", unsafe_value, Pointer(Void).null)
      value
    end

    def sorter : Gtk::Sorter?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "sorter", pointerof(value), Pointer(Void).null)
      Gtk::Sorter.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Create a special-purpose sorter that applies the sorting
    # of @sorter to the levels of a `GtkTreeListModel`.
    #
    # Note that this sorter relies on `Gtk::TreeListModel#passthrough`
    # being %FALSE as it can only sort `Gtk#TreeListRow`s.
    def self.new(sorter : Gtk::Sorter?) : self
      # gtk_tree_list_row_sorter_new: (Constructor)
      # @sorter: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      sorter = if sorter.nil?
                 Pointer(Void).null
               else
                 sorter.to_unsafe
               end
      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(sorter)
      # C call
      _retval = LibGtk.gtk_tree_list_row_sorter_new(sorter)

      # Return value handling

      Gtk::TreeListRowSorter.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns the sorter used by @self.
    def sorter : Gtk::Sorter?
      # gtk_tree_list_row_sorter_get_sorter: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_list_row_sorter_get_sorter(@pointer)

      # Return value handling

      Gtk::Sorter.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the sorter to use for items with the same parent.
    #
    # This sorter will be passed the `Gtk::TreeListRow#item` of
    # the tree list rows passed to @self.
    def sorter=(sorter : Gtk::Sorter?) : Nil
      # gtk_tree_list_row_sorter_set_sorter: (Method | Setter)
      # @sorter: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      sorter = if sorter.nil?
                 Pointer(Void).null
               else
                 sorter.to_unsafe
               end

      # C call
      LibGtk.gtk_tree_list_row_sorter_set_sorter(@pointer, sorter)

      # Return value handling
    end
  end
end
