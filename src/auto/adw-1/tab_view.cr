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
  # `#TabBar`.
  #
  # `AdwTabView` maintains a `#TabPage` object for each page, which holds
  # additional per-page properties. You can obtain the `AdwTabPage` for a page
  # with `TabView#page`, and as the return value for
  # `TabView#append` and other functions for adding children.
  #
  # `AdwTabView` only aims to be useful for dynamic tabs in multi-window
  # document-based applications, such as web browsers, file managers, text
  # editors or terminals. It does not aim to replace `Gtk#Notebook` for use
  # cases such as tabbed dialogs.
  #
  # As such, it does not support disabling page reordering or detaching.
  #
  # `AdwTabView` adds the following shortcuts in the managed scope:
  #
  # * <kbd>Ctrl</kbd>+<kbd>Page Up</kbd> - switch to the previous page
  # * <kbd>Ctrl</kbd>+<kbd>Page Down</kbd> - switch to the next page
  # * <kbd>Ctrl</kbd>+<kbd>Home</kbd> - switch to the first page
  # * <kbd>Ctrl</kbd>+<kbd>End</kbd> - switch to the last page
  # * <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Page Up</kbd> - move the current page
  #     backward
  # * <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Page Down</kbd> - move the current
  #     page forward
  # * <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Home</kbd> - move the current page at
  #     the start
  # * <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>End</kbd> - move the current page at
  #      the end
  # * <kbd>Ctrl</kbd>+<kbd>Tab</kbd> - switch to the next page, with looping
  # * <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Tab</kbd> - switch to the previous
  #     page, with looping
  # * <kbd>Alt</kbd>+<kbd>1</kbd>⋯<kbd>9</kbd> - switch to pages 1-9
  # * <kbd>Alt</kbd>+<kbd>0</kbd> - switch to page 10
  #
  # ## CSS nodes
  #
  # `AdwTabView` has a main CSS node with the name `tabview`.
  @[GObject::GeneratedWrapper]
  class TabView < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::TabViewClass), class_init,
        sizeof(LibAdw::TabView), instance_init, 0)
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, default_icon : Gio::Icon? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, is_transferring_page : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, menu_model : Gio::MenuModel? = nil, n_pages : Int32? = nil, n_pinned_pages : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, pages : Gtk::SelectionModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selected_page : Adw::TabPage? = nil, sensitive : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
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
      if !default_icon.nil?
        (_names.to_unsafe + _n).value = "default-icon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_icon)
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
      if !is_transferring_page.nil?
        (_names.to_unsafe + _n).value = "is-transferring-page".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_transferring_page)
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
      if !menu_model.nil?
        (_names.to_unsafe + _n).value = "menu-model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, menu_model)
        _n += 1
      end
      if !n_pages.nil?
        (_names.to_unsafe + _n).value = "n-pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_pages)
        _n += 1
      end
      if !n_pinned_pages.nil?
        (_names.to_unsafe + _n).value = "n-pinned-pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, n_pinned_pages)
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
      if !pages.nil?
        (_names.to_unsafe + _n).value = "pages".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pages)
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
      if !selected_page.nil?
        (_names.to_unsafe + _n).value = "selected-page".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selected_page)
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

      @pointer = LibGObject.g_object_new_with_properties(TabView.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new `AdwTabView`.
    def initialize
      # adw_tab_view_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds @child to @self with @parent as the parent.
    #
    # This function can be used to automatically position new pages, and to select
    # the correct page when this page is closed while being selected (see
    # `TabView#close_page`).
    #
    # If @parent is `NULL`, this function is equivalent to `TabView#append`.
    def add_page(child : Gtk::Widget, parent : Adw::TabPage?) : Adw::TabPage
      # adw_tab_view_add_page: (Method)
      # @parent: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      parent = if parent.nil?
                 Pointer(Void).null
               else
                 parent.to_unsafe
               end

      # C call
      _retval = LibAdw.adw_tab_view_add_page(self, child, parent)

      # Return value handling

      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    # Inserts @child as the last non-pinned page.
    def append(child : Gtk::Widget) : Adw::TabPage
      # adw_tab_view_append: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_append(self, child)

      # Return value handling

      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    # Inserts @child as the last pinned page.
    def append_pinned(child : Gtk::Widget) : Adw::TabPage
      # adw_tab_view_append_pinned: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_append_pinned(self, child)

      # Return value handling

      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    # Requests to close all pages other than @page.
    def close_other_pages(page : Adw::TabPage) : Nil
      # adw_tab_view_close_other_pages: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_view_close_other_pages(self, page)

      # Return value handling
    end

    # Requests to close @page.
    #
    # Calling this function will result in the [signal@TabView::close-page] signal
    # being emitted for @page. Closing the page can then be confirmed or
    # denied via `TabView#close_page_finish`.
    #
    # If the page is waiting for a `TabView#close_page_finish` call, this
    # function will do nothing.
    #
    # The default handler for [signal@TabView::close-page] will immediately confirm
    # closing the page if it's non-pinned, or reject it if it's pinned. This
    # behavior can be changed by registering your own handler for that signal.
    #
    # If @page was selected, another page will be selected instead:
    #
    # If the `TabPage#parent` value is `NULL`, the next page will be
    # selected when possible, or if the page was already last, the previous page
    # will be selected instead.
    #
    # If it's not `NULL`, the previous page will be selected if it's a descendant
    # (possibly indirect) of the parent. If both the previous page and the parent
    # are pinned, the parent will be selected instead.
    def close_page(page : Adw::TabPage) : Nil
      # adw_tab_view_close_page: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_view_close_page(self, page)

      # Return value handling
    end

    # Completes a `TabView#close_page` call for @page.
    #
    # If @confirm is `TRUE`, @page will be closed. If it's `FALSE`, it will be
    # reverted to its previous state and `TabView#close_page` can be called
    # for it again.
    #
    # This function should not be called unless a custom handler for
    # [signal@TabView::close-page] is used.
    def close_page_finish(page : Adw::TabPage, confirm : Bool) : Nil
      # adw_tab_view_close_page_finish: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_view_close_page_finish(self, page, confirm)

      # Return value handling
    end

    # Requests to close all pages after @page.
    def close_pages_after(page : Adw::TabPage) : Nil
      # adw_tab_view_close_pages_after: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_view_close_pages_after(self, page)

      # Return value handling
    end

    # Requests to close all pages before @page.
    def close_pages_before(page : Adw::TabPage) : Nil
      # adw_tab_view_close_pages_before: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_view_close_pages_before(self, page)

      # Return value handling
    end

    # Gets the default icon of @self.
    def default_icon : Gio::Icon
      # adw_tab_view_get_default_icon: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_get_default_icon(self)

      # Return value handling

      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::None)
    end

    # Whether a page is being transferred.
    def is_transferring_page : Bool
      # adw_tab_view_get_is_transferring_page: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_get_is_transferring_page(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the tab context menu model for @self.
    def menu_model : Gio::MenuModel?
      # adw_tab_view_get_menu_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_get_menu_model(self)

      # Return value handling

      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the number of pages in @self.
    def n_pages : Int32
      # adw_tab_view_get_n_pages: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_get_n_pages(self)

      # Return value handling

      _retval
    end

    # Gets the number of pinned pages in @self.
    def n_pinned_pages : Int32
      # adw_tab_view_get_n_pinned_pages: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_get_n_pinned_pages(self)

      # Return value handling

      _retval
    end

    # Gets the `#TabPage` representing the child at @position.
    def nth_page(position : Int32) : Adw::TabPage
      # adw_tab_view_get_nth_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_get_nth_page(self, position)

      # Return value handling

      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the `#TabPage` object representing @child.
    def page(child : Gtk::Widget) : Adw::TabPage
      # adw_tab_view_get_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_get_page(self, child)

      # Return value handling

      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    # Finds the position of @page in @self, starting from 0.
    def page_position(page : Adw::TabPage) : Int32
      # adw_tab_view_get_page_position: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_get_page_position(self, page)

      # Return value handling

      _retval
    end

    # Returns a `Gio#ListModel` that contains the pages of @self.
    #
    # This can be used to keep an up-to-date view. The model also implements
    # `Gtk#SelectionModel` and can be used to track and change the selected
    # page.
    def pages : Gtk::SelectionModel
      # adw_tab_view_get_pages: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibAdw.adw_tab_view_get_pages(self)

      # Return value handling

      Gtk::SelectionModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the currently selected page in @self.
    def selected_page : Adw::TabPage?
      # adw_tab_view_get_selected_page: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_get_selected_page(self)

      # Return value handling

      Adw::TabPage.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Inserts a non-pinned page at @position.
    #
    # It's an error to try to insert a page before a pinned page, in that case
    # `TabView#insert_pinned` should be used instead.
    def insert(child : Gtk::Widget, position : Int32) : Adw::TabPage
      # adw_tab_view_insert: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_insert(self, child, position)

      # Return value handling

      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    # Inserts a pinned page at @position.
    #
    # It's an error to try to insert a pinned page after a non-pinned page, in
    # that case `TabView#insert` should be used instead.
    def insert_pinned(child : Gtk::Widget, position : Int32) : Adw::TabPage
      # adw_tab_view_insert_pinned: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_insert_pinned(self, child, position)

      # Return value handling

      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    # Inserts @child as the first non-pinned page.
    def prepend(child : Gtk::Widget) : Adw::TabPage
      # adw_tab_view_prepend: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_prepend(self, child)

      # Return value handling

      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    # Inserts @child as the first pinned page.
    def prepend_pinned(child : Gtk::Widget) : Adw::TabPage
      # adw_tab_view_prepend_pinned: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_prepend_pinned(self, child)

      # Return value handling

      Adw::TabPage.new(_retval, GICrystal::Transfer::None)
    end

    # Reorders @page to before its previous page if possible.
    def reorder_backward(page : Adw::TabPage) : Bool
      # adw_tab_view_reorder_backward: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_reorder_backward(self, page)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Reorders @page to the first possible position.
    def reorder_first(page : Adw::TabPage) : Bool
      # adw_tab_view_reorder_first: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_reorder_first(self, page)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Reorders @page to after its next page if possible.
    def reorder_forward(page : Adw::TabPage) : Bool
      # adw_tab_view_reorder_forward: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_reorder_forward(self, page)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Reorders @page to the last possible position.
    def reorder_last(page : Adw::TabPage) : Bool
      # adw_tab_view_reorder_last: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_reorder_last(self, page)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Reorders @page to @position.
    #
    # It's a programmer error to try to reorder a pinned page after a non-pinned
    # one, or a non-pinned page before a pinned one.
    def reorder_page(page : Adw::TabPage, position : Int32) : Bool
      # adw_tab_view_reorder_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_reorder_page(self, page, position)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Selects the page after the currently selected page.
    #
    # If the last page was already selected, this function does nothing.
    def select_next_page : Bool
      # adw_tab_view_select_next_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_select_next_page(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Selects the page before the currently selected page.
    #
    # If the first page was already selected, this function does nothing.
    def select_previous_page : Bool
      # adw_tab_view_select_previous_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_tab_view_select_previous_page(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the default page icon for @self.
    def default_icon=(default_icon : Gio::Icon) : Nil
      # adw_tab_view_set_default_icon: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_view_set_default_icon(self, default_icon)

      # Return value handling
    end

    # Sets the tab context menu model for @self.
    def menu_model=(menu_model : Gio::MenuModel?) : Nil
      # adw_tab_view_set_menu_model: (Method | Setter)
      # @menu_model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      menu_model = if menu_model.nil?
                     Pointer(Void).null
                   else
                     menu_model.to_unsafe
                   end

      # C call
      LibAdw.adw_tab_view_set_menu_model(self, menu_model)

      # Return value handling
    end

    # Pins or unpins @page.
    #
    # Pinned pages are guaranteed to be placed before all non-pinned pages; at any
    # given moment the first [property@TabView:n-pinned-pages] pages in @self are
    # guaranteed to be pinned.
    #
    # When a page is pinned or unpinned, it's automatically reordered: pinning a
    # page moves it after other pinned pages; unpinning a page moves it before
    # other non-pinned pages.
    #
    # Pinned pages can still be reordered between each other.
    #
    # `#TabBar` will display pinned pages in a compact form, never showing the
    # title or close button, and only showing a single icon, selected in the
    # following order:
    #
    # 1. [property@TabPage:indicator-icon]
    # 2. A spinner if `TabPage#loading` is `TRUE`
    # 3. `TabPage#icon`
    # 4. [property@TabView:default-icon]
    #
    # Pinned pages cannot be closed by default, see [signal@TabView::close-page]
    # for how to override that behavior.
    #
    # Changes the value of the `TabPage#pinned` property.
    def set_page_pinned(page : Adw::TabPage, pinned : Bool) : Nil
      # adw_tab_view_set_page_pinned: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_view_set_page_pinned(self, page, pinned)

      # Return value handling
    end

    # Sets the currently selected page in @self.
    def selected_page=(selected_page : Adw::TabPage) : Nil
      # adw_tab_view_set_selected_page: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_view_set_selected_page(self, selected_page)

      # Return value handling
    end

    # Transfers @page from @self to @other_view.
    #
    # The @page object will be reused.
    #
    # It's a programmer error to try to insert a pinned page after a non-pinned
    # one, or a non-pinned page before a pinned one.
    def transfer_page(page : Adw::TabPage, other_view : Adw::TabView, position : Int32) : Nil
      # adw_tab_view_transfer_page: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_tab_view_transfer_page(self, page, other_view, position)

      # Return value handling
    end

    # Emitted after `TabView#close_page` has been called for @page.
    #
    # The handler is expected to call `TabView#close_page_finish` to
    # confirm or reject the closing.
    #
    # The default handler will immediately confirm closing for non-pinned pages,
    # or reject it for pinned pages, equivalent to the following example:
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # static gboolean
    # close_page_cb (AdwTabView *view,
    #                AdwTabPage *page,
    #                gpointer    user_data)
    # {
    #   adw_tab_view_close_page_finish (view, page, !adw_tab_page_get_pinned (page));
    #
    #   return GDK_EVENT_STOP;
    # }
    # ```
    #
    # The `TabView#close_page_finish` call doesn't have to happen inside
    # the handler, so can be used to do asynchronous checks before confirming the
    # closing.
    #
    # A typical reason to connect to this signal is to show a confirmation dialog
    # for closing a tab.
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

      def connect(handler : Proc(Adw::TabPage, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabPage, Bool)).unbox(_lib_box).call(page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabPage, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabPage, Bool)).unbox(_lib_box).call(page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Adw::TabView, Adw::TabPage, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabView, Adw::TabPage, Bool)).unbox(_lib_box).call(_sender, page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabView, Adw::TabPage, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabView, Adw::TabPage, Bool)).unbox(_lib_box).call(_sender, page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage) : Nil
        LibGObject.g_signal_emit_by_name(@source, "close-page", page)
      end
    end

    def close_page_signal
      ClosePageSignal.new(self)
    end

    # Emitted when a tab should be transferred into a new window.
    #
    # This can happen after a tab has been dropped on desktop.
    #
    # The signal handler is expected to create a new window, position it as
    # needed and return its `AdwTabView` that the page will be transferred into.
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

      def connect(handler : Proc(Adw::TabView))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Adw::TabView)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabView))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Adw::TabView)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Adw::TabView, Adw::TabView))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabView, Adw::TabView)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabView, Adw::TabView))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::TabView, Adw::TabView)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "create-window")
      end
    end

    def create_window_signal
      CreateWindowSignal.new(self)
    end

    # Emitted after the indicator icon on @page has been activated.
    #
    # See [property@TabPage:indicator-icon] and
    # [property@TabPage:indicator-activatable].
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

      def connect(handler : Proc(Adw::TabPage, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabPage, Nil)).unbox(_lib_box).call(page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabPage, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabPage, Nil)).unbox(_lib_box).call(page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Adw::TabView, Adw::TabPage, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabView, Adw::TabPage, Nil)).unbox(_lib_box).call(_sender, page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabView, Adw::TabPage, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabView, Adw::TabPage, Nil)).unbox(_lib_box).call(_sender, page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage) : Nil
        LibGObject.g_signal_emit_by_name(@source, "indicator-activated", page)
      end
    end

    def indicator_activated_signal
      IndicatorActivatedSignal.new(self)
    end

    # Emitted when a page has been created or transferred to @self.
    #
    # A typical reason to connect to this signal would be to connect to page
    # signals for things such as updating window title.
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

      def connect(handler : Proc(Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(_sender, page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(_sender, page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage, position : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-attached", page, position)
      end
    end

    def page_attached_signal
      PageAttachedSignal.new(self)
    end

    # Emitted when a page has been removed or transferred to another view.
    #
    # A typical reason to connect to this signal would be to disconnect signal
    # handlers connected in the [signal@TabView::page-attached] handler.
    #
    # It is important not to try and destroy the page child in the handler of
    # this function as the child might merely be moved to another window; use
    # child dispose handler for that or do it in sync with your
    # `TabView#close_page_finish` calls.
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

      def connect(handler : Proc(Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(_sender, page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(_sender, page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage, position : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-detached", page, position)
      end
    end

    def page_detached_signal
      PageDetachedSignal.new(self)
    end

    # Emitted after @page has been reordered to @position.
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

      def connect(handler : Proc(Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(_sender, page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabView, Adw::TabPage, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_position : Int32, _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          position = lib_position
          ::Box(Proc(Adw::TabView, Adw::TabPage, Int32, Nil)).unbox(_lib_box).call(_sender, page, position)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage, position : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-reordered", page, position)
      end
    end

    def page_reordered_signal
      PageReorderedSignal.new(self)
    end

    # Emitted when a context menu is opened or closed for @page.
    #
    # If the menu has been closed, @page will be set to `NULL`.
    #
    # It can be used to set up menu actions before showing the menu, for example
    # disable actions not applicable to @page.
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

      def connect(&block : Proc(Adw::TabPage?, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Adw::TabPage?, Nil))
        connect(block)
      end

      def connect(handler : Proc(Adw::TabPage?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::NullableArrayPlan
          page = (lib_page.null? ? nil : Adw::TabPage.new(lib_page, GICrystal::Transfer::None))
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabPage?, Nil)).unbox(_lib_box).call(page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabPage?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::NullableArrayPlan
          page = (lib_page.null? ? nil : Adw::TabPage.new(lib_page, GICrystal::Transfer::None))
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabPage?, Nil)).unbox(_lib_box).call(page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Adw::TabView, Adw::TabPage?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::NullableArrayPlan
          page = (lib_page.null? ? nil : Adw::TabPage.new(lib_page, GICrystal::Transfer::None))
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabView, Adw::TabPage?, Nil)).unbox(_lib_box).call(_sender, page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::TabView, Adw::TabPage?, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::TabView.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::NullableArrayPlan
          page = (lib_page.null? ? nil : Adw::TabPage.new(lib_page, GICrystal::Transfer::None))
          # Generator::GObjectArgPlan
          page = Adw::TabPage.new(lib_page, :none)
          ::Box(Proc(Adw::TabView, Adw::TabPage?, Nil)).unbox(_lib_box).call(_sender, page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Adw::TabPage?) : Nil
        LibGObject.g_signal_emit_by_name(@source, "setup-menu", page)
      end
    end

    def setup_menu_signal
      SetupMenuSignal.new(self)
    end
  end
end
