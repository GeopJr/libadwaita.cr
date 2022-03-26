@[Link("gdk_pixbuf-2.0", pkg_config: "gdk_pixbuf-2.0")]

lib LibGdkPixbuf
  # Flags
  type PixbufFormatFlags = UInt32

  # Enums
  type Colorspace = UInt32
  type InterpType = UInt32
  type PixbufAlphaMode = UInt32
  type PixbufError = UInt32
  type PixbufRotation = UInt32

  # Callbacks
  alias PixbufDestroyNotify = Pointer(UInt8), Pointer(Void) -> Void
  alias PixbufModuleFillInfoFunc = Pointer(LibGdkPixbuf::PixbufFormat) -> Void
  alias PixbufModuleFillVtableFunc = Pointer(LibGdkPixbuf::PixbufModule) -> Void
  alias PixbufModuleIncrementLoadFunc = Pointer(Void), Pointer(UInt8), UInt32 -> LibC::Int
  alias PixbufModuleLoadAnimationFunc = Pointer(Void) -> Pointer(LibGdkPixbuf::PixbufAnimation)
  alias PixbufModuleLoadFunc = Pointer(Void) -> Pointer(LibGdkPixbuf::Pixbuf)
  alias PixbufModuleLoadXpmDataFunc = Pointer(Pointer(LibC::Char)) -> Pointer(LibGdkPixbuf::Pixbuf)
  alias PixbufModulePreparedFunc = Pointer(LibGdkPixbuf::Pixbuf), Pointer(LibGdkPixbuf::PixbufAnimation), Pointer(Void) -> Void
  alias PixbufModuleSaveFunc = Pointer(Void), Pointer(LibGdkPixbuf::Pixbuf), Pointer(Pointer(LibC::Char)), Pointer(Pointer(LibC::Char)) -> LibC::Int
  alias PixbufModuleSaveOptionSupportedFunc = Pointer(LibC::Char) -> LibC::Int
  alias PixbufModuleSizeFunc = Pointer(Int32), Pointer(Int32), Pointer(Void) -> Void
  alias PixbufModuleStopLoadFunc = Pointer(Void) -> LibC::Int
  alias PixbufModuleUpdatedFunc = Pointer(LibGdkPixbuf::Pixbuf), Int32, Int32, Int32, Int32, Pointer(Void) -> Void
  alias PixbufSaveFunc = Pointer(UInt8), UInt64, Pointer(Void), Pointer(Void) -> LibC::Int

  # Interface types

  # Structs

  struct PixbufFormat # 64 bytes long
    name : Pointer(LibC::Char)
    signature : Pointer(LibGdkPixbuf::PixbufModulePattern)
    domain : Pointer(LibC::Char)
    description : Pointer(LibC::Char)
    mime_types : Pointer(Pointer(LibC::Char))
    extensions : Pointer(Pointer(LibC::Char))
    flags : UInt32
    disabled : LibC::Int
    license : Pointer(LibC::Char)
  end

  struct PixbufModule # 136 bytes long
    module_name : Pointer(LibC::Char)
    module_path : Pointer(LibC::Char)
    _module : Pointer(LibGModule::Module)
    info : Pointer(LibGdkPixbuf::PixbufFormat)
    load : LibGdkPixbuf::PixbufModuleLoadFunc
    load_xpm_data : LibGdkPixbuf::PixbufModuleLoadXpmDataFunc
    begin_load : Pointer(Void)
    stop_load : LibGdkPixbuf::PixbufModuleStopLoadFunc
    load_increment : LibGdkPixbuf::PixbufModuleIncrementLoadFunc
    load_animation : LibGdkPixbuf::PixbufModuleLoadAnimationFunc
    save : LibGdkPixbuf::PixbufModuleSaveFunc
    save_to_callback : Pointer(Void)
    is_save_option_supported : LibGdkPixbuf::PixbufModuleSaveOptionSupportedFunc
    _reserved1 : Pointer(Void)
    _reserved2 : Pointer(Void)
    _reserved3 : Pointer(Void)
    _reserved4 : Pointer(Void)
  end

  struct PixbufModulePattern # 24 bytes long
    prefix : Pointer(LibC::Char)
    mask : Pointer(LibC::Char)
    relevance : Int32
  end

  # Unions

  # Objects
  type Pixbuf = Void # Object struct with no fields

  struct PixbufAnimation
    parent_instance : LibGObject::Object
  end

  struct PixbufAnimationIter
    parent_instance : LibGObject::Object
  end

  struct PixbufLoader
    parent_instance : LibGObject::Object
    priv : Pointer(Void)
  end

  type PixbufNonAnim = Void # Object struct with no fields

  type PixbufSimpleAnim = Void # Object struct with no fields

  type PixbufSimpleAnimIter = Void # Object struct with no fields

  # All C Functions
  fun gdk_pixbuf_add_alpha(this : Void*, substitute_color : LibC::Int, r : UInt8, g : UInt8, b : UInt8) : Pointer(Void)
  fun gdk_pixbuf_animation_get_height(this : Void*) : Int32
  fun gdk_pixbuf_animation_get_iter(this : Void*, start_time : Pointer(Void)) : Pointer(Void)
  fun gdk_pixbuf_animation_get_static_image(this : Void*) : Pointer(Void)
  fun gdk_pixbuf_animation_get_type : UInt64
  fun gdk_pixbuf_animation_get_width(this : Void*) : Int32
  fun gdk_pixbuf_animation_is_static_image(this : Void*) : LibC::Int
  fun gdk_pixbuf_animation_iter_advance(this : Void*, current_time : Pointer(Void)) : LibC::Int
  fun gdk_pixbuf_animation_iter_get_delay_time(this : Void*) : Int32
  fun gdk_pixbuf_animation_iter_get_pixbuf(this : Void*) : Pointer(Void)
  fun gdk_pixbuf_animation_iter_get_type : UInt64
  fun gdk_pixbuf_animation_iter_on_currently_loading_frame(this : Void*) : LibC::Int
  fun gdk_pixbuf_animation_new_from_file(filename : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_animation_new_from_resource(resource_path : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_animation_new_from_stream(stream : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_animation_new_from_stream_async(stream : Pointer(Void), cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_pixbuf_animation_new_from_stream_finish(async_result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_apply_embedded_orientation(this : Void*) : Pointer(Void)
  fun gdk_pixbuf_calculate_rowstride(colorspace : UInt32, has_alpha : LibC::Int, bits_per_sample : Int32, width : Int32, height : Int32) : Int32
  fun gdk_pixbuf_composite(this : Void*, dest : Pointer(Void), dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : UInt32, overall_alpha : Int32) : Void
  fun gdk_pixbuf_composite_color(this : Void*, dest : Pointer(Void), dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : UInt32, overall_alpha : Int32, check_x : Int32, check_y : Int32, check_size : Int32, color1 : UInt32, color2 : UInt32) : Void
  fun gdk_pixbuf_composite_color_simple(this : Void*, dest_width : Int32, dest_height : Int32, interp_type : UInt32, overall_alpha : Int32, check_size : Int32, color1 : UInt32, color2 : UInt32) : Pointer(Void)
  fun gdk_pixbuf_copy(this : Void*) : Pointer(Void)
  fun gdk_pixbuf_copy_area(this : Void*, src_x : Int32, src_y : Int32, width : Int32, height : Int32, dest_pixbuf : Pointer(Void), dest_x : Int32, dest_y : Int32) : Void
  fun gdk_pixbuf_copy_options(this : Void*, dest_pixbuf : Pointer(Void)) : LibC::Int
  fun gdk_pixbuf_error_quark : UInt32
  fun gdk_pixbuf_fill(this : Void*, pixel : UInt32) : Void
  fun gdk_pixbuf_flip(this : Void*, horizontal : LibC::Int) : Pointer(Void)
  fun gdk_pixbuf_format_copy(this : Void*) : Pointer(Void)
  fun gdk_pixbuf_format_free(this : Void*) : Void
  fun gdk_pixbuf_format_get_description(this : Void*) : Pointer(LibC::Char)
  fun gdk_pixbuf_format_get_extensions(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gdk_pixbuf_format_get_license(this : Void*) : Pointer(LibC::Char)
  fun gdk_pixbuf_format_get_mime_types(this : Void*) : Pointer(Pointer(LibC::Char))
  fun gdk_pixbuf_format_get_name(this : Void*) : Pointer(LibC::Char)
  fun gdk_pixbuf_format_get_type : UInt64
  fun gdk_pixbuf_format_is_disabled(this : Void*) : LibC::Int
  fun gdk_pixbuf_format_is_save_option_supported(this : Void*, option_key : Pointer(LibC::Char)) : LibC::Int
  fun gdk_pixbuf_format_is_scalable(this : Void*) : LibC::Int
  fun gdk_pixbuf_format_is_writable(this : Void*) : LibC::Int
  fun gdk_pixbuf_format_set_disabled(this : Void*, disabled : LibC::Int) : Void
  fun gdk_pixbuf_get_bits_per_sample(this : Void*) : Int32
  fun gdk_pixbuf_get_byte_length(this : Void*) : UInt64
  fun gdk_pixbuf_get_colorspace(this : Void*) : UInt32
  fun gdk_pixbuf_get_file_info(filename : Pointer(LibC::Char), width : Pointer(Int32), height : Pointer(Int32)) : Pointer(Void)
  fun gdk_pixbuf_get_file_info_async(filename : Pointer(LibC::Char), cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_pixbuf_get_file_info_finish(async_result : Pointer(Void), width : Pointer(Int32), height : Pointer(Int32), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_get_formats : Pointer(LibGLib::SList)
  fun gdk_pixbuf_get_has_alpha(this : Void*) : LibC::Int
  fun gdk_pixbuf_get_height(this : Void*) : Int32
  fun gdk_pixbuf_get_n_channels(this : Void*) : Int32
  fun gdk_pixbuf_get_option(this : Void*, key : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun gdk_pixbuf_get_options(this : Void*) : Pointer(Void)
  fun gdk_pixbuf_get_pixels_with_length(this : Void*, length : Pointer(UInt32)) : Pointer(UInt8)
  fun gdk_pixbuf_get_rowstride(this : Void*) : Int32
  fun gdk_pixbuf_get_type : UInt64
  fun gdk_pixbuf_get_width(this : Void*) : Int32
  fun gdk_pixbuf_init_modules(path : Pointer(LibC::Char), error : LibGLib::Error**) : LibC::Int
  fun gdk_pixbuf_loader_close(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun gdk_pixbuf_loader_get_animation(this : Void*) : Pointer(Void)
  fun gdk_pixbuf_loader_get_format(this : Void*) : Pointer(Void)
  fun gdk_pixbuf_loader_get_pixbuf(this : Void*) : Pointer(Void)
  fun gdk_pixbuf_loader_get_type : UInt64
  fun gdk_pixbuf_loader_new : Pointer(Void)
  fun gdk_pixbuf_loader_new_with_mime_type(mime_type : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_loader_new_with_type(image_type : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_loader_set_size(this : Void*, width : Int32, height : Int32) : Void
  fun gdk_pixbuf_loader_write(this : Void*, buf : Pointer(UInt8), count : UInt64, error : LibGLib::Error**) : LibC::Int
  fun gdk_pixbuf_loader_write_bytes(this : Void*, buffer : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gdk_pixbuf_new(colorspace : UInt32, has_alpha : LibC::Int, bits_per_sample : Int32, width : Int32, height : Int32) : Pointer(Void)
  fun gdk_pixbuf_new_from_bytes(data : Pointer(Void), colorspace : UInt32, has_alpha : LibC::Int, bits_per_sample : Int32, width : Int32, height : Int32, rowstride : Int32) : Pointer(Void)
  fun gdk_pixbuf_new_from_data(data : Pointer(UInt8), colorspace : UInt32, has_alpha : LibC::Int, bits_per_sample : Int32, width : Int32, height : Int32, rowstride : Int32, destroy_fn : PixbufDestroyNotify, destroy_fn_data : Pointer(Void)) : Pointer(Void)
  fun gdk_pixbuf_new_from_file(filename : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_new_from_file_at_scale(filename : Pointer(LibC::Char), width : Int32, height : Int32, preserve_aspect_ratio : LibC::Int, error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_new_from_file_at_size(filename : Pointer(LibC::Char), width : Int32, height : Int32, error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_new_from_inline(data_length : Int32, data : Pointer(UInt8), copy_pixels : LibC::Int, error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_new_from_resource(resource_path : Pointer(LibC::Char), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_new_from_resource_at_scale(resource_path : Pointer(LibC::Char), width : Int32, height : Int32, preserve_aspect_ratio : LibC::Int, error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_new_from_stream(stream : Pointer(Void), cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_new_from_stream_async(stream : Pointer(Void), cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_pixbuf_new_from_stream_at_scale(stream : Pointer(Void), width : Int32, height : Int32, preserve_aspect_ratio : LibC::Int, cancellable : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_new_from_stream_at_scale_async(stream : Pointer(Void), width : Int32, height : Int32, preserve_aspect_ratio : LibC::Int, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_pixbuf_new_from_stream_finish(async_result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_pixbuf_new_from_xpm_data(data : Pointer(Pointer(LibC::Char))) : Pointer(Void)
  fun gdk_pixbuf_new_subpixbuf(this : Void*, src_x : Int32, src_y : Int32, width : Int32, height : Int32) : Pointer(Void)
  fun gdk_pixbuf_non_anim_get_type : UInt64
  fun gdk_pixbuf_non_anim_new(pixbuf : Pointer(Void)) : Pointer(Void)
  fun gdk_pixbuf_read_pixel_bytes(this : Void*) : Pointer(Void)
  fun gdk_pixbuf_read_pixels(this : Void*) : Pointer(UInt8)
  fun gdk_pixbuf_remove_option(this : Void*, key : Pointer(LibC::Char)) : LibC::Int
  fun gdk_pixbuf_rotate_simple(this : Void*, angle : UInt32) : Pointer(Void)
  fun gdk_pixbuf_saturate_and_pixelate(this : Void*, dest : Pointer(Void), saturation : Float32, pixelate : LibC::Int) : Void
  fun gdk_pixbuf_save_to_bufferv(this : Void*, buffer : Pointer(Pointer(UInt8)), buffer_size : Pointer(UInt64), type : Pointer(LibC::Char), option_keys : Pointer(Pointer(LibC::Char)), option_values : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun gdk_pixbuf_save_to_callbackv(this : Void*, save_func : PixbufSaveFunc, user_data : Pointer(Void), type : Pointer(LibC::Char), option_keys : Pointer(Pointer(LibC::Char)), option_values : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun gdk_pixbuf_save_to_stream_finish(async_result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gdk_pixbuf_save_to_streamv(this : Void*, stream : Pointer(Void), type : Pointer(LibC::Char), option_keys : Pointer(Pointer(LibC::Char)), option_values : Pointer(Pointer(LibC::Char)), cancellable : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gdk_pixbuf_save_to_streamv_async(this : Void*, stream : Pointer(Void), type : Pointer(LibC::Char), option_keys : Pointer(Pointer(LibC::Char)), option_values : Pointer(Pointer(LibC::Char)), cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_pixbuf_savev(this : Void*, filename : Pointer(LibC::Char), type : Pointer(LibC::Char), option_keys : Pointer(Pointer(LibC::Char)), option_values : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : LibC::Int
  fun gdk_pixbuf_scale(this : Void*, dest : Pointer(Void), dest_x : Int32, dest_y : Int32, dest_width : Int32, dest_height : Int32, offset_x : Float64, offset_y : Float64, scale_x : Float64, scale_y : Float64, interp_type : UInt32) : Void
  fun gdk_pixbuf_scale_simple(this : Void*, dest_width : Int32, dest_height : Int32, interp_type : UInt32) : Pointer(Void)
  fun gdk_pixbuf_set_option(this : Void*, key : Pointer(LibC::Char), value : Pointer(LibC::Char)) : LibC::Int
  fun gdk_pixbuf_simple_anim_add_frame(this : Void*, pixbuf : Pointer(Void)) : Void
  fun gdk_pixbuf_simple_anim_get_loop(this : Void*) : LibC::Int
  fun gdk_pixbuf_simple_anim_get_type : UInt64
  fun gdk_pixbuf_simple_anim_iter_get_type : UInt64
  fun gdk_pixbuf_simple_anim_new(width : Int32, height : Int32, rate : Float32) : Pointer(Void)
  fun gdk_pixbuf_simple_anim_set_loop(this : Void*, loop : LibC::Int) : Void
end
