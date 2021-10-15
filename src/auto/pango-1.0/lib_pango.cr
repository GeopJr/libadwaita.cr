@[Link("pango-1.0", pkg_config: "pango-1.0")]

lib LibPango
  # Flags
  type FontMask = UInt32
  type ShapeFlags = UInt32
  type ShowFlags = UInt32

  # Enums
  type Alignment = UInt32
  type AttrType = UInt32
  type BidiType = UInt32
  type CoverageLevel = UInt32
  type Direction = UInt32
  type EllipsizeMode = UInt32
  type Gravity = UInt32
  type GravityHint = UInt32
  type Overline = UInt32
  type RenderPart = UInt32
  type Script = Int32
  type Stretch = UInt32
  type Style = UInt32
  type TabAlign = UInt32
  type Underline = UInt32
  type Variant = UInt32
  type Weight = UInt32
  type WrapMode = UInt32

  # Callbacks
  alias AttrDataCopyFunc = Pointer(Void) -> Pointer(Void)
  alias AttrFilterFunc = Pointer(LibPango::Attribute), Pointer(Void) -> LibC::Int
  alias FontsetForeachFunc = Pointer(LibPango::Fontset), Pointer(LibPango::Font), Pointer(Void) -> LibC::Int

  # Interface types

  # Structs

  struct Analysis # 48 bytes long
    shape_engine : Pointer(Void)
    lang_engine : Pointer(Void)
    font : Pointer(LibPango::Font)
    level : UInt8
    gravity : UInt8
    flags : UInt8
    script : UInt8
    language : Pointer(LibPango::Language)
    extra_attrs : Pointer(LibGLib::SList)
  end

  struct AttrClass # 32 bytes long
    type : UInt32
    copy : -> Void
    destroy : -> Void
    equal : -> Void
  end

  struct AttrColor # 24 bytes long
    attr : LibPango::Attribute
    color : LibPango::Color
  end

  struct AttrFloat # 24 bytes long
    attr : LibPango::Attribute
    value : Float64
  end

  struct AttrFontDesc # 24 bytes long
    attr : LibPango::Attribute
    desc : Pointer(LibPango::FontDescription)
  end

  struct AttrFontFeatures # 24 bytes long
    attr : LibPango::Attribute
    features : Pointer(LibC::Char)
  end

  struct AttrInt # 24 bytes long
    attr : LibPango::Attribute
    value : Int32
  end

  type AttrIterator = Void # Struct with zero bytes

  struct AttrLanguage # 24 bytes long
    attr : LibPango::Attribute
    value : Pointer(LibPango::Language)
  end

  type AttrList = Void # Struct with zero bytes

  struct AttrShape # 72 bytes long
    attr : LibPango::Attribute
    ink_rect : LibPango::Rectangle
    logical_rect : LibPango::Rectangle
    data : Pointer(Void)
    copy_func : LibPango::AttrDataCopyFunc
    destroy_func : LibGLib::DestroyNotify
  end

  struct AttrSize # 24 bytes long
    attr : LibPango::Attribute
    size : Int32
    absolute : UInt32
  end

  struct AttrString # 24 bytes long
    attr : LibPango::Attribute
    value : Pointer(LibC::Char)
  end

  struct Attribute # 16 bytes long
    klass : Pointer(LibPango::AttrClass)
    start_index : UInt32
    end_index : UInt32
  end

  struct Color # 6 bytes long
    red : UInt16
    green : UInt16
    blue : UInt16
  end

  type FontDescription = Void # Struct with zero bytes

  struct FontMetrics # 40 bytes long
    ref_count : UInt32
    ascent : Int32
    descent : Int32
    height : Int32
    approximate_char_width : Int32
    approximate_digit_width : Int32
    underline_position : Int32
    underline_thickness : Int32
    strikethrough_position : Int32
    strikethrough_thickness : Int32
  end

  struct GlyphGeometry # 12 bytes long
    width : Int32
    x_offset : Int32
    y_offset : Int32
  end

  struct GlyphInfo # 20 bytes long
    glyph : UInt32
    geometry : LibPango::GlyphGeometry
    attr : LibPango::GlyphVisAttr
  end

  struct GlyphItem # 16 bytes long
    item : Pointer(LibPango::Item)
    glyphs : Pointer(LibPango::GlyphString)
  end

  struct GlyphItemIter # 40 bytes long
    glyph_item : Pointer(LibPango::GlyphItem)
    text : Pointer(LibC::Char)
    start_glyph : Int32
    start_index : Int32
    start_char : Int32
    end_glyph : Int32
    end_index : Int32
    end_char : Int32
  end

  struct GlyphString # 32 bytes long
    num_glyphs : Int32
    glyphs : Pointer(Void)
    log_clusters : Pointer(Int32)
    space : Int32
  end

  struct GlyphVisAttr # 4 bytes long
    is_cluster_start : UInt32
  end

  struct Item # 64 bytes long
    offset : Int32
    length : Int32
    num_chars : Int32
    analysis : LibPango::Analysis
  end

  type Language = Void # Struct with zero bytes

  type LayoutIter = Void # Struct with zero bytes

  struct LayoutLine # 32 bytes long
    layout : Pointer(LibPango::Layout)
    start_index : Int32
    length : Int32
    runs : Pointer(LibGLib::SList)
    is_paragraph_start : UInt32
    resolved_dir : UInt32
  end

  struct LogAttr # 52 bytes long
    is_line_break : UInt32
    is_mandatory_break : UInt32
    is_char_break : UInt32
    is_white : UInt32
    is_cursor_position : UInt32
    is_word_start : UInt32
    is_word_end : UInt32
    is_sentence_boundary : UInt32
    is_sentence_start : UInt32
    is_sentence_end : UInt32
    backspace_deletes_character : UInt32
    is_expandable_space : UInt32
    is_word_boundary : UInt32
  end

  struct Matrix # 48 bytes long
    xx : Float64
    xy : Float64
    yx : Float64
    yy : Float64
    x0 : Float64
    y0 : Float64
  end

  struct Rectangle # 16 bytes long
    x : Int32
    y : Int32
    width : Int32
    height : Int32
  end

  type RendererPrivate = Void # Struct with zero bytes

  type ScriptIter = Void # Struct with zero bytes

  type TabArray = Void # Struct with zero bytes

  # Unions

  # Objects
  type Context = Void # Object struct with no fields

  type Coverage = Void # Object struct with no fields

  struct Font
    parent_instance : LibGObject::Object
  end

  struct FontFace
    parent_instance : LibGObject::Object
  end

  struct FontFamily
    parent_instance : LibGObject::Object
  end

  struct FontMap
    parent_instance : LibGObject::Object
  end

  struct Fontset
    parent_instance : LibGObject::Object
  end

  type FontsetSimple = Void # Object struct with no fields

  type Layout = Void # Object struct with no fields

  struct Renderer
    parent_instance : LibGObject::Object
    underline : UInt32
    strikethrough : LibC::Int
    active_count : Int32
    matrix : Pointer(LibPango::Matrix)
    priv : Pointer(LibPango::RendererPrivate)
  end

  # All C Functions
  fun pango_attr_allow_breaks_new(allow_breaks : LibC::Int) : Pointer(Void)
  fun pango_attr_background_alpha_new(alpha : UInt16) : Pointer(Void)
  fun pango_attr_background_new(red : UInt16, green : UInt16, blue : UInt16) : Pointer(Void)
  fun pango_attr_fallback_new(enable_fallback : LibC::Int) : Pointer(Void)
  fun pango_attr_family_new(family : Pointer(LibC::Char)) : Pointer(Void)
  fun pango_attr_font_desc_new(desc : Pointer(Void)) : Pointer(Void)
  fun pango_attr_font_desc_new(desc : Pointer(Void)) : Pointer(Void)
  fun pango_attr_font_features_new(features : Pointer(LibC::Char)) : Pointer(Void)
  fun pango_attr_font_features_new(features : Pointer(LibC::Char)) : Pointer(Void)
  fun pango_attr_foreground_alpha_new(alpha : UInt16) : Pointer(Void)
  fun pango_attr_foreground_new(red : UInt16, green : UInt16, blue : UInt16) : Pointer(Void)
  fun pango_attr_gravity_hint_new(hint : UInt32) : Pointer(Void)
  fun pango_attr_gravity_new(gravity : UInt32) : Pointer(Void)
  fun pango_attr_insert_hyphens_new(insert_hyphens : LibC::Int) : Pointer(Void)
  fun pango_attr_iterator_copy(this : Void*) : Pointer(Void)
  fun pango_attr_iterator_destroy(this : Void*) : Void
  fun pango_attr_iterator_get(this : Void*, type : UInt32) : Pointer(Void)
  fun pango_attr_iterator_get_attrs(this : Void*) : Pointer(LibGLib::SList)
  fun pango_attr_iterator_get_font(this : Void*, desc : Pointer(Void), language : Pointer(Pointer(Void)), extra_attrs : Pointer(Pointer(LibGLib::SList))) : Void
  fun pango_attr_iterator_get_type : UInt64
  fun pango_attr_iterator_next(this : Void*) : LibC::Int
  fun pango_attr_iterator_range(this : Void*, start : Pointer(Int32), _end : Pointer(Int32)) : Void
  fun pango_attr_language_new(language : Pointer(Void)) : Pointer(Void)
  fun pango_attr_language_new(language : Pointer(Void)) : Pointer(Void)
  fun pango_attr_letter_spacing_new(letter_spacing : Int32) : Pointer(Void)
  fun pango_attr_list_change(this : Void*, attr : Pointer(Void)) : Void
  fun pango_attr_list_copy(this : Void*) : Pointer(Void)
  fun pango_attr_list_equal(this : Void*, other_list : Pointer(Void)) : LibC::Int
  fun pango_attr_list_filter(this : Void*, func : AttrFilterFunc, data : Pointer(Void)) : Pointer(Void)
  fun pango_attr_list_get_attributes(this : Void*) : Pointer(LibGLib::SList)
  fun pango_attr_list_get_iterator(this : Void*) : Pointer(Void)
  fun pango_attr_list_get_type : UInt64
  fun pango_attr_list_insert(this : Void*, attr : Pointer(Void)) : Void
  fun pango_attr_list_insert_before(this : Void*, attr : Pointer(Void)) : Void
  fun pango_attr_list_new : Pointer(Void)
  fun pango_attr_list_ref(this : Void*) : Pointer(Void)
  fun pango_attr_list_splice(this : Void*, other : Pointer(Void), pos : Int32, len : Int32) : Void
  fun pango_attr_list_unref(this : Void*) : Void
  fun pango_attr_list_update(this : Void*, pos : Int32, remove : Int32, add : Int32) : Void
  fun pango_attr_overline_color_new(red : UInt16, green : UInt16, blue : UInt16) : Pointer(Void)
  fun pango_attr_overline_new(overline : UInt32) : Pointer(Void)
  fun pango_attr_rise_new(rise : Int32) : Pointer(Void)
  fun pango_attr_scale_new(scale_factor : Float64) : Pointer(Void)
  fun pango_attr_shape_new(ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Pointer(Void)
  fun pango_attr_shape_new(ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Pointer(Void)
  fun pango_attr_shape_new_with_data(ink_rect : Pointer(Void), logical_rect : Pointer(Void), data : Pointer(Void), copy_func : AttrDataCopyFunc, destroy_func : LibGLib::DestroyNotify) : Pointer(Void)
  fun pango_attr_shape_new_with_data(ink_rect : Pointer(Void), logical_rect : Pointer(Void), data : Pointer(Void), copy_func : AttrDataCopyFunc, destroy_func : LibGLib::DestroyNotify) : Pointer(Void)
  fun pango_attr_show_new(flags : UInt32) : Pointer(Void)
  fun pango_attr_size_new(size : Int32) : Pointer(Void)
  fun pango_attr_size_new(size : Int32) : Pointer(Void)
  fun pango_attr_size_new_absolute(size : Int32) : Pointer(Void)
  fun pango_attr_size_new_absolute(size : Int32) : Pointer(Void)
  fun pango_attr_stretch_new(stretch : UInt32) : Pointer(Void)
  fun pango_attr_strikethrough_color_new(red : UInt16, green : UInt16, blue : UInt16) : Pointer(Void)
  fun pango_attr_strikethrough_new(strikethrough : LibC::Int) : Pointer(Void)
  fun pango_attr_style_new(style : UInt32) : Pointer(Void)
  fun pango_attr_type_get_name(type : UInt32) : Pointer(LibC::Char)
  fun pango_attr_type_register(name : Pointer(LibC::Char)) : UInt32
  fun pango_attr_underline_color_new(red : UInt16, green : UInt16, blue : UInt16) : Pointer(Void)
  fun pango_attr_underline_new(underline : UInt32) : Pointer(Void)
  fun pango_attr_variant_new(variant : UInt32) : Pointer(Void)
  fun pango_attr_weight_new(weight : UInt32) : Pointer(Void)
  fun pango_attribute_copy(this : Void*) : Pointer(Void)
  fun pango_attribute_destroy(this : Void*) : Void
  fun pango_attribute_equal(this : Void*, attr2 : Pointer(Void)) : LibC::Int
  fun pango_attribute_get_type : UInt64
  fun pango_attribute_init(this : Void*, klass : Pointer(Void)) : Void
  fun pango_bidi_type_for_unichar(ch : UInt32) : UInt32
  fun pango_break(text : Pointer(LibC::Char), length : Int32, analysis : Pointer(Void), attrs : Pointer(Void), attrs_len : Int32) : Void
  fun pango_color_copy(this : Void*) : Pointer(Void)
  fun pango_color_free(this : Void*) : Void
  fun pango_color_get_type : UInt64
  fun pango_color_parse(this : Void*, spec : Pointer(LibC::Char)) : LibC::Int
  fun pango_color_parse_with_alpha(this : Void*, alpha : Pointer(UInt16), spec : Pointer(LibC::Char)) : LibC::Int
  fun pango_color_to_string(this : Void*) : Pointer(LibC::Char)
  fun pango_context_changed(this : Void*) : Void
  fun pango_context_get_base_dir(this : Void*) : UInt32
  fun pango_context_get_base_gravity(this : Void*) : UInt32
  fun pango_context_get_font_description(this : Void*) : Pointer(Void)
  fun pango_context_get_font_map(this : Void*) : Pointer(Void)
  fun pango_context_get_gravity(this : Void*) : UInt32
  fun pango_context_get_gravity_hint(this : Void*) : UInt32
  fun pango_context_get_language(this : Void*) : Pointer(Void)
  fun pango_context_get_matrix(this : Void*) : Pointer(Void)
  fun pango_context_get_metrics(this : Void*, desc : Pointer(Void), language : Pointer(Void)) : Pointer(Void)
  fun pango_context_get_round_glyph_positions(this : Void*) : LibC::Int
  fun pango_context_get_serial(this : Void*) : UInt32
  fun pango_context_get_type : UInt64
  fun pango_context_list_families(this : Void*, families : Pointer(Pointer(Pointer(Void))), n_families : Pointer(Int32)) : Void
  fun pango_context_load_font(this : Void*, desc : Pointer(Void)) : Pointer(Void)
  fun pango_context_load_fontset(this : Void*, desc : Pointer(Void), language : Pointer(Void)) : Pointer(Void)
  fun pango_context_new : Pointer(Void)
  fun pango_context_set_base_dir(this : Void*, direction : UInt32) : Void
  fun pango_context_set_base_gravity(this : Void*, gravity : UInt32) : Void
  fun pango_context_set_font_description(this : Void*, desc : Pointer(Void)) : Void
  fun pango_context_set_font_map(this : Void*, font_map : Pointer(Void)) : Void
  fun pango_context_set_gravity_hint(this : Void*, hint : UInt32) : Void
  fun pango_context_set_language(this : Void*, language : Pointer(Void)) : Void
  fun pango_context_set_matrix(this : Void*, matrix : Pointer(Void)) : Void
  fun pango_context_set_round_glyph_positions(this : Void*, round_positions : LibC::Int) : Void
  fun pango_coverage_copy(this : Void*) : Pointer(Void)
  fun pango_coverage_from_bytes(bytes : Pointer(UInt8), n_bytes : Int32) : Pointer(Void)
  fun pango_coverage_get(this : Void*, index_ : Int32) : UInt32
  fun pango_coverage_get_type : UInt64
  fun pango_coverage_max(this : Void*, other : Pointer(Void)) : Void
  fun pango_coverage_new : Pointer(Void)
  fun pango_coverage_ref(this : Void*) : Pointer(Void)
  fun pango_coverage_set(this : Void*, index_ : Int32, level : UInt32) : Void
  fun pango_coverage_to_bytes(this : Void*, bytes : Pointer(Pointer(UInt8)), n_bytes : Pointer(Int32)) : Void
  fun pango_coverage_unref(this : Void*) : Void
  fun pango_default_break(text : Pointer(LibC::Char), length : Int32, analysis : Pointer(Void), attrs : Pointer(Void), attrs_len : Int32) : Void
  fun pango_extents_to_pixels(inclusive : Pointer(Void), nearest : Pointer(Void)) : Void
  fun pango_find_base_dir(text : Pointer(LibC::Char), length : Int32) : UInt32
  fun pango_find_paragraph_boundary(text : Pointer(LibC::Char), length : Int32, paragraph_delimiter_index : Pointer(Int32), next_paragraph_start : Pointer(Int32)) : Void
  fun pango_font_describe(this : Void*) : Pointer(Void)
  fun pango_font_describe_with_absolute_size(this : Void*) : Pointer(Void)
  fun pango_font_description_better_match(this : Void*, old_match : Pointer(Void), new_match : Pointer(Void)) : LibC::Int
  fun pango_font_description_copy(this : Void*) : Pointer(Void)
  fun pango_font_description_copy_static(this : Void*) : Pointer(Void)
  fun pango_font_description_equal(this : Void*, desc2 : Pointer(Void)) : LibC::Int
  fun pango_font_description_free(this : Void*) : Void
  fun pango_font_description_from_string(str : Pointer(LibC::Char)) : Pointer(Void)
  fun pango_font_description_from_string(str : Pointer(LibC::Char)) : Pointer(Void)
  fun pango_font_description_get_family(this : Void*) : Pointer(LibC::Char)
  fun pango_font_description_get_gravity(this : Void*) : UInt32
  fun pango_font_description_get_set_fields(this : Void*) : UInt32
  fun pango_font_description_get_size(this : Void*) : Int32
  fun pango_font_description_get_size_is_absolute(this : Void*) : LibC::Int
  fun pango_font_description_get_stretch(this : Void*) : UInt32
  fun pango_font_description_get_style(this : Void*) : UInt32
  fun pango_font_description_get_type : UInt64
  fun pango_font_description_get_variant(this : Void*) : UInt32
  fun pango_font_description_get_variations(this : Void*) : Pointer(LibC::Char)
  fun pango_font_description_get_weight(this : Void*) : UInt32
  fun pango_font_description_hash(this : Void*) : UInt32
  fun pango_font_description_merge(this : Void*, desc_to_merge : Pointer(Void), replace_existing : LibC::Int) : Void
  fun pango_font_description_merge_static(this : Void*, desc_to_merge : Pointer(Void), replace_existing : LibC::Int) : Void
  fun pango_font_description_new : Pointer(Void)
  fun pango_font_description_set_absolute_size(this : Void*, size : Float64) : Void
  fun pango_font_description_set_family(this : Void*, family : Pointer(LibC::Char)) : Void
  fun pango_font_description_set_family_static(this : Void*, family : Pointer(LibC::Char)) : Void
  fun pango_font_description_set_gravity(this : Void*, gravity : UInt32) : Void
  fun pango_font_description_set_size(this : Void*, size : Int32) : Void
  fun pango_font_description_set_stretch(this : Void*, stretch : UInt32) : Void
  fun pango_font_description_set_style(this : Void*, style : UInt32) : Void
  fun pango_font_description_set_variant(this : Void*, variant : UInt32) : Void
  fun pango_font_description_set_variations(this : Void*, variations : Pointer(LibC::Char)) : Void
  fun pango_font_description_set_variations_static(this : Void*, variations : Pointer(LibC::Char)) : Void
  fun pango_font_description_set_weight(this : Void*, weight : UInt32) : Void
  fun pango_font_description_to_filename(this : Void*) : Pointer(LibC::Char)
  fun pango_font_description_to_string(this : Void*) : Pointer(LibC::Char)
  fun pango_font_description_unset_fields(this : Void*, to_unset : UInt32) : Void
  fun pango_font_descriptions_free(descs : Pointer(Pointer(Void)), n_descs : Int32) : Void
  fun pango_font_face_describe(this : Void*) : Pointer(Void)
  fun pango_font_face_get_face_name(this : Void*) : Pointer(LibC::Char)
  fun pango_font_face_get_family(this : Void*) : Pointer(Void)
  fun pango_font_face_get_type : UInt64
  fun pango_font_face_is_synthesized(this : Void*) : LibC::Int
  fun pango_font_face_list_sizes(this : Void*, sizes : Pointer(Pointer(Int32)), n_sizes : Pointer(Int32)) : Void
  fun pango_font_family_get_face(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun pango_font_family_get_name(this : Void*) : Pointer(LibC::Char)
  fun pango_font_family_get_type : UInt64
  fun pango_font_family_is_monospace(this : Void*) : LibC::Int
  fun pango_font_family_is_variable(this : Void*) : LibC::Int
  fun pango_font_family_list_faces(this : Void*, faces : Pointer(Pointer(Pointer(Void))), n_faces : Pointer(Int32)) : Void
  fun pango_font_get_coverage(this : Void*, language : Pointer(Void)) : Pointer(Void)
  fun pango_font_get_face(this : Void*) : Pointer(Void)
  fun pango_font_get_features(this : Void*, features : Pointer(Pointer(Void)), len : Pointer(UInt32), num_features : Pointer(UInt32)) : Void
  fun pango_font_get_font_map(this : Void*) : Pointer(Void)
  fun pango_font_get_glyph_extents(this : Void*, glyph : UInt32, ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Void
  fun pango_font_get_metrics(this : Void*, language : Pointer(Void)) : Pointer(Void)
  fun pango_font_get_type : UInt64
  fun pango_font_has_char(this : Void*, wc : UInt32) : LibC::Int
  fun pango_font_map_changed(this : Void*) : Void
  fun pango_font_map_create_context(this : Void*) : Pointer(Void)
  fun pango_font_map_get_family(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun pango_font_map_get_serial(this : Void*) : UInt32
  fun pango_font_map_get_type : UInt64
  fun pango_font_map_list_families(this : Void*, families : Pointer(Pointer(Pointer(Void))), n_families : Pointer(Int32)) : Void
  fun pango_font_map_load_font(this : Void*, context : Pointer(Void), desc : Pointer(Void)) : Pointer(Void)
  fun pango_font_map_load_fontset(this : Void*, context : Pointer(Void), desc : Pointer(Void), language : Pointer(Void)) : Pointer(Void)
  fun pango_font_metrics_get_approximate_char_width(this : Void*) : Int32
  fun pango_font_metrics_get_approximate_digit_width(this : Void*) : Int32
  fun pango_font_metrics_get_ascent(this : Void*) : Int32
  fun pango_font_metrics_get_descent(this : Void*) : Int32
  fun pango_font_metrics_get_height(this : Void*) : Int32
  fun pango_font_metrics_get_strikethrough_position(this : Void*) : Int32
  fun pango_font_metrics_get_strikethrough_thickness(this : Void*) : Int32
  fun pango_font_metrics_get_type : UInt64
  fun pango_font_metrics_get_underline_position(this : Void*) : Int32
  fun pango_font_metrics_get_underline_thickness(this : Void*) : Int32
  fun pango_font_metrics_ref(this : Void*) : Pointer(Void)
  fun pango_font_metrics_unref(this : Void*) : Void
  fun pango_fontset_foreach(this : Void*, func : FontsetForeachFunc, data : Pointer(Void)) : Void
  fun pango_fontset_get_font(this : Void*, wc : UInt32) : Pointer(Void)
  fun pango_fontset_get_metrics(this : Void*) : Pointer(Void)
  fun pango_fontset_get_type : UInt64
  fun pango_fontset_simple_append(this : Void*, font : Pointer(Void)) : Void
  fun pango_fontset_simple_get_type : UInt64
  fun pango_fontset_simple_new(language : Pointer(Void)) : Pointer(Void)
  fun pango_fontset_simple_size(this : Void*) : Int32
  fun pango_get_log_attrs(text : Pointer(LibC::Char), length : Int32, level : Int32, language : Pointer(Void), log_attrs : Pointer(Void), attrs_len : Int32) : Void
  fun pango_get_mirror_char(ch : UInt32, mirrored_ch : Pointer(UInt32)) : LibC::Int
  fun pango_glyph_item_apply_attrs(this : Void*, text : Pointer(LibC::Char), list : Pointer(Void)) : Pointer(LibGLib::SList)
  fun pango_glyph_item_copy(this : Void*) : Pointer(Void)
  fun pango_glyph_item_free(this : Void*) : Void
  fun pango_glyph_item_get_logical_widths(this : Void*, text : Pointer(LibC::Char), logical_widths : Pointer(Int32)) : Void
  fun pango_glyph_item_get_type : UInt64
  fun pango_glyph_item_iter_copy(this : Void*) : Pointer(Void)
  fun pango_glyph_item_iter_free(this : Void*) : Void
  fun pango_glyph_item_iter_get_type : UInt64
  fun pango_glyph_item_iter_init_end(this : Void*, glyph_item : Pointer(Void), text : Pointer(LibC::Char)) : LibC::Int
  fun pango_glyph_item_iter_init_start(this : Void*, glyph_item : Pointer(Void), text : Pointer(LibC::Char)) : LibC::Int
  fun pango_glyph_item_iter_next_cluster(this : Void*) : LibC::Int
  fun pango_glyph_item_iter_prev_cluster(this : Void*) : LibC::Int
  fun pango_glyph_item_letter_space(this : Void*, text : Pointer(LibC::Char), log_attrs : Pointer(Void), letter_spacing : Int32) : Void
  fun pango_glyph_item_split(this : Void*, text : Pointer(LibC::Char), split_index : Int32) : Pointer(Void)
  fun pango_glyph_string_copy(this : Void*) : Pointer(Void)
  fun pango_glyph_string_extents(this : Void*, font : Pointer(Void), ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Void
  fun pango_glyph_string_extents_range(this : Void*, start : Int32, _end : Int32, font : Pointer(Void), ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Void
  fun pango_glyph_string_free(this : Void*) : Void
  fun pango_glyph_string_get_logical_widths(this : Void*, text : Pointer(LibC::Char), length : Int32, embedding_level : Int32, logical_widths : Pointer(Int32)) : Void
  fun pango_glyph_string_get_type : UInt64
  fun pango_glyph_string_get_width(this : Void*) : Int32
  fun pango_glyph_string_index_to_x(this : Void*, text : Pointer(LibC::Char), length : Int32, analysis : Pointer(Void), index_ : Int32, trailing : LibC::Int, x_pos : Pointer(Int32)) : Void
  fun pango_glyph_string_new : Pointer(Void)
  fun pango_glyph_string_set_size(this : Void*, new_len : Int32) : Void
  fun pango_glyph_string_x_to_index(this : Void*, text : Pointer(LibC::Char), length : Int32, analysis : Pointer(Void), x_pos : Int32, index_ : Pointer(Int32), trailing : Pointer(Int32)) : Void
  fun pango_gravity_get_for_matrix(matrix : Pointer(Void)) : UInt32
  fun pango_gravity_get_for_script(script : Int32, base_gravity : UInt32, hint : UInt32) : UInt32
  fun pango_gravity_get_for_script_and_width(script : Int32, wide : LibC::Int, base_gravity : UInt32, hint : UInt32) : UInt32
  fun pango_gravity_to_rotation(gravity : UInt32) : Float64
  fun pango_is_zero_width(ch : UInt32) : LibC::Int
  fun pango_item_apply_attrs(this : Void*, iter : Pointer(Void)) : Void
  fun pango_item_copy(this : Void*) : Pointer(Void)
  fun pango_item_free(this : Void*) : Void
  fun pango_item_get_type : UInt64
  fun pango_item_new : Pointer(Void)
  fun pango_item_split(this : Void*, split_index : Int32, split_offset : Int32) : Pointer(Void)
  fun pango_itemize(context : Pointer(Void), text : Pointer(LibC::Char), start_index : Int32, length : Int32, attrs : Pointer(Void), cached_iter : Pointer(Void)) : Pointer(LibGLib::List)
  fun pango_itemize_with_base_dir(context : Pointer(Void), base_dir : UInt32, text : Pointer(LibC::Char), start_index : Int32, length : Int32, attrs : Pointer(Void), cached_iter : Pointer(Void)) : Pointer(LibGLib::List)
  fun pango_language_from_string(language : Pointer(LibC::Char)) : Pointer(Void)
  fun pango_language_from_string(language : Pointer(LibC::Char)) : Pointer(Void)
  fun pango_language_get_default : Pointer(Void)
  fun pango_language_get_default : Pointer(Void)
  fun pango_language_get_preferred : Pointer(Void)
  fun pango_language_get_preferred : Pointer(Void)
  fun pango_language_get_sample_string(this : Void*) : Pointer(LibC::Char)
  fun pango_language_get_scripts(this : Void*, num_scripts : Pointer(Int32)) : Pointer(Int32)
  fun pango_language_get_type : UInt64
  fun pango_language_includes_script(this : Void*, script : Int32) : LibC::Int
  fun pango_language_matches(this : Void*, range_list : Pointer(LibC::Char)) : LibC::Int
  fun pango_language_to_string(this : Void*) : Pointer(LibC::Char)
  fun pango_layout_context_changed(this : Void*) : Void
  fun pango_layout_copy(this : Void*) : Pointer(Void)
  fun pango_layout_get_alignment(this : Void*) : UInt32
  fun pango_layout_get_attributes(this : Void*) : Pointer(Void)
  fun pango_layout_get_auto_dir(this : Void*) : LibC::Int
  fun pango_layout_get_baseline(this : Void*) : Int32
  fun pango_layout_get_character_count(this : Void*) : Int32
  fun pango_layout_get_context(this : Void*) : Pointer(Void)
  fun pango_layout_get_cursor_pos(this : Void*, index_ : Int32, strong_pos : Pointer(Void), weak_pos : Pointer(Void)) : Void
  fun pango_layout_get_direction(this : Void*, index : Int32) : UInt32
  fun pango_layout_get_ellipsize(this : Void*) : UInt32
  fun pango_layout_get_extents(this : Void*, ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Void
  fun pango_layout_get_font_description(this : Void*) : Pointer(Void)
  fun pango_layout_get_height(this : Void*) : Int32
  fun pango_layout_get_indent(this : Void*) : Int32
  fun pango_layout_get_iter(this : Void*) : Pointer(Void)
  fun pango_layout_get_justify(this : Void*) : LibC::Int
  fun pango_layout_get_line(this : Void*, line : Int32) : Pointer(Void)
  fun pango_layout_get_line_count(this : Void*) : Int32
  fun pango_layout_get_line_readonly(this : Void*, line : Int32) : Pointer(Void)
  fun pango_layout_get_line_spacing(this : Void*) : Float32
  fun pango_layout_get_lines(this : Void*) : Pointer(LibGLib::SList)
  fun pango_layout_get_lines_readonly(this : Void*) : Pointer(LibGLib::SList)
  fun pango_layout_get_log_attrs(this : Void*, attrs : Pointer(Pointer(Void)), n_attrs : Pointer(Int32)) : Void
  fun pango_layout_get_log_attrs_readonly(this : Void*, n_attrs : Pointer(Int32)) : Pointer(Void)
  fun pango_layout_get_pixel_extents(this : Void*, ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Void
  fun pango_layout_get_pixel_size(this : Void*, width : Pointer(Int32), height : Pointer(Int32)) : Void
  fun pango_layout_get_serial(this : Void*) : UInt32
  fun pango_layout_get_single_paragraph_mode(this : Void*) : LibC::Int
  fun pango_layout_get_size(this : Void*, width : Pointer(Int32), height : Pointer(Int32)) : Void
  fun pango_layout_get_spacing(this : Void*) : Int32
  fun pango_layout_get_tabs(this : Void*) : Pointer(Void)
  fun pango_layout_get_text(this : Void*) : Pointer(LibC::Char)
  fun pango_layout_get_type : UInt64
  fun pango_layout_get_unknown_glyphs_count(this : Void*) : Int32
  fun pango_layout_get_width(this : Void*) : Int32
  fun pango_layout_get_wrap(this : Void*) : UInt32
  fun pango_layout_index_to_line_x(this : Void*, index_ : Int32, trailing : LibC::Int, line : Pointer(Int32), x_pos : Pointer(Int32)) : Void
  fun pango_layout_index_to_pos(this : Void*, index_ : Int32, pos : Pointer(Void)) : Void
  fun pango_layout_is_ellipsized(this : Void*) : LibC::Int
  fun pango_layout_is_wrapped(this : Void*) : LibC::Int
  fun pango_layout_iter_at_last_line(this : Void*) : LibC::Int
  fun pango_layout_iter_copy(this : Void*) : Pointer(Void)
  fun pango_layout_iter_free(this : Void*) : Void
  fun pango_layout_iter_get_baseline(this : Void*) : Int32
  fun pango_layout_iter_get_char_extents(this : Void*, logical_rect : Pointer(Void)) : Void
  fun pango_layout_iter_get_cluster_extents(this : Void*, ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Void
  fun pango_layout_iter_get_index(this : Void*) : Int32
  fun pango_layout_iter_get_layout(this : Void*) : Pointer(Void)
  fun pango_layout_iter_get_layout_extents(this : Void*, ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Void
  fun pango_layout_iter_get_line(this : Void*) : Pointer(Void)
  fun pango_layout_iter_get_line_extents(this : Void*, ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Void
  fun pango_layout_iter_get_line_readonly(this : Void*) : Pointer(Void)
  fun pango_layout_iter_get_line_yrange(this : Void*, y0_ : Pointer(Int32), y1_ : Pointer(Int32)) : Void
  fun pango_layout_iter_get_run(this : Void*) : Pointer(Void)
  fun pango_layout_iter_get_run_extents(this : Void*, ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Void
  fun pango_layout_iter_get_run_readonly(this : Void*) : Pointer(Void)
  fun pango_layout_iter_get_type : UInt64
  fun pango_layout_iter_next_char(this : Void*) : LibC::Int
  fun pango_layout_iter_next_cluster(this : Void*) : LibC::Int
  fun pango_layout_iter_next_line(this : Void*) : LibC::Int
  fun pango_layout_iter_next_run(this : Void*) : LibC::Int
  fun pango_layout_line_get_extents(this : Void*, ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Void
  fun pango_layout_line_get_height(this : Void*, height : Pointer(Int32)) : Void
  fun pango_layout_line_get_pixel_extents(this : Void*, ink_rect : Pointer(Void), logical_rect : Pointer(Void)) : Void
  fun pango_layout_line_get_type : UInt64
  fun pango_layout_line_get_x_ranges(this : Void*, start_index : Int32, end_index : Int32, ranges : Pointer(Pointer(Int32)), n_ranges : Pointer(Int32)) : Void
  fun pango_layout_line_index_to_x(this : Void*, index_ : Int32, trailing : LibC::Int, x_pos : Pointer(Int32)) : Void
  fun pango_layout_line_ref(this : Void*) : Pointer(Void)
  fun pango_layout_line_unref(this : Void*) : Void
  fun pango_layout_line_x_to_index(this : Void*, x_pos : Int32, index_ : Pointer(Int32), trailing : Pointer(Int32)) : LibC::Int
  fun pango_layout_move_cursor_visually(this : Void*, strong : LibC::Int, old_index : Int32, old_trailing : Int32, direction : Int32, new_index : Pointer(Int32), new_trailing : Pointer(Int32)) : Void
  fun pango_layout_new(context : Pointer(Void)) : Pointer(Void)
  fun pango_layout_set_alignment(this : Void*, alignment : UInt32) : Void
  fun pango_layout_set_attributes(this : Void*, attrs : Pointer(Void)) : Void
  fun pango_layout_set_auto_dir(this : Void*, auto_dir : LibC::Int) : Void
  fun pango_layout_set_ellipsize(this : Void*, ellipsize : UInt32) : Void
  fun pango_layout_set_font_description(this : Void*, desc : Pointer(Void)) : Void
  fun pango_layout_set_height(this : Void*, height : Int32) : Void
  fun pango_layout_set_indent(this : Void*, indent : Int32) : Void
  fun pango_layout_set_justify(this : Void*, justify : LibC::Int) : Void
  fun pango_layout_set_line_spacing(this : Void*, factor : Float32) : Void
  fun pango_layout_set_markup(this : Void*, markup : Pointer(LibC::Char), length : Int32) : Void
  fun pango_layout_set_markup_with_accel(this : Void*, markup : Pointer(LibC::Char), length : Int32, accel_marker : UInt32, accel_char : Pointer(UInt32)) : Void
  fun pango_layout_set_single_paragraph_mode(this : Void*, setting : LibC::Int) : Void
  fun pango_layout_set_spacing(this : Void*, spacing : Int32) : Void
  fun pango_layout_set_tabs(this : Void*, tabs : Pointer(Void)) : Void
  fun pango_layout_set_text(this : Void*, text : Pointer(LibC::Char), length : Int32) : Void
  fun pango_layout_set_width(this : Void*, width : Int32) : Void
  fun pango_layout_set_wrap(this : Void*, wrap : UInt32) : Void
  fun pango_layout_xy_to_index(this : Void*, x : Int32, y : Int32, index_ : Pointer(Int32), trailing : Pointer(Int32)) : LibC::Int
  fun pango_log2vis_get_embedding_levels(text : Pointer(LibC::Char), length : Int32, pbase_dir : Pointer(UInt32)) : Pointer(UInt8)
  fun pango_markup_parser_finish(context : Pointer(Void), attr_list : Pointer(Pointer(Void)), text : Pointer(Pointer(LibC::Char)), accel_char : Pointer(UInt32)) : LibC::Int
  fun pango_markup_parser_new(accel_marker : UInt32) : Pointer(Void)
  fun pango_matrix_concat(this : Void*, new_matrix : Pointer(Void)) : Void
  fun pango_matrix_copy(this : Void*) : Pointer(Void)
  fun pango_matrix_free(this : Void*) : Void
  fun pango_matrix_get_font_scale_factor(this : Void*) : Float64
  fun pango_matrix_get_font_scale_factors(this : Void*, xscale : Pointer(Float64), yscale : Pointer(Float64)) : Void
  fun pango_matrix_get_type : UInt64
  fun pango_matrix_rotate(this : Void*, degrees : Float64) : Void
  fun pango_matrix_scale(this : Void*, scale_x : Float64, scale_y : Float64) : Void
  fun pango_matrix_transform_distance(this : Void*, dx : Pointer(Float64), dy : Pointer(Float64)) : Void
  fun pango_matrix_transform_pixel_rectangle(this : Void*, rect : Pointer(Void)) : Void
  fun pango_matrix_transform_point(this : Void*, x : Pointer(Float64), y : Pointer(Float64)) : Void
  fun pango_matrix_transform_rectangle(this : Void*, rect : Pointer(Void)) : Void
  fun pango_matrix_translate(this : Void*, tx : Float64, ty : Float64) : Void
  fun pango_parse_enum(type : UInt64, str : Pointer(LibC::Char), value : Pointer(Int32), warn : LibC::Int, possible_values : Pointer(Pointer(LibC::Char))) : LibC::Int
  fun pango_parse_markup(markup_text : Pointer(LibC::Char), length : Int32, accel_marker : UInt32, attr_list : Pointer(Pointer(Void)), text : Pointer(Pointer(LibC::Char)), accel_char : Pointer(UInt32)) : LibC::Int
  fun pango_parse_stretch(str : Pointer(LibC::Char), stretch : Pointer(UInt32), warn : LibC::Int) : LibC::Int
  fun pango_parse_style(str : Pointer(LibC::Char), style : Pointer(UInt32), warn : LibC::Int) : LibC::Int
  fun pango_parse_variant(str : Pointer(LibC::Char), variant : Pointer(UInt32), warn : LibC::Int) : LibC::Int
  fun pango_parse_weight(str : Pointer(LibC::Char), weight : Pointer(UInt32), warn : LibC::Int) : LibC::Int
  fun pango_quantize_line_geometry(thickness : Pointer(Int32), position : Pointer(Int32)) : Void
  fun pango_read_line(stream : Pointer(Void), str : Pointer(Void)) : Int32
  fun pango_renderer_activate(this : Void*) : Void
  fun pango_renderer_deactivate(this : Void*) : Void
  fun pango_renderer_draw_error_underline(this : Void*, x : Int32, y : Int32, width : Int32, height : Int32) : Void
  fun pango_renderer_draw_glyph(this : Void*, font : Pointer(Void), glyph : UInt32, x : Float64, y : Float64) : Void
  fun pango_renderer_draw_glyph_item(this : Void*, text : Pointer(LibC::Char), glyph_item : Pointer(Void), x : Int32, y : Int32) : Void
  fun pango_renderer_draw_glyphs(this : Void*, font : Pointer(Void), glyphs : Pointer(Void), x : Int32, y : Int32) : Void
  fun pango_renderer_draw_layout(this : Void*, layout : Pointer(Void), x : Int32, y : Int32) : Void
  fun pango_renderer_draw_layout_line(this : Void*, line : Pointer(Void), x : Int32, y : Int32) : Void
  fun pango_renderer_draw_rectangle(this : Void*, part : UInt32, x : Int32, y : Int32, width : Int32, height : Int32) : Void
  fun pango_renderer_draw_trapezoid(this : Void*, part : UInt32, y1_ : Float64, x11 : Float64, x21 : Float64, y2 : Float64, x12 : Float64, x22 : Float64) : Void
  fun pango_renderer_get_alpha(this : Void*, part : UInt32) : UInt16
  fun pango_renderer_get_color(this : Void*, part : UInt32) : Pointer(Void)
  fun pango_renderer_get_layout(this : Void*) : Pointer(Void)
  fun pango_renderer_get_layout_line(this : Void*) : Pointer(Void)
  fun pango_renderer_get_matrix(this : Void*) : Pointer(Void)
  fun pango_renderer_get_type : UInt64
  fun pango_renderer_part_changed(this : Void*, part : UInt32) : Void
  fun pango_renderer_set_alpha(this : Void*, part : UInt32, alpha : UInt16) : Void
  fun pango_renderer_set_color(this : Void*, part : UInt32, color : Pointer(Void)) : Void
  fun pango_renderer_set_matrix(this : Void*, matrix : Pointer(Void)) : Void
  fun pango_reorder_items(logical_items : Pointer(LibGLib::List)) : Pointer(LibGLib::List)
  fun pango_scan_int(pos : Pointer(Pointer(LibC::Char)), _out : Pointer(Int32)) : LibC::Int
  fun pango_scan_string(pos : Pointer(Pointer(LibC::Char)), _out : Pointer(Void)) : LibC::Int
  fun pango_scan_word(pos : Pointer(Pointer(LibC::Char)), _out : Pointer(Void)) : LibC::Int
  fun pango_script_for_unichar(ch : UInt32) : Int32
  fun pango_script_get_sample_language(script : Int32) : Pointer(Void)
  fun pango_script_iter_free(this : Void*) : Void
  fun pango_script_iter_get_range(this : Void*, start : Pointer(Pointer(LibC::Char)), _end : Pointer(Pointer(LibC::Char)), script : Pointer(Int32)) : Void
  fun pango_script_iter_get_type : UInt64
  fun pango_script_iter_new(text : Pointer(LibC::Char), length : Int32) : Pointer(Void)
  fun pango_script_iter_next(this : Void*) : LibC::Int
  fun pango_shape(text : Pointer(LibC::Char), length : Int32, analysis : Pointer(Void), glyphs : Pointer(Void)) : Void
  fun pango_shape_full(item_text : Pointer(LibC::Char), item_length : Int32, paragraph_text : Pointer(LibC::Char), paragraph_length : Int32, analysis : Pointer(Void), glyphs : Pointer(Void)) : Void
  fun pango_shape_with_flags(item_text : Pointer(LibC::Char), item_length : Int32, paragraph_text : Pointer(LibC::Char), paragraph_length : Int32, analysis : Pointer(Void), glyphs : Pointer(Void), flags : UInt32) : Void
  fun pango_skip_space(pos : Pointer(Pointer(LibC::Char))) : LibC::Int
  fun pango_split_file_list(str : Pointer(LibC::Char)) : Pointer(Pointer(LibC::Char))
  fun pango_tab_array_copy(this : Void*) : Pointer(Void)
  fun pango_tab_array_free(this : Void*) : Void
  fun pango_tab_array_get_positions_in_pixels(this : Void*) : LibC::Int
  fun pango_tab_array_get_size(this : Void*) : Int32
  fun pango_tab_array_get_tab(this : Void*, tab_index : Int32, alignment : Pointer(UInt32), location : Pointer(Int32)) : Void
  fun pango_tab_array_get_tabs(this : Void*, alignments : Pointer(Pointer(UInt32)), locations : Pointer(Pointer(Int32))) : Void
  fun pango_tab_array_get_type : UInt64
  fun pango_tab_array_new(initial_size : Int32, positions_in_pixels : LibC::Int) : Pointer(Void)
  fun pango_tab_array_resize(this : Void*, new_size : Int32) : Void
  fun pango_tab_array_set_tab(this : Void*, tab_index : Int32, alignment : UInt32, location : Int32) : Void
  fun pango_tailor_break(text : Pointer(LibC::Char), length : Int32, analysis : Pointer(Void), offset : Int32, log_attrs : Pointer(Void), log_attrs_len : Int32) : Void
  fun pango_trim_string(str : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun pango_unichar_direction(ch : UInt32) : UInt32
  fun pango_units_from_double(d : Float64) : Int32
  fun pango_units_to_double(i : Int32) : Float64
  fun pango_version : Int32
  fun pango_version_check(required_major : Int32, required_minor : Int32, required_micro : Int32) : Pointer(LibC::Char)
  fun pango_version_string : Pointer(LibC::Char)
end
