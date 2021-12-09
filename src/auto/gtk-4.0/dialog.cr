require "./window"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./native"

require "./root"

require "./shortcut_manager"

module Gtk
  # Dialogs are a convenient way to prompt the user for a small amount
  # of input.
  #
  # ![An example GtkDialog](dialog.png)
  #
  # Typical uses are to display a message, ask a question, or anything else
  # that does not require extensive effort on the user’s part.
  #
  # The main area of a `GtkDialog` is called the "content area", and is yours
  # to populate with widgets such a `GtkLabel` or `GtkEntry`, to present
  # your information, questions, or tasks to the user.
  #
  # In addition, dialogs allow you to add "action widgets". Most commonly,
  # action widgets are buttons. Depending on the platform, action widgets may
  # be presented in the header bar at the top of the window, or at the bottom
  # of the window. To add action widgets, create your `GtkDialog` using
  # [ctor@Gtk.Dialog.new_with_buttons], or use
  # [method@Gtk.Dialog.add_button], [method@Gtk.Dialog.add_buttons],
  # or [method@Gtk.Dialog.add_action_widget].
  #
  # `GtkDialogs` uses some heuristics to decide whether to add a close
  # button to the window decorations. If any of the action buttons use
  # the response ID %GTK_RESPONSE_CLOSE or %GTK_RESPONSE_CANCEL, the
  # close button is omitted.
  #
  # Clicking a button that was added as an action widget will emit the
  # [signal@Gtk.Dialog::response] signal with a response ID that you specified.
  # GTK will never assign a meaning to positive response IDs; these are
  # entirely user-defined. But for convenience, you can use the response
  # IDs in the [enum@Gtk.ResponseType] enumeration (these all have values
  # less than zero). If a dialog receives a delete event, the
  # [signal@Gtk.Dialog::response] signal will be emitted with the
  # %GTK_RESPONSE_DELETE_EVENT response ID.
  #
  # Dialogs are created with a call to [ctor@Gtk.Dialog.new] or
  # [ctor@Gtk.Dialog.new_with_buttons]. The latter is recommended; it allows
  # you to set the dialog title, some convenient flags, and add buttons.
  #
  # A “modal” dialog (that is, one which freezes the rest of the application
  # from user input), can be created by calling [method@Gtk.Window.set_modal]
  # on the dialog. When using [ctor@Gtk.Dialog.new_with_buttons], you can also
  # pass the %GTK_DIALOG_MODAL flag to make a dialog modal.
  #
  # For the simple dialog in the following example, a [class@Gtk.MessageDialog]
  # would save some effort. But you’d need to create the dialog contents manually
  # if you had more than a simple message in the dialog.
  #
  # An example for simple `GtkDialog` usage:
  #
  # ```c
  # // Function to open a dialog box with a message
  # void
  # quick_message (GtkWindow *parent, char *message)
  # {
  #  GtkWidget *dialog, *label, *content_area;
  #  GtkDialogFlags flags;
  #
  #  // Create the widgets
  #  flags = GTK_DIALOG_DESTROY_WITH_PARENT;
  #  dialog = gtk_dialog_new_with_buttons ("Message",
  #                                        parent,
  #                                        flags,
  #                                        _("_OK"),
  #                                        GTK_RESPONSE_NONE,
  #                                        NULL);
  #  content_area = gtk_dialog_get_content_area (GTK_DIALOG (dialog));
  #  label = gtk_label_new (message);
  #
  #  // Ensure that the dialog box is destroyed when the user responds
  #
  #  g_signal_connect_swapped (dialog,
  #                            "response",
  #                            G_CALLBACK (gtk_window_destroy),
  #                            dialog);
  #
  #  // Add the label, and show everything we’ve added
  #
  #  gtk_box_append (GTK_BOX (content_area), label);
  #  gtk_widget_show (dialog);
  # }
  # ```
  #
  # # GtkDialog as GtkBuildable
  #
  # The `GtkDialog` implementation of the `GtkBuildable` interface exposes the
  # @content_area as an internal child with the name “content_area”.
  #
  # `GtkDialog` supports a custom `<action-widgets>` element, which can contain
  # multiple `<action-widget>` elements. The “response” attribute specifies a
  # numeric response, and the content of the element is the id of widget
  # (which should be a child of the dialogs @action_area). To mark a response
  # as default, set the “default” attribute of the `<action-widget>` element
  # to true.
  #
  # `GtkDialog` supports adding action widgets by specifying “action” as
  # the “type” attribute of a `<child>` element. The widget will be added
  # either to the action area or the headerbar of the dialog, depending
  # on the “use-header-bar” property. The response id has to be associated
  # with the action widget using the `<action-widgets>` element.
  #
  # An example of a `GtkDialog` UI definition fragment:
  #
  # ```xml
  # <object class="GtkDialog" id="dialog1">
  #   <child type="action">
  #     <object class="GtkButton" id="button_cancel"/>
  #   </child>
  #   <child type="action">
  #     <object class="GtkButton" id="button_ok">
  #     </object>
  #   </child>
  #   <action-widgets>
  #     <action-widget response="cancel">button_cancel</action-widget>
  #     <action-widget response="ok" default="true">button_ok</action-widget>
  #   </action-widgets>
  # </object>
  # ```
  #
  # # Accessibility
  #
  # `GtkDialog` uses the %GTK_ACCESSIBLE_ROLE_DIALOG role.
  class Dialog < Window
    include Accessible
    include Buildable
    include ConstraintTarget
    include Native
    include Root
    include ShortcutManager

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, application : Gtk::Application? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decorated : Bool? = nil, default_height : Int32? = nil, default_widget : Gtk::Widget? = nil, default_width : Int32? = nil, deletable : Bool? = nil, destroy_with_parent : Bool? = nil, display : Gdk::Display? = nil, focus_on_click : Bool? = nil, focus_visible : Bool? = nil, focus_widget : Gtk::Widget? = nil, focusable : Bool? = nil, fullscreened : Bool? = nil, halign : Gtk::Align? = nil, handle_menubar_accel : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hide_on_close : Bool? = nil, icon_name : ::String? = nil, is_active : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, maximized : Bool? = nil, mnemonics_visible : Bool? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, resizable : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, startup_id : ::String? = nil, title : ::String? = nil, titlebar : Gtk::Widget? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transient_for : Gtk::Window? = nil, use_header_bar : Int32? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[60]
      _values = StaticArray(LibGObject::Value, 60).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if application
        (_names.to_unsafe + _n).value = "application".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, application)
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
      if child
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
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
      if decorated
        (_names.to_unsafe + _n).value = "decorated".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, decorated)
        _n += 1
      end
      if default_height
        (_names.to_unsafe + _n).value = "default-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_height)
        _n += 1
      end
      if default_widget
        (_names.to_unsafe + _n).value = "default-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_widget)
        _n += 1
      end
      if default_width
        (_names.to_unsafe + _n).value = "default-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_width)
        _n += 1
      end
      if deletable
        (_names.to_unsafe + _n).value = "deletable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, deletable)
        _n += 1
      end
      if destroy_with_parent
        (_names.to_unsafe + _n).value = "destroy-with-parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, destroy_with_parent)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if focus_on_click
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if focus_visible
        (_names.to_unsafe + _n).value = "focus-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_visible)
        _n += 1
      end
      if focus_widget
        (_names.to_unsafe + _n).value = "focus-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_widget)
        _n += 1
      end
      if focusable
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if fullscreened
        (_names.to_unsafe + _n).value = "fullscreened".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fullscreened)
        _n += 1
      end
      if halign
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if handle_menubar_accel
        (_names.to_unsafe + _n).value = "handle-menubar-accel".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, handle_menubar_accel)
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
      if hide_on_close
        (_names.to_unsafe + _n).value = "hide-on-close".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hide_on_close)
        _n += 1
      end
      if icon_name
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if is_active
        (_names.to_unsafe + _n).value = "is-active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_active)
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
      if maximized
        (_names.to_unsafe + _n).value = "maximized".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, maximized)
        _n += 1
      end
      if mnemonics_visible
        (_names.to_unsafe + _n).value = "mnemonics-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonics_visible)
        _n += 1
      end
      if modal
        (_names.to_unsafe + _n).value = "modal".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modal)
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
      if resizable
        (_names.to_unsafe + _n).value = "resizable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resizable)
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
      if startup_id
        (_names.to_unsafe + _n).value = "startup-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, startup_id)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if titlebar
        (_names.to_unsafe + _n).value = "titlebar".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, titlebar)
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
      if transient_for
        (_names.to_unsafe + _n).value = "transient-for".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transient_for)
        _n += 1
      end
      if use_header_bar
        (_names.to_unsafe + _n).value = "use-header-bar".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_header_bar)
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

      @pointer = LibGObject.g_object_new_with_properties(Dialog.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_dialog_get_type
    end

    def use_header_bar=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "use-header-bar", unsafe_value, Pointer(Void).null)
      value
    end

    def use_header_bar : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "use-header-bar", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize
      # gtk_dialog_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_dialog_new
      @pointer = _retval
    end

    def add_action_widget(child : Gtk::Widget, response_id : Int32) : Nil
      # gtk_dialog_add_action_widget: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_dialog_add_action_widget(self, child, response_id)
    end

    def add_button(button_text : ::String, response_id : Int32) : Gtk::Widget
      # gtk_dialog_add_button: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_dialog_add_button(self, button_text, response_id)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    def content_area : Gtk::Box
      # gtk_dialog_get_content_area: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_dialog_get_content_area(self)
      Gtk::Box.new(_retval, GICrystal::Transfer::None)
    end

    def header_bar : Gtk::HeaderBar
      # gtk_dialog_get_header_bar: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_dialog_get_header_bar(self)
      Gtk::HeaderBar.new(_retval, GICrystal::Transfer::None)
    end

    def response_for_widget(widget : Gtk::Widget) : Int32
      # gtk_dialog_get_response_for_widget: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_dialog_get_response_for_widget(self, widget)
      _retval
    end

    def widget_for_response(response_id : Int32) : Gtk::Widget?
      # gtk_dialog_get_widget_for_response: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_dialog_get_widget_for_response(self, response_id)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def response(response_id : Int32) : Nil
      # gtk_dialog_response: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_dialog_response(self, response_id)
    end

    def default_response=(response_id : Int32) : Nil
      # gtk_dialog_set_default_response: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_dialog_set_default_response(self, response_id)
    end

    def set_response_sensitive(response_id : Int32, setting : Bool) : Nil
      # gtk_dialog_set_response_sensitive: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_dialog_set_response_sensitive(self, response_id, setting)
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

      def connect(block : Proc(Gtk::Dialog, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Dialog.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Dialog, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Dialog, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Dialog.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Dialog, Nil)).unbox(box).call(sender)
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

      def connect(block : Proc(Gtk::Dialog, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          sender = Gtk::Dialog.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::Dialog, Int32, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Dialog, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          sender = Gtk::Dialog.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::Dialog, Int32, Nil)).unbox(box).call(sender, arg0)
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
