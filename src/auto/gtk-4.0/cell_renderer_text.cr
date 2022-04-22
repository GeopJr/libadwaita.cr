require "./cell_renderer"

module Gtk
  # Renders text in a cell
  #
  # A `GtkCellRendererText` renders a given text in its cell, using the font, color and
  # style information provided by its properties. The text will be ellipsized if it is
  # too long and the `GtkCellRendererText:ellipsize` property allows it.
  #
  # If the `GtkCellRenderer:mode` is %GTK_CELL_RENDERER_MODE_EDITABLE,
  # the `GtkCellRendererText` allows to edit its text using an entry.
  @[GObject::GeneratedWrapper]
  class CellRendererText < CellRenderer
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::CellRendererTextClass), class_init,
        sizeof(LibGtk::CellRendererText), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, align_set : Bool? = nil, alignment : Pango::Alignment? = nil, attributes : Pango::AttrList? = nil, background : ::String? = nil, background_rgba : Gdk::RGBA? = nil, background_set : Bool? = nil, cell_background : ::String? = nil, cell_background_rgba : Gdk::RGBA? = nil, cell_background_set : Bool? = nil, editable : Bool? = nil, editable_set : Bool? = nil, editing : Bool? = nil, ellipsize : Pango::EllipsizeMode? = nil, ellipsize_set : Bool? = nil, family : ::String? = nil, family_set : Bool? = nil, font : ::String? = nil, font_desc : Pango::FontDescription? = nil, foreground : ::String? = nil, foreground_rgba : Gdk::RGBA? = nil, foreground_set : Bool? = nil, height : Int32? = nil, is_expanded : Bool? = nil, is_expander : Bool? = nil, language : ::String? = nil, language_set : Bool? = nil, markup : ::String? = nil, max_width_chars : Int32? = nil, mode : Gtk::CellRendererMode? = nil, placeholder_text : ::String? = nil, rise : Int32? = nil, rise_set : Bool? = nil, scale : Float64? = nil, scale_set : Bool? = nil, sensitive : Bool? = nil, single_paragraph_mode : Bool? = nil, size : Int32? = nil, size_points : Float64? = nil, size_set : Bool? = nil, stretch : Pango::Stretch? = nil, stretch_set : Bool? = nil, strikethrough : Bool? = nil, strikethrough_set : Bool? = nil, style : Pango::Style? = nil, style_set : Bool? = nil, text : ::String? = nil, underline : Pango::Underline? = nil, underline_set : Bool? = nil, variant : Pango::Variant? = nil, variant_set : Bool? = nil, visible : Bool? = nil, weight : Int32? = nil, weight_set : Bool? = nil, width : Int32? = nil, width_chars : Int32? = nil, wrap_mode : Pango::WrapMode? = nil, wrap_width : Int32? = nil, xalign : Float32? = nil, xpad : UInt32? = nil, yalign : Float32? = nil, ypad : UInt32? = nil)
      _names = uninitialized Pointer(LibC::Char)[61]
      _values = StaticArray(LibGObject::Value, 61).new(LibGObject::Value.new)
      _n = 0

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

      @pointer = LibGObject.g_object_new_with_properties(CellRendererText.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_cell_renderer_text_get_type
    end

    def align_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "align-set", unsafe_value, Pointer(Void).null)
      value
    end

    def align_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "align-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def alignment=(value : Pango::Alignment) : Pango::Alignment
      unsafe_value = value

      LibGObject.g_object_set(self, "alignment", unsafe_value, Pointer(Void).null)
      value
    end

    def alignment : Pango::Alignment
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "alignment", pointerof(value), Pointer(Void).null)
      Pango::Alignment.new(value)
    end

    def attributes=(value : Pango::AttrList?) : Pango::AttrList?
      unsafe_value = value

      LibGObject.g_object_set(self, "attributes", unsafe_value, Pointer(Void).null)
      value
    end

    def attributes : Pango::AttrList?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "attributes", pointerof(value), Pointer(Void).null)
      Pango::AttrList.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def background=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "background", unsafe_value, Pointer(Void).null)
      value
    end

    def background_rgba=(value : Gdk::RGBA?) : Gdk::RGBA?
      unsafe_value = value

      LibGObject.g_object_set(self, "background-rgba", unsafe_value, Pointer(Void).null)
      value
    end

    def background_rgba : Gdk::RGBA?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "background-rgba", pointerof(value), Pointer(Void).null)
      Gdk::RGBA.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def background_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "background-set", unsafe_value, Pointer(Void).null)
      value
    end

    def background_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "background-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def editable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "editable", unsafe_value, Pointer(Void).null)
      value
    end

    def editable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "editable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def editable_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "editable-set", unsafe_value, Pointer(Void).null)
      value
    end

    def editable_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "editable-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def ellipsize=(value : Pango::EllipsizeMode) : Pango::EllipsizeMode
      unsafe_value = value

      LibGObject.g_object_set(self, "ellipsize", unsafe_value, Pointer(Void).null)
      value
    end

    def ellipsize : Pango::EllipsizeMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "ellipsize", pointerof(value), Pointer(Void).null)
      Pango::EllipsizeMode.new(value)
    end

    def ellipsize_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "ellipsize-set", unsafe_value, Pointer(Void).null)
      value
    end

    def ellipsize_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "ellipsize-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def family=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "family", unsafe_value, Pointer(Void).null)
      value
    end

    def family : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "family", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def family_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "family-set", unsafe_value, Pointer(Void).null)
      value
    end

    def family_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "family-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def font=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "font", unsafe_value, Pointer(Void).null)
      value
    end

    def font : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "font", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def font_desc=(value : Pango::FontDescription?) : Pango::FontDescription?
      unsafe_value = value

      LibGObject.g_object_set(self, "font-desc", unsafe_value, Pointer(Void).null)
      value
    end

    def font_desc : Pango::FontDescription?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "font-desc", pointerof(value), Pointer(Void).null)
      Pango::FontDescription.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def foreground=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "foreground", unsafe_value, Pointer(Void).null)
      value
    end

    def foreground_rgba=(value : Gdk::RGBA?) : Gdk::RGBA?
      unsafe_value = value

      LibGObject.g_object_set(self, "foreground-rgba", unsafe_value, Pointer(Void).null)
      value
    end

    def foreground_rgba : Gdk::RGBA?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "foreground-rgba", pointerof(value), Pointer(Void).null)
      Gdk::RGBA.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def foreground_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "foreground-set", unsafe_value, Pointer(Void).null)
      value
    end

    def foreground_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "foreground-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def language=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "language", unsafe_value, Pointer(Void).null)
      value
    end

    def language : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "language", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def language_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "language-set", unsafe_value, Pointer(Void).null)
      value
    end

    def language_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "language-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def markup=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "markup", unsafe_value, Pointer(Void).null)
      value
    end

    def max_width_chars=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-width-chars", unsafe_value, Pointer(Void).null)
      value
    end

    def max_width_chars : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-width-chars", pointerof(value), Pointer(Void).null)
      value
    end

    def placeholder_text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "placeholder-text", unsafe_value, Pointer(Void).null)
      value
    end

    def placeholder_text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "placeholder-text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def rise=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "rise", unsafe_value, Pointer(Void).null)
      value
    end

    def rise : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "rise", pointerof(value), Pointer(Void).null)
      value
    end

    def rise_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "rise-set", unsafe_value, Pointer(Void).null)
      value
    end

    def rise_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "rise-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def scale=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "scale", unsafe_value, Pointer(Void).null)
      value
    end

    def scale : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "scale", pointerof(value), Pointer(Void).null)
      value
    end

    def scale_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "scale-set", unsafe_value, Pointer(Void).null)
      value
    end

    def scale_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "scale-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def single_paragraph_mode=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "single-paragraph-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def single_paragraph_mode? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "single-paragraph-mode", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def size=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "size", unsafe_value, Pointer(Void).null)
      value
    end

    def size : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "size", pointerof(value), Pointer(Void).null)
      value
    end

    def size_points=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "size-points", unsafe_value, Pointer(Void).null)
      value
    end

    def size_points : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "size-points", pointerof(value), Pointer(Void).null)
      value
    end

    def size_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "size-set", unsafe_value, Pointer(Void).null)
      value
    end

    def size_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "size-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def stretch=(value : Pango::Stretch) : Pango::Stretch
      unsafe_value = value

      LibGObject.g_object_set(self, "stretch", unsafe_value, Pointer(Void).null)
      value
    end

    def stretch : Pango::Stretch
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "stretch", pointerof(value), Pointer(Void).null)
      Pango::Stretch.new(value)
    end

    def stretch_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "stretch-set", unsafe_value, Pointer(Void).null)
      value
    end

    def stretch_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "stretch-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def strikethrough=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "strikethrough", unsafe_value, Pointer(Void).null)
      value
    end

    def strikethrough? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "strikethrough", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def strikethrough_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "strikethrough-set", unsafe_value, Pointer(Void).null)
      value
    end

    def strikethrough_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "strikethrough-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def style=(value : Pango::Style) : Pango::Style
      unsafe_value = value

      LibGObject.g_object_set(self, "style", unsafe_value, Pointer(Void).null)
      value
    end

    def style : Pango::Style
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "style", pointerof(value), Pointer(Void).null)
      Pango::Style.new(value)
    end

    def style_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "style-set", unsafe_value, Pointer(Void).null)
      value
    end

    def style_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "style-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def underline=(value : Pango::Underline) : Pango::Underline
      unsafe_value = value

      LibGObject.g_object_set(self, "underline", unsafe_value, Pointer(Void).null)
      value
    end

    def underline : Pango::Underline
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "underline", pointerof(value), Pointer(Void).null)
      Pango::Underline.new(value)
    end

    def underline_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "underline-set", unsafe_value, Pointer(Void).null)
      value
    end

    def underline_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "underline-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def variant=(value : Pango::Variant) : Pango::Variant
      unsafe_value = value

      LibGObject.g_object_set(self, "variant", unsafe_value, Pointer(Void).null)
      value
    end

    def variant : Pango::Variant
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "variant", pointerof(value), Pointer(Void).null)
      Pango::Variant.new(value)
    end

    def variant_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "variant-set", unsafe_value, Pointer(Void).null)
      value
    end

    def variant_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "variant-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def weight=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "weight", unsafe_value, Pointer(Void).null)
      value
    end

    def weight : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "weight", pointerof(value), Pointer(Void).null)
      value
    end

    def weight_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "weight-set", unsafe_value, Pointer(Void).null)
      value
    end

    def weight_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "weight-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def width_chars=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "width-chars", unsafe_value, Pointer(Void).null)
      value
    end

    def width_chars : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "width-chars", pointerof(value), Pointer(Void).null)
      value
    end

    def wrap_mode=(value : Pango::WrapMode) : Pango::WrapMode
      unsafe_value = value

      LibGObject.g_object_set(self, "wrap-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def wrap_mode : Pango::WrapMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "wrap-mode", pointerof(value), Pointer(Void).null)
      Pango::WrapMode.new(value)
    end

    def wrap_width=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "wrap-width", unsafe_value, Pointer(Void).null)
      value
    end

    def wrap_width : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "wrap-width", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new `GtkCellRendererText`. Adjust how text is drawn using
    # object properties. Object properties can be
    # set globally (with g_object_set()). Also, with `GtkTreeViewColumn`,
    # you can bind a property to a value in a `GtkTreeModel`. For example,
    # you can bind the “text” property on the cell renderer to a string
    # value in the model, thus rendering a different string in each row
    # of the `GtkTreeView`.
    def initialize
      # gtk_cell_renderer_text_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_cell_renderer_text_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
    end

    # Sets the height of a renderer to explicitly be determined by the “font” and
    # “y_pad” property set on it.  Further changes in these properties do not
    # affect the height, so they must be accompanied by a subsequent call to this
    # function.  Using this function is inflexible, and should really only be used
    # if calculating the size of a cell is too slow (ie, a massive number of cells
    # displayed).  If @number_of_rows is -1, then the fixed height is unset, and
    # the height is determined by the properties again.
    def fixed_height_from_font=(number_of_rows : Int32) : Nil
      # gtk_cell_renderer_text_set_fixed_height_from_font: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_cell_renderer_text_set_fixed_height_from_font(self, number_of_rows)

      # Return value handling
    end

    # This signal is emitted after @renderer has been edited.
    #
    # It is the responsibility of the application to update the model
    # and store @new_text at the position indicated by @path.
    struct EditedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "edited::#{@detail}" : "edited"
      end

      def connect(&block : Proc(::String, ::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, ::String, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(::String, ::String, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(::String, ::String, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::CellRendererText, ::String, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::CellRendererText.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(Gtk::CellRendererText, ::String, ::String, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CellRendererText, ::String, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), lib_arg1 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::CellRendererText.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          arg1 = ::String.new(lib_arg1)
          ::Box(Proc(Gtk::CellRendererText, ::String, ::String, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(path : ::String, new_text : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "edited", path, new_text)
      end
    end

    def edited_signal
      EditedSignal.new(self)
    end
  end
end
