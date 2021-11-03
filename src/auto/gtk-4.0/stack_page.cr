require "../g_object-2.0/object"
require "./accessible"

module Gtk
  # `GtkStackPage` is an auxiliary class used by `GtkStack`.
  class StackPage < GObject::Object
    include Accessible

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, child : Gtk::Widget? = nil, icon_name : ::String? = nil, name : ::String? = nil, needs_attention : Bool? = nil, title : ::String? = nil, use_underline : Bool? = nil, visible : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[8]
      _values = StaticArray(LibGObject::Value, 8).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if child
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if icon_name
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if needs_attention
        (_names.to_unsafe + _n).value = "needs-attention".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, needs_attention)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if use_underline
        (_names.to_unsafe + _n).value = "use-underline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_underline)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(StackPage.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_stack_page_get_type
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

    def icon_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "icon-name", unsafe_value, Pointer(Void).null)
      value
    end

    def icon_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "icon-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def needs_attention=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "needs-attention", unsafe_value, Pointer(Void).null)
      value
    end

    def needs_attention? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "needs-attention", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def title=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "title", unsafe_value, Pointer(Void).null)
      value
    end

    def title : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "title", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def use_underline=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-underline", unsafe_value, Pointer(Void).null)
      value
    end

    def use_underline? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-underline", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def visible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "visible", unsafe_value, Pointer(Void).null)
      value
    end

    def visible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "visible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def child : Gtk::Widget
      # gtk_stack_page_get_child: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_stack_page_get_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def icon_name : ::String?
      # gtk_stack_page_get_icon_name: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_stack_page_get_icon_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def name : ::String?
      # gtk_stack_page_get_name: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_stack_page_get_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def needs_attention : Bool
      # gtk_stack_page_get_needs_attention: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_stack_page_get_needs_attention(self)
      GICrystal.to_bool(_retval)
    end

    def title : ::String?
      # gtk_stack_page_get_title: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_stack_page_get_title(self)
      ::String.new(_retval) unless _retval.null?
    end

    def use_underline : Bool
      # gtk_stack_page_get_use_underline: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_stack_page_get_use_underline(self)
      GICrystal.to_bool(_retval)
    end

    def visible : Bool
      # gtk_stack_page_get_visible: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_stack_page_get_visible(self)
      GICrystal.to_bool(_retval)
    end

    def icon_name=(setting : ::String) : Nil
      # gtk_stack_page_set_icon_name: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_stack_page_set_icon_name(self, setting)
    end

    def name=(setting : ::String) : Nil
      # gtk_stack_page_set_name: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_stack_page_set_name(self, setting)
    end

    def needs_attention=(setting : Bool) : Nil
      # gtk_stack_page_set_needs_attention: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_stack_page_set_needs_attention(self, setting)
    end

    def title=(setting : ::String) : Nil
      # gtk_stack_page_set_title: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_stack_page_set_title(self, setting)
    end

    def use_underline=(setting : Bool) : Nil
      # gtk_stack_page_set_use_underline: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_stack_page_set_use_underline(self, setting)
    end

    def visible=(visible : Bool) : Nil
      # gtk_stack_page_set_visible: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_stack_page_set_visible(self, visible)
    end
  end
end
