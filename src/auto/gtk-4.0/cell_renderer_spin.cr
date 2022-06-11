require "./cell_renderer_text"

module Gtk
  # Renders a spin button in a cell
  #
  # `GtkCellRendererSpin` renders text in a cell like `GtkCellRendererText` from
  # which it is derived. But while `GtkCellRendererText` offers a simple entry to
  # edit the text, `GtkCellRendererSpin` offers a `GtkSpinButton` widget. Of course,
  # that means that the text has to be parseable as a floating point number.
  #
  # The range of the spinbutton is taken from the adjustment property of the
  # cell renderer, which can be set explicitly or mapped to a column in the
  # tree model, like all properties of cell renders. `GtkCellRendererSpin`
  # also has properties for the `GtkCellRendererSpin:climb-rate` and the number
  # of `GtkCellRendererSpin:digits` to display. Other `GtkSpinButton` properties
  # can be set in a handler for the `GtkCellRenderer::editing-started` signal.
  #
  # The `GtkCellRendererSpin` cell renderer was added in GTK 2.10.
  @[GObject::GeneratedWrapper]
  class CellRendererSpin < CellRendererText
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(CellRendererSpin, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CellRendererSpin`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, adjustment : Gtk::Adjustment? = nil, align_set : Bool? = nil, alignment : Pango::Alignment? = nil, attributes : Pango::AttrList? = nil, background : ::String? = nil, background_rgba : Gdk::RGBA? = nil, background_set : Bool? = nil, cell_background : ::String? = nil, cell_background_rgba : Gdk::RGBA? = nil, cell_background_set : Bool? = nil, climb_rate : Float64? = nil, digits : UInt32? = nil, editable : Bool? = nil, editable_set : Bool? = nil, editing : Bool? = nil, ellipsize : Pango::EllipsizeMode? = nil, ellipsize_set : Bool? = nil, family : ::String? = nil, family_set : Bool? = nil, font : ::String? = nil, font_desc : Pango::FontDescription? = nil, foreground : ::String? = nil, foreground_rgba : Gdk::RGBA? = nil, foreground_set : Bool? = nil, height : Int32? = nil, is_expanded : Bool? = nil, is_expander : Bool? = nil, language : ::String? = nil, language_set : Bool? = nil, markup : ::String? = nil, max_width_chars : Int32? = nil, mode : Gtk::CellRendererMode? = nil, placeholder_text : ::String? = nil, rise : Int32? = nil, rise_set : Bool? = nil, scale : Float64? = nil, scale_set : Bool? = nil, sensitive : Bool? = nil, single_paragraph_mode : Bool? = nil, size : Int32? = nil, size_points : Float64? = nil, size_set : Bool? = nil, stretch : Pango::Stretch? = nil, stretch_set : Bool? = nil, strikethrough : Bool? = nil, strikethrough_set : Bool? = nil, style : Pango::Style? = nil, style_set : Bool? = nil, text : ::String? = nil, underline : Pango::Underline? = nil, underline_set : Bool? = nil, variant : Pango::Variant? = nil, variant_set : Bool? = nil, visible : Bool? = nil, weight : Int32? = nil, weight_set : Bool? = nil, width : Int32? = nil, width_chars : Int32? = nil, wrap_mode : Pango::WrapMode? = nil, wrap_width : Int32? = nil, xalign : Float32? = nil, xpad : UInt32? = nil, yalign : Float32? = nil, ypad : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[64]
      _values = StaticArray(LibGObject::Value, 64).new(LibGObject::Value.new)
      _n = 0

      if !adjustment.nil?
        (_names.to_unsafe + _n).value = "adjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, adjustment)
        _n += 1
      end
      if !align_set.nil?
        (_names.to_unsafe + _n).value = "align-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, align_set)
        _n += 1
      end
      if !alignment.nil?
        (_names.to_unsafe + _n).value = "alignment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, alignment)
        _n += 1
      end
      if !attributes.nil?
        (_names.to_unsafe + _n).value = "attributes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, attributes)
        _n += 1
      end
      if !background.nil?
        (_names.to_unsafe + _n).value = "background".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, background)
        _n += 1
      end
      if !background_rgba.nil?
        (_names.to_unsafe + _n).value = "background-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, background_rgba)
        _n += 1
      end
      if !background_set.nil?
        (_names.to_unsafe + _n).value = "background-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, background_set)
        _n += 1
      end
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
      if !climb_rate.nil?
        (_names.to_unsafe + _n).value = "climb-rate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, climb_rate)
        _n += 1
      end
      if !digits.nil?
        (_names.to_unsafe + _n).value = "digits".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, digits)
        _n += 1
      end
      if !editable.nil?
        (_names.to_unsafe + _n).value = "editable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable)
        _n += 1
      end
      if !editable_set.nil?
        (_names.to_unsafe + _n).value = "editable-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable_set)
        _n += 1
      end
      if !editing.nil?
        (_names.to_unsafe + _n).value = "editing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editing)
        _n += 1
      end
      if !ellipsize.nil?
        (_names.to_unsafe + _n).value = "ellipsize".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ellipsize)
        _n += 1
      end
      if !ellipsize_set.nil?
        (_names.to_unsafe + _n).value = "ellipsize-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ellipsize_set)
        _n += 1
      end
      if !family.nil?
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if !family_set.nil?
        (_names.to_unsafe + _n).value = "family-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family_set)
        _n += 1
      end
      if !font.nil?
        (_names.to_unsafe + _n).value = "font".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, font)
        _n += 1
      end
      if !font_desc.nil?
        (_names.to_unsafe + _n).value = "font-desc".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, font_desc)
        _n += 1
      end
      if !foreground.nil?
        (_names.to_unsafe + _n).value = "foreground".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, foreground)
        _n += 1
      end
      if !foreground_rgba.nil?
        (_names.to_unsafe + _n).value = "foreground-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, foreground_rgba)
        _n += 1
      end
      if !foreground_set.nil?
        (_names.to_unsafe + _n).value = "foreground-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, foreground_set)
        _n += 1
      end
      if !height.nil?
        (_names.to_unsafe + _n).value = "height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height)
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
      if !language.nil?
        (_names.to_unsafe + _n).value = "language".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, language)
        _n += 1
      end
      if !language_set.nil?
        (_names.to_unsafe + _n).value = "language-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, language_set)
        _n += 1
      end
      if !markup.nil?
        (_names.to_unsafe + _n).value = "markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, markup)
        _n += 1
      end
      if !max_width_chars.nil?
        (_names.to_unsafe + _n).value = "max-width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width_chars)
        _n += 1
      end
      if !mode.nil?
        (_names.to_unsafe + _n).value = "mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mode)
        _n += 1
      end
      if !placeholder_text.nil?
        (_names.to_unsafe + _n).value = "placeholder-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, placeholder_text)
        _n += 1
      end
      if !rise.nil?
        (_names.to_unsafe + _n).value = "rise".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rise)
        _n += 1
      end
      if !rise_set.nil?
        (_names.to_unsafe + _n).value = "rise-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rise_set)
        _n += 1
      end
      if !scale.nil?
        (_names.to_unsafe + _n).value = "scale".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale)
        _n += 1
      end
      if !scale_set.nil?
        (_names.to_unsafe + _n).value = "scale-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_set)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !single_paragraph_mode.nil?
        (_names.to_unsafe + _n).value = "single-paragraph-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, single_paragraph_mode)
        _n += 1
      end
      if !size.nil?
        (_names.to_unsafe + _n).value = "size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size)
        _n += 1
      end
      if !size_points.nil?
        (_names.to_unsafe + _n).value = "size-points".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size_points)
        _n += 1
      end
      if !size_set.nil?
        (_names.to_unsafe + _n).value = "size-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size_set)
        _n += 1
      end
      if !stretch.nil?
        (_names.to_unsafe + _n).value = "stretch".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, stretch)
        _n += 1
      end
      if !stretch_set.nil?
        (_names.to_unsafe + _n).value = "stretch-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, stretch_set)
        _n += 1
      end
      if !strikethrough.nil?
        (_names.to_unsafe + _n).value = "strikethrough".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, strikethrough)
        _n += 1
      end
      if !strikethrough_set.nil?
        (_names.to_unsafe + _n).value = "strikethrough-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, strikethrough_set)
        _n += 1
      end
      if !style.nil?
        (_names.to_unsafe + _n).value = "style".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, style)
        _n += 1
      end
      if !style_set.nil?
        (_names.to_unsafe + _n).value = "style-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, style_set)
        _n += 1
      end
      if !text.nil?
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end
      if !underline.nil?
        (_names.to_unsafe + _n).value = "underline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, underline)
        _n += 1
      end
      if !underline_set.nil?
        (_names.to_unsafe + _n).value = "underline-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, underline_set)
        _n += 1
      end
      if !variant.nil?
        (_names.to_unsafe + _n).value = "variant".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, variant)
        _n += 1
      end
      if !variant_set.nil?
        (_names.to_unsafe + _n).value = "variant-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, variant_set)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !weight.nil?
        (_names.to_unsafe + _n).value = "weight".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, weight)
        _n += 1
      end
      if !weight_set.nil?
        (_names.to_unsafe + _n).value = "weight-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, weight_set)
        _n += 1
      end
      if !width.nil?
        (_names.to_unsafe + _n).value = "width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width)
        _n += 1
      end
      if !width_chars.nil?
        (_names.to_unsafe + _n).value = "width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_chars)
        _n += 1
      end
      if !wrap_mode.nil?
        (_names.to_unsafe + _n).value = "wrap-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_mode)
        _n += 1
      end
      if !wrap_width.nil?
        (_names.to_unsafe + _n).value = "wrap-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_width)
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

      @pointer = LibGObject.g_object_new_with_properties(CellRendererSpin.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_renderer_spin_get_type
    end

    def adjustment=(value : Gtk::Adjustment?) : Gtk::Adjustment?
      unsafe_value = value

      LibGObject.g_object_set(self, "adjustment", unsafe_value, Pointer(Void).null)
      value
    end

    def adjustment : Gtk::Adjustment?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "adjustment", pointerof(value), Pointer(Void).null)
      Gtk::Adjustment.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def climb_rate=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "climb-rate", unsafe_value, Pointer(Void).null)
      value
    end

    def climb_rate : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "climb-rate", pointerof(value), Pointer(Void).null)
      value
    end

    def digits=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "digits", unsafe_value, Pointer(Void).null)
      value
    end

    def digits : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "digits", pointerof(value), Pointer(Void).null)
      value
    end
  end
end
