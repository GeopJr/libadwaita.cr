require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Adw
  # A [iface@Gio.ListModel] representing values of a given enum.
  #
  # `AdwEnumListModel` contains objects of type [class@EnumListItem].
  class EnumListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, enum_type : UInt64? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if enum_type
        (_names.to_unsafe + _n).value = "enum-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enum_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EnumListModel.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_enum_list_model_get_type
    end

    def enum_type=(value : UInt64) : UInt64
      unsafe_value = value

      LibGObject.g_object_set(self, "enum-type", unsafe_value, Pointer(Void).null)
      value
    end

    def enum_type : UInt64
      # Returns: None

      value = uninitialized UInt64
      LibGObject.g_object_get(self, "enum-type", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize(enum_type : UInt64)
      # adw_enum_list_model_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibAdw.adw_enum_list_model_new(enum_type)
      @pointer = _retval
    end

    def find_position(value : Int32) : UInt32
      # adw_enum_list_model_find_position: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_enum_list_model_find_position(self, value)
      _retval
    end

    def enum_type : UInt64
      # adw_enum_list_model_get_enum_type: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_enum_list_model_get_enum_type(self)
      _retval
    end
  end
end
