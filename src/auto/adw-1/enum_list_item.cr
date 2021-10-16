require "../g_object-2.0/object"

module Adw
  # `AdwEnumListItem` is the type of items in a [class@Adw.EnumListModel].
  class EnumListItem < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil, nick : ::String? = nil, value : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if nick
        (_names.to_unsafe + _n).value = "nick".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, nick)
        _n += 1
      end
      if value
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EnumListItem.g_type, _n, _names, _values)
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

    def name : ::String
      # adw_enum_list_item_get_name: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_enum_list_item_get_name(self)
      ::String.new(_retval)
    end

    def nick : ::String
      # adw_enum_list_item_get_nick: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_enum_list_item_get_nick(self)
      ::String.new(_retval)
    end

    def value : Int32
      # adw_enum_list_item_get_value: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_enum_list_item_get_value(self)
      _retval
    end
  end
end
