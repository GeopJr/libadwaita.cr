require "../g_object-2.0/object"
require "../gio-2.0/list_model"

module Adw
  # A `Gio#ListModel` representing values of a given enum.
  #
  # `AdwEnumListModel` contains objects of type `#EnumListItem`.
  @[GObject::GeneratedWrapper]
  class EnumListModel < GObject::Object
    include Gio::ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::EnumListModelClass), class_init,
        sizeof(LibAdw::EnumListModel), instance_init, 0)
    end

    GICrystal.define_new_method(EnumListModel, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `EnumListModel`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, enum_type : UInt64? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !enum_type.nil?
        (_names.to_unsafe + _n).value = "enum-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enum_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EnumListModel.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new `AdwEnumListModel` for @enum_type.
    def initialize(enum_type : UInt64)
      # adw_enum_list_model_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_enum_list_model_new(enum_type)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Finds the position of a given enum value in @self.
    def find_position(value : Int32) : UInt32
      # adw_enum_list_model_find_position: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_enum_list_model_find_position(@pointer, value)

      # Return value handling

      _retval
    end

    # Gets the type of the enum represented by @self.
    def enum_type : UInt64
      # adw_enum_list_model_get_enum_type: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_enum_list_model_get_enum_type(@pointer)

      # Return value handling

      _retval
    end
  end
end
