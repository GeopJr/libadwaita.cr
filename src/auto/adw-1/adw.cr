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
  # Adw major version component (e.g. 1 if %ADW_VERSION is 1.2.3)
  MAJOR_VERSION = 1
  # Adw micro version component (e.g. 3 if %ADW_VERSION is 1.2.3)
  MICRO_VERSION = 0
  # Adw minor version component (e.g. 2 if %ADW_VERSION is 1.2.3)
  MINOR_VERSION = 0
  # Adwaita version, encoded as a string, useful for printing and
  # concatenation.
  VERSION_S = "1.0.0.alpha.4"

  # Base class for all errors in this module.
  class AdwError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # Describes title centering behavior of a [class@Adw.HeaderBar] widget.
  enum CenteringPolicy : UInt32
    # Keep the title centered when possible
    Loose = 0
    # Keep the title centered at all cost
    Strict = 1
  end

  # Application color schemes for [property@Adw.StyleManager:color-scheme].
  enum ColorScheme : UInt32
    # Inherit the parent color-scheme. When set on the
    #   `AdwStyleManager` returned by [func@Adw.StyleManager.get_default], it's
    #   equivalent to `ADW_COLOR_SCHEME_PREFER_LIGHT`.
    Default = 0
    # Always use light appearance.
    ForceLight = 1
    # Use light appearance unless the system
    #   prefers dark colors.
    PreferLight = 2
    # Use dark appearance unless the system prefers
    #   prefers light colors.
    PreferDark = 3
    # Always use dark appearance.
    ForceDark = 4
  end

  # Describes the possible folding behavior of a [class@Adw.Flap] widget.
  enum FlapFoldPolicy : UInt32
    # Disable folding, the flap cannot reach narrow
    #   sizes.
    Never = 0
    # Keep the flap always folded.
    Always = 1
    # Fold and unfold the flap based on available
    #   space.
    Auto = 2
  end

  # Describes transitions types of a [class@Adw.Flap] widget.
  #
  # It determines the type of animation when transitioning between children in a
  # [class@Adw.Flap] widget, as well as which areas can be swiped via
  # [property@Adw.Flap:swipe-to-open] and [property@Adw.Flap:swipe-to-close].
  #
  # New values may be added to this enum over time.
  enum FlapTransitionType : UInt32
    # The flap slides over the content, which is
    #   dimmed. When folded, only the flap can be swiped.
    Over = 0
    # The content slides over the flap. Only the
    #   content can be swiped.
    Under = 1
    # The flap slides offscreen when hidden,
    #   neither the flap nor content overlap each other. Both widgets can be
    #   swiped.
    Slide = 2
  end

  # Determines when [class@Adw.Flap] and [class@Adw.Leaflet] will fold.
  enum FoldThresholdPolicy : UInt32
    # Folding is based on the minimum size
    Minimum = 0
    # Folding is based on the natural size
    Natural = 1
  end

  # Describes the possible transitions in a [class@Adw.Leaflet] widget.
  #
  # New values may be added to this enumeration over time.
  enum LeafletTransitionType : UInt32
    # Cover the old page or uncover the new page, sliding from or towards the end according to orientation, text direction and children order
    Over = 0
    # Uncover the new page or cover the old page, sliding from or towards the start according to orientation, text direction and children order
    Under = 1
    # Slide from left, right, up or down according to the orientation, text direction and the children order
    Slide = 2
  end

  # Describes the direction of a swipe navigation gesture.
  enum NavigationDirection : UInt32
    # Corresponds to start or top, depending on orientation and text direction
    Back = 0
    # Corresponds to end or bottom, depending on orientation and text direction
    Forward = 1
  end

  # Describes the possible transitions in a [class@Adw.Squeezer] widget.
  enum SqueezerTransitionType : UInt32
    # No transition
    None = 0
    # A cross-fade
    Crossfade = 1
  end

  # Describes the adaptive modes of [class@Adw.ViewSwitcher].
  enum ViewSwitcherPolicy : UInt32
    # Force the narrow mode
    Narrow = 0
    # Force the wide mode
    Wide = 1
  end

  # Flags

  # Errors

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    Gtk.raise_exception(error)
    Gio.raise_exception(error)
  end

  extend self
end

# Extra includes
