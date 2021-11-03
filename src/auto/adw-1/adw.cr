# Dependencies
require "../gtk-4.0/gtk.cr"
require "../gio-2.0/gio.cr"

# C lib declaration
require "./lib_adw.cr"

# Wrappers
require "./action_row.cr"
require "./application.cr"
require "./application_window.cr"
require "./avatar.cr"
require "./bin.cr"
require "./button_content.cr"
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
require "./squeezer.cr"
require "./squeezer_page.cr"
require "./status_page.cr"
require "./style_manager.cr"
require "./swipe_tracker.cr"
require "./swipeable.cr"
require "./tab_bar.cr"
require "./tab_page.cr"
require "./tab_view.cr"
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
  VERSION_S     = "1.0.0.alpha.4"

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

  enum ViewSwitcherPolicy : UInt32
    Narrow = 0
    Wide   = 1
  end

  extend self
end

# Extra includes
