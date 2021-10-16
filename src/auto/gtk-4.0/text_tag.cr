require "../g_object-2.0/object"

module Gtk
  # A tag that can be applied to text contained in a `GtkTextBuffer`.
  #
  # You may wish to begin by reading the
  # [text widget conceptual overview](section-text-widget.html),
  # which gives an overview of all the objects and data types
  # related to the text widget and how they work together.
  #
  # Tags should be in the [class@Gtk.TextTagTable] for a given
  # `GtkTextBuffer` before using them with that buffer.
  #
  # [method@Gtk.TextBuffer.create_tag] is the best way to create tags.
  # See “gtk4-demo” for numerous examples.
  #
  # For each property of `GtkTextTag`, there is a “set” property, e.g.
  # “font-set” corresponds to “font”. These “set” properties reflect
  # whether a property has been set or not.
  #
  # They are maintained by GTK and you should not set them independently.
  class TextTag < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accumulative_margin : Bool? = nil, allow_breaks : Bool? = nil, allow_breaks_set : Bool? = nil, background : ::String? = nil, background_full_height : Bool? = nil, background_full_height_set : Bool? = nil, background_rgba : Gdk::RGBA? = nil, background_set : Bool? = nil, direction : Gtk::TextDirection? = nil, editable : Bool? = nil, editable_set : Bool? = nil, fallback : Bool? = nil, fallback_set : Bool? = nil, family : ::String? = nil, family_set : Bool? = nil, font : ::String? = nil, font_desc : Pango::FontDescription? = nil, font_features : ::String? = nil, font_features_set : Bool? = nil, foreground : ::String? = nil, foreground_rgba : Gdk::RGBA? = nil, foreground_set : Bool? = nil, indent : Int32? = nil, indent_set : Bool? = nil, insert_hyphens : Bool? = nil, insert_hyphens_set : Bool? = nil, invisible : Bool? = nil, invisible_set : Bool? = nil, justification : Gtk::Justification? = nil, justification_set : Bool? = nil, language : ::String? = nil, language_set : Bool? = nil, left_margin : Int32? = nil, left_margin_set : Bool? = nil, letter_spacing : Int32? = nil, letter_spacing_set : Bool? = nil, name : ::String? = nil, overline : Pango::Overline? = nil, overline_rgba : Gdk::RGBA? = nil, overline_rgba_set : Bool? = nil, overline_set : Bool? = nil, paragraph_background : ::String? = nil, paragraph_background_rgba : Gdk::RGBA? = nil, paragraph_background_set : Bool? = nil, pixels_above_lines : Int32? = nil, pixels_above_lines_set : Bool? = nil, pixels_below_lines : Int32? = nil, pixels_below_lines_set : Bool? = nil, pixels_inside_wrap : Int32? = nil, pixels_inside_wrap_set : Bool? = nil, right_margin : Int32? = nil, right_margin_set : Bool? = nil, rise : Int32? = nil, rise_set : Bool? = nil, scale : Float64? = nil, scale_set : Bool? = nil, show_spaces : Pango::ShowFlags? = nil, show_spaces_set : Bool? = nil, size : Int32? = nil, size_points : Float64? = nil, size_set : Bool? = nil, stretch : Pango::Stretch? = nil, stretch_set : Bool? = nil, strikethrough : Bool? = nil, strikethrough_rgba : Gdk::RGBA? = nil, strikethrough_rgba_set : Bool? = nil, strikethrough_set : Bool? = nil, style : Pango::Style? = nil, style_set : Bool? = nil, tabs : Pango::TabArray? = nil, tabs_set : Bool? = nil, underline : Pango::Underline? = nil, underline_rgba : Gdk::RGBA? = nil, underline_rgba_set : Bool? = nil, underline_set : Bool? = nil, variant : Pango::Variant? = nil, variant_set : Bool? = nil, weight : Int32? = nil, weight_set : Bool? = nil, wrap_mode : Gtk::WrapMode? = nil, wrap_mode_set : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[81]
      _values = StaticArray(LibGObject::Value, 81).new(LibGObject::Value.new)
      _n = 0

      if accumulative_margin
        (_names.to_unsafe + _n).value = "accumulative-margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accumulative_margin)
        _n += 1
      end
      if allow_breaks
        (_names.to_unsafe + _n).value = "allow-breaks".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_breaks)
        _n += 1
      end
      if allow_breaks_set
        (_names.to_unsafe + _n).value = "allow-breaks-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, allow_breaks_set)
        _n += 1
      end
      if background
        (_names.to_unsafe + _n).value = "background".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, background)
        _n += 1
      end
      if background_full_height
        (_names.to_unsafe + _n).value = "background-full-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, background_full_height)
        _n += 1
      end
      if background_full_height_set
        (_names.to_unsafe + _n).value = "background-full-height-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, background_full_height_set)
        _n += 1
      end
      if background_rgba
        (_names.to_unsafe + _n).value = "background-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, background_rgba)
        _n += 1
      end
      if background_set
        (_names.to_unsafe + _n).value = "background-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, background_set)
        _n += 1
      end
      if direction
        (_names.to_unsafe + _n).value = "direction".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, direction)
        _n += 1
      end
      if editable
        (_names.to_unsafe + _n).value = "editable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable)
        _n += 1
      end
      if editable_set
        (_names.to_unsafe + _n).value = "editable-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable_set)
        _n += 1
      end
      if fallback
        (_names.to_unsafe + _n).value = "fallback".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fallback)
        _n += 1
      end
      if fallback_set
        (_names.to_unsafe + _n).value = "fallback-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fallback_set)
        _n += 1
      end
      if family
        (_names.to_unsafe + _n).value = "family".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family)
        _n += 1
      end
      if family_set
        (_names.to_unsafe + _n).value = "family-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, family_set)
        _n += 1
      end
      if font
        (_names.to_unsafe + _n).value = "font".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, font)
        _n += 1
      end
      if font_desc
        (_names.to_unsafe + _n).value = "font-desc".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, font_desc)
        _n += 1
      end
      if font_features
        (_names.to_unsafe + _n).value = "font-features".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, font_features)
        _n += 1
      end
      if font_features_set
        (_names.to_unsafe + _n).value = "font-features-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, font_features_set)
        _n += 1
      end
      if foreground
        (_names.to_unsafe + _n).value = "foreground".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, foreground)
        _n += 1
      end
      if foreground_rgba
        (_names.to_unsafe + _n).value = "foreground-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, foreground_rgba)
        _n += 1
      end
      if foreground_set
        (_names.to_unsafe + _n).value = "foreground-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, foreground_set)
        _n += 1
      end
      if indent
        (_names.to_unsafe + _n).value = "indent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, indent)
        _n += 1
      end
      if indent_set
        (_names.to_unsafe + _n).value = "indent-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, indent_set)
        _n += 1
      end
      if insert_hyphens
        (_names.to_unsafe + _n).value = "insert-hyphens".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, insert_hyphens)
        _n += 1
      end
      if insert_hyphens_set
        (_names.to_unsafe + _n).value = "insert-hyphens-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, insert_hyphens_set)
        _n += 1
      end
      if invisible
        (_names.to_unsafe + _n).value = "invisible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, invisible)
        _n += 1
      end
      if invisible_set
        (_names.to_unsafe + _n).value = "invisible-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, invisible_set)
        _n += 1
      end
      if justification
        (_names.to_unsafe + _n).value = "justification".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, justification)
        _n += 1
      end
      if justification_set
        (_names.to_unsafe + _n).value = "justification-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, justification_set)
        _n += 1
      end
      if language
        (_names.to_unsafe + _n).value = "language".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, language)
        _n += 1
      end
      if language_set
        (_names.to_unsafe + _n).value = "language-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, language_set)
        _n += 1
      end
      if left_margin
        (_names.to_unsafe + _n).value = "left-margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, left_margin)
        _n += 1
      end
      if left_margin_set
        (_names.to_unsafe + _n).value = "left-margin-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, left_margin_set)
        _n += 1
      end
      if letter_spacing
        (_names.to_unsafe + _n).value = "letter-spacing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, letter_spacing)
        _n += 1
      end
      if letter_spacing_set
        (_names.to_unsafe + _n).value = "letter-spacing-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, letter_spacing_set)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if overline
        (_names.to_unsafe + _n).value = "overline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overline)
        _n += 1
      end
      if overline_rgba
        (_names.to_unsafe + _n).value = "overline-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overline_rgba)
        _n += 1
      end
      if overline_rgba_set
        (_names.to_unsafe + _n).value = "overline-rgba-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overline_rgba_set)
        _n += 1
      end
      if overline_set
        (_names.to_unsafe + _n).value = "overline-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overline_set)
        _n += 1
      end
      if paragraph_background
        (_names.to_unsafe + _n).value = "paragraph-background".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, paragraph_background)
        _n += 1
      end
      if paragraph_background_rgba
        (_names.to_unsafe + _n).value = "paragraph-background-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, paragraph_background_rgba)
        _n += 1
      end
      if paragraph_background_set
        (_names.to_unsafe + _n).value = "paragraph-background-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, paragraph_background_set)
        _n += 1
      end
      if pixels_above_lines
        (_names.to_unsafe + _n).value = "pixels-above-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_above_lines)
        _n += 1
      end
      if pixels_above_lines_set
        (_names.to_unsafe + _n).value = "pixels-above-lines-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_above_lines_set)
        _n += 1
      end
      if pixels_below_lines
        (_names.to_unsafe + _n).value = "pixels-below-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_below_lines)
        _n += 1
      end
      if pixels_below_lines_set
        (_names.to_unsafe + _n).value = "pixels-below-lines-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_below_lines_set)
        _n += 1
      end
      if pixels_inside_wrap
        (_names.to_unsafe + _n).value = "pixels-inside-wrap".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_inside_wrap)
        _n += 1
      end
      if pixels_inside_wrap_set
        (_names.to_unsafe + _n).value = "pixels-inside-wrap-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pixels_inside_wrap_set)
        _n += 1
      end
      if right_margin
        (_names.to_unsafe + _n).value = "right-margin".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, right_margin)
        _n += 1
      end
      if right_margin_set
        (_names.to_unsafe + _n).value = "right-margin-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, right_margin_set)
        _n += 1
      end
      if rise
        (_names.to_unsafe + _n).value = "rise".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rise)
        _n += 1
      end
      if rise_set
        (_names.to_unsafe + _n).value = "rise-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rise_set)
        _n += 1
      end
      if scale
        (_names.to_unsafe + _n).value = "scale".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale)
        _n += 1
      end
      if scale_set
        (_names.to_unsafe + _n).value = "scale-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_set)
        _n += 1
      end
      if show_spaces
        (_names.to_unsafe + _n).value = "show-spaces".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_spaces)
        _n += 1
      end
      if show_spaces_set
        (_names.to_unsafe + _n).value = "show-spaces-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_spaces_set)
        _n += 1
      end
      if size
        (_names.to_unsafe + _n).value = "size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size)
        _n += 1
      end
      if size_points
        (_names.to_unsafe + _n).value = "size-points".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size_points)
        _n += 1
      end
      if size_set
        (_names.to_unsafe + _n).value = "size-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, size_set)
        _n += 1
      end
      if stretch
        (_names.to_unsafe + _n).value = "stretch".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, stretch)
        _n += 1
      end
      if stretch_set
        (_names.to_unsafe + _n).value = "stretch-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, stretch_set)
        _n += 1
      end
      if strikethrough
        (_names.to_unsafe + _n).value = "strikethrough".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, strikethrough)
        _n += 1
      end
      if strikethrough_rgba
        (_names.to_unsafe + _n).value = "strikethrough-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, strikethrough_rgba)
        _n += 1
      end
      if strikethrough_rgba_set
        (_names.to_unsafe + _n).value = "strikethrough-rgba-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, strikethrough_rgba_set)
        _n += 1
      end
      if strikethrough_set
        (_names.to_unsafe + _n).value = "strikethrough-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, strikethrough_set)
        _n += 1
      end
      if style
        (_names.to_unsafe + _n).value = "style".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, style)
        _n += 1
      end
      if style_set
        (_names.to_unsafe + _n).value = "style-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, style_set)
        _n += 1
      end
      if tabs
        (_names.to_unsafe + _n).value = "tabs".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tabs)
        _n += 1
      end
      if tabs_set
        (_names.to_unsafe + _n).value = "tabs-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tabs_set)
        _n += 1
      end
      if underline
        (_names.to_unsafe + _n).value = "underline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, underline)
        _n += 1
      end
      if underline_rgba
        (_names.to_unsafe + _n).value = "underline-rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, underline_rgba)
        _n += 1
      end
      if underline_rgba_set
        (_names.to_unsafe + _n).value = "underline-rgba-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, underline_rgba_set)
        _n += 1
      end
      if underline_set
        (_names.to_unsafe + _n).value = "underline-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, underline_set)
        _n += 1
      end
      if variant
        (_names.to_unsafe + _n).value = "variant".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, variant)
        _n += 1
      end
      if variant_set
        (_names.to_unsafe + _n).value = "variant-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, variant_set)
        _n += 1
      end
      if weight
        (_names.to_unsafe + _n).value = "weight".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, weight)
        _n += 1
      end
      if weight_set
        (_names.to_unsafe + _n).value = "weight-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, weight_set)
        _n += 1
      end
      if wrap_mode
        (_names.to_unsafe + _n).value = "wrap-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_mode)
        _n += 1
      end
      if wrap_mode_set
        (_names.to_unsafe + _n).value = "wrap-mode-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_mode_set)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TextTag.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_text_tag_get_type
    end

    def accumulative_margin=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "accumulative-margin", unsafe_value, Pointer(Void).null)
      value
    end

    def accumulative_margin? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "accumulative-margin", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def allow_breaks=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "allow-breaks", unsafe_value, Pointer(Void).null)
      value
    end

    def allow_breaks? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "allow-breaks", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def allow_breaks_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "allow-breaks-set", unsafe_value, Pointer(Void).null)
      value
    end

    def allow_breaks_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "allow-breaks-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def background=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "background", unsafe_value, Pointer(Void).null)
      value
    end

    def background_full_height=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "background-full-height", unsafe_value, Pointer(Void).null)
      value
    end

    def background_full_height? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "background-full-height", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def background_full_height_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "background-full-height-set", unsafe_value, Pointer(Void).null)
      value
    end

    def background_full_height_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "background-full-height-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def direction=(value : Gtk::TextDirection) : Gtk::TextDirection
      unsafe_value = value

      LibGObject.g_object_set(self, "direction", unsafe_value, Pointer(Void).null)
      value
    end

    def direction : Gtk::TextDirection
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "direction", pointerof(value), Pointer(Void).null)
      Gtk::TextDirection.from_value(value)
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

    def fallback=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "fallback", unsafe_value, Pointer(Void).null)
      value
    end

    def fallback? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "fallback", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def fallback_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "fallback-set", unsafe_value, Pointer(Void).null)
      value
    end

    def fallback_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "fallback-set", pointerof(value), Pointer(Void).null)
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

    def font_features=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "font-features", unsafe_value, Pointer(Void).null)
      value
    end

    def font_features : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "font-features", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def font_features_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "font-features-set", unsafe_value, Pointer(Void).null)
      value
    end

    def font_features_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "font-features-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def indent=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "indent", unsafe_value, Pointer(Void).null)
      value
    end

    def indent : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "indent", pointerof(value), Pointer(Void).null)
      value
    end

    def indent_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "indent-set", unsafe_value, Pointer(Void).null)
      value
    end

    def indent_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "indent-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def insert_hyphens=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "insert-hyphens", unsafe_value, Pointer(Void).null)
      value
    end

    def insert_hyphens? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "insert-hyphens", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def insert_hyphens_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "insert-hyphens-set", unsafe_value, Pointer(Void).null)
      value
    end

    def insert_hyphens_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "insert-hyphens-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def invisible=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "invisible", unsafe_value, Pointer(Void).null)
      value
    end

    def invisible? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "invisible", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def invisible_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "invisible-set", unsafe_value, Pointer(Void).null)
      value
    end

    def invisible_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "invisible-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def justification=(value : Gtk::Justification) : Gtk::Justification
      unsafe_value = value

      LibGObject.g_object_set(self, "justification", unsafe_value, Pointer(Void).null)
      value
    end

    def justification : Gtk::Justification
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "justification", pointerof(value), Pointer(Void).null)
      Gtk::Justification.from_value(value)
    end

    def justification_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "justification-set", unsafe_value, Pointer(Void).null)
      value
    end

    def justification_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "justification-set", pointerof(value), Pointer(Void).null)
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

    def left_margin=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "left-margin", unsafe_value, Pointer(Void).null)
      value
    end

    def left_margin : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "left-margin", pointerof(value), Pointer(Void).null)
      value
    end

    def left_margin_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "left-margin-set", unsafe_value, Pointer(Void).null)
      value
    end

    def left_margin_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "left-margin-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def letter_spacing=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "letter-spacing", unsafe_value, Pointer(Void).null)
      value
    end

    def letter_spacing : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "letter-spacing", pointerof(value), Pointer(Void).null)
      value
    end

    def letter_spacing_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "letter-spacing-set", unsafe_value, Pointer(Void).null)
      value
    end

    def letter_spacing_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "letter-spacing-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def overline=(value : Pango::Overline) : Pango::Overline
      unsafe_value = value

      LibGObject.g_object_set(self, "overline", unsafe_value, Pointer(Void).null)
      value
    end

    def overline : Pango::Overline
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "overline", pointerof(value), Pointer(Void).null)
      Pango::Overline.from_value(value)
    end

    def overline_rgba=(value : Gdk::RGBA?) : Gdk::RGBA?
      unsafe_value = value

      LibGObject.g_object_set(self, "overline-rgba", unsafe_value, Pointer(Void).null)
      value
    end

    def overline_rgba : Gdk::RGBA?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "overline-rgba", pointerof(value), Pointer(Void).null)
      Gdk::RGBA.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def overline_rgba_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "overline-rgba-set", unsafe_value, Pointer(Void).null)
      value
    end

    def overline_rgba_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "overline-rgba-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def overline_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "overline-set", unsafe_value, Pointer(Void).null)
      value
    end

    def overline_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "overline-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def paragraph_background=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "paragraph-background", unsafe_value, Pointer(Void).null)
      value
    end

    def paragraph_background_rgba=(value : Gdk::RGBA?) : Gdk::RGBA?
      unsafe_value = value

      LibGObject.g_object_set(self, "paragraph-background-rgba", unsafe_value, Pointer(Void).null)
      value
    end

    def paragraph_background_rgba : Gdk::RGBA?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "paragraph-background-rgba", pointerof(value), Pointer(Void).null)
      Gdk::RGBA.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def paragraph_background_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "paragraph-background-set", unsafe_value, Pointer(Void).null)
      value
    end

    def paragraph_background_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "paragraph-background-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def pixels_above_lines=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "pixels-above-lines", unsafe_value, Pointer(Void).null)
      value
    end

    def pixels_above_lines : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "pixels-above-lines", pointerof(value), Pointer(Void).null)
      value
    end

    def pixels_above_lines_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "pixels-above-lines-set", unsafe_value, Pointer(Void).null)
      value
    end

    def pixels_above_lines_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "pixels-above-lines-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def pixels_below_lines=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "pixels-below-lines", unsafe_value, Pointer(Void).null)
      value
    end

    def pixels_below_lines : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "pixels-below-lines", pointerof(value), Pointer(Void).null)
      value
    end

    def pixels_below_lines_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "pixels-below-lines-set", unsafe_value, Pointer(Void).null)
      value
    end

    def pixels_below_lines_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "pixels-below-lines-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def pixels_inside_wrap=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "pixels-inside-wrap", unsafe_value, Pointer(Void).null)
      value
    end

    def pixels_inside_wrap : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "pixels-inside-wrap", pointerof(value), Pointer(Void).null)
      value
    end

    def pixels_inside_wrap_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "pixels-inside-wrap-set", unsafe_value, Pointer(Void).null)
      value
    end

    def pixels_inside_wrap_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "pixels-inside-wrap-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def right_margin=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "right-margin", unsafe_value, Pointer(Void).null)
      value
    end

    def right_margin : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "right-margin", pointerof(value), Pointer(Void).null)
      value
    end

    def right_margin_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "right-margin-set", unsafe_value, Pointer(Void).null)
      value
    end

    def right_margin_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "right-margin-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def show_spaces=(value : Pango::ShowFlags) : Pango::ShowFlags
      unsafe_value = value

      LibGObject.g_object_set(self, "show-spaces", unsafe_value, Pointer(Void).null)
      value
    end

    def show_spaces : Pango::ShowFlags
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "show-spaces", pointerof(value), Pointer(Void).null)
      Pango::ShowFlags.from_value(value)
    end

    def show_spaces_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-spaces-set", unsafe_value, Pointer(Void).null)
      value
    end

    def show_spaces_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-spaces-set", pointerof(value), Pointer(Void).null)
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
      Pango::Stretch.from_value(value)
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

    def strikethrough_rgba=(value : Gdk::RGBA?) : Gdk::RGBA?
      unsafe_value = value

      LibGObject.g_object_set(self, "strikethrough-rgba", unsafe_value, Pointer(Void).null)
      value
    end

    def strikethrough_rgba : Gdk::RGBA?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "strikethrough-rgba", pointerof(value), Pointer(Void).null)
      Gdk::RGBA.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def strikethrough_rgba_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "strikethrough-rgba-set", unsafe_value, Pointer(Void).null)
      value
    end

    def strikethrough_rgba_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "strikethrough-rgba-set", pointerof(value), Pointer(Void).null)
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
      Pango::Style.from_value(value)
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

    def tabs=(value : Pango::TabArray?) : Pango::TabArray?
      unsafe_value = value

      LibGObject.g_object_set(self, "tabs", unsafe_value, Pointer(Void).null)
      value
    end

    def tabs : Pango::TabArray?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "tabs", pointerof(value), Pointer(Void).null)
      Pango::TabArray.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def tabs_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "tabs-set", unsafe_value, Pointer(Void).null)
      value
    end

    def tabs_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "tabs-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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
      Pango::Underline.from_value(value)
    end

    def underline_rgba=(value : Gdk::RGBA?) : Gdk::RGBA?
      unsafe_value = value

      LibGObject.g_object_set(self, "underline-rgba", unsafe_value, Pointer(Void).null)
      value
    end

    def underline_rgba : Gdk::RGBA?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "underline-rgba", pointerof(value), Pointer(Void).null)
      Gdk::RGBA.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def underline_rgba_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "underline-rgba-set", unsafe_value, Pointer(Void).null)
      value
    end

    def underline_rgba_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "underline-rgba-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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
      Pango::Variant.from_value(value)
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

    def wrap_mode=(value : Gtk::WrapMode) : Gtk::WrapMode
      unsafe_value = value

      LibGObject.g_object_set(self, "wrap-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def wrap_mode : Gtk::WrapMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "wrap-mode", pointerof(value), Pointer(Void).null)
      Gtk::WrapMode.from_value(value)
    end

    def wrap_mode_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "wrap-mode-set", unsafe_value, Pointer(Void).null)
      value
    end

    def wrap_mode_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "wrap-mode-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize(name : ::String?)
      # gtk_text_tag_new: (Constructor)
      # @name: (nullable)
      # Returns: (transfer full)

      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      _retval = LibGtk.gtk_text_tag_new(name)
      @pointer = _retval
    end

    def changed(size_changed : Bool) : Nil
      # gtk_text_tag_changed: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_text_tag_changed(self, size_changed)
    end

    def priority : Int32
      # gtk_text_tag_get_priority: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_text_tag_get_priority(self)
      _retval
    end

    def priority=(priority : Int32) : Nil
      # gtk_text_tag_set_priority: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_text_tag_set_priority(self, priority)
    end
  end
end
