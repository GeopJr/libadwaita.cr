require "../g_object-2.0/object"

module Adw
  # `AdwEnumListItem` is the type of items in a `#EnumListModel`.
  @[GObject::GeneratedWrapper]
  class EnumListItem < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::EnumListItemClass), class_init,
        sizeof(LibAdw::EnumListItem), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil, nick : ::String? = nil, value : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !nick.nil?
        (_names.to_unsafe + _n).value = "nick".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, nick)
        _n += 1
      end
      if !value.nil?
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EnumListItem.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_enum_list_item_get_type
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def nick : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "nick", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def value : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "value", pointerof(value), Pointer(Void).null)
      value
    end

    # Gets the enum value name.
    def name : ::String
      # adw_enum_list_item_get_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_enum_list_item_get_name(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the enum value nick.
    def nick : ::String
      # adw_enum_list_item_get_nick: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_enum_list_item_get_nick(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the enum value.
    def value : Int32
      # adw_enum_list_item_get_value: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_enum_list_item_get_value(self)

      # Return value handling

      _retval
    end
  end
end
