require "./button"
require "./accessible"

require "./actionable"

require "./buildable"

require "./constraint_target"

module Gtk
  # A `GtkToggleButton` is a button which remains “pressed-in” when
  # clicked.
  #
  # Clicking again will cause the toggle button to return to its normal state.
  #
  # A toggle button is created by calling either `Gtk::ToggleButton.new` or
  # `Gtk::ToggleButton#new_with_label`. If using the former, it is advisable
  # to pack a widget, (such as a `GtkLabel` and/or a `GtkImage`), into the toggle
  # button’s container. (See `Gtk#Button` for more information).
  #
  # The state of a `GtkToggleButton` can be set specifically using
  # `Gtk::ToggleButton#active=`, and retrieved using
  # `Gtk::ToggleButton#active`.
  #
  # To simply switch the state of a toggle button, use
  # `Gtk::ToggleButton#toggled`.
  #
  # ## Grouping
  #
  # Toggle buttons can be grouped together, to form mutually exclusive
  # groups - only one of the buttons can be toggled at a time, and toggling
  # another one will switch the currently toggled one off.
  #
  # To add a `GtkToggleButton` to a group, use `Gtk::ToggleButton#group=`.
  #
  # ## CSS nodes
  #
  # `GtkToggleButton` has a single CSS node with name button. To differentiate
  # it from a plain `GtkButton`, it gets the `.toggle` style class.
  #
  # ## Creating two `GtkToggleButton` widgets.
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # output_state (GtkToggleButton *source,
  #               gpointer         user_data)
  # {
  #   g_print ("Toggle button "%s" is active: %s",
  #            gtk_button_get_label (GTK_BUTTON (source)),
  #            gtk_toggle_button_get_active (source) ? "Yes" : "No");
  # }
  #
  # static void
  # make_toggles (void)
  # {
  #   GtkWidget *window, *toggle1, *toggle2;
  #   GtkWidget *box;
  #   const char *text;
  #
  #   window = gtk_window_new ();
  #   box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 12);
  #
  #   text = "Hi, I’m toggle button one";
  #   toggle1 = gtk_toggle_button_new_with_label (text);
  #
  #   g_signal_connect (toggle1, "toggled",
  #                     G_CALLBACK (output_state),
  #                     NULL);
  #   gtk_box_append (GTK_BOX (box), toggle1);
  #
  #   text = "Hi, I’m toggle button two";
  #   toggle2 = gtk_toggle_button_new_with_label (text);
  #   g_signal_connect (toggle2, "toggled",
  #                     G_CALLBACK (output_state),
  #                     NULL);
  #   gtk_box_append (GTK_BOX (box), toggle2);
  #
  #   gtk_window_set_child (GTK_WINDOW (window), box);
  #   gtk_widget_show (window);
  # }
  # ```
  @[GObject::GeneratedWrapper]
  class ToggleButton < Button
    include Accessible
    include Actionable
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ToggleButtonClass), class_init,
        sizeof(LibGtk::ToggleButton), instance_init, 0)
    end

    GICrystal.define_new_method(ToggleButton, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ToggleButton`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, action_name : ::String? = nil, action_target : GLib::Variant? = nil, active : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, group : Gtk::ToggleButton? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_frame : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, icon_name : ::String? = nil, label : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[44]
      _values = StaticArray(LibGObject::Value, 44).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !action_name.nil?
        (_names.to_unsafe + _n).value = "action-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_name)
        _n += 1
      end
      if !action_target.nil?
        (_names.to_unsafe + _n).value = "action-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_target)
        _n += 1
      end
      if !active.nil?
        (_names.to_unsafe + _n).value = "active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active)
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
      if !child.nil?
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
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
      if !group.nil?
        (_names.to_unsafe + _n).value = "group".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, group)
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
      if !has_frame.nil?
        (_names.to_unsafe + _n).value = "has-frame".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_frame)
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
      if !icon_name.nil?
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if !label.nil?
        (_names.to_unsafe + _n).value = "label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, label)
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
      if !use_underline.nil?
        (_names.to_unsafe + _n).value = "use-underline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_underline)
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

      @pointer = LibGObject.g_object_new_with_properties(ToggleButton.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_toggle_button_get_type
    end

    def active=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "active", unsafe_value, Pointer(Void).null)
      value
    end

    def active? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "active", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def group=(value : Gtk::ToggleButton?) : Gtk::ToggleButton?
      unsafe_value = value

      LibGObject.g_object_set(self, "group", unsafe_value, Pointer(Void).null)
      value
    end

    # Creates a new toggle button.
    #
    # A widget should be packed into the button, as in `Gtk::Button.new`.
    def initialize
      # gtk_toggle_button_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_toggle_button_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new toggle button with a text label.
    def self.new_with_label(label : ::String) : self
      # gtk_toggle_button_new_with_label: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_toggle_button_new_with_label(label)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::ToggleButton.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `GtkToggleButton` containing a label.
    #
    # The label will be created using `Gtk::Label#new_with_mnemonic`,
    # so underscores in @label indicate the mnemonic for the button.
    def self.new_with_mnemonic(label : ::String) : self
      # gtk_toggle_button_new_with_mnemonic: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_toggle_button_new_with_mnemonic(label)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::ToggleButton.new(_retval, GICrystal::Transfer::Full)
    end

    # Queries a `GtkToggleButton` and returns its current state.
    #
    # Returns %TRUE if the toggle button is pressed in and %FALSE
    # if it is raised.
    def active : Bool
      # gtk_toggle_button_get_active: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_toggle_button_get_active(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the status of the toggle button.
    #
    # Set to %TRUE if you want the `GtkToggleButton` to be “pressed in”,
    # and %FALSE to raise it.
    #
    # If the status of the button changes, this action causes the
    # `GtkToggleButton::#toggled` signal to be emitted.
    def active=(is_active : Bool) : Nil
      # gtk_toggle_button_set_active: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_toggle_button_set_active(@pointer, is_active)

      # Return value handling
    end

    # Adds @self to the group of @group.
    #
    # In a group of multiple toggle buttons, only one button can be active
    # at a time.
    #
    # Setting up groups in a cycle leads to undefined behavior.
    #
    # Note that the same effect can be achieved via the `Gtk#Actionable`
    # API, by using the same action with parameter type and state type 's'
    # for all buttons in the group, and giving each button its own target
    # value.
    def group=(group : Gtk::ToggleButton?) : Nil
      # gtk_toggle_button_set_group: (Method | Setter)
      # @group: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      group = if group.nil?
                Pointer(Void).null
              else
                group.to_unsafe
              end

      # C call
      LibGtk.gtk_toggle_button_set_group(@pointer, group)

      # Return value handling
    end

    # Emits the ::toggled signal on the `GtkToggleButton`.
    #
    # There is no good reason for an application ever to call this function.
    def toggled : Nil
      # gtk_toggle_button_toggled: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_toggle_button_toggled(@pointer)

      # Return value handling
    end

    # Emitted whenever the `GtkToggleButton`'s state is changed.
    struct ToggledSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "toggled::#{@detail}" : "toggled"
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

      def connect(handler : Proc(Gtk::ToggleButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ToggleButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ToggleButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ToggleButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::ToggleButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ToggleButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "toggled")
      end
    end

    def toggled_signal
      ToggledSignal.new(self)
    end
  end
end
