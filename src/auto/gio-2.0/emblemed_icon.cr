require "../g_object-2.0/object"
require "./icon"

module Gio
  # #GEmblemedIcon is an implementation of #GIcon that supports
  # adding an emblem to an icon. Adding multiple emblems to an
  # icon is ensured via g_emblemed_icon_add_emblem().
  #
  # Note that #GEmblemedIcon allows no control over the position
  # of the emblems. See also #GEmblem for more information.
  @[GObject::GeneratedWrapper]
  class EmblemedIcon < GObject::Object
    include Icon

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::EmblemedIconClass), class_init,
        sizeof(LibGio::EmblemedIcon), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, gicon : Gio::Icon? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !gicon.nil?
        (_names.to_unsafe + _n).value = "gicon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gicon)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EmblemedIcon.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_emblemed_icon_get_type
    end

    def gicon=(value : Gio::Icon?) : Gio::Icon?
      unsafe_value = value

      LibGObject.g_object_set(self, "gicon", unsafe_value, Pointer(Void).null)
      value
    end

    def gicon : Gio::Icon?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "gicon", pointerof(value), Pointer(Void).null)
      Gio::Icon__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new emblemed icon for @icon with the emblem @emblem.
    def initialize(icon : Gio::Icon, emblem : Gio::Emblem?)
      # g_emblemed_icon_new: (Constructor)
      # @emblem: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      emblem = if emblem.nil?
                 Pointer(Void).null
               else
                 emblem.to_unsafe
               end

      # C call
      _retval = LibGio.g_emblemed_icon_new(icon, emblem)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds @emblem to the #GList of #GEmblems.
    def add_emblem(emblem : Gio::Emblem) : Nil
      # g_emblemed_icon_add_emblem: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_emblemed_icon_add_emblem(self, emblem)

      # Return value handling
    end

    # Removes all the emblems from @icon.
    def clear_emblems : Nil
      # g_emblemed_icon_clear_emblems: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_emblemed_icon_clear_emblems(self)

      # Return value handling
    end

    # Gets the list of emblems for the @icon.
    def emblems : GLib::List
      # g_emblemed_icon_get_emblems: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_emblemed_icon_get_emblems(self)

      # Return value handling

      GLib::List(Gio::Emblem).new(_retval, GICrystal::Transfer::None)
    end

    # Gets the main icon for @emblemed.
    def icon : Gio::Icon
      # g_emblemed_icon_get_icon: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_emblemed_icon_get_icon(self)

      # Return value handling

      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::None)
    end
  end
end
