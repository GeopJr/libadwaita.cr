require "../g_object-2.0/object"

module Adw
  # An auxiliary class used by [class@Adw.Leaflet].
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

    def child=(value : Widget?) : Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "child", unsafe_value, Pointer(Void).null)
      value
    end

    def child : Gtk::Widget
      # adw_leaflet_page_get_child: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_page_get_child(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def name : ::String?
      # adw_leaflet_page_get_name: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_page_get_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def navigatable? : Bool
      # adw_leaflet_page_get_navigatable: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_leaflet_page_get_navigatable(self)
      GICrystal.to_bool(_retval)
    end

    def name=(name : ::String?) : Nil
      # adw_leaflet_page_set_name: (Method | Setter)
      # @name: (nullable)
      # Returns: (transfer none)

      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      LibAdw.adw_leaflet_page_set_name(self, name)
    end

    def navigatable=(navigatable : Bool) : Nil
      # adw_leaflet_page_set_navigatable: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_leaflet_page_set_navigatable(self, navigatable)
    end
  end
end
