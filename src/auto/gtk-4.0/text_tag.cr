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

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
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
