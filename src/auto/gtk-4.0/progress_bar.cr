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
  # `Gtk::ProgressBar#fraction=` periodically to update the progress bar.
  #
  # When an application has no accurate way of knowing the amount of work
  # to do, it can use the `GtkProgressBar` in activity mode, which shows
  # activity by a block moving back and forth within the progress area. In
  # this mode, the application is required to call `Gtk::ProgressBar#pulse`
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
  @[GObject::GeneratedWrapper]
  class ProgressBar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(ProgressBar, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ProgressBar`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, ellipsize : Pango::EllipsizeMode? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, fraction : Float64? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, inverted : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, pulse_step : Float64? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_text : Bool? = nil, text : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[42]
      _values = StaticArray(LibGObject::Value, 42).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !can_focus.nil?
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if !can_target.nil?
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if !css_classes.nil?
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if !css_name.nil?
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if !cursor.nil?
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if !ellipsize.nil?
        (_names.to_unsafe + _n).value = "ellipsize".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ellipsize)
        _n += 1
      end
      if !focus_on_click.nil?
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if !focusable.nil?
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if !fraction.nil?
        (_names.to_unsafe + _n).value = "fraction".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fraction)
        _n += 1
      end
      if !halign.nil?
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if !has_default.nil?
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if !has_focus.nil?
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if !has_tooltip.nil?
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if !height_request.nil?
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if !hexpand.nil?
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if !hexpand_set.nil?
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if !inverted.nil?
        (_names.to_unsafe + _n).value = "inverted".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inverted)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !margin_bottom.nil?
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if !margin_end.nil?
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if !margin_start.nil?
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if !margin_top.nil?
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !opacity.nil?
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if !orientation.nil?
        (_names.to_unsafe + _n).value = "orientation".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, orientation)
        _n += 1
      end
      if !overflow.nil?
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !pulse_step.nil?
        (_names.to_unsafe + _n).value = "pulse-step".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pulse_step)
        _n += 1
      end
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !root.nil?
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !show_text.nil?
        (_names.to_unsafe + _n).value = "show-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_text)
        _n += 1
      end
      if !text.nil?
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end
      if !tooltip_markup.nil?
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if !tooltip_text.nil?
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if !valign.nil?
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if !vexpand.nil?
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if !vexpand_set.nil?
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ProgressBar.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Pango::EllipsizeMode.new(value)
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

    # Returns the ellipsizing position of the progress bar.
    #
    # See `Gtk::ProgressBar#ellipsize=`.
    def ellipsize : Pango::EllipsizeMode
      # gtk_progress_bar_get_ellipsize: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_progress_bar_get_ellipsize(@pointer)

      # Return value handling

      Pango::EllipsizeMode.new(_retval)
    end

    # Returns the current fraction of the task that’s been completed.
    def fraction : Float64
      # gtk_progress_bar_get_fraction: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_progress_bar_get_fraction(@pointer)

      # Return value handling

      _retval
    end

    # Returns whether the progress bar is inverted.
    def inverted : Bool
      # gtk_progress_bar_get_inverted: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_progress_bar_get_inverted(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the pulse step.
    #
    # See `Gtk::ProgressBar#pulse_step=`.
    def pulse_step : Float64
      # gtk_progress_bar_get_pulse_step: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_progress_bar_get_pulse_step(@pointer)

      # Return value handling

      _retval
    end

    # Returns whether the `GtkProgressBar` shows text.
    #
    # See `Gtk::ProgressBar#show_text=`.
    def show_text : Bool
      # gtk_progress_bar_get_show_text: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_progress_bar_get_show_text(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the text that is displayed with the progress bar.
    #
    # The return value is a reference to the text, not a copy of it,
    # so will become invalid if you change the text in the progress bar.
    def text : ::String?
      # gtk_progress_bar_get_text: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_progress_bar_get_text(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Indicates that some progress has been made, but you don’t know how much.
    #
    # Causes the progress bar to enter “activity mode,” where a block
    # bounces back and forth. Each call to `Gtk::ProgressBar#pulse`
    # causes the block to move by a little bit (the amount of movement
    # per pulse is determined by `Gtk::ProgressBar#pulse_step=`).
    def pulse : Nil
      # gtk_progress_bar_pulse: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_progress_bar_pulse(@pointer)

      # Return value handling
    end

    # Sets the mode used to ellipsize the text.
    #
    # The text is ellipsized if there is not enough space
    # to render the entire string.
    def ellipsize=(mode : Pango::EllipsizeMode) : Nil
      # gtk_progress_bar_set_ellipsize: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_progress_bar_set_ellipsize(@pointer, mode)

      # Return value handling
    end

    # Causes the progress bar to “fill in” the given fraction
    # of the bar.
    #
    # The fraction should be between 0.0 and 1.0, inclusive.
    def fraction=(fraction : Float64) : Nil
      # gtk_progress_bar_set_fraction: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_progress_bar_set_fraction(@pointer, fraction)

      # Return value handling
    end

    # Sets whether the progress bar is inverted.
    #
    # Progress bars normally grow from top to bottom or left to right.
    # Inverted progress bars grow in the opposite direction.
    def inverted=(inverted : Bool) : Nil
      # gtk_progress_bar_set_inverted: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_progress_bar_set_inverted(@pointer, inverted)

      # Return value handling
    end

    # Sets the fraction of total progress bar length to move the
    # bouncing block.
    #
    # The bouncing block is moved when `Gtk::ProgressBar#pulse`
    # is called.
    def pulse_step=(fraction : Float64) : Nil
      # gtk_progress_bar_set_pulse_step: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_progress_bar_set_pulse_step(@pointer, fraction)

      # Return value handling
    end

    # Sets whether the progress bar will show text next to the bar.
    #
    # The shown text is either the value of the `Gtk::ProgressBar#text`
    # property or, if that is %NULL, the `Gtk::ProgressBar#fraction` value,
    # as a percentage.
    #
    # To make a progress bar that is styled and sized suitably for containing
    # text (even if the actual text is blank), set [property@Gtk.ProgressBar:show-text]
    # to %TRUE and `Gtk::ProgressBar#text` to the empty string (not %NULL).
    def show_text=(show_text : Bool) : Nil
      # gtk_progress_bar_set_show_text: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_progress_bar_set_show_text(@pointer, show_text)

      # Return value handling
    end

    # Causes the given @text to appear next to the progress bar.
    #
    # If @text is %NULL and [property@Gtk.ProgressBar:show-text] is %TRUE,
    # the current value of `Gtk::ProgressBar#fraction` will be displayed
    # as a percentage.
    #
    # If @text is non-%NULL and [property@Gtk.ProgressBar:show-text] is %TRUE,
    # the text will be displayed. In this case, it will not display the progress
    # percentage. If @text is the empty string, the progress bar will still
    # be styled and sized suitably for containing text, as long as
    # [property@Gtk.ProgressBar:show-text] is %TRUE.
    def text=(text : ::String?) : Nil
      # gtk_progress_bar_set_text: (Method | Setter)
      # @text: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      # C call
      LibGtk.gtk_progress_bar_set_text(@pointer, text)

      # Return value handling
    end
  end
end
