require "../g_object-2.0/object"
require "./icon"

module Gio
  # #GEmblem is an implementation of #GIcon that supports
  # having an emblem, which is an icon with additional properties.
  # It can than be added to a #GEmblemedIcon.
  #
  # Currently, only metainformation about the emblem's origin is
  # supported. More may be added in the future.
  @[GObject::GeneratedWrapper]
  class Emblem < GObject::Object
    include Icon

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::EmblemClass), class_init,
        sizeof(LibGio::Emblem), instance_init, 0)
    end

    GICrystal.define_new_method(Emblem, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Emblem`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, icon : GObject::Object? = nil, origin : Gio::EmblemOrigin? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !icon.nil?
        (_names.to_unsafe + _n).value = "icon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon)
        _n += 1
      end
      if !origin.nil?
        (_names.to_unsafe + _n).value = "origin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, origin)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Emblem.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_emblem_get_type
    end

    def icon=(value : GObject::Object?) : GObject::Object?
      unsafe_value = value

      LibGObject.g_object_set(self, "icon", unsafe_value, Pointer(Void).null)
      value
    end

    def icon : GObject::Object?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "icon", pointerof(value), Pointer(Void).null)
      GObject::Object.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def origin=(value : Gio::EmblemOrigin) : Gio::EmblemOrigin
      unsafe_value = value

      LibGObject.g_object_set(self, "origin", unsafe_value, Pointer(Void).null)
      value
    end

    def origin : Gio::EmblemOrigin
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "origin", pointerof(value), Pointer(Void).null)
      Gio::EmblemOrigin.new(value)
    end

    # Creates a new emblem for @icon.
    def initialize(icon : Gio::Icon)
      # g_emblem_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_emblem_new(icon)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new emblem for @icon.
    def self.new_with_origin(icon : Gio::Icon, origin : Gio::EmblemOrigin) : self
      # g_emblem_new_with_origin: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_emblem_new_with_origin(icon, origin)

      # Return value handling

      Gio::Emblem.new(_retval, GICrystal::Transfer::Full)
    end

    # Gives back the icon from @emblem.
    def icon : Gio::Icon
      # g_emblem_get_icon: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_emblem_get_icon(@pointer)

      # Return value handling

      Gio::AbstractIcon.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the origin of the emblem.
    def origin : Gio::EmblemOrigin
      # g_emblem_get_origin: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_emblem_get_origin(@pointer)

      # Return value handling

      Gio::EmblemOrigin.new(_retval)
    end
  end
end
