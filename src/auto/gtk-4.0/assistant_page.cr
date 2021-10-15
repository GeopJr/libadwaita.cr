require "../g_object-2.0/object"

module Gtk
  # `GtkAssistantPage` is an auxiliary object used by `GtkAssistant.
  class AssistantPage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child : Gtk::Widget? = nil, complete : Bool? = nil, page_type : Gtk::AssistantPageType? = nil, title : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if child
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if complete
        (_names.to_unsafe + _n).value = "complete".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, complete)
        _n += 1
      end
      if page_type
        (_names.to_unsafe + _n).value = "page-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, page_type)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(AssistantPage.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_assistant_page_get_type
    end

    def child=(value : Widget?) : Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "child", unsafe_value, Pointer(Void).null)
      value
    end

    def child : Gtk::Widget
      # gtk_assistant_page_get_child: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_assistant_page_get_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end
  end
end
