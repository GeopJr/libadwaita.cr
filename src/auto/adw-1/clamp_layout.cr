require "../gtk-4.0/layout_manager"
require "../gtk-4.0/orientable"

module Adw
  # A layout manager constraining its children to a given size.
  #
  # <picture>
  #   <source srcset="clamp-wide-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="clamp-wide.png" alt="clamp-wide">
  # </picture>
  # <picture>
  #   <source srcset="clamp-narrow-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="clamp-narrow.png" alt="clamp-narrow">
  # </picture>
  #
  # `AdwClampLayout` constraints the size of the widgets it contains to a given
  # maximum size. It will constrain the width if it is horizontal, or the height
  # if it is vertical. The expansion of the children from their minimum to their
  # maximum size is eased out for a smooth transition.
  #
  # If a child requires more than the requested maximum size, it will be
  # allocated the minimum size it can fit in instead.
  #
  # Each child will get the style  classes .large when it reached its maximum
  # size, .small when it's allocated the full size, .medium in-between, or none
  # if it hasn't been allocated yet.
  class ClampLayout < Gtk::LayoutManager
    include Gtk::Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, maximum_size : Int32? = nil, orientation : Gtk::Orientation? = nil, tightening_threshold : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if maximum_size
        (_names.to_unsafe + _n).value = "maximum-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, maximum_size)
        _n += 1
      end
      if orientation
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if tightening_threshold
        (_names.to_unsafe + _n).value = "tightening-threshold".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tightening_threshold)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ClampLayout.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_clamp_layout_get_type
    end

    def maximum_size=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "maximum-size", unsafe_value, Pointer(Void).null)
      value
    end

    def maximum_size : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "maximum-size", pointerof(value), Pointer(Void).null)
      value
    end

    def tightening_threshold=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "tightening-threshold", unsafe_value, Pointer(Void).null)
      value
    end

    def tightening_threshold : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "tightening-threshold", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize
      # adw_clamp_layout_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibAdw.adw_clamp_layout_new
      @pointer = _retval
    end

    def maximum_size : Int32
      # adw_clamp_layout_get_maximum_size: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_clamp_layout_get_maximum_size(self)
      _retval
    end

    def tightening_threshold : Int32
      # adw_clamp_layout_get_tightening_threshold: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_clamp_layout_get_tightening_threshold(self)
      _retval
    end

    def maximum_size=(maximum_size : Int32) : Nil
      # adw_clamp_layout_set_maximum_size: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_clamp_layout_set_maximum_size(self, maximum_size)
    end

    def tightening_threshold=(tightening_threshold : Int32) : Nil
      # adw_clamp_layout_set_tightening_threshold: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_clamp_layout_set_tightening_threshold(self, tightening_threshold)
    end
  end
end
