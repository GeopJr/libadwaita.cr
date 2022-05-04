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
  # See the `Gtk#Adjustment` documentation for more details about
  # an adjustment's properties.
  #
  # Note that `GtkSpinButton` will by default make its entry large enough
  # to accommodate the lower and upper bounds of the adjustment. If this
  # is not desired, the automatic sizing can be turned off by explicitly
  # setting [property@Gtk.Editable:width-chars] to a value != -1.
  #
  # ## Using a GtkSpinButton to get an integer
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  @[GObject::GeneratedWrapper]
  class SpinButton < Widget
    include Accessible
    include Buildable
    include CellEditable
    include ConstraintTarget
    include Editable
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::SpinButton), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, adjustment : Gtk::Adjustment? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, climb_rate : Float64? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, cursor_position : Int32? = nil, digits : UInt32? = nil, editable : Bool? = nil, editing_canceled : Bool? = nil, enable_undo : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_width_chars : Int32? = nil, name : ::String? = nil, numeric : Bool? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selection_bound : Int32? = nil, sensitive : Bool? = nil, snap_to_ticks : Bool? = nil, text : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, update_policy : Gtk::SpinButtonUpdatePolicy? = nil, valign : Gtk::Align? = nil, value : Float64? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_chars : Int32? = nil, width_request : Int32? = nil, wrap : Bool? = nil, xalign : Float32? = nil)
      _names = uninitialized Pointer(LibC::Char)[53]
      _values = StaticArray(LibGObject::Value, 53).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !adjustment.nil?
        (_names.to_unsafe + _n).value = "adjustment".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, adjustment)
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
      if !climb_rate.nil?
        (_names.to_unsafe + _n).value = "climb-rate".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, climb_rate)
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
      if !cursor_position.nil?
        (_names.to_unsafe + _n).value = "cursor-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor_position)
        _n += 1
      end
      if !digits.nil?
        (_names.to_unsafe + _n).value = "digits".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, digits)
        _n += 1
      end
      if !editable.nil?
        (_names.to_unsafe + _n).value = "editable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable)
        _n += 1
      end
      if !editing_canceled.nil?
        (_names.to_unsafe + _n).value = "editing-canceled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editing_canceled)
        _n += 1
      end
      if !enable_undo.nil?
        (_names.to_unsafe + _n).value = "enable-undo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_undo)
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
      if !max_width_chars.nil?
        (_names.to_unsafe + _n).value = "max-width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width_chars)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !numeric.nil?
        (_names.to_unsafe + _n).value = "numeric".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, numeric)
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
      if !selection_bound.nil?
        (_names.to_unsafe + _n).value = "selection-bound".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selection_bound)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !snap_to_ticks.nil?
        (_names.to_unsafe + _n).value = "snap-to-ticks".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, snap_to_ticks)
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
      if !update_policy.nil?
        (_names.to_unsafe + _n).value = "update-policy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, update_policy)
        _n += 1
      end
      if !valign.nil?
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if !value.nil?
        (_names.to_unsafe + _n).value = "value".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, value)
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
      if !width_chars.nil?
        (_names.to_unsafe + _n).value = "width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_chars)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if !wrap.nil?
        (_names.to_unsafe + _n).value = "wrap".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap)
        _n += 1
      end
      if !xalign.nil?
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SpinButton.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gtk::SpinButtonUpdatePolicy.new(value)
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

    # Creates a new `GtkSpinButton`.
    def initialize(adjustment : Gtk::Adjustment?, climb_rate : Float64, digits : UInt32)
      # gtk_spin_button_new: (Constructor)
      # @adjustment: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      adjustment = if adjustment.nil?
                     Pointer(Void).null
                   else
                     adjustment.to_unsafe
                   end

      # C call
      _retval = LibGtk.gtk_spin_button_new(adjustment, climb_rate, digits)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new `GtkSpinButton` with the given properties.
    #
    # This is a convenience constructor that allows creation
    # of a numeric `GtkSpinButton` without manually creating
    # an adjustment. The value is initially set to the minimum
    # value and a page increment of 10 * @step is the default.
    # The precision of the spin button is equivalent to the
    # precision of @step.
    #
    # Note that the way in which the precision is derived works
    # best if @step is a power of ten. If the resulting precision
    # is not suitable for your needs, use
    # `Gtk::SpinButton#digits=` to correct it.
    def self.new_with_range(min : Float64, max : Float64, step : Float64) : self
      # gtk_spin_button_new_with_range: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_spin_button_new_with_range(min, max, step)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::SpinButton.new(_retval, GICrystal::Transfer::Full)
    end

    # Changes the properties of an existing spin button.
    #
    # The adjustment, climb rate, and number of decimal places
    # are updated accordingly.
    def configure(adjustment : Gtk::Adjustment?, climb_rate : Float64, digits : UInt32) : Nil
      # gtk_spin_button_configure: (Method)
      # @adjustment: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      adjustment = if adjustment.nil?
                     Pointer(Void).null
                   else
                     adjustment.to_unsafe
                   end

      # C call
      LibGtk.gtk_spin_button_configure(self, adjustment, climb_rate, digits)

      # Return value handling
    end

    # Get the adjustment associated with a `GtkSpinButton`.
    def adjustment : Gtk::Adjustment
      # gtk_spin_button_get_adjustment: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_spin_button_get_adjustment(self)

      # Return value handling

      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the acceleration rate for repeated changes.
    def climb_rate : Float64
      # gtk_spin_button_get_climb_rate: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_spin_button_get_climb_rate(self)

      # Return value handling

      _retval
    end

    # Fetches the precision of @spin_button.
    def digits : UInt32
      # gtk_spin_button_get_digits: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_spin_button_get_digits(self)

      # Return value handling

      _retval
    end

    # Gets the current step and page the increments
    # used by @spin_button.
    #
    # See `Gtk::SpinButton#increments=`.
    def increments : Nil
      # gtk_spin_button_get_increments: (Method)
      # @step: (out) (transfer full) (optional)
      # @page: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      step = Pointer(Float64).null # Generator::OutArgUsedInReturnPlan
      page = Pointer(Float64).null
      # C call
      LibGtk.gtk_spin_button_get_increments(self, step, page)

      # Return value handling
    end

    # Returns whether non-numeric text can be typed into the spin button.
    def numeric : Bool
      # gtk_spin_button_get_numeric: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_spin_button_get_numeric(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the range allowed for @spin_button.
    #
    # See `Gtk::SpinButton#range=`.
    def range : Nil
      # gtk_spin_button_get_range: (Method)
      # @min: (out) (transfer full) (optional)
      # @max: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      min = Pointer(Float64).null # Generator::OutArgUsedInReturnPlan
      max = Pointer(Float64).null
      # C call
      LibGtk.gtk_spin_button_get_range(self, min, max)

      # Return value handling
    end

    # Returns whether the values are corrected to the nearest step.
    def snap_to_ticks : Bool
      # gtk_spin_button_get_snap_to_ticks: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_spin_button_get_snap_to_ticks(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the update behavior of a spin button.
    #
    # See `Gtk::SpinButton#update_policy=`.
    def update_policy : Gtk::SpinButtonUpdatePolicy
      # gtk_spin_button_get_update_policy: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_spin_button_get_update_policy(self)

      # Return value handling

      Gtk::SpinButtonUpdatePolicy.new(_retval)
    end

    # Get the value in the @spin_button.
    def value : Float64
      # gtk_spin_button_get_value: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_spin_button_get_value(self)

      # Return value handling

      _retval
    end

    # Get the value @spin_button represented as an integer.
    def value_as_int : Int32
      # gtk_spin_button_get_value_as_int: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_spin_button_get_value_as_int(self)

      # Return value handling

      _retval
    end

    # Returns whether the spin button’s value wraps around to the
    # opposite limit when the upper or lower limit of the range is
    # exceeded.
    def wrap : Bool
      # gtk_spin_button_get_wrap: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_spin_button_get_wrap(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Replaces the `GtkAdjustment` associated with @spin_button.
    def adjustment=(adjustment : Gtk::Adjustment) : Nil
      # gtk_spin_button_set_adjustment: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_set_adjustment(self, adjustment)

      # Return value handling
    end

    # Sets the acceleration rate for repeated changes when you
    # hold down a button or key.
    def climb_rate=(climb_rate : Float64) : Nil
      # gtk_spin_button_set_climb_rate: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_set_climb_rate(self, climb_rate)

      # Return value handling
    end

    # Set the precision to be displayed by @spin_button.
    #
    # Up to 20 digit precision is allowed.
    def digits=(digits : UInt32) : Nil
      # gtk_spin_button_set_digits: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_set_digits(self, digits)

      # Return value handling
    end

    # Sets the step and page increments for spin_button.
    #
    # This affects how quickly the value changes when
    # the spin button’s arrows are activated.
    def set_increments(step : Float64, page : Float64) : Nil
      # gtk_spin_button_set_increments: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_set_increments(self, step, page)

      # Return value handling
    end

    # Sets the flag that determines if non-numeric text can be typed
    # into the spin button.
    def numeric=(numeric : Bool) : Nil
      # gtk_spin_button_set_numeric: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_set_numeric(self, numeric)

      # Return value handling
    end

    # Sets the minimum and maximum allowable values for @spin_button.
    #
    # If the current value is outside this range, it will be adjusted
    # to fit within the range, otherwise it will remain unchanged.
    def set_range(min : Float64, max : Float64) : Nil
      # gtk_spin_button_set_range: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_set_range(self, min, max)

      # Return value handling
    end

    # Sets the policy as to whether values are corrected to the
    # nearest step increment when a spin button is activated after
    # providing an invalid value.
    def snap_to_ticks=(snap_to_ticks : Bool) : Nil
      # gtk_spin_button_set_snap_to_ticks: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_set_snap_to_ticks(self, snap_to_ticks)

      # Return value handling
    end

    # Sets the update behavior of a spin button.
    #
    # This determines whether the spin button is always
    # updated or only when a valid value is set.
    def update_policy=(policy : Gtk::SpinButtonUpdatePolicy) : Nil
      # gtk_spin_button_set_update_policy: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_set_update_policy(self, policy)

      # Return value handling
    end

    # Sets the value of @spin_button.
    def value=(value : Float64) : Nil
      # gtk_spin_button_set_value: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_set_value(self, value)

      # Return value handling
    end

    # Sets the flag that determines if a spin button value wraps
    # around to the opposite limit when the upper or lower limit
    # of the range is exceeded.
    def wrap=(wrap : Bool) : Nil
      # gtk_spin_button_set_wrap: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_set_wrap(self, wrap)

      # Return value handling
    end

    # Increment or decrement a spin button’s value in a specified
    # direction by a specified amount.
    def spin(direction : Gtk::SpinType, increment : Float64) : Nil
      # gtk_spin_button_spin: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_spin(self, direction, increment)

      # Return value handling
    end

    # Manually force an update of the spin button.
    def update : Nil
      # gtk_spin_button_update: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_spin_button_update(self)

      # Return value handling
    end

    # Emitted when the user initiates a value change.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # Applications should not connect to it, but may emit it with
    # g_signal_emit_by_name() if they need to control the cursor
    # programmatically.
    #
    # The default bindings for this signal are Up/Down and PageUp/PageDown.
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

      def connect(handler : Proc(Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll : UInt32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          scroll = Gtk::ScrollType.new(lib_scroll, :none)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(_lib_box).call(scroll)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll : UInt32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          scroll = Gtk::ScrollType.new(lib_scroll, :none)
          ::Box(Proc(Gtk::ScrollType, Nil)).unbox(_lib_box).call(scroll)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::SpinButton, Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::SpinButton.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          scroll = Gtk::ScrollType.new(lib_scroll, :none)
          ::Box(Proc(Gtk::SpinButton, Gtk::ScrollType, Nil)).unbox(_lib_box).call(_sender, scroll)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::SpinButton, Gtk::ScrollType, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_scroll : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::SpinButton.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          scroll = Gtk::ScrollType.new(lib_scroll, :none)
          ::Box(Proc(Gtk::SpinButton, Gtk::ScrollType, Nil)).unbox(_lib_box).call(_sender, scroll)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(scroll : Gtk::ScrollType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "change-value", scroll)
      end
    end

    def change_value_signal
      ChangeValueSignal.new(self)
    end

    # Emitted to convert the users input into a double value.
    #
    # The signal handler is expected to use `Gtk::Editable#text`
    # to retrieve the text of the spinbutton and set @new_value to the
    # new value.
    #
    # The default conversion uses g_strtod().
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

      def connect(handler : Proc(Float64, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_new_value : Float64, _lib_box : Pointer(Void)) {
          new_value = lib_new_value
          ::Box(Proc(Float64, Int32)).unbox(_lib_box).call(new_value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_new_value : Float64, _lib_box : Pointer(Void)) {
          new_value = lib_new_value
          ::Box(Proc(Float64, Int32)).unbox(_lib_box).call(new_value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::SpinButton, Float64, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_new_value : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::SpinButton.new(_lib_sender, GICrystal::Transfer::None)
          new_value = lib_new_value
          ::Box(Proc(Gtk::SpinButton, Float64, Int32)).unbox(_lib_box).call(_sender, new_value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::SpinButton, Float64, Int32))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_new_value : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::SpinButton.new(_lib_sender, GICrystal::Transfer::None)
          new_value = lib_new_value
          ::Box(Proc(Gtk::SpinButton, Float64, Int32)).unbox(_lib_box).call(_sender, new_value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(new_value : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "input", new_value)
      end
    end

    def input_signal
      InputSignal.new(self)
    end

    # Emitted to tweak the formatting of the value for display.
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # // show leading zeros
    # static gboolean
    # on_output (GtkSpinButton *spin,
    #            gpointer       data)
    # {
    #    GtkAdjustment *adjustment;
    #    char *text;
    #    int value;
    #
    #    adjustment = gtk_spin_button_get_adjustment (spin);
    #    value = (int)gtk_adjustment_get_value (adjustment);
    #    text = g_strdup_printf ("%02d", value);
    #    gtk_spin_button_set_text (spin, text):
    #    g_free (text);
    #
    #    return TRUE;
    # }
    # ```
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

      def connect(handler : Proc(Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Bool)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::SpinButton, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SpinButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::SpinButton, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SpinButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Bool)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "output")
      end
    end

    def output_signal
      OutputSignal.new(self)
    end

    # Emitted when the value is changed.
    #
    # Also see the `Gtk::SpinButton::#output` signal.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::SpinButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SpinButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::SpinButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SpinButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "value-changed")
      end
    end

    def value_changed_signal
      ValueChangedSignal.new(self)
    end

    # Emitted right after the spinbutton wraps from its maximum
    # to its minimum value or vice-versa.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::SpinButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SpinButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::SpinButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SpinButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SpinButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
