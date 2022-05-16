require "../g_object-2.0/object"

module Adw
  # An auxiliary class used by `#Squeezer`.
  @[GObject::GeneratedWrapper]
  class SqueezerPage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::SqueezerPageClass), class_init,
        sizeof(LibAdw::SqueezerPage), instance_init, 0)
    end

    GICrystal.define_new_method(SqueezerPage, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SqueezerPage`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, child : Gtk::Widget? = nil, enabled : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !child.nil?
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if !enabled.nil?
        (_names.to_unsafe + _n).value = "enabled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enabled)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SqueezerPage.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_squeezer_page_get_type
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

    def enabled=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enabled", unsafe_value, Pointer(Void).null)
      value
    end

    def enabled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enabled", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Returns the squeezer child to which @self belongs.
    def child : Gtk::Widget
      # adw_squeezer_page_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_page_get_child(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Gets whether @self is enabled.
    def enabled : Bool
      # adw_squeezer_page_get_enabled: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_squeezer_page_get_enabled(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets whether @self is enabled.
    def enabled=(enabled : Bool) : Nil
      # adw_squeezer_page_set_enabled: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_squeezer_page_set_enabled(@pointer, enabled)

      # Return value handling
    end
  end
end
