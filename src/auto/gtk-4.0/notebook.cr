require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkNotebook` is a container whose children are pages switched
  # between using tabs.
  #
  # ![An example GtkNotebook](notebook.png)
  #
  # There are many configuration options for `GtkNotebook`. Among
  # other things, you can choose on which edge the tabs appear
  # (see [method@Gtk.Notebook.set_tab_pos]), whether, if there are
  # too many tabs to fit the notebook should be made bigger or scrolling
  # arrows added (see [method@Gtk.Notebook.set_scrollable]), and whether
  # there will be a popup menu allowing the users to switch pages.
  # (see [method@Gtk.Notebook.popup_enable]).
  #
  # # GtkNotebook as GtkBuildable
  #
  # The `GtkNotebook` implementation of the `GtkBuildable` interface
  # supports placing children into tabs by specifying “tab” as the
  # “type” attribute of a <child> element. Note that the content
  # of the tab must be created before the tab can be filled.
  # A tab child can be specified without specifying a <child>
  # type attribute.
  #
  # To add a child widget in the notebooks action area, specify
  # "action-start" or “action-end” as the “type” attribute of the
  # <child> element.
  #
  # An example of a UI definition fragment with `GtkNotebook`:
  #
  # ```xml
  # <object class="GtkNotebook">
  #   <child>
  #     <object class="GtkLabel" id="notebook-content">
  #       <property name="label">Content</property>
  #     </object>
  #   </child>
  #   <child type="tab">
  #     <object class="GtkLabel" id="notebook-tab">
  #       <property name="label">Tab</property>
  #     </object>
  #   </child>
  # </object>
  # ```
  #
  # # CSS nodes
  #
  # ```
  # notebook
  # ├── header.top
  # │   ├── [<action widget>]
  # │   ├── tabs
  # │   │   ├── [arrow]
  # │   │   ├── tab
  # │   │   │   ╰── <tab label>
  # ┊   ┊   ┊
  # │   │   ├── tab[.reorderable-page]
  # │   │   │   ╰── <tab label>
  # │   │   ╰── [arrow]
  # │   ╰── [<action widget>]
  # │
  # ╰── stack
  #     ├── <child>
  #     ┊
  #     ╰── <child>
  # ```
  #
  # `GtkNotebook` has a main CSS node with name `notebook`, a subnode
  # with name `header` and below that a subnode with name `tabs` which
  # contains one subnode per tab with name `tab`.
  #
  # If action widgets are present, their CSS nodes are placed next
  # to the `tabs` node. If the notebook is scrollable, CSS nodes with
  # name `arrow` are placed as first and last child of the `tabs` node.
  #
  # The main node gets the `.frame` style class when the notebook
  # has a border (see [method@Gtk.Notebook.set_show_border]).
  #
  # The header node gets one of the style class `.top`, `.bottom`,
  # `.left` or `.right`, depending on where the tabs are placed. For
  # reorderable pages, the tab node gets the `.reorderable-page` class.
  #
  # A `tab` node gets the `.dnd` style class while it is moved with drag-and-drop.
  #
  # The nodes are always arranged from left-to-right, regardless of text direction.
  #
  # # Accessibility
  #
  # `GtkNotebook` uses the following roles:
  #
  #  - %GTK_ACCESSIBLE_ROLE_GROUP for the notebook widget
  #  - %GTK_ACCESSIBLE_ROLE_TAB_LIST for the list of tabs
  #  - %GTK_ACCESSIBLE_ROLE_TAB role for each tab
  #  - %GTK_ACCESSIBLE_ROLE_TAB_PANEL for each page
  class Notebook < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, enable_popup : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, group_name : ::String? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, page : Int32? = nil, pages : Gio::ListModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, scrollable : Bool? = nil, sensitive : Bool? = nil, show_border : Bool? = nil, show_tabs : Bool? = nil, tab_pos : Gtk::PositionType? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[43]
      _values = StaticArray(LibGObject::Value, 43).new(LibGObject::Value.new)
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
      if enable_popup
        (_names.to_unsafe + _n).value = "enable-popup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_popup)
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
      if group_name
        (_names.to_unsafe + _n).value = "group-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, group_name)
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
      if page
        (_names.to_unsafe + _n).value = "page".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, page)
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
      if scrollable
        (_names.to_unsafe + _n).value = "scrollable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scrollable)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if show_border
        (_names.to_unsafe + _n).value = "show-border".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_border)
        _n += 1
      end
      if show_tabs
        (_names.to_unsafe + _n).value = "show-tabs".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_tabs)
        _n += 1
      end
      if tab_pos
        (_names.to_unsafe + _n).value = "tab-pos".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tab_pos)
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

      @pointer = LibGObject.g_object_new_with_properties(Notebook.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_notebook_get_type
    end

    def enable_popup=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-popup", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_popup? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-popup", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def group_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "group-name", unsafe_value, Pointer(Void).null)
      value
    end

    def group_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "group-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def page=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "page", unsafe_value, Pointer(Void).null)
      value
    end

    def page : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "page", pointerof(value), Pointer(Void).null)
      value
    end

    def pages : Gio::ListModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pages", pointerof(value), Pointer(Void).null)
      Gio::ListModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def scrollable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "scrollable", unsafe_value, Pointer(Void).null)
      value
    end

    def scrollable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "scrollable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def show_border=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-border", unsafe_value, Pointer(Void).null)
      value
    end

    def show_border? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-border", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def show_tabs=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-tabs", unsafe_value, Pointer(Void).null)
      value
    end

    def show_tabs? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-tabs", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def tab_pos=(value : Gtk::PositionType) : Gtk::PositionType
      unsafe_value = value

      LibGObject.g_object_set(self, "tab-pos", unsafe_value, Pointer(Void).null)
      value
    end

    def tab_pos : Gtk::PositionType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "tab-pos", pointerof(value), Pointer(Void).null)
      Gtk::PositionType.from_value(value)
    end

    def initialize
      # gtk_notebook_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_new
      @pointer = _retval
    end

    def append_page(child : Gtk::Widget, tab_label : Gtk::Widget?) : Int32
      # gtk_notebook_append_page: (Method)
      # @tab_label: (nullable)
      # Returns: (transfer none)

      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end

      _retval = LibGtk.gtk_notebook_append_page(self, child, tab_label)
      _retval
    end

    def append_page_menu(child : Gtk::Widget, tab_label : Gtk::Widget?, menu_label : Gtk::Widget?) : Int32
      # gtk_notebook_append_page_menu: (Method)
      # @tab_label: (nullable)
      # @menu_label: (nullable)
      # Returns: (transfer none)

      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end
      menu_label = if menu_label.nil?
                     Pointer(Void).null
                   else
                     menu_label.to_unsafe
                   end

      _retval = LibGtk.gtk_notebook_append_page_menu(self, child, tab_label, menu_label)
      _retval
    end

    def detach_tab(child : Gtk::Widget) : Nil
      # gtk_notebook_detach_tab: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_detach_tab(self, child)
    end

    def action_widget(pack_type : Gtk::PackType) : Gtk::Widget?
      # gtk_notebook_get_action_widget: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_action_widget(self, pack_type)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def current_page : Int32
      # gtk_notebook_get_current_page: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_current_page(self)
      _retval
    end

    def group_name : ::String?
      # gtk_notebook_get_group_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_group_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def menu_label(child : Gtk::Widget) : Gtk::Widget?
      # gtk_notebook_get_menu_label: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_menu_label(self, child)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def menu_label_text(child : Gtk::Widget) : ::String?
      # gtk_notebook_get_menu_label_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_menu_label_text(self, child)
      ::String.new(_retval) unless _retval.null?
    end

    def n_pages : Int32
      # gtk_notebook_get_n_pages: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_n_pages(self)
      _retval
    end

    def nth_page(page_num : Int32) : Gtk::Widget?
      # gtk_notebook_get_nth_page: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_nth_page(self, page_num)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def page(child : Gtk::Widget) : Gtk::NotebookPage
      # gtk_notebook_get_page: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_page(self, child)
      Gtk::NotebookPage.new(_retval, GICrystal::Transfer::None)
    end

    def pages : Gio::ListModel
      # gtk_notebook_get_pages: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_notebook_get_pages(self)
      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def scrollable : Bool
      # gtk_notebook_get_scrollable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_scrollable(self)
      GICrystal.to_bool(_retval)
    end

    def show_border : Bool
      # gtk_notebook_get_show_border: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_show_border(self)
      GICrystal.to_bool(_retval)
    end

    def show_tabs : Bool
      # gtk_notebook_get_show_tabs: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_show_tabs(self)
      GICrystal.to_bool(_retval)
    end

    def tab_detachable(child : Gtk::Widget) : Bool
      # gtk_notebook_get_tab_detachable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_tab_detachable(self, child)
      GICrystal.to_bool(_retval)
    end

    def tab_label(child : Gtk::Widget) : Gtk::Widget?
      # gtk_notebook_get_tab_label: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_tab_label(self, child)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def tab_label_text(child : Gtk::Widget) : ::String?
      # gtk_notebook_get_tab_label_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_tab_label_text(self, child)
      ::String.new(_retval) unless _retval.null?
    end

    def tab_pos : Gtk::PositionType
      # gtk_notebook_get_tab_pos: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_tab_pos(self)
      Gtk::PositionType.from_value(_retval)
    end

    def tab_reorderable(child : Gtk::Widget) : Bool
      # gtk_notebook_get_tab_reorderable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_get_tab_reorderable(self, child)
      GICrystal.to_bool(_retval)
    end

    def insert_page(child : Gtk::Widget, tab_label : Gtk::Widget?, position : Int32) : Int32
      # gtk_notebook_insert_page: (Method)
      # @tab_label: (nullable)
      # Returns: (transfer none)

      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end

      _retval = LibGtk.gtk_notebook_insert_page(self, child, tab_label, position)
      _retval
    end

    def insert_page_menu(child : Gtk::Widget, tab_label : Gtk::Widget?, menu_label : Gtk::Widget?, position : Int32) : Int32
      # gtk_notebook_insert_page_menu: (Method)
      # @tab_label: (nullable)
      # @menu_label: (nullable)
      # Returns: (transfer none)

      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end
      menu_label = if menu_label.nil?
                     Pointer(Void).null
                   else
                     menu_label.to_unsafe
                   end

      _retval = LibGtk.gtk_notebook_insert_page_menu(self, child, tab_label, menu_label, position)
      _retval
    end

    def next_page : Nil
      # gtk_notebook_next_page: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_next_page(self)
    end

    def page_num(child : Gtk::Widget) : Int32
      # gtk_notebook_page_num: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_notebook_page_num(self, child)
      _retval
    end

    def popup_disable : Nil
      # gtk_notebook_popup_disable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_popup_disable(self)
    end

    def popup_enable : Nil
      # gtk_notebook_popup_enable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_popup_enable(self)
    end

    def prepend_page(child : Gtk::Widget, tab_label : Gtk::Widget?) : Int32
      # gtk_notebook_prepend_page: (Method)
      # @tab_label: (nullable)
      # Returns: (transfer none)

      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end

      _retval = LibGtk.gtk_notebook_prepend_page(self, child, tab_label)
      _retval
    end

    def prepend_page_menu(child : Gtk::Widget, tab_label : Gtk::Widget?, menu_label : Gtk::Widget?) : Int32
      # gtk_notebook_prepend_page_menu: (Method)
      # @tab_label: (nullable)
      # @menu_label: (nullable)
      # Returns: (transfer none)

      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end
      menu_label = if menu_label.nil?
                     Pointer(Void).null
                   else
                     menu_label.to_unsafe
                   end

      _retval = LibGtk.gtk_notebook_prepend_page_menu(self, child, tab_label, menu_label)
      _retval
    end

    def prev_page : Nil
      # gtk_notebook_prev_page: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_prev_page(self)
    end

    def remove_page(page_num : Int32) : Nil
      # gtk_notebook_remove_page: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_remove_page(self, page_num)
    end

    def reorder_child(child : Gtk::Widget, position : Int32) : Nil
      # gtk_notebook_reorder_child: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_reorder_child(self, child, position)
    end

    def set_action_widget(widget : Gtk::Widget, pack_type : Gtk::PackType) : Nil
      # gtk_notebook_set_action_widget: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_set_action_widget(self, widget, pack_type)
    end

    def current_page=(page_num : Int32) : Nil
      # gtk_notebook_set_current_page: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_set_current_page(self, page_num)
    end

    def group_name=(group_name : ::String?) : Nil
      # gtk_notebook_set_group_name: (Method)
      # @group_name: (nullable)
      # Returns: (transfer none)

      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end

      LibGtk.gtk_notebook_set_group_name(self, group_name)
    end

    def set_menu_label(child : Gtk::Widget, menu_label : Gtk::Widget?) : Nil
      # gtk_notebook_set_menu_label: (Method)
      # @menu_label: (nullable)
      # Returns: (transfer none)

      menu_label = if menu_label.nil?
                     Pointer(Void).null
                   else
                     menu_label.to_unsafe
                   end

      LibGtk.gtk_notebook_set_menu_label(self, child, menu_label)
    end

    def set_menu_label_text(child : Gtk::Widget, menu_text : ::String) : Nil
      # gtk_notebook_set_menu_label_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_set_menu_label_text(self, child, menu_text)
    end

    def scrollable=(scrollable : Bool) : Nil
      # gtk_notebook_set_scrollable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_set_scrollable(self, scrollable)
    end

    def show_border=(show_border : Bool) : Nil
      # gtk_notebook_set_show_border: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_set_show_border(self, show_border)
    end

    def show_tabs=(show_tabs : Bool) : Nil
      # gtk_notebook_set_show_tabs: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_set_show_tabs(self, show_tabs)
    end

    def set_tab_detachable(child : Gtk::Widget, detachable : Bool) : Nil
      # gtk_notebook_set_tab_detachable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_set_tab_detachable(self, child, detachable)
    end

    def set_tab_label(child : Gtk::Widget, tab_label : Gtk::Widget?) : Nil
      # gtk_notebook_set_tab_label: (Method)
      # @tab_label: (nullable)
      # Returns: (transfer none)

      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end

      LibGtk.gtk_notebook_set_tab_label(self, child, tab_label)
    end

    def set_tab_label_text(child : Gtk::Widget, tab_text : ::String) : Nil
      # gtk_notebook_set_tab_label_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_set_tab_label_text(self, child, tab_text)
    end

    def tab_pos=(pos : Gtk::PositionType) : Nil
      # gtk_notebook_set_tab_pos: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_set_tab_pos(self, pos)
    end

    def set_tab_reorderable(child : Gtk::Widget, reorderable : Bool) : Nil
      # gtk_notebook_set_tab_reorderable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_notebook_set_tab_reorderable(self, child, reorderable)
    end

    struct ChangeCurrentPageSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "change-current-page::#{@detail}" : "change-current-page"
      end

      def connect(&block : Proc(Int32, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Int32, Bool))
        connect(block)
      end

      def connect(block : Proc(Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Int32, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          arg0 = lib_arg0
          ::Box(Proc(Int32, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Notebook, Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::Notebook, Int32, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Notebook, Int32, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Int32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = lib_arg0
          ::Box(Proc(Gtk::Notebook, Int32, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "change-current-page", object)
      end
    end

    def change_current_page_signal
      ChangeCurrentPageSignal.new(self)
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

      def connect(&block : Proc(Gtk::Widget, Gtk::Notebook))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Widget, Gtk::Notebook))
        connect(block)
      end

      def connect(block : Proc(Gtk::Widget, Gtk::Notebook))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Gtk::Notebook)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, Gtk::Notebook))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Widget, Gtk::Notebook)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Notebook, Gtk::Widget, Gtk::Notebook))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, Gtk::Notebook)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Notebook, Gtk::Widget, Gtk::Notebook))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, Gtk::Notebook)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Gtk::Widget) : Nil
        LibGObject.g_signal_emit_by_name(@source, "create-window", page)
      end
    end

    def create_window_signal
      CreateWindowSignal.new(self)
    end

    struct FocusTabSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "focus-tab::#{@detail}" : "focus-tab"
      end

      def connect(&block : Proc(Gtk::NotebookTab, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::NotebookTab, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::NotebookTab, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::NotebookTab.from_value(lib_arg0)
          ::Box(Proc(Gtk::NotebookTab, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::NotebookTab, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::NotebookTab.from_value(lib_arg0)
          ::Box(Proc(Gtk::NotebookTab, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Notebook, Gtk::NotebookTab, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::NotebookTab.from_value(lib_arg0)
          ::Box(Proc(Gtk::Notebook, Gtk::NotebookTab, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Notebook, Gtk::NotebookTab, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::NotebookTab.from_value(lib_arg0)
          ::Box(Proc(Gtk::Notebook, Gtk::NotebookTab, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Gtk::NotebookTab) : Nil
        LibGObject.g_signal_emit_by_name(@source, "focus-tab", object)
      end
    end

    def focus_tab_signal
      FocusTabSignal.new(self)
    end

    struct MoveFocusOutSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "move-focus-out::#{@detail}" : "move-focus-out"
      end

      def connect(&block : Proc(Gtk::DirectionType, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::DirectionType, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::DirectionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::DirectionType, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Notebook, Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::Notebook, Gtk::DirectionType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Notebook, Gtk::DirectionType, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          ::Box(Proc(Gtk::Notebook, Gtk::DirectionType, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Gtk::DirectionType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-focus-out", object)
      end
    end

    def move_focus_out_signal
      MoveFocusOutSignal.new(self)
    end

    struct PageAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "page-added::#{@detail}" : "page-added"
      end

      def connect(&block : Proc(Gtk::Widget, UInt32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Widget, UInt32, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(child : Gtk::Widget, page_num : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-added", child, page_num)
      end
    end

    def page_added_signal
      PageAddedSignal.new(self)
    end

    struct PageRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "page-removed::#{@detail}" : "page-removed"
      end

      def connect(&block : Proc(Gtk::Widget, UInt32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Widget, UInt32, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(child : Gtk::Widget, page_num : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-removed", child, page_num)
      end
    end

    def page_removed_signal
      PageRemovedSignal.new(self)
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

      def connect(&block : Proc(Gtk::Widget, UInt32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Widget, UInt32, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(child : Gtk::Widget, page_num : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-reordered", child, page_num)
      end
    end

    def page_reordered_signal
      PageReorderedSignal.new(self)
    end

    struct ReorderTabSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "reorder-tab::#{@detail}" : "reorder-tab"
      end

      def connect(&block : Proc(Gtk::DirectionType, Bool, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::DirectionType, Bool, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::DirectionType, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::DirectionType, Bool, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::DirectionType, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::DirectionType, Bool, Bool)).unbox(box).call(arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Notebook, Gtk::DirectionType, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::Notebook, Gtk::DirectionType, Bool, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Notebook, Gtk::DirectionType, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::DirectionType.from_value(lib_arg0)
          arg1 = GICrystal.to_bool(lib_arg1)
          ::Box(Proc(Gtk::Notebook, Gtk::DirectionType, Bool, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Gtk::DirectionType, p0 : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "reorder-tab", object, p0)
      end
    end

    def reorder_tab_signal
      ReorderTabSignal.new(self)
    end

    struct SelectPageSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "select-page::#{@detail}" : "select-page"
      end

      def connect(&block : Proc(Bool, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, Bool))
        connect(block)
      end

      def connect(block : Proc(Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Notebook, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::Notebook, Bool, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Notebook, Bool, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gtk::Notebook, Bool, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(object : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-page", object)
      end
    end

    def select_page_signal
      SelectPageSignal.new(self)
    end

    struct SwitchPageSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "switch-page::#{@detail}" : "switch-page"
      end

      def connect(&block : Proc(Gtk::Widget, UInt32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Widget, UInt32, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Notebook.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Widget.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = lib_arg1
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Gtk::Widget, page_num : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "switch-page", page, page_num)
      end
    end

    def switch_page_signal
      SwitchPageSignal.new(self)
    end
  end
end
