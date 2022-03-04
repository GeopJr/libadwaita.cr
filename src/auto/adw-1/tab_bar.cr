require "../gtk-4.0/widget"
require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A tab bar for [class@Adw.TabView].
  #
  # The `AdwTabBar` widget is a tab bar that can be used with conjunction with
  # `AdwTabView`.
  #
  # `AdwTabBar` can autohide and can optionally contain action widgets on both
  # sides of the tabs.
  #
  # When there's not enough space to show all the tabs, `AdwTabBar` will scroll
  # them. Pinned tabs always stay visible and aren't a part of the scrollable
  # area.
  #
  # ## CSS nodes
  #
  # `AdwTabBar` has a single CSS node with name `tabbar`.
  class TabBar < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, autohide : Bool? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, end_action_widget : Gtk::Widget? = nil, expand_tabs : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, inverted : Bool? = nil, is_overflowing : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, start_action_widget : Gtk::Widget? = nil, tabs_revealed : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, view : Adw::TabView? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[43]
      _values = StaticArray(LibGObject::Value, 43).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if autohide
        (_names.to_unsafe + _n).value = "autohide".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, autohide)
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
      if end_action_widget
        (_names.to_unsafe + _n).value = "end-action-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, end_action_widget)
        _n += 1
      end
      if expand_tabs
        (_names.to_unsafe + _n).value = "expand-tabs".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expand_tabs)
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
      if inverted
        (_names.to_unsafe + _n).value = "inverted".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inverted)
        _n += 1
      end
      if is_overflowing
        (_names.to_unsafe + _n).value = "is-overflowing".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_overflowing)
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
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if start_action_widget
        (_names.to_unsafe + _n).value = "start-action-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, start_action_widget)
        _n += 1
      end
      if tabs_revealed
        (_names.to_unsafe + _n).value = "tabs-revealed".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tabs_revealed)
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
      if view
        (_names.to_unsafe + _n).value = "view".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, view)
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

      @pointer = LibGObject.g_object_new_with_properties(TabBar.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_tab_bar_get_type
    end

    def autohide=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "autohide", unsafe_value, Pointer(Void).null)
      value
    end

    def autohide? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "autohide", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def end_action_widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "end-action-widget", unsafe_value, Pointer(Void).null)
      value
    end

    def end_action_widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "end-action-widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def expand_tabs=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "expand-tabs", unsafe_value, Pointer(Void).null)
      value
    end

    def expand_tabs? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "expand-tabs", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
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

    def is_overflowing? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-overflowing", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def start_action_widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "start-action-widget", unsafe_value, Pointer(Void).null)
      value
    end

    def start_action_widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "start-action-widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def tabs_revealed? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "tabs-revealed", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def view=(value : Adw::TabView?) : Adw::TabView?
      unsafe_value = value

      LibGObject.g_object_set(self, "view", unsafe_value, Pointer(Void).null)
      value
    end

    def view : Adw::TabView?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "view", pointerof(value), Pointer(Void).null)
      Adw::TabView.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize
      # adw_tab_bar_new: (Constructor)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_tab_bar_new

      # Return value handling
      @pointer = _retval
      LibGObject.g_object_ref(_retval)
    end

    def autohide : Bool
      # adw_tab_bar_get_autohide: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_tab_bar_get_autohide(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def end_action_widget : Gtk::Widget?
      # adw_tab_bar_get_end_action_widget: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_tab_bar_get_end_action_widget(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def expand_tabs : Bool
      # adw_tab_bar_get_expand_tabs: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_tab_bar_get_expand_tabs(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def inverted : Bool
      # adw_tab_bar_get_inverted: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_tab_bar_get_inverted(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_overflowing : Bool
      # adw_tab_bar_get_is_overflowing: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_tab_bar_get_is_overflowing(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def start_action_widget : Gtk::Widget?
      # adw_tab_bar_get_start_action_widget: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_tab_bar_get_start_action_widget(self)

      # Return value handling
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def tabs_revealed : Bool
      # adw_tab_bar_get_tabs_revealed: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_tab_bar_get_tabs_revealed(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def view : Adw::TabView?
      # adw_tab_bar_get_view: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_tab_bar_get_view(self)

      # Return value handling
      Adw::TabView.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def autohide=(autohide : Bool) : Nil
      # adw_tab_bar_set_autohide: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_tab_bar_set_autohide(self, autohide)

      # Return value handling
    end

    def end_action_widget=(widget : Gtk::Widget?) : Nil
      # adw_tab_bar_set_end_action_widget: (Method | Setter)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibAdw.adw_tab_bar_set_end_action_widget(self, widget)

      # Return value handling
    end

    def expand_tabs=(expand_tabs : Bool) : Nil
      # adw_tab_bar_set_expand_tabs: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_tab_bar_set_expand_tabs(self, expand_tabs)

      # Return value handling
    end

    def inverted=(inverted : Bool) : Nil
      # adw_tab_bar_set_inverted: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_tab_bar_set_inverted(self, inverted)

      # Return value handling
    end

    def start_action_widget=(widget : Gtk::Widget?) : Nil
      # adw_tab_bar_set_start_action_widget: (Method | Setter)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibAdw.adw_tab_bar_set_start_action_widget(self, widget)

      # Return value handling
    end

    def view=(view : Adw::TabView?) : Nil
      # adw_tab_bar_set_view: (Method | Setter)
      # @view: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      view = if view.nil?
               Pointer(Void).null
             else
               view.to_unsafe
             end

      # C call
      LibAdw.adw_tab_bar_set_view(self, view)

      # Return value handling
    end

    def setup_extra_drop_target(actions : Gdk::DragAction, types : Enumerable(UInt64)?) : Nil
      # adw_tab_bar_setup_extra_drop_target: (Method)
      # @types: (nullable) (array length=n_types element-type Gtype)
      # Returns: (transfer none)

      # Handle parameters
      n_types = types.try(&.size) || 0
      types = if types.nil?
                Pointer(UInt64).null
              else
                types.to_a.to_unsafe
              end

      # C call
      LibAdw.adw_tab_bar_setup_extra_drop_target(self, actions, types, n_types)

      # Return value handling
    end

    struct ExtraDragDropSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "extra-drag-drop::#{@detail}" : "extra-drag-drop"
      end

      def connect(&block : Proc(Adw::TabPage, GObject::Value, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Adw::TabPage, GObject::Value, Bool))
        connect(block)
      end

      def connect(block : Proc(Adw::TabPage, GObject::Value, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GObject::Value.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabPage, GObject::Value, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabPage, GObject::Value, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GObject::Value.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabPage, GObject::Value, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::TabBar, Adw::TabPage, GObject::Value, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::TabBar.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GObject::Value.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabBar, Adw::TabPage, GObject::Value, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabBar, Adw::TabPage, GObject::Value, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::TabBar.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GObject::Value.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabBar, Adw::TabPage, GObject::Value, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage, value : _) : Nil
        value = GObject::Value.new(value) unless value.is_a?(GObject::Value)
        LibGObject.g_signal_emit_by_name(@source, "extra-drag-drop", page, value)
      end
    end

    def extra_drag_drop_signal
      ExtraDragDropSignal.new(self)
    end
  end
end
