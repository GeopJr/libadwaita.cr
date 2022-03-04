require "../g_object-2.0/object"
require "./icon"

module Gio
  # #GEmblemedIcon is an implementation of #GIcon that supports
  # adding an emblem to an icon. Adding multiple emblems to an
  # icon is ensured via g_emblemed_icon_add_emblem().
  #
  # Note that #GEmblemedIcon allows no control over the position
  # of the emblems. See also #GEmblem for more information.
  class EmblemedIcon < GObject::Object
    include Icon

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, gicon : Gio::Icon? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if gicon
        (_names.to_unsafe + _n).value = "gicon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, gicon)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EmblemedIcon.g_type, _n, _names, _values)
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

    def initialize(icon : Gio::Icon, emblem : Gio::Emblem?)
      # g_emblemed_icon_new: (Constructor)
      # @emblem: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      emblem = if emblem.nil?
                 Pointer(Void).null
               else
                 emblem.to_unsafe
               end

      # C call
      _retval = LibGio.g_emblemed_icon_new(icon, emblem)

      # Return value handling
      @pointer = _retval
    end

    def add_emblem(emblem : Gio::Emblem) : Nil
      # g_emblemed_icon_add_emblem: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_emblemed_icon_add_emblem(self, emblem)

      # Return value handling
    end

    def clear_emblems : Nil
      # g_emblemed_icon_clear_emblems: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_emblemed_icon_clear_emblems(self)

      # Return value handling
    end

    def emblems : GLib::List
      # g_emblemed_icon_get_emblems: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_emblemed_icon_get_emblems(self)

      # Return value handling
      GLib::List(Gio::Emblem).new(_retval, GICrystal::Transfer::None)
    end

    def icon : Gio::Icon
      # g_emblemed_icon_get_icon: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_emblemed_icon_get_icon(self)

      # Return value handling
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::None)
    end
  end
end
