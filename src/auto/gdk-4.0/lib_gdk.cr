@[Link("gtk-4", pkg_config: "gtk-4")]

lib LibGdk
  # Flags
  type AnchorHints = UInt32
  type AxisFlags = UInt32
  type DragAction = UInt32
  type FrameClockPhase = UInt32
  type ModifierType = UInt32
  type PaintableFlags = UInt32
  type SeatCapabilities = UInt32
  type ToplevelState = UInt32

  # Enums
  type AxisUse = UInt32
  type CrossingMode = UInt32
  type DevicePadFeature = UInt32
  type DeviceToolType = UInt32
  type DragCancelReason = UInt32
  type EventType = UInt32
  type FullscreenMode = UInt32
  type GLError = UInt32
  type Gravity = UInt32
  type InputSource = UInt32
  type KeyMatch = UInt32
  type MemoryFormat = UInt32
  type NotifyType = UInt32
  type ScrollDirection = UInt32
  type SubpixelLayout = UInt32
  type SurfaceEdge = UInt32
  type TitlebarGesture = UInt32
  type TouchpadGesturePhase = UInt32
  type VulkanError = UInt32

  # Callbacks
  alias ContentDeserializeFunc = Pointer(LibGdk::ContentDeserializer) -> Void
  alias ContentSerializeFunc = Pointer(LibGdk::ContentSerializer) -> Void

  # Interface types
  type DevicePad = Void
  type DragSurface = Void
  type Paintable = Void
  type Popup = Void
  type Toplevel = Void

  # Structs
  type ContentFormats = Void # Struct with zero bytes

  type ContentFormatsBuilder = Void # Struct with zero bytes

  type EventSequence = Void # Struct with zero bytes

  type FrameClockPrivate = Void # Struct with zero bytes

  type FrameTimings = Void # Struct with zero bytes

  struct KeymapKey # 12 bytes long
    keycode : UInt32
    group : Int32
    level : Int32
  end

  type PopupLayout = Void # Struct with zero bytes

  struct RGBA # 16 bytes long
    red : Float32
    green : Float32
    blue : Float32
    alpha : Float32
  end

  struct Rectangle # 16 bytes long
    x : Int32
    y : Int32
    width : Int32
    height : Int32
  end

  struct TimeCoord # 104 bytes long
    time : UInt32
    flags : UInt32
    axes : Float64[12]
  end

  type ToplevelLayout = Void # Struct with zero bytes

  type ToplevelSize = Void # Struct with zero bytes

  # Unions

  # Objects
  type AppLaunchContext = Void # Object struct with no fields

  type ButtonEvent = Void # Object struct with no fields

  type CairoContext = Void # Object struct with no fields

  type Clipboard = Void # Object struct with no fields

  type ContentDeserializer = Void # Object struct with no fields

  struct ContentProvider
    parent : LibGObject::Object
  end

  type ContentSerializer = Void # Object struct with no fields

  type CrossingEvent = Void # Object struct with no fields

  type Cursor = Void # Object struct with no fields

  type DNDEvent = Void # Object struct with no fields

  type DeleteEvent = Void # Object struct with no fields

  type Device = Void # Object struct with no fields

  type DeviceTool = Void # Object struct with no fields

  type Display = Void # Object struct with no fields

  type DisplayManager = Void # Object struct with no fields

  type Drag = Void # Object struct with no fields

  type DrawContext = Void # Object struct with no fields

  type Drop = Void # Object struct with no fields

  type Event = Void # Object struct with no fields

  type FocusEvent = Void # Object struct with no fields

  type FrameClock = Void # Object struct with no fields

  type GLContext = Void # Object struct with no fields

  type GLTexture = Void # Object struct with no fields

  type GrabBrokenEvent = Void # Object struct with no fields

  type KeyEvent = Void # Object struct with no fields

  type MemoryTexture = Void # Object struct with no fields

  type Monitor = Void # Object struct with no fields

  type MotionEvent = Void # Object struct with no fields

  type PadEvent = Void # Object struct with no fields

  type ProximityEvent = Void # Object struct with no fields

  type ScrollEvent = Void # Object struct with no fields

  struct Seat
    parent_instance : LibGObject::Object
  end

  type Snapshot = Void # Object struct with no fields

  type Surface = Void # Object struct with no fields

  type Texture = Void # Object struct with no fields

  type TouchEvent = Void # Object struct with no fields

  type TouchpadEvent = Void # Object struct with no fields

  type VulkanContext = Void # Object struct with no fields

  # All C Functions
  fun gdk_app_launch_context_get_display(this : Void*) : Pointer(Void)
  fun gdk_app_launch_context_get_type : UInt64
  fun gdk_app_launch_context_set_desktop(this : Void*, desktop : Int32) : Void
  fun gdk_app_launch_context_set_icon(this : Void*, icon : Pointer(Void)) : Void
  fun gdk_app_launch_context_set_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun gdk_app_launch_context_set_timestamp(this : Void*, timestamp : UInt32) : Void
  fun gdk_button_event_get_button(this : Void*) : UInt32
  fun gdk_button_event_get_type : UInt64
  fun gdk_cairo_context_cairo_create(this : Void*) : Pointer(Void)
  fun gdk_cairo_context_get_type : UInt64
  fun gdk_cairo_draw_from_gl(cr : Pointer(Void), surface : Pointer(Void), source : Int32, source_type : Int32, buffer_scale : Int32, x : Int32, y : Int32, width : Int32, height : Int32) : Void
  fun gdk_cairo_rectangle(cr : Pointer(Void), rectangle : Pointer(Void)) : Void
  fun gdk_cairo_region(cr : Pointer(Void), region : Pointer(Void)) : Void
  fun gdk_cairo_region_create_from_surface(surface : Pointer(Void)) : Pointer(Void)
  fun gdk_cairo_set_source_pixbuf(cr : Pointer(Void), pixbuf : Pointer(Void), pixbuf_x : Float64, pixbuf_y : Float64) : Void
  fun gdk_cairo_set_source_rgba(cr : Pointer(Void), rgba : Pointer(Void)) : Void
  fun gdk_clipboard_get_content(this : Void*) : Pointer(Void)
  fun gdk_clipboard_get_display(this : Void*) : Pointer(Void)
  fun gdk_clipboard_get_formats(this : Void*) : Pointer(Void)
  fun gdk_clipboard_get_type : UInt64
  fun gdk_clipboard_is_local(this : Void*) : LibC::Int
  fun gdk_clipboard_read_async(this : Void*, mime_types : Pointer(Pointer(LibC::Char)), io_priority : Int32, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_clipboard_read_finish(this : Void*, result : Pointer(Void), out_mime_type : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_clipboard_read_text_async(this : Void*, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_clipboard_read_text_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(LibC::Char)
  fun gdk_clipboard_read_texture_async(this : Void*, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_clipboard_read_texture_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_clipboard_read_value_async(this : Void*, type : UInt64, io_priority : Int32, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_clipboard_read_value_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_clipboard_set_content(this : Void*, provider : Pointer(Void)) : LibC::Int
  fun gdk_clipboard_set_value(this : Void*, value : Pointer(Void)) : Void
  fun gdk_clipboard_store_async(this : Void*, io_priority : Int32, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_clipboard_store_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gdk_content_deserialize_async(stream : Pointer(Void), mime_type : Pointer(LibC::Char), type : UInt64, io_priority : Int32, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_content_deserialize_finish(result : Pointer(Void), value : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gdk_content_deserializer_get_cancellable(this : Void*) : Pointer(Void)
  fun gdk_content_deserializer_get_gtype(this : Void*) : UInt64
  fun gdk_content_deserializer_get_input_stream(this : Void*) : Pointer(Void)
  fun gdk_content_deserializer_get_mime_type(this : Void*) : Pointer(LibC::Char)
  fun gdk_content_deserializer_get_priority(this : Void*) : Int32
  fun gdk_content_deserializer_get_task_data(this : Void*) : Pointer(Void)
  fun gdk_content_deserializer_get_type : UInt64
  fun gdk_content_deserializer_get_user_data(this : Void*) : Pointer(Void)
  fun gdk_content_deserializer_get_value(this : Void*) : Pointer(Void)
  fun gdk_content_deserializer_return_error(this : Void*, error : Pointer(Void)) : Void
  fun gdk_content_deserializer_return_success(this : Void*) : Void
  fun gdk_content_deserializer_set_task_data(this : Void*, data : Pointer(Void), notify : LibGLib::DestroyNotify) : Void
  fun gdk_content_formats_builder_add_formats(this : Void*, formats : Pointer(Void)) : Void
  fun gdk_content_formats_builder_add_gtype(this : Void*, type : UInt64) : Void
  fun gdk_content_formats_builder_add_mime_type(this : Void*, mime_type : Pointer(LibC::Char)) : Void
  fun gdk_content_formats_builder_get_type : UInt64
  fun gdk_content_formats_builder_new : Pointer(Void)
  fun gdk_content_formats_builder_ref(this : Void*) : Pointer(Void)
  fun gdk_content_formats_builder_to_formats(this : Void*) : Pointer(Void)
  fun gdk_content_formats_builder_unref(this : Void*) : Void
  fun gdk_content_formats_contain_gtype(this : Void*, type : UInt64) : LibC::Int
  fun gdk_content_formats_contain_mime_type(this : Void*, mime_type : Pointer(LibC::Char)) : LibC::Int
  fun gdk_content_formats_get_gtypes(this : Void*, n_gtypes : Pointer(UInt64)) : Pointer(UInt64)
  fun gdk_content_formats_get_mime_types(this : Void*, n_mime_types : Pointer(UInt64)) : Pointer(Pointer(LibC::Char))
  fun gdk_content_formats_get_type : UInt64
  fun gdk_content_formats_match(this : Void*, second : Pointer(Void)) : LibC::Int
  fun gdk_content_formats_match_gtype(this : Void*, second : Pointer(Void)) : UInt64
  fun gdk_content_formats_match_mime_type(this : Void*, second : Pointer(Void)) : Pointer(LibC::Char)
  fun gdk_content_formats_new(mime_types : Pointer(Pointer(LibC::Char)), n_mime_types : UInt32) : Pointer(Void)
  fun gdk_content_formats_new_for_gtype(type : UInt64) : Pointer(Void)
  fun gdk_content_formats_parse(string : Pointer(LibC::Char)) : Pointer(Void)
  fun gdk_content_formats_parse(string : Pointer(LibC::Char)) : Pointer(Void)
  fun gdk_content_formats_print(this : Void*, string : Pointer(Void)) : Void
  fun gdk_content_formats_ref(this : Void*) : Pointer(Void)
  fun gdk_content_formats_to_string(this : Void*) : Pointer(LibC::Char)
  fun gdk_content_formats_union(this : Void*, second : Pointer(Void)) : Pointer(Void)
  fun gdk_content_formats_union_deserialize_gtypes(this : Void*) : Pointer(Void)
  fun gdk_content_formats_union_deserialize_mime_types(this : Void*) : Pointer(Void)
  fun gdk_content_formats_union_serialize_gtypes(this : Void*) : Pointer(Void)
  fun gdk_content_formats_union_serialize_mime_types(this : Void*) : Pointer(Void)
  fun gdk_content_formats_unref(this : Void*) : Void
  fun gdk_content_provider_content_changed(this : Void*) : Void
  fun gdk_content_provider_get_type : UInt64
  fun gdk_content_provider_get_value(this : Void*, value : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gdk_content_provider_new_for_bytes(mime_type : Pointer(LibC::Char), bytes : Pointer(Void)) : Pointer(Void)
  fun gdk_content_provider_new_for_value(value : Pointer(Void)) : Pointer(Void)
  fun gdk_content_provider_new_union(providers : Pointer(Pointer(Void)), n_providers : UInt64) : Pointer(Void)
  fun gdk_content_provider_ref_formats(this : Void*) : Pointer(Void)
  fun gdk_content_provider_ref_storable_formats(this : Void*) : Pointer(Void)
  fun gdk_content_provider_write_mime_type_async(this : Void*, mime_type : Pointer(LibC::Char), stream : Pointer(Void), io_priority : Int32, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_content_provider_write_mime_type_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gdk_content_register_deserializer(mime_type : Pointer(LibC::Char), type : UInt64, deserialize : ContentDeserializeFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : Void
  fun gdk_content_register_serializer(type : UInt64, mime_type : Pointer(LibC::Char), serialize : ContentSerializeFunc, data : Pointer(Void), notify : LibGLib::DestroyNotify) : Void
  fun gdk_content_serialize_async(stream : Pointer(Void), mime_type : Pointer(LibC::Char), value : Pointer(Void), io_priority : Int32, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_content_serialize_finish(result : Pointer(Void), error : LibGLib::Error**) : LibC::Int
  fun gdk_content_serializer_get_cancellable(this : Void*) : Pointer(Void)
  fun gdk_content_serializer_get_gtype(this : Void*) : UInt64
  fun gdk_content_serializer_get_mime_type(this : Void*) : Pointer(LibC::Char)
  fun gdk_content_serializer_get_output_stream(this : Void*) : Pointer(Void)
  fun gdk_content_serializer_get_priority(this : Void*) : Int32
  fun gdk_content_serializer_get_task_data(this : Void*) : Pointer(Void)
  fun gdk_content_serializer_get_type : UInt64
  fun gdk_content_serializer_get_user_data(this : Void*) : Pointer(Void)
  fun gdk_content_serializer_get_value(this : Void*) : Pointer(Void)
  fun gdk_content_serializer_return_error(this : Void*, error : Pointer(Void)) : Void
  fun gdk_content_serializer_return_success(this : Void*) : Void
  fun gdk_content_serializer_set_task_data(this : Void*, data : Pointer(Void), notify : LibGLib::DestroyNotify) : Void
  fun gdk_crossing_event_get_detail(this : Void*) : UInt32
  fun gdk_crossing_event_get_focus(this : Void*) : LibC::Int
  fun gdk_crossing_event_get_mode(this : Void*) : UInt32
  fun gdk_crossing_event_get_type : UInt64
  fun gdk_cursor_get_fallback(this : Void*) : Pointer(Void)
  fun gdk_cursor_get_hotspot_x(this : Void*) : Int32
  fun gdk_cursor_get_hotspot_y(this : Void*) : Int32
  fun gdk_cursor_get_name(this : Void*) : Pointer(LibC::Char)
  fun gdk_cursor_get_texture(this : Void*) : Pointer(Void)
  fun gdk_cursor_get_type : UInt64
  fun gdk_cursor_new_from_name(name : Pointer(LibC::Char), fallback : Pointer(Void)) : Pointer(Void)
  fun gdk_cursor_new_from_texture(texture : Pointer(Void), hotspot_x : Int32, hotspot_y : Int32, fallback : Pointer(Void)) : Pointer(Void)
  fun gdk_delete_event_get_type : UInt64
  fun gdk_device_get_caps_lock_state(this : Void*) : LibC::Int
  fun gdk_device_get_device_tool(this : Void*) : Pointer(Void)
  fun gdk_device_get_direction(this : Void*) : UInt32
  fun gdk_device_get_display(this : Void*) : Pointer(Void)
  fun gdk_device_get_has_cursor(this : Void*) : LibC::Int
  fun gdk_device_get_modifier_state(this : Void*) : UInt32
  fun gdk_device_get_name(this : Void*) : Pointer(LibC::Char)
  fun gdk_device_get_num_lock_state(this : Void*) : LibC::Int
  fun gdk_device_get_num_touches(this : Void*) : UInt32
  fun gdk_device_get_product_id(this : Void*) : Pointer(LibC::Char)
  fun gdk_device_get_scroll_lock_state(this : Void*) : LibC::Int
  fun gdk_device_get_seat(this : Void*) : Pointer(Void)
  fun gdk_device_get_source(this : Void*) : UInt32
  fun gdk_device_get_surface_at_position(this : Void*, win_x : Pointer(Float64), win_y : Pointer(Float64)) : Pointer(Void)
  fun gdk_device_get_timestamp(this : Void*) : UInt32
  fun gdk_device_get_type : UInt64
  fun gdk_device_get_vendor_id(this : Void*) : Pointer(LibC::Char)
  fun gdk_device_has_bidi_layouts(this : Void*) : LibC::Int
  fun gdk_device_pad_get_feature_group(this : Void*, feature : UInt32, feature_idx : Int32) : Int32
  fun gdk_device_pad_get_group_n_modes(this : Void*, group_idx : Int32) : Int32
  fun gdk_device_pad_get_n_features(this : Void*, feature : UInt32) : Int32
  fun gdk_device_pad_get_n_groups(this : Void*) : Int32
  fun gdk_device_pad_get_type : UInt64
  fun gdk_device_tool_get_axes(this : Void*) : UInt32
  fun gdk_device_tool_get_hardware_id(this : Void*) : UInt64
  fun gdk_device_tool_get_serial(this : Void*) : UInt64
  fun gdk_device_tool_get_tool_type(this : Void*) : UInt32
  fun gdk_device_tool_get_type : UInt64
  fun gdk_display_beep(this : Void*) : Void
  fun gdk_display_close(this : Void*) : Void
  fun gdk_display_device_is_grabbed(this : Void*, device : Pointer(Void)) : LibC::Int
  fun gdk_display_flush(this : Void*) : Void
  fun gdk_display_get_app_launch_context(this : Void*) : Pointer(Void)
  fun gdk_display_get_clipboard(this : Void*) : Pointer(Void)
  fun gdk_display_get_default : Pointer(Void)
  fun gdk_display_get_default_seat(this : Void*) : Pointer(Void)
  fun gdk_display_get_monitor_at_surface(this : Void*, surface : Pointer(Void)) : Pointer(Void)
  fun gdk_display_get_monitors(this : Void*) : Pointer(Void)
  fun gdk_display_get_name(this : Void*) : Pointer(LibC::Char)
  fun gdk_display_get_primary_clipboard(this : Void*) : Pointer(Void)
  fun gdk_display_get_setting(this : Void*, name : Pointer(LibC::Char), value : Pointer(Void)) : LibC::Int
  fun gdk_display_get_startup_notification_id(this : Void*) : Pointer(LibC::Char)
  fun gdk_display_get_type : UInt64
  fun gdk_display_is_closed(this : Void*) : LibC::Int
  fun gdk_display_is_composited(this : Void*) : LibC::Int
  fun gdk_display_is_rgba(this : Void*) : LibC::Int
  fun gdk_display_list_seats(this : Void*) : Pointer(LibGLib::List)
  fun gdk_display_manager_get : Pointer(Void)
  fun gdk_display_manager_get_default_display(this : Void*) : Pointer(Void)
  fun gdk_display_manager_get_type : UInt64
  fun gdk_display_manager_list_displays(this : Void*) : Pointer(LibGLib::SList)
  fun gdk_display_manager_open_display(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun gdk_display_manager_set_default_display(this : Void*, display : Pointer(Void)) : Void
  fun gdk_display_map_keycode(this : Void*, keycode : UInt32, keys : Pointer(Pointer(Void)), keyvals : Pointer(Pointer(UInt32)), n_entries : Pointer(Int32)) : LibC::Int
  fun gdk_display_map_keyval(this : Void*, keyval : UInt32, keys : Pointer(Pointer(Void)), n_keys : Pointer(Int32)) : LibC::Int
  fun gdk_display_notify_startup_complete(this : Void*, startup_id : Pointer(LibC::Char)) : Void
  fun gdk_display_open(display_name : Pointer(LibC::Char)) : Pointer(Void)
  fun gdk_display_prepare_gl(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun gdk_display_put_event(this : Void*, event : Pointer(Void)) : Void
  fun gdk_display_supports_input_shapes(this : Void*) : LibC::Int
  fun gdk_display_sync(this : Void*) : Void
  fun gdk_display_translate_key(this : Void*, keycode : UInt32, state : UInt32, group : Int32, keyval : Pointer(UInt32), effective_group : Pointer(Int32), level : Pointer(Int32), consumed : Pointer(UInt32)) : LibC::Int
  fun gdk_dnd_event_get_drop(this : Void*) : Pointer(Void)
  fun gdk_dnd_event_get_type : UInt64
  fun gdk_drag_action_is_unique(action : UInt32) : LibC::Int
  fun gdk_drag_begin(surface : Pointer(Void), device : Pointer(Void), content : Pointer(Void), actions : UInt32, dx : Float64, dy : Float64) : Pointer(Void)
  fun gdk_drag_drop_done(this : Void*, success : LibC::Int) : Void
  fun gdk_drag_get_actions(this : Void*) : UInt32
  fun gdk_drag_get_content(this : Void*) : Pointer(Void)
  fun gdk_drag_get_device(this : Void*) : Pointer(Void)
  fun gdk_drag_get_display(this : Void*) : Pointer(Void)
  fun gdk_drag_get_drag_surface(this : Void*) : Pointer(Void)
  fun gdk_drag_get_formats(this : Void*) : Pointer(Void)
  fun gdk_drag_get_selected_action(this : Void*) : UInt32
  fun gdk_drag_get_surface(this : Void*) : Pointer(Void)
  fun gdk_drag_get_type : UInt64
  fun gdk_drag_set_hotspot(this : Void*, hot_x : Int32, hot_y : Int32) : Void
  fun gdk_drag_surface_get_type : UInt64
  fun gdk_drag_surface_present(this : Void*, width : Int32, height : Int32) : LibC::Int
  fun gdk_draw_context_begin_frame(this : Void*, region : Pointer(Void)) : Void
  fun gdk_draw_context_end_frame(this : Void*) : Void
  fun gdk_draw_context_get_display(this : Void*) : Pointer(Void)
  fun gdk_draw_context_get_frame_region(this : Void*) : Pointer(Void)
  fun gdk_draw_context_get_surface(this : Void*) : Pointer(Void)
  fun gdk_draw_context_get_type : UInt64
  fun gdk_draw_context_is_in_frame(this : Void*) : LibC::Int
  fun gdk_drop_finish(this : Void*, action : UInt32) : Void
  fun gdk_drop_get_actions(this : Void*) : UInt32
  fun gdk_drop_get_device(this : Void*) : Pointer(Void)
  fun gdk_drop_get_display(this : Void*) : Pointer(Void)
  fun gdk_drop_get_drag(this : Void*) : Pointer(Void)
  fun gdk_drop_get_formats(this : Void*) : Pointer(Void)
  fun gdk_drop_get_surface(this : Void*) : Pointer(Void)
  fun gdk_drop_get_type : UInt64
  fun gdk_drop_read_async(this : Void*, mime_types : Pointer(Pointer(LibC::Char)), io_priority : Int32, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_drop_read_finish(this : Void*, result : Pointer(Void), out_mime_type : Pointer(Pointer(LibC::Char)), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_drop_read_value_async(this : Void*, type : UInt64, io_priority : Int32, cancellable : Pointer(Void), callback : LibGio::AsyncReadyCallback, user_data : Pointer(Void)) : Void
  fun gdk_drop_read_value_finish(this : Void*, result : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_drop_status(this : Void*, actions : UInt32, preferred : UInt32) : Void
  fun gdk_event_get_axes(this : Void*, axes : Pointer(Pointer(Float64)), n_axes : Pointer(UInt32)) : LibC::Int
  fun gdk_event_get_axis(this : Void*, axis_use : UInt32, value : Pointer(Float64)) : LibC::Int
  fun gdk_event_get_device(this : Void*) : Pointer(Void)
  fun gdk_event_get_device_tool(this : Void*) : Pointer(Void)
  fun gdk_event_get_display(this : Void*) : Pointer(Void)
  fun gdk_event_get_event_sequence(this : Void*) : Pointer(Void)
  fun gdk_event_get_event_type(this : Void*) : UInt32
  fun gdk_event_get_history(this : Void*, out_n_coords : Pointer(UInt32)) : Pointer(Void)
  fun gdk_event_get_modifier_state(this : Void*) : UInt32
  fun gdk_event_get_pointer_emulated(this : Void*) : LibC::Int
  fun gdk_event_get_position(this : Void*, x : Pointer(Float64), y : Pointer(Float64)) : LibC::Int
  fun gdk_event_get_seat(this : Void*) : Pointer(Void)
  fun gdk_event_get_surface(this : Void*) : Pointer(Void)
  fun gdk_event_get_time(this : Void*) : UInt32
  fun gdk_event_get_type : UInt64
  fun gdk_event_ref(this : Void*) : Pointer(Void)
  fun gdk_event_sequence_get_type : UInt64
  fun gdk_event_triggers_context_menu(this : Void*) : LibC::Int
  fun gdk_event_unref(this : Void*) : Void
  fun gdk_events_get_angle(event1 : Pointer(Void), event2 : Pointer(Void), angle : Pointer(Float64)) : LibC::Int
  fun gdk_events_get_angle(this : Void*, event2 : Pointer(Void), angle : Pointer(Float64)) : LibC::Int
  fun gdk_events_get_center(event1 : Pointer(Void), event2 : Pointer(Void), x : Pointer(Float64), y : Pointer(Float64)) : LibC::Int
  fun gdk_events_get_center(this : Void*, event2 : Pointer(Void), x : Pointer(Float64), y : Pointer(Float64)) : LibC::Int
  fun gdk_events_get_distance(event1 : Pointer(Void), event2 : Pointer(Void), distance : Pointer(Float64)) : LibC::Int
  fun gdk_events_get_distance(this : Void*, event2 : Pointer(Void), distance : Pointer(Float64)) : LibC::Int
  fun gdk_focus_event_get_in(this : Void*) : LibC::Int
  fun gdk_focus_event_get_type : UInt64
  fun gdk_frame_clock_begin_updating(this : Void*) : Void
  fun gdk_frame_clock_end_updating(this : Void*) : Void
  fun gdk_frame_clock_get_current_timings(this : Void*) : Pointer(Void)
  fun gdk_frame_clock_get_fps(this : Void*) : Float64
  fun gdk_frame_clock_get_frame_counter(this : Void*) : Int64
  fun gdk_frame_clock_get_frame_time(this : Void*) : Int64
  fun gdk_frame_clock_get_history_start(this : Void*) : Int64
  fun gdk_frame_clock_get_refresh_info(this : Void*, base_time : Int64, refresh_interval_return : Pointer(Int64), presentation_time_return : Pointer(Int64)) : Void
  fun gdk_frame_clock_get_timings(this : Void*, frame_counter : Int64) : Pointer(Void)
  fun gdk_frame_clock_get_type : UInt64
  fun gdk_frame_clock_request_phase(this : Void*, phase : UInt32) : Void
  fun gdk_frame_timings_get_complete(this : Void*) : LibC::Int
  fun gdk_frame_timings_get_frame_counter(this : Void*) : Int64
  fun gdk_frame_timings_get_frame_time(this : Void*) : Int64
  fun gdk_frame_timings_get_predicted_presentation_time(this : Void*) : Int64
  fun gdk_frame_timings_get_presentation_time(this : Void*) : Int64
  fun gdk_frame_timings_get_refresh_interval(this : Void*) : Int64
  fun gdk_frame_timings_get_type : UInt64
  fun gdk_frame_timings_ref(this : Void*) : Pointer(Void)
  fun gdk_frame_timings_unref(this : Void*) : Void
  fun gdk_gl_context_clear_current : Void
  fun gdk_gl_context_get_current : Pointer(Void)
  fun gdk_gl_context_get_debug_enabled(this : Void*) : LibC::Int
  fun gdk_gl_context_get_display(this : Void*) : Pointer(Void)
  fun gdk_gl_context_get_forward_compatible(this : Void*) : LibC::Int
  fun gdk_gl_context_get_required_version(this : Void*, major : Pointer(Int32), minor : Pointer(Int32)) : Void
  fun gdk_gl_context_get_shared_context(this : Void*) : Pointer(Void)
  fun gdk_gl_context_get_surface(this : Void*) : Pointer(Void)
  fun gdk_gl_context_get_type : UInt64
  fun gdk_gl_context_get_use_es(this : Void*) : LibC::Int
  fun gdk_gl_context_get_version(this : Void*, major : Pointer(Int32), minor : Pointer(Int32)) : Void
  fun gdk_gl_context_is_legacy(this : Void*) : LibC::Int
  fun gdk_gl_context_is_shared(this : Void*, other : Pointer(Void)) : LibC::Int
  fun gdk_gl_context_make_current(this : Void*) : Void
  fun gdk_gl_context_realize(this : Void*, error : LibGLib::Error**) : LibC::Int
  fun gdk_gl_context_set_debug_enabled(this : Void*, enabled : LibC::Int) : Void
  fun gdk_gl_context_set_forward_compatible(this : Void*, compatible : LibC::Int) : Void
  fun gdk_gl_context_set_required_version(this : Void*, major : Int32, minor : Int32) : Void
  fun gdk_gl_context_set_use_es(this : Void*, use_es : Int32) : Void
  fun gdk_gl_error_quark : UInt32
  fun gdk_gl_texture_get_type : UInt64
  fun gdk_gl_texture_new(context : Pointer(Void), id : UInt32, width : Int32, height : Int32, destroy : LibGLib::DestroyNotify, data : Pointer(Void)) : Pointer(Void)
  fun gdk_gl_texture_release(this : Void*) : Void
  fun gdk_grab_broken_event_get_grab_surface(this : Void*) : Pointer(Void)
  fun gdk_grab_broken_event_get_implicit(this : Void*) : LibC::Int
  fun gdk_grab_broken_event_get_type : UInt64
  fun gdk_intern_mime_type(string : Pointer(LibC::Char)) : Pointer(LibC::Char)
  fun gdk_key_event_get_consumed_modifiers(this : Void*) : UInt32
  fun gdk_key_event_get_keycode(this : Void*) : UInt32
  fun gdk_key_event_get_keyval(this : Void*) : UInt32
  fun gdk_key_event_get_layout(this : Void*) : UInt32
  fun gdk_key_event_get_level(this : Void*) : UInt32
  fun gdk_key_event_get_match(this : Void*, keyval : Pointer(UInt32), modifiers : Pointer(UInt32)) : LibC::Int
  fun gdk_key_event_get_type : UInt64
  fun gdk_key_event_is_modifier(this : Void*) : LibC::Int
  fun gdk_key_event_matches(this : Void*, keyval : UInt32, modifiers : UInt32) : UInt32
  fun gdk_keyval_convert_case(symbol : UInt32, lower : Pointer(UInt32), upper : Pointer(UInt32)) : Void
  fun gdk_keyval_from_name(keyval_name : Pointer(LibC::Char)) : UInt32
  fun gdk_keyval_is_lower(keyval : UInt32) : LibC::Int
  fun gdk_keyval_is_upper(keyval : UInt32) : LibC::Int
  fun gdk_keyval_name(keyval : UInt32) : Pointer(LibC::Char)
  fun gdk_keyval_to_lower(keyval : UInt32) : UInt32
  fun gdk_keyval_to_unicode(keyval : UInt32) : UInt32
  fun gdk_keyval_to_upper(keyval : UInt32) : UInt32
  fun gdk_memory_texture_get_type : UInt64
  fun gdk_memory_texture_new(width : Int32, height : Int32, format : UInt32, bytes : Pointer(Void), stride : UInt64) : Pointer(Void)
  fun gdk_monitor_get_connector(this : Void*) : Pointer(LibC::Char)
  fun gdk_monitor_get_display(this : Void*) : Pointer(Void)
  fun gdk_monitor_get_geometry(this : Void*, geometry : Pointer(Void)) : Void
  fun gdk_monitor_get_height_mm(this : Void*) : Int32
  fun gdk_monitor_get_manufacturer(this : Void*) : Pointer(LibC::Char)
  fun gdk_monitor_get_model(this : Void*) : Pointer(LibC::Char)
  fun gdk_monitor_get_refresh_rate(this : Void*) : Int32
  fun gdk_monitor_get_scale_factor(this : Void*) : Int32
  fun gdk_monitor_get_subpixel_layout(this : Void*) : UInt32
  fun gdk_monitor_get_type : UInt64
  fun gdk_monitor_get_width_mm(this : Void*) : Int32
  fun gdk_monitor_is_valid(this : Void*) : LibC::Int
  fun gdk_motion_event_get_type : UInt64
  fun gdk_pad_event_get_axis_value(this : Void*, index : Pointer(UInt32), value : Pointer(Float64)) : Void
  fun gdk_pad_event_get_button(this : Void*) : UInt32
  fun gdk_pad_event_get_group_mode(this : Void*, group : Pointer(UInt32), mode : Pointer(UInt32)) : Void
  fun gdk_pad_event_get_type : UInt64
  fun gdk_paintable_compute_concrete_size(this : Void*, specified_width : Float64, specified_height : Float64, default_width : Float64, default_height : Float64, concrete_width : Pointer(Float64), concrete_height : Pointer(Float64)) : Void
  fun gdk_paintable_get_current_image(this : Void*) : Pointer(Void)
  fun gdk_paintable_get_flags(this : Void*) : UInt32
  fun gdk_paintable_get_intrinsic_aspect_ratio(this : Void*) : Float64
  fun gdk_paintable_get_intrinsic_height(this : Void*) : Int32
  fun gdk_paintable_get_intrinsic_width(this : Void*) : Int32
  fun gdk_paintable_get_type : UInt64
  fun gdk_paintable_invalidate_contents(this : Void*) : Void
  fun gdk_paintable_invalidate_size(this : Void*) : Void
  fun gdk_paintable_new_empty(intrinsic_width : Int32, intrinsic_height : Int32) : Pointer(Void)
  fun gdk_paintable_new_empty(intrinsic_width : Int32, intrinsic_height : Int32) : Pointer(Void)
  fun gdk_paintable_snapshot(this : Void*, snapshot : Pointer(Void), width : Float64, height : Float64) : Void
  fun gdk_pixbuf_get_from_surface(surface : Pointer(Void), src_x : Int32, src_y : Int32, width : Int32, height : Int32) : Pointer(Void)
  fun gdk_pixbuf_get_from_texture(texture : Pointer(Void)) : Pointer(Void)
  fun gdk_popup_get_autohide(this : Void*) : LibC::Int
  fun gdk_popup_get_parent(this : Void*) : Pointer(Void)
  fun gdk_popup_get_position_x(this : Void*) : Int32
  fun gdk_popup_get_position_y(this : Void*) : Int32
  fun gdk_popup_get_rect_anchor(this : Void*) : UInt32
  fun gdk_popup_get_surface_anchor(this : Void*) : UInt32
  fun gdk_popup_get_type : UInt64
  fun gdk_popup_layout_copy(this : Void*) : Pointer(Void)
  fun gdk_popup_layout_equal(this : Void*, other : Pointer(Void)) : LibC::Int
  fun gdk_popup_layout_get_anchor_hints(this : Void*) : UInt32
  fun gdk_popup_layout_get_anchor_rect(this : Void*) : Pointer(Void)
  fun gdk_popup_layout_get_offset(this : Void*, dx : Pointer(Int32), dy : Pointer(Int32)) : Void
  fun gdk_popup_layout_get_rect_anchor(this : Void*) : UInt32
  fun gdk_popup_layout_get_shadow_width(this : Void*, left : Pointer(Int32), right : Pointer(Int32), top : Pointer(Int32), bottom : Pointer(Int32)) : Void
  fun gdk_popup_layout_get_surface_anchor(this : Void*) : UInt32
  fun gdk_popup_layout_get_type : UInt64
  fun gdk_popup_layout_new(anchor_rect : Pointer(Void), rect_anchor : UInt32, surface_anchor : UInt32) : Pointer(Void)
  fun gdk_popup_layout_ref(this : Void*) : Pointer(Void)
  fun gdk_popup_layout_set_anchor_hints(this : Void*, anchor_hints : UInt32) : Void
  fun gdk_popup_layout_set_anchor_rect(this : Void*, anchor_rect : Pointer(Void)) : Void
  fun gdk_popup_layout_set_offset(this : Void*, dx : Int32, dy : Int32) : Void
  fun gdk_popup_layout_set_rect_anchor(this : Void*, anchor : UInt32) : Void
  fun gdk_popup_layout_set_shadow_width(this : Void*, left : Int32, right : Int32, top : Int32, bottom : Int32) : Void
  fun gdk_popup_layout_set_surface_anchor(this : Void*, anchor : UInt32) : Void
  fun gdk_popup_layout_unref(this : Void*) : Void
  fun gdk_popup_present(this : Void*, width : Int32, height : Int32, layout : Pointer(Void)) : LibC::Int
  fun gdk_proximity_event_get_type : UInt64
  fun gdk_rectangle_contains_point(this : Void*, x : Int32, y : Int32) : LibC::Int
  fun gdk_rectangle_equal(this : Void*, rect2 : Pointer(Void)) : LibC::Int
  fun gdk_rectangle_get_type : UInt64
  fun gdk_rectangle_intersect(this : Void*, src2 : Pointer(Void), dest : Pointer(Void)) : LibC::Int
  fun gdk_rectangle_union(this : Void*, src2 : Pointer(Void), dest : Pointer(Void)) : Void
  fun gdk_rgba_copy(this : Void*) : Pointer(Void)
  fun gdk_rgba_equal(this : Void*, p2 : Pointer(Void)) : LibC::Int
  fun gdk_rgba_free(this : Void*) : Void
  fun gdk_rgba_get_type : UInt64
  fun gdk_rgba_hash(this : Void*) : UInt32
  fun gdk_rgba_is_clear(this : Void*) : LibC::Int
  fun gdk_rgba_is_opaque(this : Void*) : LibC::Int
  fun gdk_rgba_parse(this : Void*, spec : Pointer(LibC::Char)) : LibC::Int
  fun gdk_rgba_to_string(this : Void*) : Pointer(LibC::Char)
  fun gdk_scroll_event_get_deltas(this : Void*, delta_x : Pointer(Float64), delta_y : Pointer(Float64)) : Void
  fun gdk_scroll_event_get_direction(this : Void*) : UInt32
  fun gdk_scroll_event_get_type : UInt64
  fun gdk_scroll_event_is_stop(this : Void*) : LibC::Int
  fun gdk_seat_get_capabilities(this : Void*) : UInt32
  fun gdk_seat_get_devices(this : Void*, capabilities : UInt32) : Pointer(LibGLib::List)
  fun gdk_seat_get_display(this : Void*) : Pointer(Void)
  fun gdk_seat_get_keyboard(this : Void*) : Pointer(Void)
  fun gdk_seat_get_pointer(this : Void*) : Pointer(Void)
  fun gdk_seat_get_tools(this : Void*) : Pointer(LibGLib::List)
  fun gdk_seat_get_type : UInt64
  fun gdk_set_allowed_backends(backends : Pointer(LibC::Char)) : Void
  fun gdk_snapshot_get_type : UInt64
  fun gdk_surface_beep(this : Void*) : Void
  fun gdk_surface_create_cairo_context(this : Void*) : Pointer(Void)
  fun gdk_surface_create_gl_context(this : Void*, error : LibGLib::Error**) : Pointer(Void)
  fun gdk_surface_create_similar_surface(this : Void*, content : UInt32, width : Int32, height : Int32) : Pointer(Void)
  fun gdk_surface_create_vulkan_context(this : Void*, error : LibGLib::Error**) : Pointer(Void)
  fun gdk_surface_destroy(this : Void*) : Void
  fun gdk_surface_get_cursor(this : Void*) : Pointer(Void)
  fun gdk_surface_get_device_cursor(this : Void*, device : Pointer(Void)) : Pointer(Void)
  fun gdk_surface_get_device_position(this : Void*, device : Pointer(Void), x : Pointer(Float64), y : Pointer(Float64), mask : Pointer(UInt32)) : LibC::Int
  fun gdk_surface_get_display(this : Void*) : Pointer(Void)
  fun gdk_surface_get_frame_clock(this : Void*) : Pointer(Void)
  fun gdk_surface_get_height(this : Void*) : Int32
  fun gdk_surface_get_mapped(this : Void*) : LibC::Int
  fun gdk_surface_get_scale_factor(this : Void*) : Int32
  fun gdk_surface_get_type : UInt64
  fun gdk_surface_get_width(this : Void*) : Int32
  fun gdk_surface_hide(this : Void*) : Void
  fun gdk_surface_is_destroyed(this : Void*) : LibC::Int
  fun gdk_surface_new_popup(parent : Pointer(Void), autohide : LibC::Int) : Pointer(Void)
  fun gdk_surface_new_toplevel(display : Pointer(Void)) : Pointer(Void)
  fun gdk_surface_queue_render(this : Void*) : Void
  fun gdk_surface_request_layout(this : Void*) : Void
  fun gdk_surface_set_cursor(this : Void*, cursor : Pointer(Void)) : Void
  fun gdk_surface_set_device_cursor(this : Void*, device : Pointer(Void), cursor : Pointer(Void)) : Void
  fun gdk_surface_set_input_region(this : Void*, region : Pointer(Void)) : Void
  fun gdk_surface_set_opaque_region(this : Void*, region : Pointer(Void)) : Void
  fun gdk_surface_translate_coordinates(this : Void*, to : Pointer(Void), x : Pointer(Float64), y : Pointer(Float64)) : LibC::Int
  fun gdk_texture_download(this : Void*, data : Pointer(UInt8), stride : UInt64) : Void
  fun gdk_texture_get_height(this : Void*) : Int32
  fun gdk_texture_get_type : UInt64
  fun gdk_texture_get_width(this : Void*) : Int32
  fun gdk_texture_new_for_pixbuf(pixbuf : Pointer(Void)) : Pointer(Void)
  fun gdk_texture_new_from_file(file : Pointer(Void), error : LibGLib::Error**) : Pointer(Void)
  fun gdk_texture_new_from_resource(resource_path : Pointer(LibC::Char)) : Pointer(Void)
  fun gdk_texture_save_to_png(this : Void*, filename : Pointer(LibC::Char)) : LibC::Int
  fun gdk_toplevel_begin_move(this : Void*, device : Pointer(Void), button : Int32, x : Float64, y : Float64, timestamp : UInt32) : Void
  fun gdk_toplevel_begin_resize(this : Void*, edge : UInt32, device : Pointer(Void), button : Int32, x : Float64, y : Float64, timestamp : UInt32) : Void
  fun gdk_toplevel_focus(this : Void*, timestamp : UInt32) : Void
  fun gdk_toplevel_get_state(this : Void*) : UInt32
  fun gdk_toplevel_get_type : UInt64
  fun gdk_toplevel_inhibit_system_shortcuts(this : Void*, event : Pointer(Void)) : Void
  fun gdk_toplevel_layout_copy(this : Void*) : Pointer(Void)
  fun gdk_toplevel_layout_equal(this : Void*, other : Pointer(Void)) : LibC::Int
  fun gdk_toplevel_layout_get_fullscreen(this : Void*, fullscreen : Pointer(LibC::Int)) : LibC::Int
  fun gdk_toplevel_layout_get_fullscreen_monitor(this : Void*) : Pointer(Void)
  fun gdk_toplevel_layout_get_maximized(this : Void*, maximized : Pointer(LibC::Int)) : LibC::Int
  fun gdk_toplevel_layout_get_resizable(this : Void*) : LibC::Int
  fun gdk_toplevel_layout_get_type : UInt64
  fun gdk_toplevel_layout_new : Pointer(Void)
  fun gdk_toplevel_layout_ref(this : Void*) : Pointer(Void)
  fun gdk_toplevel_layout_set_fullscreen(this : Void*, fullscreen : LibC::Int, monitor : Pointer(Void)) : Void
  fun gdk_toplevel_layout_set_maximized(this : Void*, maximized : LibC::Int) : Void
  fun gdk_toplevel_layout_set_resizable(this : Void*, resizable : LibC::Int) : Void
  fun gdk_toplevel_layout_unref(this : Void*) : Void
  fun gdk_toplevel_lower(this : Void*) : LibC::Int
  fun gdk_toplevel_minimize(this : Void*) : LibC::Int
  fun gdk_toplevel_present(this : Void*, layout : Pointer(Void)) : Void
  fun gdk_toplevel_restore_system_shortcuts(this : Void*) : Void
  fun gdk_toplevel_set_decorated(this : Void*, decorated : LibC::Int) : Void
  fun gdk_toplevel_set_deletable(this : Void*, deletable : LibC::Int) : Void
  fun gdk_toplevel_set_icon_list(this : Void*, surfaces : Pointer(LibGLib::List)) : Void
  fun gdk_toplevel_set_modal(this : Void*, modal : LibC::Int) : Void
  fun gdk_toplevel_set_startup_id(this : Void*, startup_id : Pointer(LibC::Char)) : Void
  fun gdk_toplevel_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun gdk_toplevel_set_transient_for(this : Void*, parent : Pointer(Void)) : Void
  fun gdk_toplevel_show_window_menu(this : Void*, event : Pointer(Void)) : LibC::Int
  fun gdk_toplevel_size_get_bounds(this : Void*, bounds_width : Pointer(Int32), bounds_height : Pointer(Int32)) : Void
  fun gdk_toplevel_size_get_type : UInt64
  fun gdk_toplevel_size_set_min_size(this : Void*, min_width : Int32, min_height : Int32) : Void
  fun gdk_toplevel_size_set_shadow_width(this : Void*, left : Int32, right : Int32, top : Int32, bottom : Int32) : Void
  fun gdk_toplevel_size_set_size(this : Void*, width : Int32, height : Int32) : Void
  fun gdk_toplevel_supports_edge_constraints(this : Void*) : LibC::Int
  fun gdk_toplevel_titlebar_gesture(this : Void*, gesture : UInt32) : LibC::Int
  fun gdk_touch_event_get_emulating_pointer(this : Void*) : LibC::Int
  fun gdk_touch_event_get_type : UInt64
  fun gdk_touchpad_event_get_deltas(this : Void*, dx : Pointer(Float64), dy : Pointer(Float64)) : Void
  fun gdk_touchpad_event_get_gesture_phase(this : Void*) : UInt32
  fun gdk_touchpad_event_get_n_fingers(this : Void*) : UInt32
  fun gdk_touchpad_event_get_pinch_angle_delta(this : Void*) : Float64
  fun gdk_touchpad_event_get_pinch_scale(this : Void*) : Float64
  fun gdk_touchpad_event_get_type : UInt64
  fun gdk_unicode_to_keyval(wc : UInt32) : UInt32
  fun gdk_vulkan_context_get_type : UInt64
  fun gdk_vulkan_error_quark : UInt32
end
