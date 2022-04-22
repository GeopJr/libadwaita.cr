require "../g_object-2.0/object"

module Gtk
  # `GtkListItem` is used by list widgets to represent items in a `GListModel`.
  #
  # The `GtkListItem`s are managed by the list widget (with its factory)
  # and cannot be created by applications, but they need to be populated
  # by application code. This is done by calling `Gtk::ListItem#child=`.
  #
  # `GtkListItem`s exist in 2 stages:
  #
  # 1. The unbound stage where the listitem is not currently connected to
  #    an item in the list. In that case, the `Gtk::ListItem#item`
  #    property is set to %NULL.
  #
  # 2. The bound stage where the listitem references an item from the list.
  #    The `Gtk::ListItem#item` property is not %NULL.
  @[GObject::GeneratedWrapper]
  class ListItem < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ListItemClass), class_init,
        sizeof(LibGtk::ListItem), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, activatable : Bool? = nil, child : Gtk::Widget? = nil, item : GObject::Object? = nil, position : UInt32? = nil, selectable : Bool? = nil, selected : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if !activatable.nil?
        (_names.to_unsafe + _n).value = "activatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activatable)
        _n += 1
      end
      if !child.nil?
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if !item.nil?
        (_names.to_unsafe + _n).value = "item".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item)
        _n += 1
      end
      if !position.nil?
        (_names.to_unsafe + _n).value = "position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, position)
        _n += 1
      end
      if !selectable.nil?
        (_names.to_unsafe + _n).value = "selectable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selectable)
        _n += 1
      end
      if !selected.nil?
        (_names.to_unsafe + _n).value = "selected".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ListItem.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_list_item_get_type
    end

    def activatable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "activatable", unsafe_value, Pointer(Void).null)
      value
    end

    def activatable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "activatable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def child=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "child", unsafe_value, Pointer(Void).null)
      value
    end

    def child : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "child", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def item : GObject::Object?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "item", pointerof(value), Pointer(Void).null)
      GObject::Object.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def position : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "position", pointerof(value), Pointer(Void).null)
      value
    end

    def selectable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "selectable", unsafe_value, Pointer(Void).null)
      value
    end

    def selectable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "selectable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def selected? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "selected", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Checks if a list item has been set to be activatable via
    # gtk_list_item_set_activatable().
    def activatable : Bool
      # gtk_list_item_get_activatable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_item_get_activatable(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the child previously set via gtk_list_item_set_child() or
    # %NULL if none was set.
    def child : Gtk::Widget?
      # gtk_list_item_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_item_get_child(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the model item that associated with @self.
    #
    # If @self is unbound, this function returns %NULL.
    def item : GObject::Object?
      # gtk_list_item_get_item: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_item_get_item(self)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the position in the model that @self currently displays.
    #
    # If @self is unbound, %GTK_INVALID_LIST_POSITION is returned.
    def position : UInt32
      # gtk_list_item_get_position: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_item_get_position(self)

      # Return value handling

      _retval
    end

    # Checks if a list item has been set to be selectable via
    # gtk_list_item_set_selectable().
    #
    # Do not confuse this function with `Gtk::ListItem#selected`.
    def selectable : Bool
      # gtk_list_item_get_selectable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_item_get_selectable(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Checks if the item is displayed as selected.
    #
    # The selected state is maintained by the liste widget and its model
    # and cannot be set otherwise.
    def selected : Bool
      # gtk_list_item_get_selected: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_list_item_get_selected(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets @self to be activatable.
    #
    # If an item is activatable, double-clicking on the item, using
    # the Return key or calling gtk_widget_activate() will activate
    # the item. Activating instructs the containing view to handle
    # activation. `GtkListView` for example will be emitting the
    # `Gtk::ListView::#activate` signal.
    #
    # By default, list items are activatable.
    def activatable=(activatable : Bool) : Nil
      # gtk_list_item_set_activatable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_item_set_activatable(self, activatable)

      # Return value handling
    end

    # Sets the child to be used for this listitem.
    #
    # This function is typically called by applications when
    # setting up a listitem so that the widget can be reused when
    # binding it multiple times.
    def child=(child : Gtk::Widget?) : Nil
      # gtk_list_item_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_list_item_set_child(self, child)

      # Return value handling
    end

    # Sets @self to be selectable.
    #
    # If an item is selectable, clicking on the item or using the keyboard
    # will try to select or unselect the item. If this succeeds is up to
    # the model to determine, as it is managing the selected state.
    #
    # Note that this means that making an item non-selectable has no
    # influence on the selected state at all. A non-selectable item
    # may still be selected.
    #
    # By default, list items are selectable. When rebinding them to
    # a new item, they will also be reset to be selectable by GTK.
    def selectable=(selectable : Bool) : Nil
      # gtk_list_item_set_selectable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_list_item_set_selectable(self, selectable)

      # Return value handling
    end
  end
end
