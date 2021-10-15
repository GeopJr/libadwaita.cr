require "../g_object-2.0/object"

module Gtk
  # `GtkListItem` is used by list widgets to represent items in a `GListModel`.
  #
  # The `GtkListItem`s are managed by the list widget (with its factory)
  # and cannot be created by applications, but they need to be populated
  # by application code. This is done by calling [method@Gtk.ListItem.set_child].
  #
  # `GtkListItem`s exist in 2 stages:
  #
  # 1. The unbound stage where the listitem is not currently connected to
  #    an item in the list. In that case, the [property@Gtk.ListItem:item]
  #    property is set to %NULL.
  #
  # 2. The bound stage where the listitem references an item from the list.
  #    The [property@Gtk.ListItem:item] property is not %NULL.
  class ListItem < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, activatable : Bool? = nil, child : Gtk::Widget? = nil, item : GObject::Object? = nil, position : UInt32? = nil, selectable : Bool? = nil, selected : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if activatable
        (_names.to_unsafe + _n).value = "activatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activatable)
        _n += 1
      end
      if child
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if item
        (_names.to_unsafe + _n).value = "item".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item)
        _n += 1
      end
      if position
        (_names.to_unsafe + _n).value = "position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, position)
        _n += 1
      end
      if selectable
        (_names.to_unsafe + _n).value = "selectable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selectable)
        _n += 1
      end
      if selected
        (_names.to_unsafe + _n).value = "selected".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ListItem.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_list_item_get_type
    end

    def activatable? : Bool
      # gtk_list_item_get_activatable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_item_get_activatable(self)
      GICrystal.to_bool(_retval)
    end

    def child : Gtk::Widget?
      # gtk_list_item_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_item_get_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def item : GObject::Object?
      # gtk_list_item_get_item: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_item_get_item(self)
      GObject::Object.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def position : UInt32
      # gtk_list_item_get_position: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_item_get_position(self)
      _retval
    end

    def selectable? : Bool
      # gtk_list_item_get_selectable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_item_get_selectable(self)
      GICrystal.to_bool(_retval)
    end

    def selected? : Bool
      # gtk_list_item_get_selected: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_list_item_get_selected(self)
      GICrystal.to_bool(_retval)
    end

    def activatable=(activatable : Bool) : Nil
      # gtk_list_item_set_activatable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_item_set_activatable(self, activatable)
    end

    def child=(child : Gtk::Widget?) : Nil
      # gtk_list_item_set_child: (Method)
      # @child: (nullable)
      # Returns: (transfer none)

      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      LibGtk.gtk_list_item_set_child(self, child)
    end

    def selectable=(selectable : Bool) : Nil
      # gtk_list_item_set_selectable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_list_item_set_selectable(self, selectable)
    end
  end
end
