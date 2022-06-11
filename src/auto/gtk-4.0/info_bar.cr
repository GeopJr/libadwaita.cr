require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkInfoBar` can be show messages to the user without a dialog.
  #
  # ![An example GtkInfoBar](info-bar.png)
  #
  # It is often temporarily shown at the top or bottom of a document.
  # In contrast to `Gtk#Dialog`, which has an action area at the
  # bottom, `GtkInfoBar` has an action area at the side.
  #
  # The API of `GtkInfoBar` is very similar to `GtkDialog`, allowing you
  # to add buttons to the action area with `Gtk::InfoBar#add_button`
  # or `Gtk::InfoBar#new_with_buttons`. The sensitivity of action widgets
  # can be controlled with `Gtk::InfoBar#response_sensitive=`.
  #
  # To add widgets to the main content area of a `GtkInfoBar`, use
  # `Gtk::InfoBar#add_child`.
  #
  # Similar to `Gtk#MessageDialog`, the contents of a `GtkInfoBar`
  # can by classified as error message, warning, informational message, etc,
  # by using `Gtk::InfoBar#message_type=`. GTK may use the message
  # type to determine how the message is displayed.
  #
  # A simple example for using a `GtkInfoBar`:
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GtkWidget *message_label;
  # GtkWidget *widget;
  # GtkWidget *grid;
  # GtkInfoBar *bar;
  #
  # // set up info bar
  # widget = gtk_info_bar_new ();
  # bar = GTK_INFO_BAR (widget);
  # grid = gtk_grid_new ();
  #
  # message_label = gtk_label_new ("");
  # gtk_info_bar_add_child (bar, message_label);
  # gtk_info_bar_add_button (bar,
  #                          _("_OK"),
  #                          GTK_RESPONSE_OK);
  # g_signal_connect (bar,
  #                   "response",
  #                   G_CALLBACK (gtk_widget_hide),
  #                   NULL);
  # gtk_grid_attach (GTK_GRID (grid),
  #                  widget,
  #                  0, 2, 1, 1);
  #
  # // ...
  #
  # // show an error message
  # gtk_label_set_text (GTK_LABEL (message_label), "An error occurred!");
  # gtk_info_bar_set_message_type (bar, GTK_MESSAGE_ERROR);
  # gtk_widget_show (bar);
  # ```
  #
  # # GtkInfoBar as GtkBuildable
  #
  # `GtkInfoBar` supports a custom `<action-widgets>` element, which can contain
  # multiple `<action-widget>` elements. The “response” attribute specifies a
  # numeric response, and the content of the element is the id of widget
  # (which should be a child of the dialogs @action_area).
  #
  # `GtkInfoBar` supports adding action widgets by specifying “action” as
  # the “type” attribute of a `<child>` element. The widget will be added
  # either to the action area. The response id has to be associated
  # with the action widget using the `<action-widgets>` element.
  #
  # # CSS nodes
  #
  # `GtkInfoBar` has a single CSS node with name infobar. The node may get
  # one of the style classes .info, .warning, .error or .question, depending
  # on the message type.
  # If the info bar shows a close button, that button will have the .close
  # style class applied.
  @[GObject::GeneratedWrapper]
  class InfoBar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(InfoBar, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `InfoBar`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, message_type : Gtk::MessageType? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, revealed : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_close_button : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[38]
      _values = StaticArray(LibGObject::Value, 38).new(LibGObject::Value.new)
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
      if !message_type.nil?
        (_names.to_unsafe + _n).value = "message-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, message_type)
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
      if !revealed.nil?
        (_names.to_unsafe + _n).value = "revealed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, revealed)
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
      if !show_close_button.nil?
        (_names.to_unsafe + _n).value = "show-close-button".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_close_button)
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

      @pointer = LibGObject.g_object_new_with_properties(InfoBar.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_info_bar_get_type
    end

    def message_type=(value : Gtk::MessageType) : Gtk::MessageType
      unsafe_value = value

      LibGObject.g_object_set(self, "message-type", unsafe_value, Pointer(Void).null)
      value
    end

    def message_type : Gtk::MessageType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "message-type", pointerof(value), Pointer(Void).null)
      Gtk::MessageType.new(value)
    end

    def revealed=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "revealed", unsafe_value, Pointer(Void).null)
      value
    end

    def revealed? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "revealed", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def show_close_button=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-close-button", unsafe_value, Pointer(Void).null)
      value
    end

    def show_close_button? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-close-button", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Add an activatable widget to the action area of a `GtkInfoBar`.
    #
    # This also connects a signal handler that will emit the
    # `Gtk::InfoBar::#response` signal on the message area
    # when the widget is activated. The widget is appended to the
    # end of the message areas action area.
    def add_action_widget(child : Gtk::Widget, response_id : Int32) : Nil
      # gtk_info_bar_add_action_widget: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_info_bar_add_action_widget(@pointer, child, response_id)

      # Return value handling
    end

    # Adds a button with the given text.
    #
    # Clicking the button will emit the `Gtk::InfoBar::#response`
    # signal with the given response_id. The button is appended to the
    # end of the info bars's action area. The button widget is returned,
    # but usually you don't need it.
    def add_button(button_text : ::String, response_id : Int32) : Gtk::Button
      # gtk_info_bar_add_button: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_info_bar_add_button(@pointer, button_text, response_id)

      # Return value handling

      Gtk::Button.new(_retval, GICrystal::Transfer::None)
    end

    # Adds a widget to the content area of the info bar.
    def add_child(widget : Gtk::Widget) : Nil
      # gtk_info_bar_add_child: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_info_bar_add_child(@pointer, widget)

      # Return value handling
    end

    # Returns the message type of the message area.
    def message_type : Gtk::MessageType
      # gtk_info_bar_get_message_type: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_info_bar_get_message_type(@pointer)

      # Return value handling

      Gtk::MessageType.new(_retval)
    end

    # Returns whether the info bar is currently revealed.
    def revealed : Bool
      # gtk_info_bar_get_revealed: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_info_bar_get_revealed(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the widget will display a standard close button.
    def show_close_button : Bool
      # gtk_info_bar_get_show_close_button: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_info_bar_get_show_close_button(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Removes a widget from the action area of @info_bar.
    #
    # The widget must have been put there by a call to
    # `Gtk::InfoBar#add_action_widget` or `Gtk::InfoBar#add_button`.
    def remove_action_widget(widget : Gtk::Widget) : Nil
      # gtk_info_bar_remove_action_widget: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_info_bar_remove_action_widget(@pointer, widget)

      # Return value handling
    end

    # Removes a widget from the content area of the info bar.
    def remove_child(widget : Gtk::Widget) : Nil
      # gtk_info_bar_remove_child: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_info_bar_remove_child(@pointer, widget)

      # Return value handling
    end

    # Emits the “response” signal with the given @response_id.
    def response(response_id : Int32) : Nil
      # gtk_info_bar_response: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_info_bar_response(@pointer, response_id)

      # Return value handling
    end

    # Sets the last widget in the info bar’s action area with
    # the given response_id as the default widget for the dialog.
    #
    # Pressing “Enter” normally activates the default widget.
    #
    # Note that this function currently requires @info_bar to
    # be added to a widget hierarchy.
    def default_response=(response_id : Int32) : Nil
      # gtk_info_bar_set_default_response: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_info_bar_set_default_response(@pointer, response_id)

      # Return value handling
    end

    # Sets the message type of the message area.
    #
    # GTK uses this type to determine how the message is displayed.
    def message_type=(message_type : Gtk::MessageType) : Nil
      # gtk_info_bar_set_message_type: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_info_bar_set_message_type(@pointer, message_type)

      # Return value handling
    end

    # Sets the sensitivity of action widgets for @response_id.
    #
    # Calls `gtk_widget_set_sensitive (widget, setting)` for each
    # widget in the info bars’s action area with the given @response_id.
    # A convenient way to sensitize/desensitize buttons.
    def set_response_sensitive(response_id : Int32, setting : Bool) : Nil
      # gtk_info_bar_set_response_sensitive: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_info_bar_set_response_sensitive(@pointer, response_id, setting)

      # Return value handling
    end

    # Sets whether the `GtkInfoBar` is revealed.
    #
    # Changing this will make @info_bar reveal or conceal
    # itself via a sliding transition.
    #
    # Note: this does not show or hide @info_bar in the
    # `Gtk::Widget#visible` sense, so revealing has no effect
    # if `Gtk::Widget#visible` is %FALSE.
    def revealed=(revealed : Bool) : Nil
      # gtk_info_bar_set_revealed: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_info_bar_set_revealed(@pointer, revealed)

      # Return value handling
    end

    # If true, a standard close button is shown.
    #
    # When clicked it emits the response %GTK_RESPONSE_CLOSE.
    def show_close_button=(setting : Bool) : Nil
      # gtk_info_bar_set_show_close_button: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_info_bar_set_show_close_button(@pointer, setting)

      # Return value handling
    end

    # Gets emitted when the user uses a keybinding to dismiss the info bar.
    #
    # The ::close signal is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is the Escape key.
    struct CloseSignal < GObject::Signal
      def name : String
        @detail ? "close::#{@detail}" : "close"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::InfoBar, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::InfoBar.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::InfoBar, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "close")
      end
    end

    def close_signal
      CloseSignal.new(self)
    end

    # Emitted when an action widget is clicked.
    #
    # The signal is also emitted when the application programmer
    # calls `Gtk::InfoBar#response`. The @response_id depends
    # on which action widget was clicked.
    struct ResponseSignal < GObject::Signal
      def name : String
        @detail ? "response::#{@detail}" : "response"
      end

      def connect(*, after : Bool = false, &block : Proc(Int32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Int32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_response_id : Int32, _lib_box : Pointer(Void)) {
          response_id = lib_response_id
          ::Box(Proc(Int32, Nil)).unbox(_lib_box).call(response_id)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::InfoBar, Int32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_response_id : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::InfoBar.new(_lib_sender, GICrystal::Transfer::None)
          response_id = lib_response_id
          ::Box(Proc(Gtk::InfoBar, Int32, Nil)).unbox(_lib_box).call(_sender, response_id)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(response_id : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "response", response_id)
      end
    end

    def response_signal
      ResponseSignal.new(self)
    end
  end
end
