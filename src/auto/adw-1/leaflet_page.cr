require "../g_object-2.0/object"

module Adw
  # An auxiliary class used by [class@Leaflet].
  class LeafletPage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child : Gtk::Widget? = nil, name : ::String? = nil, navigatable : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if child
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if navigatable
        (_names.to_unsafe + _n).value = "navigatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, navigatable)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(LeafletPage.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_leaflet_page_get_type
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

    def navigatable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "navigatable", unsafe_value, Pointer(Void).null)
      value
    end

    def navigatable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "navigatable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def child : Gtk::Widget
      # adw_leaflet_page_get_child: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_leaflet_page_get_child(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def name : ::String?
      # adw_leaflet_page_get_name: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_leaflet_page_get_name(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def navigatable : Bool
      # adw_leaflet_page_get_navigatable: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_leaflet_page_get_navigatable(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def name=(name : ::String?) : Nil
      # adw_leaflet_page_set_name: (Method | Setter)
      # @name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibAdw.adw_leaflet_page_set_name(self, name)

      # Return value handling
    end

    def navigatable=(navigatable : Bool) : Nil
      # adw_leaflet_page_set_navigatable: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_leaflet_page_set_navigatable(self, navigatable)

      # Return value handling
    end
  end
end
