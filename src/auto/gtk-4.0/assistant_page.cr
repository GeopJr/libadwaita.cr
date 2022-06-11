require "../g_object-2.0/object"

module Gtk
  # `GtkAssistantPage` is an auxiliary object used by `GtkAssistant.
  @[GObject::GeneratedWrapper]
  class AssistantPage < GObject::Object
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(AssistantPage, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `AssistantPage`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child : Gtk::Widget? = nil, complete : Bool? = nil, page_type : Gtk::AssistantPageType? = nil, title : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !child.nil?
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if !complete.nil?
        (_names.to_unsafe + _n).value = "complete".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, complete)
        _n += 1
      end
      if !page_type.nil?
        (_names.to_unsafe + _n).value = "page-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, page_type)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(AssistantPage.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_assistant_page_get_type
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

    def complete=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "complete", unsafe_value, Pointer(Void).null)
      value
    end

    def complete? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "complete", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def page_type=(value : Gtk::AssistantPageType) : Gtk::AssistantPageType
      unsafe_value = value

      LibGObject.g_object_set(self, "page-type", unsafe_value, Pointer(Void).null)
      value
    end

    def page_type : Gtk::AssistantPageType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "page-type", pointerof(value), Pointer(Void).null)
      Gtk::AssistantPageType.new(value)
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

    # Returns the child to which @page belongs.
    def child : Gtk::Widget
      # gtk_assistant_page_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_page_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end
  end
end
