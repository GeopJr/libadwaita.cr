@[Link("harfbuzz-gobject", pkg_config: "harfbuzz-gobject")]

lib LibHarfBuzz
  # Flags
  type BufferDiffFlagsT = UInt32
  type BufferFlagsT = UInt32
  type BufferSerializeFlagsT = UInt32
  type GlyphFlagsT = UInt32
  type OtColorPaletteFlagsT = UInt32
  type OtMathGlyphPartFlagsT = UInt32
  type OtVarAxisFlagsT = UInt32

  # Enums
  type AatLayoutFeatureSelectorT = UInt32
  type AatLayoutFeatureTypeT = UInt32
  type BufferClusterLevelT = UInt32
  type BufferContentTypeT = UInt32
  type BufferSerializeFormatT = UInt32
  type DirectionT = UInt32
  type MemoryModeT = UInt32
  type OtLayoutBaselineTagT = UInt32
  type OtLayoutGlyphClassT = UInt32
  type OtMathConstantT = UInt32
  type OtMathKernT = UInt32
  type OtMetaTagT = UInt32
  type OtMetricsTagT = UInt32
  type ScriptT = UInt32
  type StyleTagT = UInt32
  type UnicodeCombiningClassT = UInt32
  type UnicodeGeneralCategoryT = UInt32

  # Callbacks
  alias BufferMessageFuncT = Pointer(LibHarfBuzz::BufferT), Pointer(LibHarfBuzz::FontT), Pointer(LibC::Char), Pointer(Void) -> Int32
  alias DestroyFuncT = Pointer(Void) -> Void
  alias DrawClosePathFuncT = Pointer(LibHarfBuzz::DrawFuncsT), Pointer(Void), Pointer(LibHarfBuzz::DrawStateT), Pointer(Void) -> Void
  alias DrawCubicToFuncT = Pointer(LibHarfBuzz::DrawFuncsT), Pointer(Void), Pointer(LibHarfBuzz::DrawStateT), Float32, Float32, Float32, Float32, Float32, Float32, Pointer(Void) -> Void
  alias DrawLineToFuncT = Pointer(LibHarfBuzz::DrawFuncsT), Pointer(Void), Pointer(LibHarfBuzz::DrawStateT), Float32, Float32, Pointer(Void) -> Void
  alias DrawMoveToFuncT = Pointer(LibHarfBuzz::DrawFuncsT), Pointer(Void), Pointer(LibHarfBuzz::DrawStateT), Float32, Float32, Pointer(Void) -> Void
  alias DrawQuadraticToFuncT = Pointer(LibHarfBuzz::DrawFuncsT), Pointer(Void), Pointer(LibHarfBuzz::DrawStateT), Float32, Float32, Float32, Float32, Pointer(Void) -> Void
  alias FontGetFontExtentsFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), LibHarfBuzz::FontExtentsT, Pointer(Void) -> Int32
  alias FontGetGlyphAdvanceFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, Pointer(Void) -> Int32
  alias FontGetGlyphAdvancesFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, Pointer(UInt32), UInt32, Int32, UInt32, Pointer(Void) -> Void
  alias FontGetGlyphContourPointFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, UInt32, Int32, Int32, Pointer(Void) -> Int32
  alias FontGetGlyphExtentsFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, LibHarfBuzz::GlyphExtentsT, Pointer(Void) -> Int32
  alias FontGetGlyphFromNameFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), Pointer(Pointer(LibC::Char)), Int32, UInt32, Pointer(Void) -> Int32
  alias FontGetGlyphFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, UInt32, UInt32, Pointer(Void) -> Int32
  alias FontGetGlyphKerningFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, UInt32, Pointer(Void) -> Int32
  alias FontGetGlyphNameFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, Pointer(Pointer(LibC::Char)), UInt32, Pointer(Void) -> Int32
  alias FontGetGlyphOriginFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, Int32, Int32, Pointer(Void) -> Int32
  alias FontGetGlyphShapeFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, Pointer(LibHarfBuzz::DrawFuncsT), Pointer(Void), Pointer(Void) -> Void
  alias FontGetNominalGlyphFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, UInt32, Pointer(Void) -> Int32
  alias FontGetNominalGlyphsFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, Pointer(UInt32), UInt32, UInt32, UInt32, Pointer(Void) -> UInt32
  alias FontGetVariationGlyphFuncT = Pointer(LibHarfBuzz::FontT), Pointer(Void), UInt32, UInt32, UInt32, Pointer(Void) -> Int32
  alias ReferenceTableFuncT = Pointer(LibHarfBuzz::FaceT), UInt32, Pointer(Void) -> Pointer(LibHarfBuzz::BlobT)
  alias UnicodeCombiningClassFuncT = Pointer(LibHarfBuzz::UnicodeFuncsT), UInt32, Pointer(Void) -> UInt32
  alias UnicodeComposeFuncT = Pointer(LibHarfBuzz::UnicodeFuncsT), UInt32, UInt32, UInt32, Pointer(Void) -> Int32
  alias UnicodeDecomposeCompatibilityFuncT = Pointer(LibHarfBuzz::UnicodeFuncsT), UInt32, Pointer(UInt32), Pointer(Void) -> UInt32
  alias UnicodeDecomposeFuncT = Pointer(LibHarfBuzz::UnicodeFuncsT), UInt32, UInt32, UInt32, Pointer(Void) -> Int32
  alias UnicodeEastasianWidthFuncT = Pointer(LibHarfBuzz::UnicodeFuncsT), UInt32, Pointer(Void) -> UInt32
  alias UnicodeGeneralCategoryFuncT = Pointer(LibHarfBuzz::UnicodeFuncsT), UInt32, Pointer(Void) -> UInt32
  alias UnicodeMirroringFuncT = Pointer(LibHarfBuzz::UnicodeFuncsT), UInt32, Pointer(Void) -> UInt32
  alias UnicodeScriptFuncT = Pointer(LibHarfBuzz::UnicodeFuncsT), UInt32, Pointer(Void) -> UInt32

  # Interface types

  # Structs

  struct AatLayoutFeatureSelectorInfoT # 16 bytes long
    name_id : UInt32
    enable : UInt32
    disable : UInt32
    reserved : UInt32
  end

  type BlobT = Void # Struct with zero bytes

  type BufferT = Void # Struct with zero bytes

  type DrawFuncsT = Void # Struct with zero bytes

  struct DrawStateT # 48 bytes long
    path_open : Int32
    path_start_x : Float32
    path_start_y : Float32
    current_x : Float32
    current_y : Float32
    reserved1 : LibHarfBuzz::VarNumT
    reserved2 : LibHarfBuzz::VarNumT
    reserved3 : LibHarfBuzz::VarNumT
    reserved4 : LibHarfBuzz::VarNumT
    reserved5 : LibHarfBuzz::VarNumT
    reserved6 : LibHarfBuzz::VarNumT
    reserved7 : LibHarfBuzz::VarNumT
  end

  type FaceT = Void # Struct with zero bytes

  struct FeatureT # 16 bytes long
    tag : UInt32
    value : UInt32
    start : UInt32
    _end : UInt32
  end

  struct FontExtentsT # 48 bytes long
    ascender : Int32
    descender : Int32
    line_gap : Int32
    reserved9 : Int32
    reserved8 : Int32
    reserved7 : Int32
    reserved6 : Int32
    reserved5 : Int32
    reserved4 : Int32
    reserved3 : Int32
    reserved2 : Int32
    reserved1 : Int32
  end

  type FontFuncsT = Void # Struct with zero bytes

  type FontT = Void # Struct with zero bytes

  struct GlyphExtentsT # 16 bytes long
    x_bearing : Int32
    y_bearing : Int32
    width : Int32
    height : Int32
  end

  struct GlyphInfoT # 20 bytes long
    codepoint : UInt32
    mask : UInt32
    cluster : UInt32
    var1 : LibHarfBuzz::VarIntT
    var2 : LibHarfBuzz::VarIntT
  end

  struct GlyphPositionT # 20 bytes long
    x_advance : Int32
    y_advance : Int32
    x_offset : Int32
    y_offset : Int32
    var : LibHarfBuzz::VarIntT
  end

  type LanguageT = Void # Struct with zero bytes

  type MapT = Void # Struct with zero bytes

  struct OtColorLayerT # 8 bytes long
    glyph : UInt32
    color_index : UInt32
  end

  struct OtMathGlyphPartT # 20 bytes long
    glyph : UInt32
    start_connector_length : Int32
    end_connector_length : Int32
    full_advance : Int32
    flags : UInt32
  end

  struct OtMathGlyphVariantT # 8 bytes long
    glyph : UInt32
    advance : Int32
  end

  struct OtMathKernEntryT # 8 bytes long
    max_correction_height : Int32
    kern_value : Int32
  end

  struct OtNameEntryT # 16 bytes long
    name_id : UInt32
    var : LibHarfBuzz::VarIntT
    language : Pointer(LibHarfBuzz::LanguageT)
  end

  struct OtVarAxisInfoT # 32 bytes long
    axis_index : UInt32
    tag : UInt32
    name_id : UInt32
    flags : UInt32
    min_value : Float32
    default_value : Float32
    max_value : Float32
    reserved : UInt32
  end

  struct OtVarAxisT # 20 bytes long
    tag : UInt32
    name_id : UInt32
    min_value : Float32
    default_value : Float32
    max_value : Float32
  end

  struct SegmentPropertiesT # 32 bytes long
    direction : UInt32
    script : UInt32
    language : Pointer(LibHarfBuzz::LanguageT)
    reserved1 : Pointer(Void)
    reserved2 : Pointer(Void)
  end

  type SetT = Void # Struct with zero bytes

  type ShapePlanT = Void # Struct with zero bytes

  type UnicodeFuncsT = Void # Struct with zero bytes

  struct UserDataKeyT # 1 bytes long
    unused : Int8
  end

  struct VariationT # 8 bytes long
    tag : UInt32
    value : Float32
  end

  # Unions

  union VarIntT # 4 bytes
    u32 : UInt32
    i32 : Int32
    u16 : UInt16[2]
    i16 : Int16[2]
    u8 : UInt8[4]
    i8 : Int8[4]
  end

  union VarNumT # 4 bytes
    f : Float32
    u32 : UInt32
    i32 : Int32
    u16 : UInt16[2]
    i16 : Int16[2]
    u8 : UInt8[4]
    i8 : Int8[4]
  end

  # Objects

  # All C Functions
  fun hb_aat_layout_feature_type_get_name_id(face : Pointer(Void), feature_type : UInt32) : UInt32
  fun hb_aat_layout_feature_type_get_selector_infos(face : Pointer(Void), feature_type : UInt32, start_offset : UInt32, selector_count : Pointer(UInt32), selectors : Pointer(Pointer(Void)), default_index : Pointer(UInt32)) : UInt32
  fun hb_aat_layout_get_feature_types(face : Pointer(Void), start_offset : UInt32, feature_count : Pointer(UInt32), features : Pointer(Pointer(UInt32))) : UInt32
  fun hb_aat_layout_has_positioning(face : Pointer(Void)) : Int32
  fun hb_aat_layout_has_substitution(face : Pointer(Void)) : Int32
  fun hb_aat_layout_has_tracking(face : Pointer(Void)) : Int32
  fun hb_blob_copy_writable_or_fail(blob : Pointer(Void)) : Pointer(Void)
  fun hb_blob_create_from_file(file_name : Pointer(LibC::Char)) : Pointer(Void)
  fun hb_blob_create_from_file_or_fail(file_name : Pointer(LibC::Char)) : Pointer(Void)
  fun hb_blob_create_sub_blob(parent : Pointer(Void), offset : UInt32, length : UInt32) : Pointer(Void)
  fun hb_blob_get_data(blob : Pointer(Void), length : Pointer(UInt32)) : Pointer(Pointer(LibC::Char))
  fun hb_blob_get_data_writable(blob : Pointer(Void), length : Pointer(UInt32)) : Pointer(Pointer(LibC::Char))
  fun hb_blob_get_empty : Pointer(Void)
  fun hb_blob_get_length(blob : Pointer(Void)) : UInt32
  fun hb_blob_is_immutable(blob : Pointer(Void)) : Int32
  fun hb_blob_make_immutable(blob : Pointer(Void)) : Void
  fun hb_buffer_add(buffer : Pointer(Void), codepoint : UInt32, cluster : UInt32) : Void
  fun hb_buffer_add_codepoints(buffer : Pointer(Void), text : Pointer(UInt32), text_length : Int32, item_offset : UInt32, item_length : Int32) : Void
  fun hb_buffer_add_latin1(buffer : Pointer(Void), text : Pointer(UInt8), text_length : Int32, item_offset : UInt32, item_length : Int32) : Void
  fun hb_buffer_add_utf16(buffer : Pointer(Void), text : Pointer(UInt16), text_length : Int32, item_offset : UInt32, item_length : Int32) : Void
  fun hb_buffer_add_utf32(buffer : Pointer(Void), text : Pointer(UInt32), text_length : Int32, item_offset : UInt32, item_length : Int32) : Void
  fun hb_buffer_add_utf8(buffer : Pointer(Void), text : Pointer(UInt8), text_length : Int32, item_offset : UInt32, item_length : Int32) : Void
  fun hb_buffer_allocation_successful(buffer : Pointer(Void)) : Int32
  fun hb_buffer_append(buffer : Pointer(Void), source : Pointer(Void), start : UInt32, _end : UInt32) : Void
  fun hb_buffer_clear_contents(buffer : Pointer(Void)) : Void
  fun hb_buffer_create : Pointer(Void)
  fun hb_buffer_create_similar(src : Pointer(Void)) : Pointer(Void)
  fun hb_buffer_deserialize_glyphs(buffer : Pointer(Void), buf : Pointer(Pointer(LibC::Char)), buf_len : Int32, end_ptr : Pointer(Pointer(LibC::Char)), font : Pointer(Void), format : UInt32) : Int32
  fun hb_buffer_deserialize_unicode(buffer : Pointer(Void), buf : Pointer(Pointer(LibC::Char)), buf_len : Int32, end_ptr : Pointer(Pointer(LibC::Char)), format : UInt32) : Int32
  fun hb_buffer_diff(buffer : Pointer(Void), reference : Pointer(Void), dottedcircle_glyph : UInt32, position_fuzz : UInt32) : UInt32
  fun hb_buffer_get_cluster_level(buffer : Pointer(Void)) : UInt32
  fun hb_buffer_get_content_type(buffer : Pointer(Void)) : UInt32
  fun hb_buffer_get_direction(buffer : Pointer(Void)) : UInt32
  fun hb_buffer_get_empty : Pointer(Void)
  fun hb_buffer_get_flags(buffer : Pointer(Void)) : UInt32
  fun hb_buffer_get_glyph_infos(buffer : Pointer(Void), length : Pointer(UInt32)) : Pointer(Void)
  fun hb_buffer_get_glyph_positions(buffer : Pointer(Void), length : Pointer(UInt32)) : Pointer(Void)
  fun hb_buffer_get_invisible_glyph(buffer : Pointer(Void)) : UInt32
  fun hb_buffer_get_language(buffer : Pointer(Void)) : Pointer(Void)
  fun hb_buffer_get_length(buffer : Pointer(Void)) : UInt32
  fun hb_buffer_get_not_found_glyph(buffer : Pointer(Void)) : UInt32
  fun hb_buffer_get_replacement_codepoint(buffer : Pointer(Void)) : UInt32
  fun hb_buffer_get_script(buffer : Pointer(Void)) : UInt32
  fun hb_buffer_get_segment_properties(buffer : Pointer(Void), props : Pointer(Void)) : Void
  fun hb_buffer_get_unicode_funcs(buffer : Pointer(Void)) : Pointer(Void)
  fun hb_buffer_guess_segment_properties(buffer : Pointer(Void)) : Void
  fun hb_buffer_has_positions(buffer : Pointer(Void)) : Int32
  fun hb_buffer_normalize_glyphs(buffer : Pointer(Void)) : Void
  fun hb_buffer_pre_allocate(buffer : Pointer(Void), size : UInt32) : Int32
  fun hb_buffer_reset(buffer : Pointer(Void)) : Void
  fun hb_buffer_reverse(buffer : Pointer(Void)) : Void
  fun hb_buffer_reverse_clusters(buffer : Pointer(Void)) : Void
  fun hb_buffer_reverse_range(buffer : Pointer(Void), start : UInt32, _end : UInt32) : Void
  fun hb_buffer_serialize(buffer : Pointer(Void), start : UInt32, _end : UInt32, buf : Pointer(Pointer(UInt8)), buf_size : Pointer(UInt32), buf_consumed : Pointer(UInt32), font : Pointer(Void), format : UInt32, flags : UInt32) : UInt32
  fun hb_buffer_serialize_format_from_string(str : Pointer(UInt8), len : Int32) : UInt32
  fun hb_buffer_serialize_format_to_string(format : UInt32) : Pointer(LibC::Char)
  fun hb_buffer_serialize_glyphs(buffer : Pointer(Void), start : UInt32, _end : UInt32, buf : Pointer(Pointer(UInt8)), buf_size : Pointer(UInt32), buf_consumed : Pointer(UInt32), font : Pointer(Void), format : UInt32, flags : UInt32) : UInt32
  fun hb_buffer_serialize_list_formats : Pointer(Pointer(LibC::Char))
  fun hb_buffer_serialize_unicode(buffer : Pointer(Void), start : UInt32, _end : UInt32, buf : Pointer(Pointer(UInt8)), buf_size : Pointer(UInt32), buf_consumed : Pointer(UInt32), format : UInt32, flags : UInt32) : UInt32
  fun hb_buffer_set_cluster_level(buffer : Pointer(Void), cluster_level : UInt32) : Void
  fun hb_buffer_set_content_type(buffer : Pointer(Void), content_type : UInt32) : Void
  fun hb_buffer_set_direction(buffer : Pointer(Void), direction : UInt32) : Void
  fun hb_buffer_set_flags(buffer : Pointer(Void), flags : UInt32) : Void
  fun hb_buffer_set_invisible_glyph(buffer : Pointer(Void), invisible : UInt32) : Void
  fun hb_buffer_set_language(buffer : Pointer(Void), language : Pointer(Void)) : Void
  fun hb_buffer_set_length(buffer : Pointer(Void), length : UInt32) : Int32
  fun hb_buffer_set_message_func(buffer : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_buffer_set_not_found_glyph(buffer : Pointer(Void), not_found : UInt32) : Void
  fun hb_buffer_set_replacement_codepoint(buffer : Pointer(Void), replacement : UInt32) : Void
  fun hb_buffer_set_script(buffer : Pointer(Void), script : UInt32) : Void
  fun hb_buffer_set_segment_properties(buffer : Pointer(Void), props : Pointer(Void)) : Void
  fun hb_buffer_set_unicode_funcs(buffer : Pointer(Void), unicode_funcs : Pointer(Void)) : Void
  fun hb_color_get_alpha(color : UInt32) : UInt8
  fun hb_color_get_blue(color : UInt32) : UInt8
  fun hb_color_get_green(color : UInt32) : UInt8
  fun hb_color_get_red(color : UInt32) : UInt8
  fun hb_direction_from_string(str : Pointer(UInt8), len : Int32) : UInt32
  fun hb_direction_to_string(direction : UInt32) : Pointer(LibC::Char)
  fun hb_draw_close_path(dfuncs : Pointer(Void), draw_data : Pointer(Void), st : Pointer(Void)) : Void
  fun hb_draw_cubic_to(dfuncs : Pointer(Void), draw_data : Pointer(Void), st : Pointer(Void), control1_x : Float32, control1_y : Float32, control2_x : Float32, control2_y : Float32, to_x : Float32, to_y : Float32) : Void
  fun hb_draw_funcs_create : Pointer(Void)
  fun hb_draw_funcs_is_immutable(dfuncs : Pointer(Void)) : Int32
  fun hb_draw_funcs_make_immutable(dfuncs : Pointer(Void)) : Void
  fun hb_draw_funcs_set_close_path_func(dfuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_draw_funcs_set_cubic_to_func(dfuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_draw_funcs_set_line_to_func(dfuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_draw_funcs_set_move_to_func(dfuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_draw_funcs_set_quadratic_to_func(dfuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_draw_line_to(dfuncs : Pointer(Void), draw_data : Pointer(Void), st : Pointer(Void), to_x : Float32, to_y : Float32) : Void
  fun hb_draw_move_to(dfuncs : Pointer(Void), draw_data : Pointer(Void), st : Pointer(Void), to_x : Float32, to_y : Float32) : Void
  fun hb_draw_quadratic_to(dfuncs : Pointer(Void), draw_data : Pointer(Void), st : Pointer(Void), control_x : Float32, control_y : Float32, to_x : Float32, to_y : Float32) : Void
  fun hb_face_builder_add_table(face : Pointer(Void), tag : UInt32, blob : Pointer(Void)) : Int32
  fun hb_face_builder_create : Pointer(Void)
  fun hb_face_collect_unicodes(face : Pointer(Void), _out : Pointer(Void)) : Void
  fun hb_face_collect_variation_selectors(face : Pointer(Void), _out : Pointer(Void)) : Void
  fun hb_face_collect_variation_unicodes(face : Pointer(Void), variation_selector : UInt32, _out : Pointer(Void)) : Void
  fun hb_face_count(blob : Pointer(Void)) : UInt32
  fun hb_face_create(blob : Pointer(Void), index : UInt32) : Pointer(Void)
  fun hb_face_create_for_tables(reference_table_func : Void*, user_data : Pointer(Void), destroy : Void*) : Pointer(Void)
  fun hb_face_get_empty : Pointer(Void)
  fun hb_face_get_glyph_count(face : Pointer(Void)) : UInt32
  fun hb_face_get_index(face : Pointer(Void)) : UInt32
  fun hb_face_get_table_tags(face : Pointer(Void), start_offset : UInt32, table_count : Pointer(UInt32), table_tags : Pointer(Pointer(UInt32))) : UInt32
  fun hb_face_get_upem(face : Pointer(Void)) : UInt32
  fun hb_face_is_immutable(face : Pointer(Void)) : Int32
  fun hb_face_make_immutable(face : Pointer(Void)) : Void
  fun hb_face_reference_blob(face : Pointer(Void)) : Pointer(Void)
  fun hb_face_reference_table(face : Pointer(Void), tag : UInt32) : Pointer(Void)
  fun hb_face_set_glyph_count(face : Pointer(Void), glyph_count : UInt32) : Void
  fun hb_face_set_index(face : Pointer(Void), index : UInt32) : Void
  fun hb_face_set_upem(face : Pointer(Void), upem : UInt32) : Void
  fun hb_feature_from_string(str : Pointer(UInt8), len : Int32, feature : Pointer(Void)) : Int32
  fun hb_feature_to_string(feature : Pointer(Void), buf : Pointer(Pointer(Pointer(LibC::Char))), size : Pointer(UInt32)) : Void
  fun hb_feature_to_string(this : Void*, buf : Pointer(Pointer(Pointer(LibC::Char))), size : Pointer(UInt32)) : Void
  fun hb_font_add_glyph_origin_for_direction(font : Pointer(Void), glyph : UInt32, direction : UInt32, x : Pointer(Int32), y : Pointer(Int32)) : Void
  fun hb_font_create(face : Pointer(Void)) : Pointer(Void)
  fun hb_font_create_sub_font(parent : Pointer(Void)) : Pointer(Void)
  fun hb_font_funcs_create : Pointer(Void)
  fun hb_font_funcs_get_empty : Pointer(Void)
  fun hb_font_funcs_is_immutable(ffuncs : Pointer(Void)) : Int32
  fun hb_font_funcs_make_immutable(ffuncs : Pointer(Void)) : Void
  fun hb_font_funcs_set_font_h_extents_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_font_v_extents_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_contour_point_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_extents_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_from_name_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_h_advance_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_h_advances_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_h_kerning_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_h_origin_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_name_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_shape_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_v_advance_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_v_advances_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_v_kerning_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_glyph_v_origin_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_nominal_glyph_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_nominal_glyphs_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_funcs_set_variation_glyph_func(ffuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_get_empty : Pointer(Void)
  fun hb_font_get_extents_for_direction(font : Pointer(Void), direction : UInt32, extents : Pointer(Void)) : Void
  fun hb_font_get_face(font : Pointer(Void)) : Pointer(Void)
  fun hb_font_get_glyph(font : Pointer(Void), unicode : UInt32, variation_selector : UInt32, glyph : Pointer(UInt32)) : Int32
  fun hb_font_get_glyph_advance_for_direction(font : Pointer(Void), glyph : UInt32, direction : UInt32, x : Pointer(Int32), y : Pointer(Int32)) : Void
  fun hb_font_get_glyph_advances_for_direction(font : Pointer(Void), direction : UInt32, count : UInt32, first_glyph : Pointer(UInt32), glyph_stride : UInt32, first_advance : Pointer(Int32), advance_stride : Pointer(UInt32)) : Void
  fun hb_font_get_glyph_contour_point(font : Pointer(Void), glyph : UInt32, point_index : UInt32, x : Pointer(Int32), y : Pointer(Int32)) : Int32
  fun hb_font_get_glyph_contour_point_for_origin(font : Pointer(Void), glyph : UInt32, point_index : UInt32, direction : UInt32, x : Pointer(Int32), y : Pointer(Int32)) : Int32
  fun hb_font_get_glyph_extents(font : Pointer(Void), glyph : UInt32, extents : Pointer(Void)) : Int32
  fun hb_font_get_glyph_extents_for_origin(font : Pointer(Void), glyph : UInt32, direction : UInt32, extents : Pointer(Void)) : Int32
  fun hb_font_get_glyph_from_name(font : Pointer(Void), name : Pointer(Pointer(LibC::Char)), len : Int32, glyph : Pointer(UInt32)) : Int32
  fun hb_font_get_glyph_h_advance(font : Pointer(Void), glyph : UInt32) : Int32
  fun hb_font_get_glyph_h_advances(font : Pointer(Void), count : UInt32, first_glyph : Pointer(UInt32), glyph_stride : UInt32, first_advance : Pointer(Int32), advance_stride : UInt32) : Void
  fun hb_font_get_glyph_h_kerning(font : Pointer(Void), left_glyph : UInt32, right_glyph : UInt32) : Int32
  fun hb_font_get_glyph_h_origin(font : Pointer(Void), glyph : UInt32, x : Pointer(Int32), y : Pointer(Int32)) : Int32
  fun hb_font_get_glyph_kerning_for_direction(font : Pointer(Void), first_glyph : UInt32, second_glyph : UInt32, direction : UInt32, x : Pointer(Int32), y : Pointer(Int32)) : Void
  fun hb_font_get_glyph_name(font : Pointer(Void), glyph : UInt32, name : Pointer(Pointer(Pointer(LibC::Char))), size : Pointer(UInt32)) : Int32
  fun hb_font_get_glyph_origin_for_direction(font : Pointer(Void), glyph : UInt32, direction : UInt32, x : Pointer(Int32), y : Pointer(Int32)) : Void
  fun hb_font_get_glyph_shape(font : Pointer(Void), glyph : UInt32, dfuncs : Pointer(Void), draw_data : Pointer(Void)) : Void
  fun hb_font_get_glyph_v_advance(font : Pointer(Void), glyph : UInt32) : Int32
  fun hb_font_get_glyph_v_advances(font : Pointer(Void), count : UInt32, first_glyph : Pointer(UInt32), glyph_stride : UInt32, first_advance : Pointer(Int32), advance_stride : Pointer(UInt32)) : Void
  fun hb_font_get_glyph_v_kerning(font : Pointer(Void), top_glyph : UInt32, bottom_glyph : UInt32) : Int32
  fun hb_font_get_glyph_v_origin(font : Pointer(Void), glyph : UInt32, x : Pointer(Int32), y : Pointer(Int32)) : Int32
  fun hb_font_get_h_extents(font : Pointer(Void), extents : Pointer(Void)) : Int32
  fun hb_font_get_nominal_glyph(font : Pointer(Void), unicode : UInt32, glyph : Pointer(UInt32)) : Int32
  fun hb_font_get_nominal_glyphs(font : Pointer(Void), count : UInt32, first_unicode : Pointer(UInt32), unicode_stride : UInt32, first_glyph : Pointer(UInt32), glyph_stride : UInt32) : UInt32
  fun hb_font_get_parent(font : Pointer(Void)) : Pointer(Void)
  fun hb_font_get_ppem(font : Pointer(Void), x_ppem : Pointer(UInt32), y_ppem : Pointer(UInt32)) : Void
  fun hb_font_get_ptem(font : Pointer(Void)) : Float32
  fun hb_font_get_scale(font : Pointer(Void), x_scale : Pointer(Int32), y_scale : Pointer(Int32)) : Void
  fun hb_font_get_synthetic_slant(font : Pointer(Void)) : Float32
  fun hb_font_get_v_extents(font : Pointer(Void), extents : Pointer(Void)) : Int32
  fun hb_font_get_var_coords_design(font : Pointer(Void), length : Pointer(UInt32)) : Pointer(Float32)
  fun hb_font_get_var_coords_normalized(font : Pointer(Void), length : Pointer(UInt32)) : Pointer(Int32)
  fun hb_font_get_variation_glyph(font : Pointer(Void), unicode : UInt32, variation_selector : UInt32, glyph : Pointer(UInt32)) : Int32
  fun hb_font_glyph_from_string(font : Pointer(Void), s : Pointer(UInt8), len : Int32, glyph : Pointer(UInt32)) : Int32
  fun hb_font_glyph_to_string(font : Pointer(Void), glyph : UInt32, s : Pointer(Pointer(Pointer(LibC::Char))), size : Pointer(UInt32)) : Void
  fun hb_font_is_immutable(font : Pointer(Void)) : Int32
  fun hb_font_make_immutable(font : Pointer(Void)) : Void
  fun hb_font_set_face(font : Pointer(Void), face : Pointer(Void)) : Void
  fun hb_font_set_funcs(font : Pointer(Void), klass : Pointer(Void), font_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_set_funcs_data(font : Pointer(Void), font_data : Pointer(Void), destroy : Void*) : Void
  fun hb_font_set_parent(font : Pointer(Void), parent : Pointer(Void)) : Void
  fun hb_font_set_ppem(font : Pointer(Void), x_ppem : UInt32, y_ppem : UInt32) : Void
  fun hb_font_set_ptem(font : Pointer(Void), ptem : Float32) : Void
  fun hb_font_set_scale(font : Pointer(Void), x_scale : Int32, y_scale : Int32) : Void
  fun hb_font_set_synthetic_slant(font : Pointer(Void), slant : Float32) : Void
  fun hb_font_set_var_coords_design(font : Pointer(Void), coords : Pointer(Float32), coords_length : UInt32) : Void
  fun hb_font_set_var_coords_normalized(font : Pointer(Void), coords : Pointer(Int32), coords_length : UInt32) : Void
  fun hb_font_set_var_named_instance(font : Pointer(Void), instance_index : UInt32) : Void
  fun hb_font_set_variations(font : Pointer(Void), variations : Pointer(Void), variations_length : UInt32) : Void
  fun hb_font_subtract_glyph_origin_for_direction(font : Pointer(Void), glyph : UInt32, direction : UInt32, x : Pointer(Int32), y : Pointer(Int32)) : Void
  fun hb_ft_font_changed(font : Pointer(Void)) : Void
  fun hb_ft_font_get_load_flags(font : Pointer(Void)) : Int32
  fun hb_ft_font_set_funcs(font : Pointer(Void)) : Void
  fun hb_ft_font_set_load_flags(font : Pointer(Void), load_flags : Int32) : Void
  fun hb_ft_font_unlock_face(font : Pointer(Void)) : Void
  fun hb_glib_blob_create(gbytes : Pointer(Void)) : Pointer(Void)
  fun hb_glib_get_unicode_funcs : Pointer(Void)
  fun hb_glib_script_from_script(script : UInt32) : Int32
  fun hb_glib_script_to_script(script : Int32) : UInt32
  fun hb_glyph_info_get_glyph_flags(info : Pointer(Void)) : UInt32
  fun hb_gobject_blob_get_type : UInt64
  fun hb_gobject_buffer_get_type : UInt64
  fun hb_gobject_draw_funcs_get_type : UInt64
  fun hb_gobject_face_get_type : UInt64
  fun hb_gobject_feature_get_type : UInt64
  fun hb_gobject_font_funcs_get_type : UInt64
  fun hb_gobject_font_get_type : UInt64
  fun hb_gobject_glyph_info_get_type : UInt64
  fun hb_gobject_glyph_position_get_type : UInt64
  fun hb_gobject_map_get_type : UInt64
  fun hb_gobject_ot_math_glyph_part_get_type : UInt64
  fun hb_gobject_ot_math_glyph_variant_get_type : UInt64
  fun hb_gobject_segment_properties_get_type : UInt64
  fun hb_gobject_set_get_type : UInt64
  fun hb_gobject_shape_plan_get_type : UInt64
  fun hb_gobject_unicode_funcs_get_type : UInt64
  fun hb_gobject_user_data_key_get_type : UInt64
  fun hb_language_from_string(str : Pointer(UInt8), len : Int32) : Pointer(Void)
  fun hb_language_get_default : Pointer(Void)
  fun hb_language_to_string(language : Pointer(Void)) : Pointer(LibC::Char)
  fun hb_language_to_string(this : Void*) : Pointer(LibC::Char)
  fun hb_map_allocation_successful(map : Pointer(Void)) : Int32
  fun hb_map_clear(map : Pointer(Void)) : Void
  fun hb_map_create : Pointer(Void)
  fun hb_map_del(map : Pointer(Void), key : UInt32) : Void
  fun hb_map_get(map : Pointer(Void), key : UInt32) : UInt32
  fun hb_map_get_empty : Pointer(Void)
  fun hb_map_get_population(map : Pointer(Void)) : UInt32
  fun hb_map_has(map : Pointer(Void), key : UInt32) : Int32
  fun hb_map_is_empty(map : Pointer(Void)) : Int32
  fun hb_map_set(map : Pointer(Void), key : UInt32, value : UInt32) : Void
  fun hb_ot_color_glyph_get_layers(face : Pointer(Void), glyph : UInt32, start_offset : UInt32, layer_count : Pointer(UInt32), layers : Pointer(Pointer(Void))) : UInt32
  fun hb_ot_color_glyph_reference_png(font : Pointer(Void), glyph : UInt32) : Pointer(Void)
  fun hb_ot_color_glyph_reference_svg(face : Pointer(Void), glyph : UInt32) : Pointer(Void)
  fun hb_ot_color_has_layers(face : Pointer(Void)) : Int32
  fun hb_ot_color_has_palettes(face : Pointer(Void)) : Int32
  fun hb_ot_color_has_png(face : Pointer(Void)) : Int32
  fun hb_ot_color_has_svg(face : Pointer(Void)) : Int32
  fun hb_ot_color_palette_color_get_name_id(face : Pointer(Void), color_index : UInt32) : UInt32
  fun hb_ot_color_palette_get_colors(face : Pointer(Void), palette_index : UInt32, start_offset : UInt32, color_count : Pointer(UInt32), colors : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_color_palette_get_count(face : Pointer(Void)) : UInt32
  fun hb_ot_color_palette_get_flags(face : Pointer(Void), palette_index : UInt32) : UInt32
  fun hb_ot_color_palette_get_name_id(face : Pointer(Void), palette_index : UInt32) : UInt32
  fun hb_ot_font_set_funcs(font : Pointer(Void)) : Void
  fun hb_ot_layout_collect_features(face : Pointer(Void), table_tag : UInt32, scripts : Pointer(UInt32), languages : Pointer(UInt32), features : Pointer(UInt32), feature_indexes : Pointer(Void)) : Void
  fun hb_ot_layout_collect_lookups(face : Pointer(Void), table_tag : UInt32, scripts : Pointer(UInt32), languages : Pointer(UInt32), features : Pointer(UInt32), lookup_indexes : Pointer(Void)) : Void
  fun hb_ot_layout_feature_get_characters(face : Pointer(Void), table_tag : UInt32, feature_index : UInt32, start_offset : UInt32, char_count : Pointer(UInt32), characters : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_layout_feature_get_lookups(face : Pointer(Void), table_tag : UInt32, feature_index : UInt32, start_offset : UInt32, lookup_count : Pointer(UInt32), lookup_indexes : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_layout_feature_get_name_ids(face : Pointer(Void), table_tag : UInt32, feature_index : UInt32, label_id : Pointer(UInt32), tooltip_id : Pointer(UInt32), sample_id : Pointer(UInt32), num_named_parameters : Pointer(UInt32), first_param_id : Pointer(UInt32)) : Int32
  fun hb_ot_layout_feature_with_variations_get_lookups(face : Pointer(Void), table_tag : UInt32, feature_index : UInt32, variations_index : UInt32, start_offset : UInt32, lookup_count : Pointer(UInt32), lookup_indexes : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_layout_get_attach_points(face : Pointer(Void), glyph : UInt32, start_offset : UInt32, point_count : Pointer(UInt32), point_array : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_layout_get_baseline(font : Pointer(Void), baseline_tag : UInt32, direction : UInt32, script_tag : UInt32, language_tag : UInt32, coord : Pointer(Int32)) : Int32
  fun hb_ot_layout_get_baseline_with_fallback(font : Pointer(Void), baseline_tag : UInt32, direction : UInt32, script_tag : UInt32, language_tag : UInt32, coord : Pointer(Int32)) : Void
  fun hb_ot_layout_get_glyph_class(face : Pointer(Void), glyph : UInt32) : UInt32
  fun hb_ot_layout_get_glyphs_in_class(face : Pointer(Void), klass : UInt32, glyphs : Pointer(Void)) : Void
  fun hb_ot_layout_get_horizontal_baseline_tag_for_script(script : UInt32) : UInt32
  fun hb_ot_layout_get_ligature_carets(font : Pointer(Void), direction : UInt32, glyph : UInt32, start_offset : UInt32, caret_count : Pointer(UInt32), caret_array : Pointer(Pointer(Int32))) : UInt32
  fun hb_ot_layout_get_size_params(face : Pointer(Void), design_size : Pointer(UInt32), subfamily_id : Pointer(UInt32), subfamily_name_id : Pointer(UInt32), range_start : Pointer(UInt32), range_end : Pointer(UInt32)) : Int32
  fun hb_ot_layout_has_glyph_classes(face : Pointer(Void)) : Int32
  fun hb_ot_layout_has_positioning(face : Pointer(Void)) : Int32
  fun hb_ot_layout_has_substitution(face : Pointer(Void)) : Int32
  fun hb_ot_layout_language_find_feature(face : Pointer(Void), table_tag : UInt32, script_index : UInt32, language_index : UInt32, feature_tag : UInt32, feature_index : Pointer(UInt32)) : Int32
  fun hb_ot_layout_language_get_feature_indexes(face : Pointer(Void), table_tag : UInt32, script_index : UInt32, language_index : UInt32, start_offset : UInt32, feature_count : Pointer(UInt32), feature_indexes : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_layout_language_get_feature_tags(face : Pointer(Void), table_tag : UInt32, script_index : UInt32, language_index : UInt32, start_offset : UInt32, feature_count : Pointer(UInt32), feature_tags : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_layout_language_get_required_feature(face : Pointer(Void), table_tag : UInt32, script_index : UInt32, language_index : UInt32, feature_index : Pointer(UInt32), feature_tag : Pointer(UInt32)) : Int32
  fun hb_ot_layout_language_get_required_feature_index(face : Pointer(Void), table_tag : UInt32, script_index : UInt32, language_index : UInt32, feature_index : Pointer(UInt32)) : Int32
  fun hb_ot_layout_lookup_collect_glyphs(face : Pointer(Void), table_tag : UInt32, lookup_index : UInt32, glyphs_before : Pointer(Void), glyphs_input : Pointer(Void), glyphs_after : Pointer(Void), glyphs_output : Pointer(Void)) : Void
  fun hb_ot_layout_lookup_get_glyph_alternates(face : Pointer(Void), lookup_index : UInt32, glyph : UInt32, start_offset : UInt32, alternate_count : Pointer(UInt32), alternate_glyphs : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_layout_lookup_substitute_closure(face : Pointer(Void), lookup_index : UInt32, glyphs : Pointer(Void)) : Void
  fun hb_ot_layout_lookup_would_substitute(face : Pointer(Void), lookup_index : UInt32, glyphs : Pointer(UInt32), glyphs_length : UInt32, zero_context : Int32) : Int32
  fun hb_ot_layout_lookups_substitute_closure(face : Pointer(Void), lookups : Pointer(Void), glyphs : Pointer(Void)) : Void
  fun hb_ot_layout_script_find_language(face : Pointer(Void), table_tag : UInt32, script_index : UInt32, language_tag : UInt32, language_index : Pointer(UInt32)) : Int32
  fun hb_ot_layout_script_get_language_tags(face : Pointer(Void), table_tag : UInt32, script_index : UInt32, start_offset : UInt32, language_count : Pointer(UInt32), language_tags : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_layout_script_select_language(face : Pointer(Void), table_tag : UInt32, script_index : UInt32, language_count : UInt32, language_tags : Pointer(UInt32), language_index : Pointer(UInt32)) : Int32
  fun hb_ot_layout_table_choose_script(face : Pointer(Void), table_tag : UInt32, script_tags : Pointer(UInt32), script_index : Pointer(UInt32), chosen_script : Pointer(UInt32)) : Int32
  fun hb_ot_layout_table_find_feature_variations(face : Pointer(Void), table_tag : UInt32, coords : Pointer(Int32), num_coords : UInt32, variations_index : Pointer(UInt32)) : Int32
  fun hb_ot_layout_table_find_script(face : Pointer(Void), table_tag : UInt32, script_tag : UInt32, script_index : Pointer(UInt32)) : Int32
  fun hb_ot_layout_table_get_feature_tags(face : Pointer(Void), table_tag : UInt32, start_offset : UInt32, feature_count : Pointer(UInt32), feature_tags : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_layout_table_get_lookup_count(face : Pointer(Void), table_tag : UInt32) : UInt32
  fun hb_ot_layout_table_get_script_tags(face : Pointer(Void), table_tag : UInt32, start_offset : UInt32, script_count : Pointer(UInt32), script_tags : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_layout_table_select_script(face : Pointer(Void), table_tag : UInt32, script_count : UInt32, script_tags : Pointer(UInt32), script_index : Pointer(UInt32), chosen_script : Pointer(UInt32)) : Int32
  fun hb_ot_math_get_constant(font : Pointer(Void), constant : UInt32) : Int32
  fun hb_ot_math_get_glyph_assembly(font : Pointer(Void), glyph : UInt32, direction : UInt32, start_offset : UInt32, parts_count : Pointer(UInt32), parts : Pointer(Pointer(Void)), italics_correction : Pointer(Int32)) : UInt32
  fun hb_ot_math_get_glyph_italics_correction(font : Pointer(Void), glyph : UInt32) : Int32
  fun hb_ot_math_get_glyph_kerning(font : Pointer(Void), glyph : UInt32, kern : UInt32, correction_height : Int32) : Int32
  fun hb_ot_math_get_glyph_kernings(font : Pointer(Void), glyph : UInt32, kern : UInt32, start_offset : UInt32, entries_count : Pointer(UInt32), kern_entries : Pointer(Pointer(Void))) : UInt32
  fun hb_ot_math_get_glyph_top_accent_attachment(font : Pointer(Void), glyph : UInt32) : Int32
  fun hb_ot_math_get_glyph_variants(font : Pointer(Void), glyph : UInt32, direction : UInt32, start_offset : UInt32, variants_count : Pointer(UInt32), variants : Pointer(Pointer(Void))) : UInt32
  fun hb_ot_math_get_min_connector_overlap(font : Pointer(Void), direction : UInt32) : Int32
  fun hb_ot_math_has_data(face : Pointer(Void)) : Int32
  fun hb_ot_math_is_glyph_extended_shape(face : Pointer(Void), glyph : UInt32) : Int32
  fun hb_ot_meta_get_entry_tags(face : Pointer(Void), start_offset : UInt32, entries_count : Pointer(UInt32), entries : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_meta_reference_entry(face : Pointer(Void), meta_tag : UInt32) : Pointer(Void)
  fun hb_ot_metrics_get_position(font : Pointer(Void), metrics_tag : UInt32, position : Pointer(Int32)) : Int32
  fun hb_ot_metrics_get_position_with_fallback(font : Pointer(Void), metrics_tag : UInt32, position : Pointer(Int32)) : Void
  fun hb_ot_metrics_get_variation(font : Pointer(Void), metrics_tag : UInt32) : Float32
  fun hb_ot_metrics_get_x_variation(font : Pointer(Void), metrics_tag : UInt32) : Int32
  fun hb_ot_metrics_get_y_variation(font : Pointer(Void), metrics_tag : UInt32) : Int32
  fun hb_ot_name_get_utf16(face : Pointer(Void), name_id : UInt32, language : Pointer(Void), text_size : Pointer(UInt32), text : Pointer(Pointer(UInt16))) : UInt32
  fun hb_ot_name_get_utf32(face : Pointer(Void), name_id : UInt32, language : Pointer(Void), text_size : Pointer(UInt32), text : Pointer(Pointer(UInt32))) : UInt32
  fun hb_ot_name_get_utf8(face : Pointer(Void), name_id : UInt32, language : Pointer(Void), text_size : Pointer(UInt32), text : Pointer(Pointer(Pointer(LibC::Char)))) : UInt32
  fun hb_ot_name_list_names(face : Pointer(Void), num_entries : Pointer(UInt32)) : Pointer(Void)
  fun hb_ot_shape_glyphs_closure(font : Pointer(Void), buffer : Pointer(Void), features : Pointer(Void), num_features : UInt32, glyphs : Pointer(Void)) : Void
  fun hb_ot_shape_plan_collect_lookups(shape_plan : Pointer(Void), table_tag : UInt32, lookup_indexes : Pointer(Void)) : Void
  fun hb_ot_tag_from_language(language : Pointer(Void)) : UInt32
  fun hb_ot_tag_to_language(tag : UInt32) : Pointer(Void)
  fun hb_ot_tag_to_script(tag : UInt32) : UInt32
  fun hb_ot_tags_from_script(script : UInt32, script_tag_1 : Pointer(UInt32), script_tag_2 : Pointer(UInt32)) : Void
  fun hb_ot_tags_from_script_and_language(script : UInt32, language : Pointer(Void), script_count : Pointer(UInt32), script_tags : Pointer(UInt32), language_count : Pointer(UInt32), language_tags : Pointer(UInt32)) : Void
  fun hb_ot_tags_to_script_and_language(script_tag : UInt32, language_tag : UInt32, script : Pointer(UInt32), language : Pointer(Pointer(Void))) : Void
  fun hb_ot_var_find_axis(face : Pointer(Void), axis_tag : UInt32, axis_index : Pointer(UInt32), axis_info : Pointer(Void)) : Int32
  fun hb_ot_var_find_axis_info(face : Pointer(Void), axis_tag : UInt32, axis_info : Pointer(Void)) : Int32
  fun hb_ot_var_get_axes(face : Pointer(Void), start_offset : UInt32, axes_count : Pointer(UInt32), axes_array : Pointer(Pointer(Void))) : UInt32
  fun hb_ot_var_get_axis_count(face : Pointer(Void)) : UInt32
  fun hb_ot_var_get_axis_infos(face : Pointer(Void), start_offset : UInt32, axes_count : Pointer(UInt32), axes_array : Pointer(Pointer(Void))) : UInt32
  fun hb_ot_var_get_named_instance_count(face : Pointer(Void)) : UInt32
  fun hb_ot_var_has_data(face : Pointer(Void)) : Int32
  fun hb_ot_var_named_instance_get_design_coords(face : Pointer(Void), instance_index : UInt32, coords_length : Pointer(UInt32), coords : Pointer(Pointer(Float32))) : UInt32
  fun hb_ot_var_named_instance_get_postscript_name_id(face : Pointer(Void), instance_index : UInt32) : UInt32
  fun hb_ot_var_named_instance_get_subfamily_name_id(face : Pointer(Void), instance_index : UInt32) : UInt32
  fun hb_ot_var_normalize_coords(face : Pointer(Void), coords_length : UInt32, design_coords : Pointer(Float32), normalized_coords : Pointer(Int32)) : Void
  fun hb_ot_var_normalize_variations(face : Pointer(Void), variations : Pointer(Void), variations_length : UInt32, coords : Pointer(Pointer(Int32)), coords_length : Pointer(UInt32)) : Void
  fun hb_script_from_iso15924_tag(tag : UInt32) : UInt32
  fun hb_script_from_string(str : Pointer(UInt8), len : Int32) : UInt32
  fun hb_script_get_horizontal_direction(script : UInt32) : UInt32
  fun hb_script_to_iso15924_tag(script : UInt32) : UInt32
  fun hb_segment_properties_equal(a : Pointer(Void), b : Pointer(Void)) : Int32
  fun hb_segment_properties_hash(p : Pointer(Void)) : UInt32
  fun hb_segment_properties_overlay(p : Pointer(Void), src : Pointer(Void)) : Void
  fun hb_set_add(set : Pointer(Void), codepoint : UInt32) : Void
  fun hb_set_add_range(set : Pointer(Void), first : UInt32, last : UInt32) : Void
  fun hb_set_add_sorted_array(set : Pointer(Void), sorted_codepoints : Pointer(UInt32), num_codepoints : UInt32) : Void
  fun hb_set_allocation_successful(set : Pointer(Void)) : Int32
  fun hb_set_clear(set : Pointer(Void)) : Void
  fun hb_set_copy(set : Pointer(Void)) : Pointer(Void)
  fun hb_set_create : Pointer(Void)
  fun hb_set_del(set : Pointer(Void), codepoint : UInt32) : Void
  fun hb_set_del_range(set : Pointer(Void), first : UInt32, last : UInt32) : Void
  fun hb_set_get_empty : Pointer(Void)
  fun hb_set_get_max(set : Pointer(Void)) : UInt32
  fun hb_set_get_min(set : Pointer(Void)) : UInt32
  fun hb_set_get_population(set : Pointer(Void)) : UInt32
  fun hb_set_has(set : Pointer(Void), codepoint : UInt32) : Int32
  fun hb_set_intersect(set : Pointer(Void), other : Pointer(Void)) : Void
  fun hb_set_invert(set : Pointer(Void)) : Void
  fun hb_set_is_empty(set : Pointer(Void)) : Int32
  fun hb_set_is_equal(set : Pointer(Void), other : Pointer(Void)) : Int32
  fun hb_set_is_subset(set : Pointer(Void), larger_set : Pointer(Void)) : Int32
  fun hb_set_next(set : Pointer(Void), codepoint : Pointer(UInt32)) : Int32
  fun hb_set_next_many(set : Pointer(Void), codepoint : UInt32, _out : Pointer(UInt32), size : UInt32) : UInt32
  fun hb_set_next_range(set : Pointer(Void), first : Pointer(UInt32), last : Pointer(UInt32)) : Int32
  fun hb_set_previous(set : Pointer(Void), codepoint : Pointer(UInt32)) : Int32
  fun hb_set_previous_range(set : Pointer(Void), first : Pointer(UInt32), last : Pointer(UInt32)) : Int32
  fun hb_set_set(set : Pointer(Void), other : Pointer(Void)) : Void
  fun hb_set_subtract(set : Pointer(Void), other : Pointer(Void)) : Void
  fun hb_set_symmetric_difference(set : Pointer(Void), other : Pointer(Void)) : Void
  fun hb_set_union(set : Pointer(Void), other : Pointer(Void)) : Void
  fun hb_shape(font : Pointer(Void), buffer : Pointer(Void), features : Pointer(Void), num_features : UInt32) : Void
  fun hb_shape_full(font : Pointer(Void), buffer : Pointer(Void), features : Pointer(Void), num_features : UInt32, shaper_list : Pointer(Pointer(LibC::Char))) : Int32
  fun hb_shape_list_shapers : Pointer(Pointer(LibC::Char))
  fun hb_shape_plan_create(face : Pointer(Void), props : Pointer(Void), user_features : Pointer(Void), num_user_features : UInt32, shaper_list : Pointer(Pointer(LibC::Char))) : Pointer(Void)
  fun hb_shape_plan_create2(face : Pointer(Void), props : Pointer(Void), user_features : Pointer(Void), num_user_features : UInt32, coords : Pointer(Int32), num_coords : UInt32, shaper_list : Pointer(Pointer(LibC::Char))) : Pointer(Void)
  fun hb_shape_plan_create_cached(face : Pointer(Void), props : Pointer(Void), user_features : Pointer(Void), num_user_features : UInt32, shaper_list : Pointer(Pointer(LibC::Char))) : Pointer(Void)
  fun hb_shape_plan_create_cached2(face : Pointer(Void), props : Pointer(Void), user_features : Pointer(Void), num_user_features : UInt32, coords : Pointer(Int32), num_coords : UInt32, shaper_list : Pointer(Pointer(LibC::Char))) : Pointer(Void)
  fun hb_shape_plan_execute(shape_plan : Pointer(Void), font : Pointer(Void), buffer : Pointer(Void), features : Pointer(Void), num_features : UInt32) : Int32
  fun hb_shape_plan_get_empty : Pointer(Void)
  fun hb_shape_plan_get_shaper(shape_plan : Pointer(Void)) : Pointer(LibC::Char)
  fun hb_style_get_value(font : Pointer(Void), style_tag : UInt32) : Float32
  fun hb_tag_from_string(str : Pointer(UInt8), len : Int32) : UInt32
  fun hb_tag_to_string(tag : UInt32, buf : Pointer(Pointer(UInt8))) : Void
  fun hb_unicode_combining_class(ufuncs : Pointer(Void), unicode : UInt32) : UInt32
  fun hb_unicode_compose(ufuncs : Pointer(Void), a : UInt32, b : UInt32, ab : Pointer(UInt32)) : Int32
  fun hb_unicode_decompose(ufuncs : Pointer(Void), ab : UInt32, a : Pointer(UInt32), b : Pointer(UInt32)) : Int32
  fun hb_unicode_decompose_compatibility(ufuncs : Pointer(Void), u : UInt32, decomposed : Pointer(UInt32)) : UInt32
  fun hb_unicode_eastasian_width(ufuncs : Pointer(Void), unicode : UInt32) : UInt32
  fun hb_unicode_funcs_create(parent : Pointer(Void)) : Pointer(Void)
  fun hb_unicode_funcs_get_default : Pointer(Void)
  fun hb_unicode_funcs_get_empty : Pointer(Void)
  fun hb_unicode_funcs_get_parent(ufuncs : Pointer(Void)) : Pointer(Void)
  fun hb_unicode_funcs_is_immutable(ufuncs : Pointer(Void)) : Int32
  fun hb_unicode_funcs_make_immutable(ufuncs : Pointer(Void)) : Void
  fun hb_unicode_funcs_set_combining_class_func(ufuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_unicode_funcs_set_compose_func(ufuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_unicode_funcs_set_decompose_compatibility_func(ufuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_unicode_funcs_set_decompose_func(ufuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_unicode_funcs_set_eastasian_width_func(ufuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_unicode_funcs_set_general_category_func(ufuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_unicode_funcs_set_mirroring_func(ufuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_unicode_funcs_set_script_func(ufuncs : Pointer(Void), func : Void*, user_data : Pointer(Void), destroy : Void*) : Void
  fun hb_unicode_general_category(ufuncs : Pointer(Void), unicode : UInt32) : UInt32
  fun hb_unicode_mirroring(ufuncs : Pointer(Void), unicode : UInt32) : UInt32
  fun hb_unicode_script(ufuncs : Pointer(Void), unicode : UInt32) : UInt32
  fun hb_variation_from_string(str : Pointer(UInt8), len : Int32, variation : Pointer(Void)) : Int32
  fun hb_variation_to_string(this : Void*, buf : Pointer(Pointer(Pointer(LibC::Char))), size : Pointer(UInt32)) : Void
  fun hb_variation_to_string(variation : Pointer(Void), buf : Pointer(Pointer(Pointer(LibC::Char))), size : Pointer(UInt32)) : Void
end
