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
  @[GObject::GeneratedWrapper]
  class ClampLayout < Gtk::LayoutManager
    include Gtk::Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::ClampLayoutClass), class_init,
        sizeof(LibAdw::ClampLayout), instance_init, 0)
    end

    GICrystal.define_new_method(ClampLayout, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ClampLayout`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, maximum_size : Int32? = nil, orientation : Gtk::Orientation? = nil, tightening_threshold : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !maximum_size.nil?
        (_names.to_unsafe + _n).value = "maximum-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, maximum_size)
        _n += 1
      end
      if !orientation.nil?
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if !tightening_threshold.nil?
        (_names.to_unsafe + _n).value = "tightening-threshold".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tightening_threshold)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ClampLayout.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new `AdwClampLayout`.
    def initialize
      # adw_clamp_layout_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_clamp_layout_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the maximum size allocated to the children.
    def maximum_size : Int32
      # adw_clamp_layout_get_maximum_size: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_clamp_layout_get_maximum_size(@pointer)

      # Return value handling

      _retval
    end

    # Gets the size above which the children are clamped.
    def tightening_threshold : Int32
      # adw_clamp_layout_get_tightening_threshold: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_clamp_layout_get_tightening_threshold(@pointer)

      # Return value handling

      _retval
    end

    # Sets the maximum size allocated to the children.
    def maximum_size=(maximum_size : Int32) : Nil
      # adw_clamp_layout_set_maximum_size: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_clamp_layout_set_maximum_size(@pointer, maximum_size)

      # Return value handling
    end

    # Sets the size above which the children are clamped.
    def tightening_threshold=(tightening_threshold : Int32) : Nil
      # adw_clamp_layout_set_tightening_threshold: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_clamp_layout_set_tightening_threshold(@pointer, tightening_threshold)

      # Return value handling
    end
  end
end
