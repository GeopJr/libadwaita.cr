require "../g_object-2.0/object"

module Gtk
  # `GtkTreeListRow` is used by `GtkTreeListModel` to represent items.
  #
  # It allows navigating the model as a tree and modify the state of rows.
  #
  # `GtkTreeListRow` instances are created by a `GtkTreeListModel` only
  # when the `Gtk::TreeListModel#passthrough` property is not set.
  #
  # There are various support objects that can make use of `GtkTreeListRow`
  # objects, such as the `Gtk#TreeExpander` widget that allows displaying
  # an icon to expand or collapse a row or `Gtk#TreeListRowSorter` that
  # makes it possible to sort trees properly.
  @[GObject::GeneratedWrapper]
  class TreeListRow < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TreeListRowClass), class_init,
        sizeof(LibGtk::TreeListRow), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, children : Gio::ListModel? = nil, depth : UInt32? = nil, expandable : Bool? = nil, expanded : Bool? = nil, item : GObject::Object? = nil)
      _names = uninitialized Pointer(LibC::Char)[5]
      _values = StaticArray(LibGObject::Value, 5).new(LibGObject::Value.new)
      _n = 0

      if !children.nil?
        (_names.to_unsafe + _n).value = "children".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, children)
        _n += 1
      end
      if !depth.nil?
        (_names.to_unsafe + _n).value = "depth".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, depth)
        _n += 1
      end
      if !expandable.nil?
        (_names.to_unsafe + _n).value = "expandable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expandable)
        _n += 1
      end
      if !expanded.nil?
        (_names.to_unsafe + _n).value = "expanded".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expanded)
        _n += 1
      end
      if !item.nil?
        (_names.to_unsafe + _n).value = "item".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TreeListRow.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tree_list_row_get_type
    end

    def children : Gio::ListModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "children", pointerof(value), Pointer(Void).null)
      Gio::ListModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def depth : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "depth", pointerof(value), Pointer(Void).null)
      value
    end

    def expandable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "expandable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def expanded=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "expanded", unsafe_value, Pointer(Void).null)
      value
    end

    def expanded? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "expanded", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def item : GObject::Object?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "item", pointerof(value), Pointer(Void).null)
      GObject::Object.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # If @self is not expanded or @position is greater than the
    # number of children, %NULL is returned.
    def child_row(position : UInt32) : Gtk::TreeListRow?
      # gtk_tree_list_row_get_child_row: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_list_row_get_child_row(self, position)

      # Return value handling

      Gtk::TreeListRow.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # If the row is expanded, gets the model holding the children of @self.
    #
    # This model is the model created by the
    # `Gtk#TreeListModelCreateModelFunc`
    # and contains the original items, no matter what value
    # `Gtk::TreeListModel#passthrough` is set to.
    def children : Gio::ListModel?
      # gtk_tree_list_row_get_children: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_list_row_get_children(self)

      # Return value handling

      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the depth of this row.
    #
    # Rows that correspond to items in the root model have a depth
    # of zero, rows corresponding to items of models of direct children
    # of the root model have a depth of 1 and so on.
    #
    # The depth of a row never changes until the row is destroyed.
    def depth : UInt32
      # gtk_tree_list_row_get_depth: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_list_row_get_depth(self)

      # Return value handling

      _retval
    end

    # Gets if a row is currently expanded.
    def expanded : Bool
      # gtk_tree_list_row_get_expanded: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_list_row_get_expanded(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the item corresponding to this row,
    #
    # The value returned by this function never changes until the
    # row is destroyed.
    def item : GObject::Object?
      # gtk_tree_list_row_get_item: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_list_row_get_item(self)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Gets the row representing the parent for @self.
    #
    # That is the row that would need to be collapsed
    # to make this row disappear.
    #
    # If @self is a row corresponding to the root model,
    # %NULL is returned.
    #
    # The value returned by this function never changes
    # until the row is destroyed.
    def parent : Gtk::TreeListRow?
      # gtk_tree_list_row_get_parent: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_tree_list_row_get_parent(self)

      # Return value handling

      Gtk::TreeListRow.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Returns the position in the `GtkTreeListModel` that @self occupies
    # at the moment.
    def position : UInt32
      # gtk_tree_list_row_get_position: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_list_row_get_position(self)

      # Return value handling

      _retval
    end

    # Checks if a row can be expanded.
    #
    # This does not mean that the row is actually expanded,
    # this can be checked with `Gtk::TreeListRow#expanded`.
    #
    # If a row is expandable never changes until the row is destroyed.
    def is_expandable : Bool
      # gtk_tree_list_row_is_expandable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_tree_list_row_is_expandable(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Expands or collapses a row.
    #
    # If a row is expanded, the model of calling the
    # `Gtk#TreeListModelCreateModelFunc` for the row's
    # item will be inserted after this row. If a row is collapsed,
    # those items will be removed from the model.
    #
    # If the row is not expandable, this function does nothing.
    def expanded=(expanded : Bool) : Nil
      # gtk_tree_list_row_set_expanded: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tree_list_row_set_expanded(self, expanded)

      # Return value handling
    end
  end
end
