require "../g_object-2.0/object"

module Gtk
  # `GtkNotebookPage` is an auxiliary object used by `GtkNotebook`.
  class NotebookPage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child : Gtk::Widget? = nil, detachable : Bool? = nil, menu : Gtk::Widget? = nil, menu_label : ::String? = nil, position : Int32? = nil, reorderable : Bool? = nil, tab : Gtk::Widget? = nil, tab_expand : Bool? = nil, tab_fill : Bool? = nil, tab_label : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[10]
      _values = StaticArray(LibGObject::Value, 10).new(LibGObject::Value.new)
      _n = 0

      if child
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if detachable
        (_names.to_unsafe + _n).value = "detachable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, detachable)
        _n += 1
      end
      if menu
        (_names.to_unsafe + _n).value = "menu".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, menu)
        _n += 1
      end
      if menu_label
        (_names.to_unsafe + _n).value = "menu-label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, menu_label)
        _n += 1
      end
      if position
        (_names.to_unsafe + _n).value = "position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, position)
        _n += 1
      end
      if reorderable
        (_names.to_unsafe + _n).value = "reorderable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, reorderable)
        _n += 1
      end
      if tab
        (_names.to_unsafe + _n).value = "tab".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tab)
        _n += 1
      end
      if tab_expand
        (_names.to_unsafe + _n).value = "tab-expand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tab_expand)
        _n += 1
      end
      if tab_fill
        (_names.to_unsafe + _n).value = "tab-fill".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tab_fill)
        _n += 1
      end
      if tab_label
        (_names.to_unsafe + _n).value = "tab-label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tab_label)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NotebookPage.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_notebook_page_get_type
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

    def detachable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "detachable", unsafe_value, Pointer(Void).null)
      value
    end

    def detachable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "detachable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def menu=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "menu", unsafe_value, Pointer(Void).null)
      value
    end

    def menu : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "menu", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def menu_label=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "menu-label", unsafe_value, Pointer(Void).null)
      value
    end

    def menu_label : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "menu-label", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def position=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "position", unsafe_value, Pointer(Void).null)
      value
    end

    def position : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "position", pointerof(value), Pointer(Void).null)
      value
    end

    def reorderable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "reorderable", unsafe_value, Pointer(Void).null)
      value
    end

    def reorderable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "reorderable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def tab=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "tab", unsafe_value, Pointer(Void).null)
      value
    end

    def tab : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "tab", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def tab_expand=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "tab-expand", unsafe_value, Pointer(Void).null)
      value
    end

    def tab_expand? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "tab-expand", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def tab_fill=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "tab-fill", unsafe_value, Pointer(Void).null)
      value
    end

    def tab_fill? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "tab-fill", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def tab_label=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "tab-label", unsafe_value, Pointer(Void).null)
      value
    end

    def tab_label : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "tab-label", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def child : Gtk::Widget
      # gtk_notebook_page_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_page_get_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end
  end
end
