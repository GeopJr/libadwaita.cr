# Dependencies
require "../gtk-4.0/gtk.cr"
require "../gio-2.0/gio.cr"

# C lib declaration
require "./lib_adw.cr"

# Wrappers
require "./action_row.cr"
require "./animation.cr"
require "./animation_target.cr"
require "./application.cr"
require "./application_window.cr"
require "./avatar.cr"
require "./bin.cr"
require "./button_content.cr"
require "./callback_animation_target.cr"
require "./carousel.cr"
require "./carousel_indicator_dots.cr"
require "./carousel_indicator_lines.cr"
require "./clamp.cr"
require "./clamp_layout.cr"
require "./clamp_scrollable.cr"
require "./combo_row.cr"
require "./enum_list_item.cr"
require "./enum_list_model.cr"
require "./expander_row.cr"
require "./flap.cr"
require "./header_bar.cr"
require "./leaflet.cr"
require "./leaflet_page.cr"
require "./preferences_group.cr"
require "./preferences_page.cr"
require "./preferences_row.cr"
require "./preferences_window.cr"
require "./split_button.cr"
require "./spring_animation.cr"
require "./spring_params.cr"
require "./squeezer.cr"
require "./squeezer_page.cr"
require "./status_page.cr"
require "./style_manager.cr"
require "./swipe_tracker.cr"
require "./swipeable.cr"
require "./tab_bar.cr"
require "./tab_page.cr"
require "./tab_view.cr"
require "./timed_animation.cr"
require "./toast.cr"
require "./toast_overlay.cr"
require "./view_stack.cr"
require "./view_stack_page.cr"
require "./view_switcher.cr"
require "./view_switcher_bar.cr"
require "./view_switcher_title.cr"
require "./window.cr"
require "./window_title.cr"

module Adw
  MAJOR_VERSION = 1
  MICRO_VERSION = 0
  MINOR_VERSION = 0
  VERSION_S     = "1.0.0.beta.1"

  enum AnimationState : UInt32
    Idle     = 0
    Paused   = 1
    Playing  = 2
    Finished = 3
  end

  enum CenteringPolicy : UInt32
    Loose  = 0
    Strict = 1
  end

  enum ColorScheme : UInt32
    Default     = 0
    ForceLight  = 1
    PreferLight = 2
    PreferDark  = 3
    ForceDark   = 4
  end

  enum Easing : UInt32
    Linear           =  0
    EaseInQuad       =  1
    EaseOutQuad      =  2
    EaseInOutQuad    =  3
    EaseInCubic      =  4
    EaseOutCubic     =  5
    EaseInOutCubic   =  6
    EaseInQuart      =  7
    EaseOutQuart     =  8
    EaseInOutQuart   =  9
    EaseInQuint      = 10
    EaseOutQuint     = 11
    EaseInOutQuint   = 12
    EaseInSine       = 13
    EaseOutSine      = 14
    EaseInOutSine    = 15
    EaseInExpo       = 16
    EaseOutExpo      = 17
    EaseInOutExpo    = 18
    EaseInCirc       = 19
    EaseOutCirc      = 20
    EaseInOutCirc    = 21
    EaseInElastic    = 22
    EaseOutElastic   = 23
    EaseInOutElastic = 24
    EaseInBack       = 25
    EaseOutBack      = 26
    EaseInOutBack    = 27
    EaseInBounce     = 28
    EaseOutBounce    = 29
    EaseInOutBounce  = 30
  end

  enum FlapFoldPolicy : UInt32
    Never  = 0
    Always = 1
    Auto   = 2
  end

  enum FlapTransitionType : UInt32
    Over  = 0
    Under = 1
    Slide = 2
  end

  enum FoldThresholdPolicy : UInt32
    Minimum = 0
    Natural = 1
  end

  enum LeafletTransitionType : UInt32
    Over  = 0
    Under = 1
    Slide = 2
  end

  enum NavigationDirection : UInt32
    Back    = 0
    Forward = 1
  end

  enum SqueezerTransitionType : UInt32
    None      = 0
    Crossfade = 1
  end

  enum ToastPriority : UInt32
    Normal = 0
    High   = 1
  end

  enum ViewSwitcherPolicy : UInt32
    Narrow = 0
    Wide   = 1
  end

  extend self
end

# Extra includes
