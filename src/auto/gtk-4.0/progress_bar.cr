require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./orientable"

module Gtk
  # `GtkProgressBar` is typically used to display the progress of a long
  # running operation.
  #
  # It provides a visual clue that processing is underway. `GtkProgressBar`
  # can be used in two different modes: percentage mode and activity mode.
  #
  # ![An example GtkProgressBar](progressbar.png)
  #
  # When an application can determine how much work needs to take place
  # (e.g. read a fixed number of bytes from a file) and can monitor its
  # progress, it can use the `GtkProgressBar` in percentage mode and the
  # user sees a growing bar indicating the percentage of the work that
  # has been completed. In this mode, the application is required to call
  # [method@Gtk.ProgressBar.set_fraction] periodically to update the progress bar.
  #
  # When an application has no accurate way of knowing the amount of work
  # to do, it can use the `GtkProgressBar` in activity mode, which shows
  # activity by a block moving back and forth within the progress area. In
  # this mode, the application is required to call [method@Gtk.ProgressBar.pulse]
  # periodically to update the progress bar.
  #
  # There is quite a bit of flexibility provided to control the appearance
  # of the `GtkProgressBar`. Functions are provided to control the orientation
  # of the bar, optional text can be displayed along with the bar, and the
  # step size used in activity mode can be set.
  #
  # # CSS nodes
  #
  # ```
  # progressbar[.osd]
  # ├── [text]
  # ╰── trough[.empty][.full]
  #     ╰── progress[.pulse]
  # ```
  #
  # `GtkProgressBar` has a main CSS node with name progressbar and subnodes with
  # names text and trough, of which the latter has a subnode named progress. The
  # text subnode is only present if text is shown. The progress subnode has the
  # style class .pulse when in activity mode. It gets the style classes .left,
  # .right, .top or .bottom added when the progress 'touches' the corresponding
  # end of the GtkProgressBar. The .osd class on the progressbar node is for use
  # in overlays like the one Epiphany has for page loading progress.
  #
  # # Accessibility
  #
  # `GtkProgressBar` uses the %GTK_ACCESSIBLE_ROLE_PROGRESS_BAR role.
  class ProgressBar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, ellipsize : Pango::EllipsizeMode? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, fraction : Float64? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, inverted : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, pulse_step : Float64? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_text : Bool? = nil, text : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[42]
      _values = StaticArray(LibGObject::Value, 42).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if can_focus
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if can_target
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if css_classes
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if css_name
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if cursor
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if ellipsize
        (_names.to_unsafe + _n).value = "ellipsize".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ellipsize)
        _n += 1
      end
      if focus_on_click
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if focusable
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if fraction
        (_names.to_unsafe + _n).value = "fraction".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fraction)
        _n += 1
      end
      if halign
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if has_default
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if has_focus
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if has_tooltip
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if height_request
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if hexpand
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if hexpand_set
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if inverted
        (_names.to_unsafe + _n).value = "inverted".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inverted)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if margin_bottom
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if margin_end
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if margin_start
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if margin_top
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if opacity
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if orientation
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if overflow
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if pulse_step
        (_names.to_unsafe + _n).value = "pulse-step".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pulse_step)
        _n += 1
      end
      if receives_default
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if root
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if scale_factor
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if show_text
        (_names.to_unsafe + _n).value = "show-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_text)
        _n += 1
      end
      if text
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end
      if tooltip_markup
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if tooltip_text
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if valign
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if vexpand
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if vexpand_set
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ProgressBar.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_progress_bar_get_type
    end

    def ellipsize=(value : Pango::EllipsizeMode) : Pango::EllipsizeMode
      unsafe_value = value

      LibGObject.g_object_set(self, "ellipsize", unsafe_value, Pointer(Void).null)
      value
    end

    def ellipsize : Pango::EllipsizeMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "ellipsize", pointerof(value), Pointer(Void).null)
      Pango::EllipsizeMode.from_value(value)
    end

    def fraction=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "fraction", unsafe_value, Pointer(Void).null)
      value
    end

    def fraction : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "fraction", pointerof(value), Pointer(Void).null)
      value
    end

    def inverted=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "inverted", unsafe_value, Pointer(Void).null)
      value
    end

    def inverted? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "inverted", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def pulse_step=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "pulse-step", unsafe_value, Pointer(Void).null)
      value
    end

    def pulse_step : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "pulse-step", pointerof(value), Pointer(Void).null)
      value
    end

    def show_text=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-text", unsafe_value, Pointer(Void).null)
      value
    end

    def show_text? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-text", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "text", unsafe_value, Pointer(Void).null)
      value
    end

    def text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize
      # gtk_progress_bar_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_progress_bar_new
      @pointer = _retval
    end

    def ellipsize : Pango::EllipsizeMode
      # gtk_progress_bar_get_ellipsize: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_progress_bar_get_ellipsize(self)
      Pango::EllipsizeMode.from_value(_retval)
    end

    def fraction : Float64
      # gtk_progress_bar_get_fraction: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_progress_bar_get_fraction(self)
      _retval
    end

    def inverted : Bool
      # gtk_progress_bar_get_inverted: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_progress_bar_get_inverted(self)
      GICrystal.to_bool(_retval)
    end

    def pulse_step : Float64
      # gtk_progress_bar_get_pulse_step: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_progress_bar_get_pulse_step(self)
      _retval
    end

    def show_text : Bool
      # gtk_progress_bar_get_show_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_progress_bar_get_show_text(self)
      GICrystal.to_bool(_retval)
    end

    def text : ::String?
      # gtk_progress_bar_get_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_progress_bar_get_text(self)
      ::String.new(_retval) unless _retval.null?
    end

    def pulse : Nil
      # gtk_progress_bar_pulse: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_progress_bar_pulse(self)
    end

    def ellipsize=(mode : Pango::EllipsizeMode) : Nil
      # gtk_progress_bar_set_ellipsize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_progress_bar_set_ellipsize(self, mode)
    end

    def fraction=(fraction : Float64) : Nil
      # gtk_progress_bar_set_fraction: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_progress_bar_set_fraction(self, fraction)
    end

    def inverted=(inverted : Bool) : Nil
      # gtk_progress_bar_set_inverted: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_progress_bar_set_inverted(self, inverted)
    end

    def pulse_step=(fraction : Float64) : Nil
      # gtk_progress_bar_set_pulse_step: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_progress_bar_set_pulse_step(self, fraction)
    end

    def show_text=(show_text : Bool) : Nil
      # gtk_progress_bar_set_show_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_progress_bar_set_show_text(self, show_text)
    end

    def text=(text : ::String?) : Nil
      # gtk_progress_bar_set_text: (Method)
      # @text: (nullable)
      # Returns: (transfer none)

      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      LibGtk.gtk_progress_bar_set_text(self, text)
    end
  end
end
