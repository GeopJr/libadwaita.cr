require "./cell_renderer"
require "./orientable"

module Gtk
  # Renders numbers as progress bars
  #
  # `GtkCellRendererProgress` renders a numeric value as a progress par in a cell.
  # Additionally, it can display a text on top of the progress bar.
  @[GObject::GeneratedWrapper]
  class CellRendererProgress < CellRenderer
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::CellRendererProgress), instance_init, 0)
    end

    GICrystal.define_new_method(CellRendererProgress, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CellRendererProgress`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, cell_background : ::String? = nil, cell_background_rgba : Gdk::RGBA? = nil, cell_background_set : Bool? = nil, editing : Bool? = nil, height : Int32? = nil, inverted : Bool? = nil, is_expanded : Bool? = nil, is_expander : Bool? = nil, mode : Gtk::CellRendererMode? = nil, orientation : Gtk::Orientation? = nil, pulse : Int32? = nil, sensitive : Bool? = nil, text : ::String? = nil, text_xalign : Float32? = nil, text_yalign : Float32? = nil, value : Int32? = nil, visible : Bool? = nil, width : Int32? = nil, xalign : Float32? = nil, xpad : UInt32? = nil, yalign : Float32? = nil, ypad : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[22]
      _values = StaticArray(LibGObject::Value, 22).new(LibGObject::Value.new)
      _n = 0

      if !cell_background.nil?
        (_names.to_unsafe + _n).value = "cell-background".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background)
        _n += 1
      end
      if !cell_background_rgba.nil?
        (_names.to_unsafe + _n).value = "cell-background-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background_rgba)
        _n += 1
      end
      if !cell_background_set.nil?
        (_names.to_unsafe + _n).value = "cell-background-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_background_set)
        _n += 1
      end
      if !editing.nil?
        (_names.to_unsafe + _n).value = "editing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editing)
        _n += 1
      end
      if !height.nil?
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
        _n += 1
      end
      if !inverted.nil?
        (_names.to_unsafe + _n).value = "inverted".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inverted)
        _n += 1
      end
      if !is_expanded.nil?
        (_names.to_unsafe + _n).value = "is-expanded".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_expanded)
        _n += 1
      end
      if !is_expander.nil?
        (_names.to_unsafe + _n).value = "is-expander".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_expander)
        _n += 1
      end
      if !mode.nil?
        (_names.to_unsafe + _n).value = "mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode)
        _n += 1
      end
      if !orientation.nil?
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if !pulse.nil?
        (_names.to_unsafe + _n).value = "pulse".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pulse)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !text.nil?
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end
      if !text_xalign.nil?
        (_names.to_unsafe + _n).value = "text-xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text_xalign)
        _n += 1
      end
      if !text_yalign.nil?
        (_names.to_unsafe + _n).value = "text-yalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text_yalign)
        _n += 1
      end
      if !value.nil?
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !width.nil?
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end
      if !xalign.nil?
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end
      if !xpad.nil?
        (_names.to_unsafe + _n).value = "xpad".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xpad)
        _n += 1
      end
      if !yalign.nil?
        (_names.to_unsafe + _n).value = "yalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, yalign)
        _n += 1
      end
      if !ypad.nil?
        (_names.to_unsafe + _n).value = "ypad".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ypad)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(CellRendererProgress.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_renderer_progress_get_type
    end

    def inverted=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "inverted", unsafe_value, Pointer(Void).null)
      value
    end

    def inverted? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "inverted", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def pulse=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "pulse", unsafe_value, Pointer(Void).null)
      value
    end

    def pulse : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "pulse", pointerof(value), Pointer(Void).null)
      value
    end

    def text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "text", unsafe_value, Pointer(Void).null)
      value
    end

    def text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def text_xalign=(value : Float32) : Float32
      unsafe_value = value

      LibGObject.g_object_set(self, "text-xalign", unsafe_value, Pointer(Void).null)
      value
    end

    def text_xalign : Float32
      # Returns: None

      value = uninitialized Float32
      LibGObject.g_object_get(self, "text-xalign", pointerof(value), Pointer(Void).null)
      value
    end

    def text_yalign=(value : Float32) : Float32
      unsafe_value = value

      LibGObject.g_object_set(self, "text-yalign", unsafe_value, Pointer(Void).null)
      value
    end

    def text_yalign : Float32
      # Returns: None

      value = uninitialized Float32
      LibGObject.g_object_get(self, "text-yalign", pointerof(value), Pointer(Void).null)
      value
    end

    def value=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "value", unsafe_value, Pointer(Void).null)
      value
    end

    def value : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "value", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new `GtkCellRendererProgress`.
    def initialize
      # gtk_cell_renderer_progress_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_renderer_progress_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end
  end
end
