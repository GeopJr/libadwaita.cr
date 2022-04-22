@[Link("adwaita-1", pkg_config: "adwaita-1")]

lib LibAdw
  # Flags

  # Enums
  type AnimationState = UInt32
  type CenteringPolicy = UInt32
  type ColorScheme = UInt32
  type Easing = UInt32
  type FlapFoldPolicy = UInt32
  type FlapTransitionType = UInt32
  type FoldThresholdPolicy = UInt32
  type LeafletTransitionType = UInt32
  type NavigationDirection = UInt32
  type SqueezerTransitionType = UInt32
  type ToastPriority = UInt32
  type ViewSwitcherPolicy = UInt32

  # Callbacks
  alias AnimationTargetFunc = Float64, Pointer(Void) -> Void

  # Interface types
  type Swipeable = Void

  # Structs

  struct ActionRowClass # 552 bytes long
    parent_class : LibAdw::PreferencesRowClass
    activate : -> Void
    padding : Pointer(Void)[4]
  end

  type AnimationClass = Void # Struct with zero bytes

  type AnimationTargetClass = Void # Struct with zero bytes

  struct ApplicationClass # 424 bytes long
    parent_class : LibGtk::ApplicationClass
    padding : Pointer(Void)[4]
  end

  struct ApplicationWindowClass # 608 bytes long
    parent_class : LibGtk::ApplicationWindowClass
    padding : Pointer(Void)[4]
  end

  struct AvatarClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct BinClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct ButtonContentClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  type CallbackAnimationTargetClass = Void # Struct with zero bytes

  struct CarouselClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct CarouselIndicatorDotsClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct CarouselIndicatorLinesClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct ClampClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct ClampLayoutClass # 320 bytes long
    parent_class : LibGtk::LayoutManagerClass
  end

  struct ClampScrollableClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct ComboRowClass # 584 bytes long
    parent_class : LibAdw::ActionRowClass
    padding : Pointer(Void)[4]
  end

  struct EnumListItemClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct EnumListModelClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct ExpanderRowClass # 544 bytes long
    parent_class : LibAdw::PreferencesRowClass
    padding : Pointer(Void)[4]
  end

  struct FlapClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct HeaderBarClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct LeafletClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct LeafletPageClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct PreferencesGroupClass # 440 bytes long
    parent_class : LibGtk::WidgetClass
    padding : Pointer(Void)[4]
  end

  struct PreferencesPageClass # 440 bytes long
    parent_class : LibGtk::WidgetClass
    padding : Pointer(Void)[4]
  end

  struct PreferencesRowClass # 512 bytes long
    parent_class : LibGtk::ListBoxRowClass
    padding : Pointer(Void)[4]
  end

  struct PreferencesWindowClass # 576 bytes long
    parent_class : LibAdw::WindowClass
    padding : Pointer(Void)[4]
  end

  struct SplitButtonClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  type SpringAnimationClass = Void # Struct with zero bytes

  type SpringParams = Void # Struct with zero bytes

  struct SqueezerClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct SqueezerPageClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct StatusPageClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct StyleManagerClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct SwipeTrackerClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct SwipeableInterface # 88 bytes long
    parent : LibGObject::TypeInterface
    get_distance : -> Void
    get_snap_points : -> Void
    get_progress : -> Void
    get_cancel_progress : -> Void
    get_swipe_area : -> Void
    padding : Pointer(Void)[4]
  end

  struct TabBarClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct TabPageClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct TabViewClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  type TimedAnimationClass = Void # Struct with zero bytes

  struct ToastClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct ToastOverlayClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct ViewStackClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct ViewStackPageClass # 136 bytes long
    parent_class : LibGObject::ObjectClass
  end

  struct ViewSwitcherBarClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct ViewSwitcherClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct ViewSwitcherTitleClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  struct WindowClass # 544 bytes long
    parent_class : LibGtk::WindowClass
    padding : Pointer(Void)[4]
  end

  struct WindowTitleClass # 408 bytes long
    parent_class : LibGtk::WidgetClass
  end

  # Unions

  # Objects

  struct ActionRow
    parent_instance : LibAdw::PreferencesRow
  end

  struct Animation
    parent_instance : LibGObject::Object
  end

  type AnimationTarget = Void # Object struct with no fields

  struct Application
    parent_instance : LibGtk::Application
  end

  struct ApplicationWindow
    parent_instance : LibGtk::ApplicationWindow
  end

  type Avatar = Void # Object struct with no fields

  struct Bin
    parent_instance : LibGtk::Widget
  end

  type ButtonContent = Void # Object struct with no fields

  type CallbackAnimationTarget = Void # Object struct with no fields

  type Carousel = Void # Object struct with no fields

  type CarouselIndicatorDots = Void # Object struct with no fields

  type CarouselIndicatorLines = Void # Object struct with no fields

  type Clamp = Void # Object struct with no fields

  type ClampLayout = Void # Object struct with no fields

  type ClampScrollable = Void # Object struct with no fields

  struct ComboRow
    parent_instance : LibAdw::ActionRow
  end

  type EnumListItem = Void # Object struct with no fields

  type EnumListModel = Void # Object struct with no fields

  struct ExpanderRow
    parent_instance : LibAdw::PreferencesRow
  end

  type Flap = Void # Object struct with no fields

  type HeaderBar = Void # Object struct with no fields

  type Leaflet = Void # Object struct with no fields

  type LeafletPage = Void # Object struct with no fields

  struct PreferencesGroup
    parent_instance : LibGtk::Widget
  end

  struct PreferencesPage
    parent_instance : LibGtk::Widget
  end

  struct PreferencesRow
    parent_instance : LibGtk::ListBoxRow
  end

  struct PreferencesWindow
    parent_instance : LibAdw::Window
  end

  type SplitButton = Void # Object struct with no fields

  type SpringAnimation = Void # Object struct with no fields

  type Squeezer = Void # Object struct with no fields

  type SqueezerPage = Void # Object struct with no fields

  type StatusPage = Void # Object struct with no fields

  type StyleManager = Void # Object struct with no fields

  type SwipeTracker = Void # Object struct with no fields

  type TabBar = Void # Object struct with no fields

  type TabPage = Void # Object struct with no fields

  type TabView = Void # Object struct with no fields

  type TimedAnimation = Void # Object struct with no fields

  type Toast = Void # Object struct with no fields

  type ToastOverlay = Void # Object struct with no fields

  type ViewStack = Void # Object struct with no fields

  type ViewStackPage = Void # Object struct with no fields

  type ViewSwitcher = Void # Object struct with no fields

  type ViewSwitcherBar = Void # Object struct with no fields

  type ViewSwitcherTitle = Void # Object struct with no fields

  struct Window
    parent_instance : LibGtk::Window
  end

  type WindowTitle = Void # Object struct with no fields

  # All C Functions
  fun adw_action_row_activate(this : Void*) : Void
  fun adw_action_row_add_prefix(this : Void*, widget : Pointer(Void)) : Void
  fun adw_action_row_add_suffix(this : Void*, widget : Pointer(Void)) : Void
  fun adw_action_row_get_activatable_widget(this : Void*) : Pointer(Void)
  fun adw_action_row_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun adw_action_row_get_subtitle(this : Void*) : Pointer(LibC::Char)
  fun adw_action_row_get_subtitle_lines(this : Void*) : Int32
  fun adw_action_row_get_title_lines(this : Void*) : Int32
  fun adw_action_row_get_type : UInt64
  fun adw_action_row_new : Pointer(Void)
  fun adw_action_row_remove(this : Void*, widget : Pointer(Void)) : Void
  fun adw_action_row_set_activatable_widget(this : Void*, widget : Pointer(Void)) : Void
  fun adw_action_row_set_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun adw_action_row_set_subtitle(this : Void*, subtitle : Pointer(LibC::Char)) : Void
  fun adw_action_row_set_subtitle_lines(this : Void*, subtitle_lines : Int32) : Void
  fun adw_action_row_set_title_lines(this : Void*, title_lines : Int32) : Void
  fun adw_animation_get_state(this : Void*) : UInt32
  fun adw_animation_get_target(this : Void*) : Pointer(Void)
  fun adw_animation_get_type : UInt64
  fun adw_animation_get_value(this : Void*) : Float64
  fun adw_animation_get_widget(this : Void*) : Pointer(Void)
  fun adw_animation_pause(this : Void*) : Void
  fun adw_animation_play(this : Void*) : Void
  fun adw_animation_reset(this : Void*) : Void
  fun adw_animation_resume(this : Void*) : Void
  fun adw_animation_skip(this : Void*) : Void
  fun adw_animation_target_get_type : UInt64
  fun adw_application_get_style_manager(this : Void*) : Pointer(Void)
  fun adw_application_get_type : UInt64
  fun adw_application_new(application_id : Pointer(LibC::Char), flags : UInt32) : Pointer(Void)
  fun adw_application_window_get_content(this : Void*) : Pointer(Void)
  fun adw_application_window_get_type : UInt64
  fun adw_application_window_new(app : Pointer(Void)) : Pointer(Void)
  fun adw_application_window_set_content(this : Void*, content : Pointer(Void)) : Void
  fun adw_avatar_draw_to_texture(this : Void*, scale_factor : Int32) : Pointer(Void)
  fun adw_avatar_get_custom_image(this : Void*) : Pointer(Void)
  fun adw_avatar_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun adw_avatar_get_show_initials(this : Void*) : LibC::Int
  fun adw_avatar_get_size(this : Void*) : Int32
  fun adw_avatar_get_text(this : Void*) : Pointer(LibC::Char)
  fun adw_avatar_get_type : UInt64
  fun adw_avatar_new(size : Int32, text : Pointer(LibC::Char), show_initials : LibC::Int) : Pointer(Void)
  fun adw_avatar_set_custom_image(this : Void*, custom_image : Pointer(Void)) : Void
  fun adw_avatar_set_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun adw_avatar_set_show_initials(this : Void*, show_initials : LibC::Int) : Void
  fun adw_avatar_set_size(this : Void*, size : Int32) : Void
  fun adw_avatar_set_text(this : Void*, text : Pointer(LibC::Char)) : Void
  fun adw_bin_get_child(this : Void*) : Pointer(Void)
  fun adw_bin_get_type : UInt64
  fun adw_bin_new : Pointer(Void)
  fun adw_bin_set_child(this : Void*, child : Pointer(Void)) : Void
  fun adw_button_content_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun adw_button_content_get_label(this : Void*) : Pointer(LibC::Char)
  fun adw_button_content_get_type : UInt64
  fun adw_button_content_get_use_underline(this : Void*) : LibC::Int
  fun adw_button_content_new : Pointer(Void)
  fun adw_button_content_set_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun adw_button_content_set_label(this : Void*, label : Pointer(LibC::Char)) : Void
  fun adw_button_content_set_use_underline(this : Void*, use_underline : LibC::Int) : Void
  fun adw_callback_animation_target_get_type : UInt64
  fun adw_callback_animation_target_new(callback : AnimationTargetFunc, user_data : Pointer(Void), destroy : LibGLib::DestroyNotify) : Pointer(Void)
  fun adw_carousel_append(this : Void*, child : Pointer(Void)) : Void
  fun adw_carousel_get_allow_long_swipes(this : Void*) : LibC::Int
  fun adw_carousel_get_allow_mouse_drag(this : Void*) : LibC::Int
  fun adw_carousel_get_allow_scroll_wheel(this : Void*) : LibC::Int
  fun adw_carousel_get_interactive(this : Void*) : LibC::Int
  fun adw_carousel_get_n_pages(this : Void*) : UInt32
  fun adw_carousel_get_nth_page(this : Void*, n : UInt32) : Pointer(Void)
  fun adw_carousel_get_position(this : Void*) : Float64
  fun adw_carousel_get_reveal_duration(this : Void*) : UInt32
  fun adw_carousel_get_scroll_params(this : Void*) : Pointer(Void)
  fun adw_carousel_get_spacing(this : Void*) : UInt32
  fun adw_carousel_get_type : UInt64
  fun adw_carousel_indicator_dots_get_carousel(this : Void*) : Pointer(Void)
  fun adw_carousel_indicator_dots_get_type : UInt64
  fun adw_carousel_indicator_dots_new : Pointer(Void)
  fun adw_carousel_indicator_dots_set_carousel(this : Void*, carousel : Pointer(Void)) : Void
  fun adw_carousel_indicator_lines_get_carousel(this : Void*) : Pointer(Void)
  fun adw_carousel_indicator_lines_get_type : UInt64
  fun adw_carousel_indicator_lines_new : Pointer(Void)
  fun adw_carousel_indicator_lines_set_carousel(this : Void*, carousel : Pointer(Void)) : Void
  fun adw_carousel_insert(this : Void*, child : Pointer(Void), position : Int32) : Void
  fun adw_carousel_new : Pointer(Void)
  fun adw_carousel_prepend(this : Void*, child : Pointer(Void)) : Void
  fun adw_carousel_remove(this : Void*, child : Pointer(Void)) : Void
  fun adw_carousel_reorder(this : Void*, child : Pointer(Void), position : Int32) : Void
  fun adw_carousel_scroll_to(this : Void*, widget : Pointer(Void), animate : LibC::Int) : Void
  fun adw_carousel_set_allow_long_swipes(this : Void*, allow_long_swipes : LibC::Int) : Void
  fun adw_carousel_set_allow_mouse_drag(this : Void*, allow_mouse_drag : LibC::Int) : Void
  fun adw_carousel_set_allow_scroll_wheel(this : Void*, allow_scroll_wheel : LibC::Int) : Void
  fun adw_carousel_set_interactive(this : Void*, interactive : LibC::Int) : Void
  fun adw_carousel_set_reveal_duration(this : Void*, reveal_duration : UInt32) : Void
  fun adw_carousel_set_scroll_params(this : Void*, params : Pointer(Void)) : Void
  fun adw_carousel_set_spacing(this : Void*, spacing : UInt32) : Void
  fun adw_clamp_get_child(this : Void*) : Pointer(Void)
  fun adw_clamp_get_maximum_size(this : Void*) : Int32
  fun adw_clamp_get_tightening_threshold(this : Void*) : Int32
  fun adw_clamp_get_type : UInt64
  fun adw_clamp_layout_get_maximum_size(this : Void*) : Int32
  fun adw_clamp_layout_get_tightening_threshold(this : Void*) : Int32
  fun adw_clamp_layout_get_type : UInt64
  fun adw_clamp_layout_new : Pointer(Void)
  fun adw_clamp_layout_set_maximum_size(this : Void*, maximum_size : Int32) : Void
  fun adw_clamp_layout_set_tightening_threshold(this : Void*, tightening_threshold : Int32) : Void
  fun adw_clamp_new : Pointer(Void)
  fun adw_clamp_scrollable_get_child(this : Void*) : Pointer(Void)
  fun adw_clamp_scrollable_get_maximum_size(this : Void*) : Int32
  fun adw_clamp_scrollable_get_tightening_threshold(this : Void*) : Int32
  fun adw_clamp_scrollable_get_type : UInt64
  fun adw_clamp_scrollable_new : Pointer(Void)
  fun adw_clamp_scrollable_set_child(this : Void*, child : Pointer(Void)) : Void
  fun adw_clamp_scrollable_set_maximum_size(this : Void*, maximum_size : Int32) : Void
  fun adw_clamp_scrollable_set_tightening_threshold(this : Void*, tightening_threshold : Int32) : Void
  fun adw_clamp_set_child(this : Void*, child : Pointer(Void)) : Void
  fun adw_clamp_set_maximum_size(this : Void*, maximum_size : Int32) : Void
  fun adw_clamp_set_tightening_threshold(this : Void*, tightening_threshold : Int32) : Void
  fun adw_combo_row_get_expression(this : Void*) : Pointer(Void)
  fun adw_combo_row_get_factory(this : Void*) : Pointer(Void)
  fun adw_combo_row_get_list_factory(this : Void*) : Pointer(Void)
  fun adw_combo_row_get_model(this : Void*) : Pointer(Void)
  fun adw_combo_row_get_selected(this : Void*) : UInt32
  fun adw_combo_row_get_selected_item(this : Void*) : Pointer(Void)
  fun adw_combo_row_get_type : UInt64
  fun adw_combo_row_get_use_subtitle(this : Void*) : LibC::Int
  fun adw_combo_row_new : Pointer(Void)
  fun adw_combo_row_set_expression(this : Void*, expression : Pointer(Void)) : Void
  fun adw_combo_row_set_factory(this : Void*, factory : Pointer(Void)) : Void
  fun adw_combo_row_set_list_factory(this : Void*, factory : Pointer(Void)) : Void
  fun adw_combo_row_set_model(this : Void*, model : Pointer(Void)) : Void
  fun adw_combo_row_set_selected(this : Void*, position : UInt32) : Void
  fun adw_combo_row_set_use_subtitle(this : Void*, use_subtitle : LibC::Int) : Void
  fun adw_easing_ease(_self : UInt32, value : Float64) : Float64
  fun adw_enum_list_item_get_name(this : Void*) : Pointer(LibC::Char)
  fun adw_enum_list_item_get_nick(this : Void*) : Pointer(LibC::Char)
  fun adw_enum_list_item_get_type : UInt64
  fun adw_enum_list_item_get_value(this : Void*) : Int32
  fun adw_enum_list_model_find_position(this : Void*, value : Int32) : UInt32
  fun adw_enum_list_model_get_enum_type(this : Void*) : UInt64
  fun adw_enum_list_model_get_type : UInt64
  fun adw_enum_list_model_new(enum_type : UInt64) : Pointer(Void)
  fun adw_expander_row_add_action(this : Void*, widget : Pointer(Void)) : Void
  fun adw_expander_row_add_prefix(this : Void*, widget : Pointer(Void)) : Void
  fun adw_expander_row_add_row(this : Void*, child : Pointer(Void)) : Void
  fun adw_expander_row_get_enable_expansion(this : Void*) : LibC::Int
  fun adw_expander_row_get_expanded(this : Void*) : LibC::Int
  fun adw_expander_row_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun adw_expander_row_get_show_enable_switch(this : Void*) : LibC::Int
  fun adw_expander_row_get_subtitle(this : Void*) : Pointer(LibC::Char)
  fun adw_expander_row_get_type : UInt64
  fun adw_expander_row_new : Pointer(Void)
  fun adw_expander_row_remove(this : Void*, child : Pointer(Void)) : Void
  fun adw_expander_row_set_enable_expansion(this : Void*, enable_expansion : LibC::Int) : Void
  fun adw_expander_row_set_expanded(this : Void*, expanded : LibC::Int) : Void
  fun adw_expander_row_set_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun adw_expander_row_set_show_enable_switch(this : Void*, show_enable_switch : LibC::Int) : Void
  fun adw_expander_row_set_subtitle(this : Void*, subtitle : Pointer(LibC::Char)) : Void
  fun adw_flap_get_content(this : Void*) : Pointer(Void)
  fun adw_flap_get_flap(this : Void*) : Pointer(Void)
  fun adw_flap_get_flap_position(this : Void*) : UInt32
  fun adw_flap_get_fold_duration(this : Void*) : UInt32
  fun adw_flap_get_fold_policy(this : Void*) : UInt32
  fun adw_flap_get_fold_threshold_policy(this : Void*) : UInt32
  fun adw_flap_get_folded(this : Void*) : LibC::Int
  fun adw_flap_get_locked(this : Void*) : LibC::Int
  fun adw_flap_get_modal(this : Void*) : LibC::Int
  fun adw_flap_get_reveal_flap(this : Void*) : LibC::Int
  fun adw_flap_get_reveal_params(this : Void*) : Pointer(Void)
  fun adw_flap_get_reveal_progress(this : Void*) : Float64
  fun adw_flap_get_separator(this : Void*) : Pointer(Void)
  fun adw_flap_get_swipe_to_close(this : Void*) : LibC::Int
  fun adw_flap_get_swipe_to_open(this : Void*) : LibC::Int
  fun adw_flap_get_transition_type(this : Void*) : UInt32
  fun adw_flap_get_type : UInt64
  fun adw_flap_new : Pointer(Void)
  fun adw_flap_set_content(this : Void*, content : Pointer(Void)) : Void
  fun adw_flap_set_flap(this : Void*, flap : Pointer(Void)) : Void
  fun adw_flap_set_flap_position(this : Void*, position : UInt32) : Void
  fun adw_flap_set_fold_duration(this : Void*, duration : UInt32) : Void
  fun adw_flap_set_fold_policy(this : Void*, policy : UInt32) : Void
  fun adw_flap_set_fold_threshold_policy(this : Void*, policy : UInt32) : Void
  fun adw_flap_set_locked(this : Void*, locked : LibC::Int) : Void
  fun adw_flap_set_modal(this : Void*, modal : LibC::Int) : Void
  fun adw_flap_set_reveal_flap(this : Void*, reveal_flap : LibC::Int) : Void
  fun adw_flap_set_reveal_params(this : Void*, params : Pointer(Void)) : Void
  fun adw_flap_set_separator(this : Void*, separator : Pointer(Void)) : Void
  fun adw_flap_set_swipe_to_close(this : Void*, swipe_to_close : LibC::Int) : Void
  fun adw_flap_set_swipe_to_open(this : Void*, swipe_to_open : LibC::Int) : Void
  fun adw_flap_set_transition_type(this : Void*, transition_type : UInt32) : Void
  fun adw_get_enable_animations(widget : Pointer(Void)) : LibC::Int
  fun adw_get_major_version : UInt32
  fun adw_get_micro_version : UInt32
  fun adw_get_minor_version : UInt32
  fun adw_header_bar_get_centering_policy(this : Void*) : UInt32
  fun adw_header_bar_get_decoration_layout(this : Void*) : Pointer(LibC::Char)
  fun adw_header_bar_get_show_end_title_buttons(this : Void*) : LibC::Int
  fun adw_header_bar_get_show_start_title_buttons(this : Void*) : LibC::Int
  fun adw_header_bar_get_title_widget(this : Void*) : Pointer(Void)
  fun adw_header_bar_get_type : UInt64
  fun adw_header_bar_new : Pointer(Void)
  fun adw_header_bar_pack_end(this : Void*, child : Pointer(Void)) : Void
  fun adw_header_bar_pack_start(this : Void*, child : Pointer(Void)) : Void
  fun adw_header_bar_remove(this : Void*, child : Pointer(Void)) : Void
  fun adw_header_bar_set_centering_policy(this : Void*, centering_policy : UInt32) : Void
  fun adw_header_bar_set_decoration_layout(this : Void*, layout : Pointer(LibC::Char)) : Void
  fun adw_header_bar_set_show_end_title_buttons(this : Void*, setting : LibC::Int) : Void
  fun adw_header_bar_set_show_start_title_buttons(this : Void*, setting : LibC::Int) : Void
  fun adw_header_bar_set_title_widget(this : Void*, title_widget : Pointer(Void)) : Void
  fun adw_init : Void
  fun adw_is_initialized : LibC::Int
  fun adw_leaflet_append(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_leaflet_get_adjacent_child(this : Void*, direction : UInt32) : Pointer(Void)
  fun adw_leaflet_get_can_navigate_back(this : Void*) : LibC::Int
  fun adw_leaflet_get_can_navigate_forward(this : Void*) : LibC::Int
  fun adw_leaflet_get_can_unfold(this : Void*) : LibC::Int
  fun adw_leaflet_get_child_by_name(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun adw_leaflet_get_child_transition_params(this : Void*) : Pointer(Void)
  fun adw_leaflet_get_child_transition_running(this : Void*) : LibC::Int
  fun adw_leaflet_get_fold_threshold_policy(this : Void*) : UInt32
  fun adw_leaflet_get_folded(this : Void*) : LibC::Int
  fun adw_leaflet_get_homogeneous(this : Void*) : LibC::Int
  fun adw_leaflet_get_mode_transition_duration(this : Void*) : UInt32
  fun adw_leaflet_get_page(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_leaflet_get_pages(this : Void*) : Pointer(Void)
  fun adw_leaflet_get_transition_type(this : Void*) : UInt32
  fun adw_leaflet_get_type : UInt64
  fun adw_leaflet_get_visible_child(this : Void*) : Pointer(Void)
  fun adw_leaflet_get_visible_child_name(this : Void*) : Pointer(LibC::Char)
  fun adw_leaflet_insert_child_after(this : Void*, child : Pointer(Void), sibling : Pointer(Void)) : Pointer(Void)
  fun adw_leaflet_navigate(this : Void*, direction : UInt32) : LibC::Int
  fun adw_leaflet_new : Pointer(Void)
  fun adw_leaflet_page_get_child(this : Void*) : Pointer(Void)
  fun adw_leaflet_page_get_name(this : Void*) : Pointer(LibC::Char)
  fun adw_leaflet_page_get_navigatable(this : Void*) : LibC::Int
  fun adw_leaflet_page_get_type : UInt64
  fun adw_leaflet_page_set_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun adw_leaflet_page_set_navigatable(this : Void*, navigatable : LibC::Int) : Void
  fun adw_leaflet_prepend(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_leaflet_remove(this : Void*, child : Pointer(Void)) : Void
  fun adw_leaflet_reorder_child_after(this : Void*, child : Pointer(Void), sibling : Pointer(Void)) : Void
  fun adw_leaflet_set_can_navigate_back(this : Void*, can_navigate_back : LibC::Int) : Void
  fun adw_leaflet_set_can_navigate_forward(this : Void*, can_navigate_forward : LibC::Int) : Void
  fun adw_leaflet_set_can_unfold(this : Void*, can_unfold : LibC::Int) : Void
  fun adw_leaflet_set_child_transition_params(this : Void*, params : Pointer(Void)) : Void
  fun adw_leaflet_set_fold_threshold_policy(this : Void*, policy : UInt32) : Void
  fun adw_leaflet_set_homogeneous(this : Void*, homogeneous : LibC::Int) : Void
  fun adw_leaflet_set_mode_transition_duration(this : Void*, duration : UInt32) : Void
  fun adw_leaflet_set_transition_type(this : Void*, transition : UInt32) : Void
  fun adw_leaflet_set_visible_child(this : Void*, visible_child : Pointer(Void)) : Void
  fun adw_leaflet_set_visible_child_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun adw_lerp(a : Float64, b : Float64, t : Float64) : Float64
  fun adw_preferences_group_add(this : Void*, child : Pointer(Void)) : Void
  fun adw_preferences_group_get_description(this : Void*) : Pointer(LibC::Char)
  fun adw_preferences_group_get_header_suffix(this : Void*) : Pointer(Void)
  fun adw_preferences_group_get_title(this : Void*) : Pointer(LibC::Char)
  fun adw_preferences_group_get_type : UInt64
  fun adw_preferences_group_new : Pointer(Void)
  fun adw_preferences_group_remove(this : Void*, child : Pointer(Void)) : Void
  fun adw_preferences_group_set_description(this : Void*, description : Pointer(LibC::Char)) : Void
  fun adw_preferences_group_set_header_suffix(this : Void*, child : Pointer(Void)) : Void
  fun adw_preferences_group_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun adw_preferences_page_add(this : Void*, group : Pointer(Void)) : Void
  fun adw_preferences_page_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun adw_preferences_page_get_name(this : Void*) : Pointer(LibC::Char)
  fun adw_preferences_page_get_title(this : Void*) : Pointer(LibC::Char)
  fun adw_preferences_page_get_type : UInt64
  fun adw_preferences_page_get_use_underline(this : Void*) : LibC::Int
  fun adw_preferences_page_new : Pointer(Void)
  fun adw_preferences_page_remove(this : Void*, group : Pointer(Void)) : Void
  fun adw_preferences_page_set_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun adw_preferences_page_set_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun adw_preferences_page_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun adw_preferences_page_set_use_underline(this : Void*, use_underline : LibC::Int) : Void
  fun adw_preferences_row_get_title(this : Void*) : Pointer(LibC::Char)
  fun adw_preferences_row_get_title_selectable(this : Void*) : LibC::Int
  fun adw_preferences_row_get_type : UInt64
  fun adw_preferences_row_get_use_underline(this : Void*) : LibC::Int
  fun adw_preferences_row_new : Pointer(Void)
  fun adw_preferences_row_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun adw_preferences_row_set_title_selectable(this : Void*, title_selectable : LibC::Int) : Void
  fun adw_preferences_row_set_use_underline(this : Void*, use_underline : LibC::Int) : Void
  fun adw_preferences_window_add(this : Void*, page : Pointer(Void)) : Void
  fun adw_preferences_window_add_toast(this : Void*, toast : Pointer(Void)) : Void
  fun adw_preferences_window_close_subpage(this : Void*) : Void
  fun adw_preferences_window_get_can_navigate_back(this : Void*) : LibC::Int
  fun adw_preferences_window_get_search_enabled(this : Void*) : LibC::Int
  fun adw_preferences_window_get_type : UInt64
  fun adw_preferences_window_get_visible_page(this : Void*) : Pointer(Void)
  fun adw_preferences_window_get_visible_page_name(this : Void*) : Pointer(LibC::Char)
  fun adw_preferences_window_new : Pointer(Void)
  fun adw_preferences_window_present_subpage(this : Void*, subpage : Pointer(Void)) : Void
  fun adw_preferences_window_remove(this : Void*, page : Pointer(Void)) : Void
  fun adw_preferences_window_set_can_navigate_back(this : Void*, can_navigate_back : LibC::Int) : Void
  fun adw_preferences_window_set_search_enabled(this : Void*, search_enabled : LibC::Int) : Void
  fun adw_preferences_window_set_visible_page(this : Void*, page : Pointer(Void)) : Void
  fun adw_preferences_window_set_visible_page_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun adw_split_button_get_child(this : Void*) : Pointer(Void)
  fun adw_split_button_get_direction(this : Void*) : UInt32
  fun adw_split_button_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun adw_split_button_get_label(this : Void*) : Pointer(LibC::Char)
  fun adw_split_button_get_menu_model(this : Void*) : Pointer(Void)
  fun adw_split_button_get_popover(this : Void*) : Pointer(Void)
  fun adw_split_button_get_type : UInt64
  fun adw_split_button_get_use_underline(this : Void*) : LibC::Int
  fun adw_split_button_new : Pointer(Void)
  fun adw_split_button_popdown(this : Void*) : Void
  fun adw_split_button_popup(this : Void*) : Void
  fun adw_split_button_set_child(this : Void*, child : Pointer(Void)) : Void
  fun adw_split_button_set_direction(this : Void*, direction : UInt32) : Void
  fun adw_split_button_set_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun adw_split_button_set_label(this : Void*, label : Pointer(LibC::Char)) : Void
  fun adw_split_button_set_menu_model(this : Void*, menu_model : Pointer(Void)) : Void
  fun adw_split_button_set_popover(this : Void*, popover : Pointer(Void)) : Void
  fun adw_split_button_set_use_underline(this : Void*, use_underline : LibC::Int) : Void
  fun adw_spring_animation_get_clamp(this : Void*) : LibC::Int
  fun adw_spring_animation_get_epsilon(this : Void*) : Float64
  fun adw_spring_animation_get_estimated_duration(this : Void*) : UInt32
  fun adw_spring_animation_get_initial_velocity(this : Void*) : Float64
  fun adw_spring_animation_get_spring_params(this : Void*) : Pointer(Void)
  fun adw_spring_animation_get_type : UInt64
  fun adw_spring_animation_get_value_from(this : Void*) : Float64
  fun adw_spring_animation_get_value_to(this : Void*) : Float64
  fun adw_spring_animation_get_velocity(this : Void*) : Float64
  fun adw_spring_animation_new(widget : Pointer(Void), from : Float64, to : Float64, spring_params : Pointer(Void), target : Pointer(Void)) : Pointer(Void)
  fun adw_spring_animation_set_clamp(this : Void*, clamp : LibC::Int) : Void
  fun adw_spring_animation_set_epsilon(this : Void*, epsilon : Float64) : Void
  fun adw_spring_animation_set_initial_velocity(this : Void*, velocity : Float64) : Void
  fun adw_spring_animation_set_spring_params(this : Void*, spring_params : Pointer(Void)) : Void
  fun adw_spring_animation_set_value_from(this : Void*, value : Float64) : Void
  fun adw_spring_animation_set_value_to(this : Void*, value : Float64) : Void
  fun adw_spring_params_get_damping(this : Void*) : Float64
  fun adw_spring_params_get_damping_ratio(this : Void*) : Float64
  fun adw_spring_params_get_mass(this : Void*) : Float64
  fun adw_spring_params_get_stiffness(this : Void*) : Float64
  fun adw_spring_params_get_type : UInt64
  fun adw_spring_params_new(damping_ratio : Float64, mass : Float64, stiffness : Float64) : Pointer(Void)
  fun adw_spring_params_new_full(damping : Float64, mass : Float64, stiffness : Float64) : Pointer(Void)
  fun adw_spring_params_ref(this : Void*) : Pointer(Void)
  fun adw_spring_params_unref(this : Void*) : Void
  fun adw_squeezer_add(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_squeezer_get_allow_none(this : Void*) : LibC::Int
  fun adw_squeezer_get_homogeneous(this : Void*) : LibC::Int
  fun adw_squeezer_get_interpolate_size(this : Void*) : LibC::Int
  fun adw_squeezer_get_page(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_squeezer_get_pages(this : Void*) : Pointer(Void)
  fun adw_squeezer_get_switch_threshold_policy(this : Void*) : UInt32
  fun adw_squeezer_get_transition_duration(this : Void*) : UInt32
  fun adw_squeezer_get_transition_running(this : Void*) : LibC::Int
  fun adw_squeezer_get_transition_type(this : Void*) : UInt32
  fun adw_squeezer_get_type : UInt64
  fun adw_squeezer_get_visible_child(this : Void*) : Pointer(Void)
  fun adw_squeezer_get_xalign(this : Void*) : Float32
  fun adw_squeezer_get_yalign(this : Void*) : Float32
  fun adw_squeezer_new : Pointer(Void)
  fun adw_squeezer_page_get_child(this : Void*) : Pointer(Void)
  fun adw_squeezer_page_get_enabled(this : Void*) : LibC::Int
  fun adw_squeezer_page_get_type : UInt64
  fun adw_squeezer_page_set_enabled(this : Void*, enabled : LibC::Int) : Void
  fun adw_squeezer_remove(this : Void*, child : Pointer(Void)) : Void
  fun adw_squeezer_set_allow_none(this : Void*, allow_none : LibC::Int) : Void
  fun adw_squeezer_set_homogeneous(this : Void*, homogeneous : LibC::Int) : Void
  fun adw_squeezer_set_interpolate_size(this : Void*, interpolate_size : LibC::Int) : Void
  fun adw_squeezer_set_switch_threshold_policy(this : Void*, policy : UInt32) : Void
  fun adw_squeezer_set_transition_duration(this : Void*, duration : UInt32) : Void
  fun adw_squeezer_set_transition_type(this : Void*, transition : UInt32) : Void
  fun adw_squeezer_set_xalign(this : Void*, xalign : Float32) : Void
  fun adw_squeezer_set_yalign(this : Void*, yalign : Float32) : Void
  fun adw_status_page_get_child(this : Void*) : Pointer(Void)
  fun adw_status_page_get_description(this : Void*) : Pointer(LibC::Char)
  fun adw_status_page_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun adw_status_page_get_paintable(this : Void*) : Pointer(Void)
  fun adw_status_page_get_title(this : Void*) : Pointer(LibC::Char)
  fun adw_status_page_get_type : UInt64
  fun adw_status_page_new : Pointer(Void)
  fun adw_status_page_set_child(this : Void*, child : Pointer(Void)) : Void
  fun adw_status_page_set_description(this : Void*, description : Pointer(LibC::Char)) : Void
  fun adw_status_page_set_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun adw_status_page_set_paintable(this : Void*, paintable : Pointer(Void)) : Void
  fun adw_status_page_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun adw_style_manager_get_color_scheme(this : Void*) : UInt32
  fun adw_style_manager_get_dark(this : Void*) : LibC::Int
  fun adw_style_manager_get_default : Pointer(Void)
  fun adw_style_manager_get_display(this : Void*) : Pointer(Void)
  fun adw_style_manager_get_for_display(display : Pointer(Void)) : Pointer(Void)
  fun adw_style_manager_get_high_contrast(this : Void*) : LibC::Int
  fun adw_style_manager_get_system_supports_color_schemes(this : Void*) : LibC::Int
  fun adw_style_manager_get_type : UInt64
  fun adw_style_manager_set_color_scheme(this : Void*, color_scheme : UInt32) : Void
  fun adw_swipe_tracker_get_allow_long_swipes(this : Void*) : LibC::Int
  fun adw_swipe_tracker_get_allow_mouse_drag(this : Void*) : LibC::Int
  fun adw_swipe_tracker_get_enabled(this : Void*) : LibC::Int
  fun adw_swipe_tracker_get_reversed(this : Void*) : LibC::Int
  fun adw_swipe_tracker_get_swipeable(this : Void*) : Pointer(Void)
  fun adw_swipe_tracker_get_type : UInt64
  fun adw_swipe_tracker_new(swipeable : Pointer(Void)) : Pointer(Void)
  fun adw_swipe_tracker_set_allow_long_swipes(this : Void*, allow_long_swipes : LibC::Int) : Void
  fun adw_swipe_tracker_set_allow_mouse_drag(this : Void*, allow_mouse_drag : LibC::Int) : Void
  fun adw_swipe_tracker_set_enabled(this : Void*, enabled : LibC::Int) : Void
  fun adw_swipe_tracker_set_reversed(this : Void*, reversed : LibC::Int) : Void
  fun adw_swipe_tracker_shift_position(this : Void*, delta : Float64) : Void
  fun adw_swipeable_get_cancel_progress(this : Void*) : Float64
  fun adw_swipeable_get_distance(this : Void*) : Float64
  fun adw_swipeable_get_progress(this : Void*) : Float64
  fun adw_swipeable_get_snap_points(this : Void*, n_snap_points : Pointer(Int32)) : Pointer(Float64)
  fun adw_swipeable_get_swipe_area(this : Void*, navigation_direction : UInt32, is_drag : LibC::Int, rect : Pointer(Void)) : Void
  fun adw_swipeable_get_type : UInt64
  fun adw_tab_bar_get_autohide(this : Void*) : LibC::Int
  fun adw_tab_bar_get_end_action_widget(this : Void*) : Pointer(Void)
  fun adw_tab_bar_get_expand_tabs(this : Void*) : LibC::Int
  fun adw_tab_bar_get_inverted(this : Void*) : LibC::Int
  fun adw_tab_bar_get_is_overflowing(this : Void*) : LibC::Int
  fun adw_tab_bar_get_start_action_widget(this : Void*) : Pointer(Void)
  fun adw_tab_bar_get_tabs_revealed(this : Void*) : LibC::Int
  fun adw_tab_bar_get_type : UInt64
  fun adw_tab_bar_get_view(this : Void*) : Pointer(Void)
  fun adw_tab_bar_new : Pointer(Void)
  fun adw_tab_bar_set_autohide(this : Void*, autohide : LibC::Int) : Void
  fun adw_tab_bar_set_end_action_widget(this : Void*, widget : Pointer(Void)) : Void
  fun adw_tab_bar_set_expand_tabs(this : Void*, expand_tabs : LibC::Int) : Void
  fun adw_tab_bar_set_inverted(this : Void*, inverted : LibC::Int) : Void
  fun adw_tab_bar_set_start_action_widget(this : Void*, widget : Pointer(Void)) : Void
  fun adw_tab_bar_set_view(this : Void*, view : Pointer(Void)) : Void
  fun adw_tab_bar_setup_extra_drop_target(this : Void*, actions : UInt32, types : Pointer(UInt64), n_types : UInt64) : Void
  fun adw_tab_page_get_child(this : Void*) : Pointer(Void)
  fun adw_tab_page_get_icon(this : Void*) : Pointer(Void)
  fun adw_tab_page_get_indicator_activatable(this : Void*) : LibC::Int
  fun adw_tab_page_get_indicator_icon(this : Void*) : Pointer(Void)
  fun adw_tab_page_get_loading(this : Void*) : LibC::Int
  fun adw_tab_page_get_needs_attention(this : Void*) : LibC::Int
  fun adw_tab_page_get_parent(this : Void*) : Pointer(Void)
  fun adw_tab_page_get_pinned(this : Void*) : LibC::Int
  fun adw_tab_page_get_selected(this : Void*) : LibC::Int
  fun adw_tab_page_get_title(this : Void*) : Pointer(LibC::Char)
  fun adw_tab_page_get_tooltip(this : Void*) : Pointer(LibC::Char)
  fun adw_tab_page_get_type : UInt64
  fun adw_tab_page_set_icon(this : Void*, icon : Pointer(Void)) : Void
  fun adw_tab_page_set_indicator_activatable(this : Void*, activatable : LibC::Int) : Void
  fun adw_tab_page_set_indicator_icon(this : Void*, indicator_icon : Pointer(Void)) : Void
  fun adw_tab_page_set_loading(this : Void*, loading : LibC::Int) : Void
  fun adw_tab_page_set_needs_attention(this : Void*, needs_attention : LibC::Int) : Void
  fun adw_tab_page_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun adw_tab_page_set_tooltip(this : Void*, tooltip : Pointer(LibC::Char)) : Void
  fun adw_tab_view_add_page(this : Void*, child : Pointer(Void), parent : Pointer(Void)) : Pointer(Void)
  fun adw_tab_view_append(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_tab_view_append_pinned(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_tab_view_close_other_pages(this : Void*, page : Pointer(Void)) : Void
  fun adw_tab_view_close_page(this : Void*, page : Pointer(Void)) : Void
  fun adw_tab_view_close_page_finish(this : Void*, page : Pointer(Void), confirm : LibC::Int) : Void
  fun adw_tab_view_close_pages_after(this : Void*, page : Pointer(Void)) : Void
  fun adw_tab_view_close_pages_before(this : Void*, page : Pointer(Void)) : Void
  fun adw_tab_view_get_default_icon(this : Void*) : Pointer(Void)
  fun adw_tab_view_get_is_transferring_page(this : Void*) : LibC::Int
  fun adw_tab_view_get_menu_model(this : Void*) : Pointer(Void)
  fun adw_tab_view_get_n_pages(this : Void*) : Int32
  fun adw_tab_view_get_n_pinned_pages(this : Void*) : Int32
  fun adw_tab_view_get_nth_page(this : Void*, position : Int32) : Pointer(Void)
  fun adw_tab_view_get_page(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_tab_view_get_page_position(this : Void*, page : Pointer(Void)) : Int32
  fun adw_tab_view_get_pages(this : Void*) : Pointer(Void)
  fun adw_tab_view_get_selected_page(this : Void*) : Pointer(Void)
  fun adw_tab_view_get_type : UInt64
  fun adw_tab_view_insert(this : Void*, child : Pointer(Void), position : Int32) : Pointer(Void)
  fun adw_tab_view_insert_pinned(this : Void*, child : Pointer(Void), position : Int32) : Pointer(Void)
  fun adw_tab_view_new : Pointer(Void)
  fun adw_tab_view_prepend(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_tab_view_prepend_pinned(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_tab_view_reorder_backward(this : Void*, page : Pointer(Void)) : LibC::Int
  fun adw_tab_view_reorder_first(this : Void*, page : Pointer(Void)) : LibC::Int
  fun adw_tab_view_reorder_forward(this : Void*, page : Pointer(Void)) : LibC::Int
  fun adw_tab_view_reorder_last(this : Void*, page : Pointer(Void)) : LibC::Int
  fun adw_tab_view_reorder_page(this : Void*, page : Pointer(Void), position : Int32) : LibC::Int
  fun adw_tab_view_select_next_page(this : Void*) : LibC::Int
  fun adw_tab_view_select_previous_page(this : Void*) : LibC::Int
  fun adw_tab_view_set_default_icon(this : Void*, default_icon : Pointer(Void)) : Void
  fun adw_tab_view_set_menu_model(this : Void*, menu_model : Pointer(Void)) : Void
  fun adw_tab_view_set_page_pinned(this : Void*, page : Pointer(Void), pinned : LibC::Int) : Void
  fun adw_tab_view_set_selected_page(this : Void*, selected_page : Pointer(Void)) : Void
  fun adw_tab_view_transfer_page(this : Void*, page : Pointer(Void), other_view : Pointer(Void), position : Int32) : Void
  fun adw_timed_animation_get_alternate(this : Void*) : LibC::Int
  fun adw_timed_animation_get_duration(this : Void*) : UInt32
  fun adw_timed_animation_get_easing(this : Void*) : UInt32
  fun adw_timed_animation_get_repeat_count(this : Void*) : UInt32
  fun adw_timed_animation_get_reverse(this : Void*) : LibC::Int
  fun adw_timed_animation_get_type : UInt64
  fun adw_timed_animation_get_value_from(this : Void*) : Float64
  fun adw_timed_animation_get_value_to(this : Void*) : Float64
  fun adw_timed_animation_new(widget : Pointer(Void), from : Float64, to : Float64, duration : UInt32, target : Pointer(Void)) : Pointer(Void)
  fun adw_timed_animation_set_alternate(this : Void*, alternate : LibC::Int) : Void
  fun adw_timed_animation_set_duration(this : Void*, duration : UInt32) : Void
  fun adw_timed_animation_set_easing(this : Void*, easing : UInt32) : Void
  fun adw_timed_animation_set_repeat_count(this : Void*, repeat_count : UInt32) : Void
  fun adw_timed_animation_set_reverse(this : Void*, reverse : LibC::Int) : Void
  fun adw_timed_animation_set_value_from(this : Void*, value : Float64) : Void
  fun adw_timed_animation_set_value_to(this : Void*, value : Float64) : Void
  fun adw_toast_dismiss(this : Void*) : Void
  fun adw_toast_get_action_name(this : Void*) : Pointer(LibC::Char)
  fun adw_toast_get_action_target_value(this : Void*) : Pointer(Void)
  fun adw_toast_get_button_label(this : Void*) : Pointer(LibC::Char)
  fun adw_toast_get_priority(this : Void*) : UInt32
  fun adw_toast_get_timeout(this : Void*) : UInt32
  fun adw_toast_get_title(this : Void*) : Pointer(LibC::Char)
  fun adw_toast_get_type : UInt64
  fun adw_toast_new(title : Pointer(LibC::Char)) : Pointer(Void)
  fun adw_toast_overlay_add_toast(this : Void*, toast : Pointer(Void)) : Void
  fun adw_toast_overlay_get_child(this : Void*) : Pointer(Void)
  fun adw_toast_overlay_get_type : UInt64
  fun adw_toast_overlay_new : Pointer(Void)
  fun adw_toast_overlay_set_child(this : Void*, child : Pointer(Void)) : Void
  fun adw_toast_set_action_name(this : Void*, action_name : Pointer(LibC::Char)) : Void
  fun adw_toast_set_action_target_value(this : Void*, action_target : Pointer(Void)) : Void
  fun adw_toast_set_button_label(this : Void*, button_label : Pointer(LibC::Char)) : Void
  fun adw_toast_set_detailed_action_name(this : Void*, detailed_action_name : Pointer(LibC::Char)) : Void
  fun adw_toast_set_priority(this : Void*, priority : UInt32) : Void
  fun adw_toast_set_timeout(this : Void*, timeout : UInt32) : Void
  fun adw_toast_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun adw_view_stack_add(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_view_stack_add_named(this : Void*, child : Pointer(Void), name : Pointer(LibC::Char)) : Pointer(Void)
  fun adw_view_stack_add_titled(this : Void*, child : Pointer(Void), name : Pointer(LibC::Char), title : Pointer(LibC::Char)) : Pointer(Void)
  fun adw_view_stack_get_child_by_name(this : Void*, name : Pointer(LibC::Char)) : Pointer(Void)
  fun adw_view_stack_get_hhomogeneous(this : Void*) : LibC::Int
  fun adw_view_stack_get_page(this : Void*, child : Pointer(Void)) : Pointer(Void)
  fun adw_view_stack_get_pages(this : Void*) : Pointer(Void)
  fun adw_view_stack_get_type : UInt64
  fun adw_view_stack_get_vhomogeneous(this : Void*) : LibC::Int
  fun adw_view_stack_get_visible_child(this : Void*) : Pointer(Void)
  fun adw_view_stack_get_visible_child_name(this : Void*) : Pointer(LibC::Char)
  fun adw_view_stack_new : Pointer(Void)
  fun adw_view_stack_page_get_badge_number(this : Void*) : UInt32
  fun adw_view_stack_page_get_child(this : Void*) : Pointer(Void)
  fun adw_view_stack_page_get_icon_name(this : Void*) : Pointer(LibC::Char)
  fun adw_view_stack_page_get_name(this : Void*) : Pointer(LibC::Char)
  fun adw_view_stack_page_get_needs_attention(this : Void*) : LibC::Int
  fun adw_view_stack_page_get_title(this : Void*) : Pointer(LibC::Char)
  fun adw_view_stack_page_get_type : UInt64
  fun adw_view_stack_page_get_use_underline(this : Void*) : LibC::Int
  fun adw_view_stack_page_get_visible(this : Void*) : LibC::Int
  fun adw_view_stack_page_set_badge_number(this : Void*, badge_number : UInt32) : Void
  fun adw_view_stack_page_set_icon_name(this : Void*, icon_name : Pointer(LibC::Char)) : Void
  fun adw_view_stack_page_set_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun adw_view_stack_page_set_needs_attention(this : Void*, needs_attention : LibC::Int) : Void
  fun adw_view_stack_page_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun adw_view_stack_page_set_use_underline(this : Void*, use_underline : LibC::Int) : Void
  fun adw_view_stack_page_set_visible(this : Void*, visible : LibC::Int) : Void
  fun adw_view_stack_remove(this : Void*, child : Pointer(Void)) : Void
  fun adw_view_stack_set_hhomogeneous(this : Void*, hhomogeneous : LibC::Int) : Void
  fun adw_view_stack_set_vhomogeneous(this : Void*, vhomogeneous : LibC::Int) : Void
  fun adw_view_stack_set_visible_child(this : Void*, child : Pointer(Void)) : Void
  fun adw_view_stack_set_visible_child_name(this : Void*, name : Pointer(LibC::Char)) : Void
  fun adw_view_switcher_bar_get_reveal(this : Void*) : LibC::Int
  fun adw_view_switcher_bar_get_stack(this : Void*) : Pointer(Void)
  fun adw_view_switcher_bar_get_type : UInt64
  fun adw_view_switcher_bar_new : Pointer(Void)
  fun adw_view_switcher_bar_set_reveal(this : Void*, reveal : LibC::Int) : Void
  fun adw_view_switcher_bar_set_stack(this : Void*, stack : Pointer(Void)) : Void
  fun adw_view_switcher_get_policy(this : Void*) : UInt32
  fun adw_view_switcher_get_stack(this : Void*) : Pointer(Void)
  fun adw_view_switcher_get_type : UInt64
  fun adw_view_switcher_new : Pointer(Void)
  fun adw_view_switcher_set_policy(this : Void*, policy : UInt32) : Void
  fun adw_view_switcher_set_stack(this : Void*, stack : Pointer(Void)) : Void
  fun adw_view_switcher_title_get_stack(this : Void*) : Pointer(Void)
  fun adw_view_switcher_title_get_subtitle(this : Void*) : Pointer(LibC::Char)
  fun adw_view_switcher_title_get_title(this : Void*) : Pointer(LibC::Char)
  fun adw_view_switcher_title_get_title_visible(this : Void*) : LibC::Int
  fun adw_view_switcher_title_get_type : UInt64
  fun adw_view_switcher_title_get_view_switcher_enabled(this : Void*) : LibC::Int
  fun adw_view_switcher_title_new : Pointer(Void)
  fun adw_view_switcher_title_set_stack(this : Void*, stack : Pointer(Void)) : Void
  fun adw_view_switcher_title_set_subtitle(this : Void*, subtitle : Pointer(LibC::Char)) : Void
  fun adw_view_switcher_title_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
  fun adw_view_switcher_title_set_view_switcher_enabled(this : Void*, enabled : LibC::Int) : Void
  fun adw_window_get_content(this : Void*) : Pointer(Void)
  fun adw_window_get_type : UInt64
  fun adw_window_new : Pointer(Void)
  fun adw_window_set_content(this : Void*, content : Pointer(Void)) : Void
  fun adw_window_title_get_subtitle(this : Void*) : Pointer(LibC::Char)
  fun adw_window_title_get_title(this : Void*) : Pointer(LibC::Char)
  fun adw_window_title_get_type : UInt64
  fun adw_window_title_new(title : Pointer(LibC::Char), subtitle : Pointer(LibC::Char)) : Pointer(Void)
  fun adw_window_title_set_subtitle(this : Void*, subtitle : Pointer(LibC::Char)) : Void
  fun adw_window_title_set_title(this : Void*, title : Pointer(LibC::Char)) : Void
end
