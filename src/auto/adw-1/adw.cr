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
  # Indicates an `#Animation` with an infinite duration.
  #
  # This value is mostly used internally.
  DURATION_INFINITE = 4294967295_u32
  # Adwaita major version component (e.g. 1 if the version is 1.2.3).
  MAJOR_VERSION = 1
  # Adwaita micro version component (e.g. 3 if the version is 1.2.3).
  MICRO_VERSION = 0
  # Adwaita minor version component (e.g. 2 if the version is 1.2.3).
  MINOR_VERSION = 1
  # Adwaita version, encoded as a string, useful for printing and
  # concatenation.
  VERSION_S = "1.1.0"

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

  # Describes the possible states of an `#Animation`.
  #
  # The state can be controlled with `Animation#play`,
  # `Animation#pause`, `Animation#resume`,
  # `Animation#reset` and `Animation#skip`.
  enum AnimationState : UInt32
    # The animation hasn't started yet.
    Idle = 0
    # The animation has been paused.
    Paused = 1
    # The animation is currently playing.
    Playing = 2
    # The animation has finished.
    Finished = 3
  end

  # Describes title centering behavior of a `#HeaderBar` widget.
  enum CenteringPolicy : UInt32
    # Keep the title centered when possible
    Loose = 0
    # Keep the title centered at all cost
    Strict = 1
  end

  # Application color schemes for [property@StyleManager:color-scheme].
  enum ColorScheme : UInt32
    # Inherit the parent color-scheme. When set on the
    #   `AdwStyleManager` returned by `StyleManager#default`, it's
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

  # Describes the available easing functions for use with
  # `#TimedAnimation`.
  #
  # New values may be added to this enumeration over time.
  enum Easing : UInt32
    # Linear tweening.
    Linear = 0
    # Quadratic tweening.
    EaseInQuad = 1
    # Quadratic tweening, inverse of `ADW_EASE_IN_QUAD`.
    EaseOutQuad = 2
    # Quadratic tweening, combining `ADW_EASE_IN_QUAD` and
    #   `ADW_EASE_OUT_QUAD`.
    EaseInOutQuad = 3
    # Cubic tweening.
    EaseInCubic = 4
    # Cubic tweening, inverse of `ADW_EASE_IN_CUBIC`.
    EaseOutCubic = 5
    # Cubic tweening, combining `ADW_EASE_IN_CUBIC` and
    #   `ADW_EASE_OUT_CUBIC`.
    EaseInOutCubic = 6
    # Quartic tweening.
    EaseInQuart = 7
    # Quartic tweening, inverse of `ADW_EASE_IN_QUART`.
    EaseOutQuart = 8
    # Quartic tweening, combining `ADW_EASE_IN_QUART` and
    #   `ADW_EASE_OUT_QUART`.
    EaseInOutQuart = 9
    # Quintic tweening.
    EaseInQuint = 10
    # Quintic tweening, inverse of `ADW_EASE_IN_QUINT`.
    EaseOutQuint = 11
    # Quintic tweening, combining `ADW_EASE_IN_QUINT` and
    #   `ADW_EASE_OUT_QUINT`.
    EaseInOutQuint = 12
    # Sine wave tweening.
    EaseInSine = 13
    # Sine wave tweening, inverse of `ADW_EASE_IN_SINE`.
    EaseOutSine = 14
    # Sine wave tweening, combining `ADW_EASE_IN_SINE` and
    #   `ADW_EASE_OUT_SINE`.
    EaseInOutSine = 15
    # Exponential tweening.
    EaseInExpo = 16
    # Exponential tweening, inverse of `ADW_EASE_IN_EXPO`.
    EaseOutExpo = 17
    # Exponential tweening, combining `ADW_EASE_IN_EXPO` and
    #   `ADW_EASE_OUT_EXPO`.
    EaseInOutExpo = 18
    # Circular tweening.
    EaseInCirc = 19
    # Circular tweening, inverse of `ADW_EASE_IN_CIRC`.
    EaseOutCirc = 20
    # Circular tweening, combining `ADW_EASE_IN_CIRC` and
    #   `ADW_EASE_OUT_CIRC`.
    EaseInOutCirc = 21
    # Elastic tweening, with offshoot on start.
    EaseInElastic = 22
    # Elastic tweening, with offshoot on end, inverse of
    #   `ADW_EASE_IN_ELASTIC`.
    EaseOutElastic = 23
    # Elastic tweening, with offshoot on both ends,
    #   combining `ADW_EASE_IN_ELASTIC` and `ADW_EASE_OUT_ELASTIC`.
    EaseInOutElastic = 24
    # Overshooting cubic tweening, with backtracking on start.
    EaseInBack = 25
    # Overshooting cubic tweening, with backtracking on end,
    #   inverse of `ADW_EASE_IN_BACK`.
    EaseOutBack = 26
    # Overshooting cubic tweening, with backtracking on both
    #   ends, combining `ADW_EASE_IN_BACK` and `ADW_EASE_OUT_BACK`.
    EaseInOutBack = 27
    # Exponentially decaying parabolic (bounce) tweening,
    #   on start.
    EaseInBounce = 28
    # Exponentially decaying parabolic (bounce) tweening,
    #   with bounce on end, inverse of `ADW_EASE_IN_BOUNCE`.
    EaseOutBounce = 29
    # Exponentially decaying parabolic (bounce) tweening,
    #   with bounce on both ends, combining `ADW_EASE_IN_BOUNCE` and
    #   `ADW_EASE_OUT_BOUNCE`.
    EaseInOutBounce = 30
  end

  # Describes the possible folding behavior of a `#Flap` widget.
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

  # Describes transitions types of a `#Flap` widget.
  #
  # It determines the type of animation when transitioning between children in a
  # `#Flap` widget, as well as which areas can be swiped via
  # [property@Flap:swipe-to-open] and [property@Flap:swipe-to-close].
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

  # Determines when `#Flap` and `#Leaflet` will fold.
  enum FoldThresholdPolicy : UInt32
    # Folding is based on the minimum size
    Minimum = 0
    # Folding is based on the natural size
    Natural = 1
  end

  # Describes the possible transitions in a `#Leaflet` widget.
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

  # Describes the possible transitions in a `#Squeezer` widget.
  enum SqueezerTransitionType : UInt32
    # No transition
    None = 0
    # A cross-fade
    Crossfade = 1
  end

  # `#Toast` behavior when another toast is already displayed.
  enum ToastPriority : UInt32
    # the toast will be queued if another toast is
    #   already displayed.
    Normal = 0
    # the toast will be displayed immediately, pushing
    #   the previous toast into the queue instead.
    High = 1
  end

  # Describes the adaptive modes of `#ViewSwitcher`.
  enum ViewSwitcherPolicy : UInt32
    # Force the narrow mode
    Narrow = 0
    # Force the wide mode
    Wide = 1
  end

  # Flags

  def self.easing_ease(self _self : Adw::Easing, value : Float64) : Float64
    # adw_easing_ease: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibAdw.adw_easing_ease(_self, value)

    # Return value handling

    _retval
  end

  def self.enable_animations(widget : Gtk::Widget) : Bool
    # adw_get_enable_animations: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibAdw.adw_get_enable_animations(widget)

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.major_version : UInt32
    # adw_get_major_version: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibAdw.adw_get_major_version

    # Return value handling

    _retval
  end

  def self.micro_version : UInt32
    # adw_get_micro_version: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibAdw.adw_get_micro_version

    # Return value handling

    _retval
  end

  def self.minor_version : UInt32
    # adw_get_minor_version: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibAdw.adw_get_minor_version

    # Return value handling

    _retval
  end

  def self.init : Nil
    # adw_init: (None)
    # Returns: (transfer none)

    # C call
    LibAdw.adw_init

    # Return value handling
  end

  def self.is_initialized : Bool
    # adw_is_initialized: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibAdw.adw_is_initialized

    # Return value handling

    GICrystal.to_bool(_retval)
  end

  def self.lerp(a : Float64, b : Float64, t : Float64) : Float64
    # adw_lerp: (None)
    # Returns: (transfer none)

    # C call
    _retval = LibAdw.adw_lerp(a, b, t)

    # Return value handling

    _retval
  end

  # Errors

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    Gtk.raise_exception(error)
    Gio.raise_exception(error)
  end

  extend self
end

# Extra includes
