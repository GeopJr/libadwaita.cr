require "../gtk-4.0/widget"
require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A dynamic tabbed container.
  #
  # `AdwTabView` is a container which shows one child at a time. While it
  # provides keyboard shortcuts for switching between pages, it does not provide
  # a visible tab bar and relies on external widgets for that, such as
  # [class@Adw.TabBar].
  #
  # `AdwTabView` maintains a [class@Adw.TabPage] object for each page, which
  # holds additional per-page properties. You can obtain the `AdwTabPage` for a
  # page with [method@Adw.TabView.get_page], and as the return value for
  # [method@Adw.TabView.append] and other functions for adding children.
  #
  # `AdwTabView` only aims to be useful for dynamic tabs in multi-window
  # document-based applications, such as web browsers, file managers, text
  # editors or terminals. It does not aim to replace [class@Gtk.Notebook] for use
  # cases such as tabbed dialogs.
  #
  # As such, it does not support disabling page reordering or detaching, or
  # adding children via [class@Gtk.Builder].
  #
  # `AdwTabView` adds the following shortcuts in the managed scope:
  #
  # * Ctrl+Page Up - switch to the previous page
  # * Ctrl+Page Down - switch to the next page
  # * Ctrl+Home - switch to the first page
  # * Ctrl+End - switch to the last page
  # * Ctrl+Shift+Page Up - move the current page backward
  # * Ctrl+Shift+Page Down - move the current page forward
  # * Ctrl+Shift+Home - move the current page at the start
  # * Ctrl+Shift+End - move the current page at the end
  # * Ctrl+Tab - switch to the next page, with looping
  # * Ctrl+Shift+Tab - switch to the previous page, with looping
  # * Alt+1-9 - switch to pages 1-9
  # * Alt+0 - switch to page 10
  #
  # ## CSS nodes
  #
  # `AdwTabView` has a main CSS node with the name `tabview`.
  class TabView < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, default_icon : Gio::Icon? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, is_transferring_page : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, menu_model : Gio::MenuModel? = nil, n_pages : Int32? = nil, n_pinned_pages : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, pages : Gtk::SelectionModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selected_page : Adw::TabPage? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
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
      if default_icon
        (_names.to_unsafe + _n).value = "default-icon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_icon)
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
      if is_transferring_page
        (_names.to_unsafe + _n).value = "is-transferring-page".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_transferring_page)
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
      if menu_model
        (_names.to_unsafe + _n).value = "menu-model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, menu_model)
        _n += 1
      end
      if n_pages
        (_names.to_unsafe + _n).value = "n-pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_pages)
        _n += 1
      end
      if n_pinned_pages
        (_names.to_unsafe + _n).value = "n-pinned-pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_pinned_pages)
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
      if pages
        (_names.to_unsafe + _n).value = "pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pages)
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
      if selected_page
        (_names.to_unsafe + _n).value = "selected-page".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected_page)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
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

      @pointer = LibGObject.g_object_new_with_properties(TabView.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_tab_view_get_type
    end

    def default_icon=(value : Gio::Icon?) : Gio::Icon?
      unsafe_value = value

      LibGObject.g_object_set(self, "default-icon", unsafe_value, Pointer(Void).null)
      value
    end

    def default_icon : Gio::Icon?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "default-icon", pointerof(value), Pointer(Void).null)
      Gio::Icon__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def is_transferring_page? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-transferring-page", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def menu_model=(value : Gio::MenuModel?) : Gio::MenuModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "menu-model", unsafe_value, Pointer(Void).null)
      value
    end

    def menu_model : Gio::MenuModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "menu-model", pointerof(value), Pointer(Void).null)
      Gio::MenuModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def n_pages : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "n-pages", pointerof(value), Pointer(Void).null)
      value
    end

    def n_pinned_pages : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "n-pinned-pages", pointerof(value), Pointer(Void).null)
      value
    end

    def pages : Gtk::SelectionModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pages", pointerof(value), Pointer(Void).null)
      Gtk::SelectionModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def selected_page=(value : Adw::TabPage?) : Adw::TabPage?
      unsafe_value = value

      LibGObject.g_object_set(self, "selected-page", unsafe_value, Pointer(Void).null)
      value
    end

    def selected_page : Adw::TabPage?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "selected-page", pointerof(value), Pointer(Void).null)
      Adw::TabPage.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def initialize
      # adw_tab_view_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_new
      @pointer = _retval
    end

    def add_page(child : Gtk::Widget, parent : Adw::TabPage?) : Adw::TabPage
      # adw_tab_view_add_page: (Method)
      # @parent: (nullable)
      # Returns: (transfer none)

      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      _retval = LibAdw.adw_tab_view_add_page(self, child, parent)
      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    def append(child : Gtk::Widget) : Adw::TabPage
      # adw_tab_view_append: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_append(self, child)
      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    def append_pinned(child : Gtk::Widget) : Adw::TabPage
      # adw_tab_view_append_pinned: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_append_pinned(self, child)
      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    def close_other_pages(page : Adw::TabPage) : Nil
      # adw_tab_view_close_other_pages: (Method)
      # Returns: (transfer none)

      LibAdw.adw_tab_view_close_other_pages(self, page)
    end

    def close_page(page : Adw::TabPage) : Nil
      # adw_tab_view_close_page: (Method)
      # Returns: (transfer none)

      LibAdw.adw_tab_view_close_page(self, page)
    end

    def close_page_finish(page : Adw::TabPage, confirm : Bool) : Nil
      # adw_tab_view_close_page_finish: (Method)
      # Returns: (transfer none)

      LibAdw.adw_tab_view_close_page_finish(self, page, confirm)
    end

    def close_pages_after(page : Adw::TabPage) : Nil
      # adw_tab_view_close_pages_after: (Method)
      # Returns: (transfer none)

      LibAdw.adw_tab_view_close_pages_after(self, page)
    end

    def close_pages_before(page : Adw::TabPage) : Nil
      # adw_tab_view_close_pages_before: (Method)
      # Returns: (transfer none)

      LibAdw.adw_tab_view_close_pages_before(self, page)
    end

    def default_icon : Gio::Icon
      # adw_tab_view_get_default_icon: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_get_default_icon(self)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def is_transferring_page : Bool
      # adw_tab_view_get_is_transferring_page: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_get_is_transferring_page(self)
      GICrystal.to_bool(_retval)
    end

    def menu_model : Gio::MenuModel?
      # adw_tab_view_get_menu_model: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_get_menu_model(self)
      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def n_pages : Int32
      # adw_tab_view_get_n_pages: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_get_n_pages(self)
      _retval
    end

    def n_pinned_pages : Int32
      # adw_tab_view_get_n_pinned_pages: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_get_n_pinned_pages(self)
      _retval
    end

    def nth_page(position : Int32) : Adw::TabPage
      # adw_tab_view_get_nth_page: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_get_nth_page(self, position)
      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    def page(child : Gtk::Widget) : Adw::TabPage
      # adw_tab_view_get_page: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_get_page(self, child)
      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    def page_position(page : Adw::TabPage) : Int32
      # adw_tab_view_get_page_position: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_get_page_position(self, page)
      _retval
    end

    def pages : Gtk::SelectionModel
      # adw_tab_view_get_pages: (Method | Getter)
      # Returns: (transfer full)

      _retval = LibAdw.adw_tab_view_get_pages(self)
      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def selected_page : Adw::TabPage?
      # adw_tab_view_get_selected_page: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_get_selected_page(self)
      Adw::TabPage.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def insert(child : Gtk::Widget, position : Int32) : Adw::TabPage
      # adw_tab_view_insert: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_insert(self, child, position)
      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    def insert_pinned(child : Gtk::Widget, position : Int32) : Adw::TabPage
      # adw_tab_view_insert_pinned: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_insert_pinned(self, child, position)
      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    def prepend(child : Gtk::Widget) : Adw::TabPage
      # adw_tab_view_prepend: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_prepend(self, child)
      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    def prepend_pinned(child : Gtk::Widget) : Adw::TabPage
      # adw_tab_view_prepend_pinned: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_prepend_pinned(self, child)
      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    def reorder_backward(page : Adw::TabPage) : Bool
      # adw_tab_view_reorder_backward: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_reorder_backward(self, page)
      GICrystal.to_bool(_retval)
    end

    def reorder_first(page : Adw::TabPage) : Bool
      # adw_tab_view_reorder_first: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_reorder_first(self, page)
      GICrystal.to_bool(_retval)
    end

    def reorder_forward(page : Adw::TabPage) : Bool
      # adw_tab_view_reorder_forward: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_reorder_forward(self, page)
      GICrystal.to_bool(_retval)
    end

    def reorder_last(page : Adw::TabPage) : Bool
      # adw_tab_view_reorder_last: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_reorder_last(self, page)
      GICrystal.to_bool(_retval)
    end

    def reorder_page(page : Adw::TabPage, position : Int32) : Bool
      # adw_tab_view_reorder_page: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_reorder_page(self, page, position)
      GICrystal.to_bool(_retval)
    end

    def select_next_page : Bool
      # adw_tab_view_select_next_page: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_select_next_page(self)
      GICrystal.to_bool(_retval)
    end

    def select_previous_page : Bool
      # adw_tab_view_select_previous_page: (Method)
      # Returns: (transfer none)

      _retval = LibAdw.adw_tab_view_select_previous_page(self)
      GICrystal.to_bool(_retval)
    end

    def default_icon=(default_icon : Gio::Icon) : Nil
      # adw_tab_view_set_default_icon: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_tab_view_set_default_icon(self, default_icon)
    end

    def menu_model=(menu_model : Gio::MenuModel?) : Nil
      # adw_tab_view_set_menu_model: (Method | Setter)
      # @menu_model: (nullable)
      # Returns: (transfer none)

      menu_model = if menu_model.nil?
                     Pointer(Void).null
                   else
                     menu_model.to_unsafe
                   end

      LibAdw.adw_tab_view_set_menu_model(self, menu_model)
    end

    def set_page_pinned(page : Adw::TabPage, pinned : Bool) : Nil
      # adw_tab_view_set_page_pinned: (Method)
      # Returns: (transfer none)

      LibAdw.adw_tab_view_set_page_pinned(self, page, pinned)
    end

    def selected_page=(selected_page : Adw::TabPage) : Nil
      # adw_tab_view_set_selected_page: (Method | Setter)
      # Returns: (transfer none)

      LibAdw.adw_tab_view_set_selected_page(self, selected_page)
    end

    def transfer_page(page : Adw::TabPage, other_view : Adw::TabView, position : Int32) : Nil
      # adw_tab_view_transfer_page: (Method)
      # Returns: (transfer none)

      LibAdw.adw_tab_view_transfer_page(self, page, other_view, position)
    end

    struct ClosePageSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "close-page::#{@detail}" : "close-page"
      end

      def connect(&block : Proc(Adw::TabPage, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Adw::TabPage, Bool))
        connect(block)
      end

      def connect(block : Proc(Adw::TabPage, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabPage, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabPage, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabPage, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::TabView, Adw::TabPage, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabView, Adw::TabPage, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabView, Adw::TabPage, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabView, Adw::TabPage, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage) : Nil
        LibGObject.g_signal_emit_by_name(@source, "close-page", page)
      end
    end

    def close_page_signal
      ClosePageSignal.new(self)
    end

    struct CreateWindowSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "create-window::#{@detail}" : "create-window"
      end

      def connect(&block : Proc(Adw::TabView))
        connect(block)
      end

      def connect_after(&block : Proc(Adw::TabView))
        connect(block)
      end

      def connect(block : Proc(Adw::TabView))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Adw::TabView)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabView))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Adw::TabView)).unbox(box).call.to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::TabView, Adw::TabView))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabView, Adw::TabView)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabView, Adw::TabView))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabView, Adw::TabView)).unbox(box).call(sender).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "create-window")
      end
    end

    def create_window_signal
      CreateWindowSignal.new(self)
    end

    struct IndicatorActivatedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "indicator-activated::#{@detail}" : "indicator-activated"
      end

      def connect(&block : Proc(Adw::TabPage, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Adw::TabPage, Nil))
        connect(block)
      end

      def connect(block : Proc(Adw::TabPage, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabPage, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabPage, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabPage, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::TabView, Adw::TabPage, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabView, Adw::TabPage, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabView, Adw::TabPage, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabView, Adw::TabPage, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage) : Nil
        LibGObject.g_signal_emit_by_name(@source, "indicator-activated", page)
      end
    end

    def indicator_activated_signal
      IndicatorActivatedSignal.new(self)
    end

    struct PageAttachedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "page-attached::#{@detail}" : "page-attached"
      end

      def connect(&block : Proc(Adw::TabPage, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Adw::TabPage, Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage, position : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-attached", page, position)
      end
    end

    def page_attached_signal
      PageAttachedSignal.new(self)
    end

    struct PageDetachedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "page-detached::#{@detail}" : "page-detached"
      end

      def connect(&block : Proc(Adw::TabPage, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Adw::TabPage, Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage, position : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-detached", page, position)
      end
    end

    def page_detached_signal
      PageDetachedSignal.new(self)
    end

    struct PageReorderedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "page-reordered::#{@detail}" : "page-reordered"
      end

      def connect(&block : Proc(Adw::TabPage, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Adw::TabPage, Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Int32, box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage, position : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-reordered", page, position)
      end
    end

    def page_reordered_signal
      PageReorderedSignal.new(self)
    end

    struct SetupMenuSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "setup-menu::#{@detail}" : "setup-menu"
      end

      def connect(&block : Proc(Adw::TabPage, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Adw::TabPage, Nil))
        connect(block)
      end

      def connect(block : Proc(Adw::TabPage, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabPage, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabPage, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabPage, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Adw::TabView, Adw::TabPage, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabView, Adw::TabPage, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::TabView, Adw::TabPage, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::TabView.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Adw::TabPage.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabView, Adw::TabPage, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage) : Nil
        LibGObject.g_signal_emit_by_name(@source, "setup-menu", page)
      end
    end

    def setup_menu_signal
      SetupMenuSignal.new(self)
    end
  end
end
