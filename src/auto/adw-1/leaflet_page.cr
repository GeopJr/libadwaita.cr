require "../g_object-2.0/object"

module Adw
  # An auxiliary class used by `#Leaflet`.
  @[GObject::GeneratedWrapper]
  class LeafletPage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::LeafletPageClass), class_init,
        sizeof(LibAdw::LeafletPage), instance_init, 0)
    end

    GICrystal.define_new_method(LeafletPage, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `LeafletPage`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child : Gtk::Widget? = nil, name : ::String? = nil, navigatable : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !child.nil?
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !navigatable.nil?
        (_names.to_unsafe + _n).value = "navigatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, navigatable)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(LeafletPage.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Gets the leaflet child th which @self belongs.
    def child : Gtk::Widget
      # adw_leaflet_page_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_page_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the name of @self.
    def name : ::String?
      # adw_leaflet_page_get_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_page_get_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets whether the child can be navigated to when folded.
    def navigatable : Bool
      # adw_leaflet_page_get_navigatable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_leaflet_page_get_navigatable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the name of the @self.
    def name=(name : ::String?) : Nil
      # adw_leaflet_page_set_name: (Method | Setter)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibAdw.adw_leaflet_page_set_name(@pointer, name)

      # Return value handling
    end

    # Sets whether @self can be navigated to when folded.
    def navigatable=(navigatable : Bool) : Nil
      # adw_leaflet_page_set_navigatable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_leaflet_page_set_navigatable(@pointer, navigatable)

      # Return value handling
    end
  end
end
