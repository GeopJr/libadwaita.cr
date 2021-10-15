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
  # In contrast to [class@Gtk.Dialog], which has an action area at the
  # bottom, `GtkInfoBar` has an action area at the side.
  #
  # The API of `GtkInfoBar` is very similar to `GtkDialog`, allowing you
  # to add buttons to the action area with [method@Gtk.InfoBar.add_button]
  # or [ctor@Gtk.InfoBar.new_with_buttons]. The sensitivity of action widgets
  # can be controlled with [method@Gtk.InfoBar.set_response_sensitive].
  #
  # To add widgets to the main content area of a `GtkInfoBar`, use
  # [method@Gtk.InfoBar.add_child].
  #
  # Similar to [class@Gtk.MessageDialog], the contents of a `GtkInfoBar`
  # can by classified as error message, warning, informational message, etc,
  # by using [method@Gtk.InfoBar.set_message_type]. GTK may use the message
  # type to determine how the message is displayed.
  #
  # A simple example for using a `GtkInfoBar`:
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
  # `GtkInfoBar` supports a custom <action-widgets> element, which can contain
  # multiple <action-widget> elements. The “response” attribute specifies a
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
  class InfoBar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, message_type : Gtk::MessageType? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, revealed : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_close_button : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[38]
      _values = StaticArray(LibGObject::Value, 38).new(LibGObject::Value.new)
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
      if message_type
        (_names.to_unsafe + _n).value = "message-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, message_type)
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
      if revealed
        (_names.to_unsafe + _n).value = "revealed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, revealed)
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
      if show_close_button
        (_names.to_unsafe + _n).value = "show-close-button".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_close_button)
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

      @pointer = LibGObject.g_object_new_with_properties(InfoBar.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_info_bar_get_type
    end

    def initialize
      # gtk_info_bar_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_info_bar_new
      @pointer = _retval
    end

    def add_action_widget(child : Gtk::Widget, response_id : Int32) : Nil
      # gtk_info_bar_add_action_widget: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_info_bar_add_action_widget(self, child, response_id)
    end

    def add_button(button_text : ::String, response_id : Int32) : Gtk::Button
      # gtk_info_bar_add_button: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_info_bar_add_button(self, button_text, response_id)
      Gtk::Button.new(_retval, GICrystal::Transfer::None)
    end

    def add_child(widget : Gtk::Widget) : Nil
      # gtk_info_bar_add_child: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_info_bar_add_child(self, widget)
    end

    def message_type : Gtk::MessageType
      # gtk_info_bar_get_message_type: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_info_bar_get_message_type(self)
      Gtk::MessageType.from_value(_retval)
    end

    def revealed? : Bool
      # gtk_info_bar_get_revealed: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_info_bar_get_revealed(self)
      GICrystal.to_bool(_retval)
    end

    def show_close_button? : Bool
      # gtk_info_bar_get_show_close_button: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_info_bar_get_show_close_button(self)
      GICrystal.to_bool(_retval)
    end

    def remove_action_widget(widget : Gtk::Widget) : Nil
      # gtk_info_bar_remove_action_widget: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_info_bar_remove_action_widget(self, widget)
    end

    def remove_child(widget : Gtk::Widget) : Nil
      # gtk_info_bar_remove_child: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_info_bar_remove_child(self, widget)
    end

    def response(response_id : Int32) : Nil
      # gtk_info_bar_response: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_info_bar_response(self, response_id)
    end

    def default_response=(response_id : Int32) : Nil
      # gtk_info_bar_set_default_response: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_info_bar_set_default_response(self, response_id)
    end

    def message_type=(message_type : Gtk::MessageType) : Nil
      # gtk_info_bar_set_message_type: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_info_bar_set_message_type(self, message_type)
    end

    def set_response_sensitive(response_id : Int32, setting : Bool) : Nil
      # gtk_info_bar_set_response_sensitive: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_info_bar_set_response_sensitive(self, response_id, setting)
    end

    def revealed=(revealed : Bool) : Nil
      # gtk_info_bar_set_revealed: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_info_bar_set_revealed(self, revealed)
    end

    def show_close_button=(setting : Bool) : Nil
      # gtk_info_bar_set_show_close_button: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_info_bar_set_show_close_button(self, setting)
    end

    struct CloseSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "close::#{@detail}" : "close"
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

      def connect(block : Proc(Gtk::InfoBar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::InfoBar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::InfoBar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::InfoBar, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::InfoBar.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::InfoBar, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "close")
      end
    end

    def close_signal
      CloseSignal.new(self)
    end

    struct ResponseSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "response::#{@detail}" : "response"
      end

      def connect(&block : Proc(Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Int32, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Int32, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::InfoBar, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          sender = Gtk::InfoBar.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::InfoBar, Int32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::InfoBar, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          sender = Gtk::InfoBar.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::InfoBar, Int32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
