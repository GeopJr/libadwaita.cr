require "./widget"
require "./accessible"

require "./buildable"

require "./cell_editable"

require "./constraint_target"

require "./editable"

require "./orientable"

module Gtk
  # A `GtkSpinButton` is an ideal way to allow the user to set the
  # value of some attribute.
  #
  # ![An example GtkSpinButton](spinbutton.png)
  #
  # Rather than having to directly type a number into a `GtkEntry`,
  # `GtkSpinButton` allows the user to click on one of two arrows
  # to increment or decrement the displayed value. A value can still be
  # typed in, with the bonus that it can be checked to ensure it is in a
  # given range.
  #
  # The main properties of a `GtkSpinButton` are through an adjustment.
  # See the [class@Gtk.Adjustment] documentation for more details about
  # an adjustment's properties.
  #
  # Note that `GtkSpinButton` will by default make its entry large enough
  # to accommodate the lower and upper bounds of the adjustment. If this
  # is not desired, the automatic sizing can be turned off by explicitly
  # setting [property@Gtk.Editable:width-chars] to a value != -1.
  #
  # ## Using a GtkSpinButton to get an integer
  #
  # ```c
  # // Provides a function to retrieve an integer value from a GtkSpinButton
  # // and creates a spin button to model percentage values.
  #
  # int
  # grab_int_value (GtkSpinButton *button,
  #                 gpointer       user_data)
  # {
  #   return gtk_spin_button_get_value_as_int (button);
  # }
  #
  # void
  # create_integer_spin_button (void)
  # {
  #
  #   GtkWidget *window, *button;
  #   GtkAdjustment *adjustment;
  #
  #   adjustment = gtk_adjustment_new (50.0, 0.0, 100.0, 1.0, 5.0, 0.0);
  #
  #   window = gtk_window_new ();
  #
  #   // creates the spinbutton, with no decimal places
  #   button = gtk_spin_button_new (adjustment, 1.0, 0);
  #   gtk_window_set_child (GTK_WINDOW (window), button);
  #
  #   gtk_widget_show (window);
  # }
  # ```
  #
  # ## Using a GtkSpinButton to get a floating point value
  #
  # ```c
  # // Provides a function to retrieve a floating point value from a
  # // GtkSpinButton, and creates a high precision spin button.
  #
  # float
  # grab_float_value (GtkSpinButton *button,
  #                   gpointer       user_data)
  # {
  #   return gtk_spin_button_get_value (button);
  # }
  #
  # void
  # create_floating_spin_button (void)
  # {
  #   GtkWidget *window, *button;
  #   GtkAdjustment *adjustment;
  #
  #   adjustment = gtk_adjustment_new (2.500, 0.0, 5.0, 0.001, 0.1, 0.0);
  #
  #   window = gtk_window_new ();
  #
  #   // creates the spinbutton, with three decimal places
  #   button = gtk_spin_button_new (adjustment, 0.001, 3);
  #   gtk_window_set_child (GTK_WINDOW (window), button);
  #
  #   gtk_widget_show (window);
  # }
  # ```
  #
  # # CSS nodes
  #
  # ```
  # spinbutton.horizontal
  # ├── text
  # │ ├── undershoot.left
  # │ ╰── undershoot.right
  # ├── button.down
  # ╰── button.up
  # ```
  #
  # ```
  # spinbutton.vertical
  # ├── button.up
  # ├── text
  # │ ├── undershoot.left
  # │ ╰── undershoot.right
  # ╰── button.down
  # ```
  #
  # `GtkSpinButton`s main CSS node has the name spinbutton. It creates subnodes
  # for the entry and the two buttons, with these names. The button nodes have
  # the style classes .up and .down. The `GtkText` subnodes (if present) are put
  # below the text node. The orientation of the spin button is reflected in
  # the .vertical or .horizontal style class on the main node.
  #
  # # Accessiblity
  #
  # `GtkSpinButton` uses the %GTK_ACCESSIBLE_ROLE_SPIN_BUTTON role.
  class SpinButton < Widget
    include Accessible
    include Buildable
    include CellEditable
    include ConstraintTarget
    include Editable
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, adjustment : Gtk::Adjustment? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, climb_rate : Float64? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, cursor_position : Int32? = nil, digits : UInt32? = nil, editable : Bool? = nil, editing_canceled : Bool? = nil, enable_undo : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_width_chars : Int32? = nil, name : ::String? = nil, numeric : Bool? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selection_bound : Int32? = nil, sensitive : Bool? = nil, snap_to_ticks : Bool? = nil, text : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, update_policy : Gtk::SpinButtonUpdatePolicy? = nil, valign : Gtk::Align? = nil, value : Float64? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_chars : Int32? = nil, width_request : Int32? = nil, wrap : Bool? = nil, xalign : Float32? = nil)
      _names = uninitialized Pointer(LibC::Char)[53]
      _values = StaticArray(LibGObject::Value, 53).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if adjustment
        (_names.to_unsafe + _n).value = "adjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, adjustment)
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
      if climb_rate
        (_names.to_unsafe + _n).value = "climb-rate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, climb_rate)
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
      if cursor_position
        (_names.to_unsafe + _n).value = "cursor-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor_position)
        _n += 1
      end
      if digits
        (_names.to_unsafe + _n).value = "digits".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, digits)
        _n += 1
      end
      if editable
        (_names.to_unsafe + _n).value = "editable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable)
        _n += 1
      end
      if editing_canceled
        (_names.to_unsafe + _n).value = "editing-canceled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editing_canceled)
        _n += 1
      end
      if enable_undo
        (_names.to_unsafe + _n).value = "enable-undo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_undo)
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
      if max_width_chars
        (_names.to_unsafe + _n).value = "max-width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width_chars)
        _n += 1
      end
      if name
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if numeric
        (_names.to_unsafe + _n).value = "numeric".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, numeric)
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
      if selection_bound
        (_names.to_unsafe + _n).value = "selection-bound".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selection_bound)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if snap_to_ticks
        (_names.to_unsafe + _n).value = "snap-to-ticks".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, snap_to_ticks)
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
      if update_policy
        (_names.to_unsafe + _n).value = "update-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, update_policy)
        _n += 1
      end
      if valign
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if value
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
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
      if width_chars
        (_names.to_unsafe + _n).value = "width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_chars)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if wrap
        (_names.to_unsafe + _n).value = "wrap".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap)
        _n += 1
      end
      if xalign
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SpinButton.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_spin_button_get_type
    end

    def adjustment=(value : Gtk::Adjustment?) : Gtk::Adjustment?
      unsafe_value = value

      LibGObject.g_object_set(self, "adjustment", unsafe_value, Pointer(Void).null)
      value
    end

    def adjustment : Gtk::Adjustment?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "adjustment", pointerof(value), Pointer(Void).null)
      Gtk::Adjustment.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def climb_rate=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "climb-rate", unsafe_value, Pointer(Void).null)
      value
    end

    def climb_rate : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "climb-rate", pointerof(value), Pointer(Void).null)
      value
    end

    def digits=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "digits", unsafe_value, Pointer(Void).null)
      value
    end

    def digits : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "digits", pointerof(value), Pointer(Void).null)
      value
    end

    def numeric=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "numeric", unsafe_value, Pointer(Void).null)
      value
    end

    def numeric? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "numeric", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def snap_to_ticks=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "snap-to-ticks", unsafe_value, Pointer(Void).null)
      value
    end

    def snap_to_ticks? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "snap-to-ticks", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def update_policy=(value : Gtk::SpinButtonUpdatePolicy) : Gtk::SpinButtonUpdatePolicy
      unsafe_value = value

      LibGObject.g_object_set(self, "update-policy", unsafe_value, Pointer(Void).null)
      value
    end

    def update_policy : Gtk::SpinButtonUpdatePolicy
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "update-policy", pointerof(value), Pointer(Void).null)
      Gtk::SpinButtonUpdatePolicy.from_value(value)
    end

    def value=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "value", unsafe_value, Pointer(Void).null)
      value
    end

    def value : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "value", pointerof(value), Pointer(Void).null)
      value
    end

    def wrap=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "wrap", unsafe_value, Pointer(Void).null)
      value
    end

    def wrap? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "wrap", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def initialize(adjustment : Gtk::Adjustment?, climb_rate : Float64, digits : UInt32)
      # gtk_spin_button_new: (Constructor)
      # @adjustment: (nullable)
      # Returns: (transfer none)

      adjustment = if adjustment.nil?
                     Pointer(Void).null
                   else
                     adjustment.to_unsafe
                   end

      _retval = LibGtk.gtk_spin_button_new(adjustment, climb_rate, digits)
      @pointer = _retval
    end

    def self.new_with_range(min : Float64, max : Float64, step : Float64) : Gtk::Widget
      # gtk_spin_button_new_with_range: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_spin_button_new_with_range(min, max, step)
      Gtk::SpinButton.new(_retval, GICrystal::Transfer::Full)
    end

    def configure(adjustment : Gtk::Adjustment?, climb_rate : Float64, digits : UInt32) : Nil
      # gtk_spin_button_configure: (Method)
      # @adjustment: (nullable)
      # Returns: (transfer none)

      adjustment = if adjustment.nil?
                     Pointer(Void).null
                   else
                     adjustment.to_unsafe
                   end

      LibGtk.gtk_spin_button_configure(self, adjustment, climb_rate, digits)
    end

    def adjustment : Gtk::Adjustment
      # gtk_spin_button_get_adjustment: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_spin_button_get_adjustment(self)
      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    def climb_rate : Float64
      # gtk_spin_button_get_climb_rate: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_spin_button_get_climb_rate(self)
      _retval
    end

    def digits : UInt32
      # gtk_spin_button_get_digits: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_spin_button_get_digits(self)
      _retval
    end

    def increments : Nil
      # gtk_spin_button_get_increments: (Method)
      # @step: (out) (transfer full) (optional)
      # @page: (out) (transfer full) (optional)
      # Returns: (transfer none)

      step = Pointer(Float64).null
      page = Pointer(Float64).null

      LibGtk.gtk_spin_button_get_increments(self, step, page)
    end

    def numeric : Bool
      # gtk_spin_button_get_numeric: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_spin_button_get_numeric(self)
      GICrystal.to_bool(_retval)
    end

    def range : Nil
      # gtk_spin_button_get_range: (Method)
      # @min: (out) (transfer full) (optional)
      # @max: (out) (transfer full) (optional)
      # Returns: (transfer none)

      min = Pointer(Float64).null
      max = Pointer(Float64).null

      LibGtk.gtk_spin_button_get_range(self, min, max)
    end

    def snap_to_ticks : Bool
      # gtk_spin_button_get_snap_to_ticks: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_spin_button_get_snap_to_ticks(self)
      GICrystal.to_bool(_retval)
    end

    def update_policy : Gtk::SpinButtonUpdatePolicy
      # gtk_spin_button_get_update_policy: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_spin_button_get_update_policy(self)
      Gtk::SpinButtonUpdatePolicy.from_value(_retval)
    end

    def value : Float64
      # gtk_spin_button_get_value: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_spin_button_get_value(self)
      _retval
    end

    def value_as_int : Int32
      # gtk_spin_button_get_value_as_int: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_spin_button_get_value_as_int(self)
      _retval
    end

    def wrap : Bool
      # gtk_spin_button_get_wrap: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_spin_button_get_wrap(self)
      GICrystal.to_bool(_retval)
    end

    def adjustment=(adjustment : Gtk::Adjustment) : Nil
      # gtk_spin_button_set_adjustment: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_set_adjustment(self, adjustment)
    end

    def climb_rate=(climb_rate : Float64) : Nil
      # gtk_spin_button_set_climb_rate: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_set_climb_rate(self, climb_rate)
    end

    def digits=(digits : UInt32) : Nil
      # gtk_spin_button_set_digits: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_set_digits(self, digits)
    end

    def set_increments(step : Float64, page : Float64) : Nil
      # gtk_spin_button_set_increments: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_set_increments(self, step, page)
    end

    def numeric=(numeric : Bool) : Nil
      # gtk_spin_button_set_numeric: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_set_numeric(self, numeric)
    end

    def set_range(min : Float64, max : Float64) : Nil
      # gtk_spin_button_set_range: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_set_range(self, min, max)
    end

    def snap_to_ticks=(snap_to_ticks : Bool) : Nil
      # gtk_spin_button_set_snap_to_ticks: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_set_snap_to_ticks(self, snap_to_ticks)
    end

    def update_policy=(policy : Gtk::SpinButtonUpdatePolicy) : Nil
      # gtk_spin_button_set_update_policy: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_set_update_policy(self, policy)
    end

    def value=(value : Float64) : Nil
      # gtk_spin_button_set_value: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_set_value(self, value)
    end

    def wrap=(wrap : Bool) : Nil
      # gtk_spin_button_set_wrap: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_set_wrap(self, wrap)
    end

    def spin(direction : Gtk::SpinType, increment : Float64) : Nil
      # gtk_spin_button_spin: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_spin(self, direction, increment)
    end

    def update : Nil
      # gtk_spin_button_update: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_spin_button_update(self)
    end

    struct ChangeValueSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "change-value::#{@detail}" : "change-value"
      end

      def connect(&block : Proc(Gtk::ScrollType, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ScrollType, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::SpinButton, Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::SpinButton.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::SpinButton, Gtk::ScrollType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SpinButton, Gtk::ScrollType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::SpinButton.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ScrollType.from_value(lib_arg0)
          ::Box(Proc(Gtk::SpinButton, Gtk::ScrollType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(scroll : Gtk::ScrollType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "change-value", scroll)
      end
    end

    def change_value_signal
      ChangeValueSignal.new(self)
    end

    struct InputSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "input::#{@detail}" : "input"
      end

      def connect(&block : Proc(Float64, Int32))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Int32))
        connect(block)
      end

      def connect(block : Proc(Float64, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Float64, Int32)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Float64, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Float64, Int32)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::SpinButton, Float64, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          sender = Gtk::SpinButton.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::SpinButton, Float64, Int32)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SpinButton, Float64, Int32))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Float64, box : Pointer(Void)) {
          sender = Gtk::SpinButton.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::SpinButton, Float64, Int32)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(new_value : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "input", new_value)
      end
    end

    def input_signal
      InputSignal.new(self)
    end

    struct OutputSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "output::#{@detail}" : "output"
      end

      def connect(&block : Proc(Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool))
        connect(block)
      end

      def connect(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::SpinButton, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SpinButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SpinButton, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SpinButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Bool)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "output")
      end
    end

    def output_signal
      OutputSignal.new(self)
    end

    struct ValueChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "value-changed::#{@detail}" : "value-changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::SpinButton, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SpinButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SpinButton, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SpinButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "value-changed")
      end
    end

    def value_changed_signal
      ValueChangedSignal.new(self)
    end

    struct WrappedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "wrapped::#{@detail}" : "wrapped"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::SpinButton, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SpinButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SpinButton, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SpinButton.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "wrapped")
      end
    end

    def wrapped_signal
      WrappedSignal.new(self)
    end
  end
end
