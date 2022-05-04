require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./orientable"

module Gtk
  # `GtkScaleButton` provides a button which pops up a scale widget.
  #
  # This kind of widget is commonly used for volume controls in multimedia
  # applications, and GTK provides a `Gtk#VolumeButton` subclass that
  # is tailored for this use case.
  #
  # # CSS nodes
  #
  # `GtkScaleButton` has a single CSS node with name button. To differentiate
  # it from a plain `GtkButton`, it gets the .scale style class.
  @[GObject::GeneratedWrapper]
  class ScaleButton < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include Orientable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ScaleButtonClass), class_init,
        sizeof(LibGtk::ScaleButton), instance_init, 0)
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, adjustment : Gtk::Adjustment? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, icons : Enumerable(::String)? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, orientation : Gtk::Orientation? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, value : Float64? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[39]
      _values = StaticArray(LibGObject::Value, 39).new(LibGObject::Value.new)
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
      if !icons.nil?
        (_names.to_unsafe + _n).value = "icons".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icons)
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
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ScaleButton.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_scale_button_get_type
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

    def icons=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "icons", unsafe_value, Pointer(Void).null)
      value
    end

    def icons : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "icons", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
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

    # Creates a `GtkScaleButton`.
    #
    # The new scale button has a range between @min and @max,
    # with a stepping of @step.
    def initialize(min : Float64, max : Float64, step : Float64, icons : Enumerable(::String)?)
      # gtk_scale_button_new: (Constructor)
      # @icons: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      icons = if icons.nil?
                Pointer(Pointer(LibC::Char)).null
              else
                icons.to_a.map(&.to_unsafe).to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_scale_button_new(min, max, step, icons)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the `GtkAdjustment` associated with the `GtkScaleButton`’s scale.
    #
    # See `Gtk::Range#adjustment` for details.
    def adjustment : Gtk::Adjustment
      # gtk_scale_button_get_adjustment: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scale_button_get_adjustment(self)

      # Return value handling

      Gtk::Adjustment.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the minus button of the `GtkScaleButton`.
    def minus_button : Gtk::Button
      # gtk_scale_button_get_minus_button: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scale_button_get_minus_button(self)

      # Return value handling

      Gtk::Button.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the plus button of the `GtkScaleButton.`
    def plus_button : Gtk::Button
      # gtk_scale_button_get_plus_button: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scale_button_get_plus_button(self)

      # Return value handling

      Gtk::Button.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves the popup of the `GtkScaleButton`.
    def popup : Gtk::Widget
      # gtk_scale_button_get_popup: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scale_button_get_popup(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the current value of the scale button.
    def value : Float64
      # gtk_scale_button_get_value: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_scale_button_get_value(self)

      # Return value handling

      _retval
    end

    # Sets the `GtkAdjustment` to be used as a model
    # for the `GtkScaleButton`’s scale.
    #
    # See `Gtk::Range#adjustment=` for details.
    def adjustment=(adjustment : Gtk::Adjustment) : Nil
      # gtk_scale_button_set_adjustment: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scale_button_set_adjustment(self, adjustment)

      # Return value handling
    end

    # Sets the icons to be used by the scale button.
    def icons=(icons : Enumerable(::String)) : Nil
      # gtk_scale_button_set_icons: (Method | Setter)
      # @icons: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      icons = icons.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_scale_button_set_icons(self, icons)

      # Return value handling
    end

    # Sets the current value of the scale.
    #
    # If the value is outside the minimum or maximum range values,
    # it will be clamped to fit inside them.
    #
    # The scale button emits the [signal@Gtk.ScaleButton::value-changed]
    # signal if the value changes.
    def value=(value : Float64) : Nil
      # gtk_scale_button_set_value: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_scale_button_set_value(self, value)

      # Return value handling
    end

    # Emitted to dismiss the popup.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is <kbd>Escape</kbd>.
    struct PopdownSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "popdown::#{@detail}" : "popdown"
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

      def connect(handler : Proc(Gtk::ScaleButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ScaleButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ScaleButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ScaleButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ScaleButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ScaleButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "popdown")
      end
    end

    def popdown_signal
      PopdownSignal.new(self)
    end

    # Emitted to popup the scale widget.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # The default bindings for this signal are <kbd>Space</kbd>,
    # <kbd>Enter</kbd> and <kbd>Return</kbd>.
    struct PopupSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "popup::#{@detail}" : "popup"
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

      def connect(handler : Proc(Gtk::ScaleButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ScaleButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ScaleButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ScaleButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ScaleButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ScaleButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "popup")
      end
    end

    def popup_signal
      PopupSignal.new(self)
    end

    # Emitted when the value field has changed.
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

      def connect(&block : Proc(Float64, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Float64, Nil))
        connect(block)
      end

      def connect(handler : Proc(Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Float64, _lib_box : Pointer(Void)) {
          value = lib_value
          ::Box(Proc(Float64, Nil)).unbox(_lib_box).call(value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Float64, _lib_box : Pointer(Void)) {
          value = lib_value
          ::Box(Proc(Float64, Nil)).unbox(_lib_box).call(value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::ScaleButton, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::ScaleButton.new(_lib_sender, GICrystal::Transfer::None)
          value = lib_value
          ::Box(Proc(Gtk::ScaleButton, Float64, Nil)).unbox(_lib_box).call(_sender, value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ScaleButton, Float64, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_value : Float64, _lib_box : Pointer(Void)) {
          _sender = Gtk::ScaleButton.new(_lib_sender, GICrystal::Transfer::None)
          value = lib_value
          ::Box(Proc(Gtk::ScaleButton, Float64, Nil)).unbox(_lib_box).call(_sender, value)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(value : Float64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "value-changed", value)
      end
    end

    def value_changed_signal
      ValueChangedSignal.new(self)
    end
  end
end
