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
  # (see `Gtk::Notebook#tab_pos=`), whether, if there are
  # too many tabs to fit the notebook should be made bigger or scrolling
  # arrows added (see `Gtk::Notebook#scrollable=`), and whether
  # there will be a popup menu allowing the users to switch pages.
  # (see `Gtk::Notebook#popup_enable`).
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
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
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
  # has a border (see `Gtk::Notebook#show_border=`).
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
  @[GObject::GeneratedWrapper]
  class Notebook < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Notebook, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Notebook`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, enable_popup : Bool? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, group_name : ::String? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, page : Int32? = nil, pages : Gio::ListModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, scrollable : Bool? = nil, sensitive : Bool? = nil, show_border : Bool? = nil, show_tabs : Bool? = nil, tab_pos : Gtk::PositionType? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[43]
      _values = StaticArray(LibGObject::Value, 43).new(LibGObject::Value.new)
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
      if !enable_popup.nil?
        (_names.to_unsafe + _n).value = "enable-popup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_popup)
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
      if !group_name.nil?
        (_names.to_unsafe + _n).value = "group-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, group_name)
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
      if !page.nil?
        (_names.to_unsafe + _n).value = "page".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, page)
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
      if !scrollable.nil?
        (_names.to_unsafe + _n).value = "scrollable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scrollable)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !show_border.nil?
        (_names.to_unsafe + _n).value = "show-border".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_border)
        _n += 1
      end
      if !show_tabs.nil?
        (_names.to_unsafe + _n).value = "show-tabs".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_tabs)
        _n += 1
      end
      if !tab_pos.nil?
        (_names.to_unsafe + _n).value = "tab-pos".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tab_pos)
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

      @pointer = LibGObject.g_object_new_with_properties(Notebook.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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
      Gio::AbstractListModel.new(value, GICrystal::Transfer::None) unless value.null?
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
      Gtk::PositionType.new(value)
    end

    # Appends a page to @notebook.
    def append_page(child : Gtk::Widget, tab_label : Gtk::Widget?) : Int32
      # gtk_notebook_append_page: (Method)
      # @tab_label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end

      # C call
      _retval = LibGtk.gtk_notebook_append_page(@pointer, child, tab_label)

      # Return value handling

      _retval
    end

    # Appends a page to @notebook, specifying the widget to use as the
    # label in the popup menu.
    def append_page_menu(child : Gtk::Widget, tab_label : Gtk::Widget?, menu_label : Gtk::Widget?) : Int32
      # gtk_notebook_append_page_menu: (Method)
      # @tab_label: (nullable)
      # @menu_label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end
      # Generator::NullableArrayPlan
      menu_label = if menu_label.nil?
                     Pointer(Void).null
                   else
                     menu_label.to_unsafe
                   end

      # C call
      _retval = LibGtk.gtk_notebook_append_page_menu(@pointer, child, tab_label, menu_label)

      # Return value handling

      _retval
    end

    # Removes the child from the notebook.
    #
    # This function is very similar to `Gtk::Notebook#remove_page`,
    # but additionally informs the notebook that the removal
    # is happening as part of a tab DND operation, which should
    # not be cancelled.
    def detach_tab(child : Gtk::Widget) : Nil
      # gtk_notebook_detach_tab: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_detach_tab(@pointer, child)

      # Return value handling
    end

    # Gets one of the action widgets.
    #
    # See `Gtk::Notebook#action_widget=`.
    def action_widget(pack_type : Gtk::PackType) : Gtk::Widget?
      # gtk_notebook_get_action_widget: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_action_widget(@pointer, pack_type)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the page number of the current page.
    def current_page : Int32
      # gtk_notebook_get_current_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_current_page(@pointer)

      # Return value handling

      _retval
    end

    # Gets the current group name for @notebook.
    def group_name : ::String?
      # gtk_notebook_get_group_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_group_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Retrieves the menu label widget of the page containing @child.
    def menu_label(child : Gtk::Widget) : Gtk::Widget?
      # gtk_notebook_get_menu_label: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_menu_label(@pointer, child)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the text of the menu label for the page containing
    # @child.
    def menu_label_text(child : Gtk::Widget) : ::String?
      # gtk_notebook_get_menu_label_text: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_menu_label_text(@pointer, child)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the number of pages in a notebook.
    def n_pages : Int32
      # gtk_notebook_get_n_pages: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_n_pages(@pointer)

      # Return value handling

      _retval
    end

    # Returns the child widget contained in page number @page_num.
    def nth_page(page_num : Int32) : Gtk::Widget?
      # gtk_notebook_get_nth_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_nth_page(@pointer, page_num)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the `GtkNotebookPage` for @child.
    def page(child : Gtk::Widget) : Gtk::NotebookPage
      # gtk_notebook_get_page: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_page(@pointer, child)

      # Return value handling

      Gtk::NotebookPage.new(_retval, GICrystal::Transfer::None)
    end

    # Returns a `GListModel` that contains the pages of the notebook.
    #
    # This can be used to keep an up-to-date view. The model also
    # implements `Gtk#SelectionModel` and can be used to track
    # and modify the visible page.
    def pages : Gio::ListModel
      # gtk_notebook_get_pages: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_notebook_get_pages(@pointer)

      # Return value handling

      Gio::AbstractListModel.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns whether the tab label area has arrows for scrolling.
    def scrollable : Bool
      # gtk_notebook_get_scrollable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_scrollable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether a bevel will be drawn around the notebook pages.
    def show_border : Bool
      # gtk_notebook_get_show_border: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_show_border(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the tabs of the notebook are shown.
    def show_tabs : Bool
      # gtk_notebook_get_show_tabs: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_show_tabs(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the tab contents can be detached from @notebook.
    def tab_detachable(child : Gtk::Widget) : Bool
      # gtk_notebook_get_tab_detachable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_tab_detachable(@pointer, child)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the tab label widget for the page @child.
    #
    # %NULL is returned if @child is not in @notebook or
    # if no tab label has specifically been set for @child.
    def tab_label(child : Gtk::Widget) : Gtk::Widget?
      # gtk_notebook_get_tab_label: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_tab_label(@pointer, child)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the text of the tab label for the page containing
    # @child.
    def tab_label_text(child : Gtk::Widget) : ::String?
      # gtk_notebook_get_tab_label_text: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_tab_label_text(@pointer, child)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the edge at which the tabs are drawn.
    def tab_pos : Gtk::PositionType
      # gtk_notebook_get_tab_pos: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_tab_pos(@pointer)

      # Return value handling

      Gtk::PositionType.new(_retval)
    end

    # Gets whether the tab can be reordered via drag and drop or not.
    def tab_reorderable(child : Gtk::Widget) : Bool
      # gtk_notebook_get_tab_reorderable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_get_tab_reorderable(@pointer, child)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Insert a page into @notebook at the given position.
    def insert_page(child : Gtk::Widget, tab_label : Gtk::Widget?, position : Int32) : Int32
      # gtk_notebook_insert_page: (Method)
      # @tab_label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end

      # C call
      _retval = LibGtk.gtk_notebook_insert_page(@pointer, child, tab_label, position)

      # Return value handling

      _retval
    end

    # Insert a page into @notebook at the given position, specifying
    # the widget to use as the label in the popup menu.
    def insert_page_menu(child : Gtk::Widget, tab_label : Gtk::Widget?, menu_label : Gtk::Widget?, position : Int32) : Int32
      # gtk_notebook_insert_page_menu: (Method)
      # @tab_label: (nullable)
      # @menu_label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end
      # Generator::NullableArrayPlan
      menu_label = if menu_label.nil?
                     Pointer(Void).null
                   else
                     menu_label.to_unsafe
                   end

      # C call
      _retval = LibGtk.gtk_notebook_insert_page_menu(@pointer, child, tab_label, menu_label, position)

      # Return value handling

      _retval
    end

    # Switches to the next page.
    #
    # Nothing happens if the current page is the last page.
    def next_page : Nil
      # gtk_notebook_next_page: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_next_page(@pointer)

      # Return value handling
    end

    # Finds the index of the page which contains the given child
    # widget.
    def page_num(child : Gtk::Widget) : Int32
      # gtk_notebook_page_num: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_notebook_page_num(@pointer, child)

      # Return value handling

      _retval
    end

    # Disables the popup menu.
    def popup_disable : Nil
      # gtk_notebook_popup_disable: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_popup_disable(@pointer)

      # Return value handling
    end

    # Enables the popup menu.
    #
    # If the user clicks with the right mouse button on the tab labels,
    # a menu with all the pages will be popped up.
    def popup_enable : Nil
      # gtk_notebook_popup_enable: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_popup_enable(@pointer)

      # Return value handling
    end

    # Prepends a page to @notebook.
    def prepend_page(child : Gtk::Widget, tab_label : Gtk::Widget?) : Int32
      # gtk_notebook_prepend_page: (Method)
      # @tab_label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end

      # C call
      _retval = LibGtk.gtk_notebook_prepend_page(@pointer, child, tab_label)

      # Return value handling

      _retval
    end

    # Prepends a page to @notebook, specifying the widget to use as the
    # label in the popup menu.
    def prepend_page_menu(child : Gtk::Widget, tab_label : Gtk::Widget?, menu_label : Gtk::Widget?) : Int32
      # gtk_notebook_prepend_page_menu: (Method)
      # @tab_label: (nullable)
      # @menu_label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end
      # Generator::NullableArrayPlan
      menu_label = if menu_label.nil?
                     Pointer(Void).null
                   else
                     menu_label.to_unsafe
                   end

      # C call
      _retval = LibGtk.gtk_notebook_prepend_page_menu(@pointer, child, tab_label, menu_label)

      # Return value handling

      _retval
    end

    # Switches to the previous page.
    #
    # Nothing happens if the current page is the first page.
    def prev_page : Nil
      # gtk_notebook_prev_page: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_prev_page(@pointer)

      # Return value handling
    end

    # Removes a page from the notebook given its index
    # in the notebook.
    def remove_page(page_num : Int32) : Nil
      # gtk_notebook_remove_page: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_remove_page(@pointer, page_num)

      # Return value handling
    end

    # Reorders the page containing @child, so that it appears in position
    # @position.
    #
    # If @position is greater than or equal to the number of children in
    # the list or negative, @child will be moved to the end of the list.
    def reorder_child(child : Gtk::Widget, position : Int32) : Nil
      # gtk_notebook_reorder_child: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_reorder_child(@pointer, child, position)

      # Return value handling
    end

    # Sets @widget as one of the action widgets.
    #
    # Depending on the pack type the widget will be placed before
    # or after the tabs. You can use a `GtkBox` if you need to pack
    # more than one widget on the same side.
    def set_action_widget(widget : Gtk::Widget, pack_type : Gtk::PackType) : Nil
      # gtk_notebook_set_action_widget: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_set_action_widget(@pointer, widget, pack_type)

      # Return value handling
    end

    # Switches to the page number @page_num.
    #
    # Note that due to historical reasons, GtkNotebook refuses
    # to switch to a page unless the child widget is visible.
    # Therefore, it is recommended to show child widgets before
    # adding them to a notebook.
    def current_page=(page_num : Int32) : Nil
      # gtk_notebook_set_current_page: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_set_current_page(@pointer, page_num)

      # Return value handling
    end

    # Sets a group name for @notebook.
    #
    # Notebooks with the same name will be able to exchange tabs
    # via drag and drop. A notebook with a %NULL group name will
    # not be able to exchange tabs with any other notebook.
    def group_name=(group_name : ::String?) : Nil
      # gtk_notebook_set_group_name: (Method | Setter)
      # @group_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      group_name = if group_name.nil?
                     Pointer(LibC::Char).null
                   else
                     group_name.to_unsafe
                   end

      # C call
      LibGtk.gtk_notebook_set_group_name(@pointer, group_name)

      # Return value handling
    end

    # Changes the menu label for the page containing @child.
    def set_menu_label(child : Gtk::Widget, menu_label : Gtk::Widget?) : Nil
      # gtk_notebook_set_menu_label: (Method)
      # @menu_label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      menu_label = if menu_label.nil?
                     Pointer(Void).null
                   else
                     menu_label.to_unsafe
                   end

      # C call
      LibGtk.gtk_notebook_set_menu_label(@pointer, child, menu_label)

      # Return value handling
    end

    # Creates a new label and sets it as the menu label of @child.
    def set_menu_label_text(child : Gtk::Widget, menu_text : ::String) : Nil
      # gtk_notebook_set_menu_label_text: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_set_menu_label_text(@pointer, child, menu_text)

      # Return value handling
    end

    # Sets whether the tab label area will have arrows for
    # scrolling if there are too many tabs to fit in the area.
    def scrollable=(scrollable : Bool) : Nil
      # gtk_notebook_set_scrollable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_set_scrollable(@pointer, scrollable)

      # Return value handling
    end

    # Sets whether a bevel will be drawn around the notebook pages.
    #
    # This only has a visual effect when the tabs are not shown.
    def show_border=(show_border : Bool) : Nil
      # gtk_notebook_set_show_border: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_set_show_border(@pointer, show_border)

      # Return value handling
    end

    # Sets whether to show the tabs for the notebook or not.
    def show_tabs=(show_tabs : Bool) : Nil
      # gtk_notebook_set_show_tabs: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_set_show_tabs(@pointer, show_tabs)

      # Return value handling
    end

    # Sets whether the tab can be detached from @notebook to another
    # notebook or widget.
    #
    # Note that two notebooks must share a common group identificator
    # (see `Gtk::Notebook#group_name=`) to allow automatic tabs
    # interchange between them.
    #
    # If you want a widget to interact with a notebook through DnD
    # (i.e.: accept dragged tabs from it) it must be set as a drop
    # destination and accept the target “GTK_NOTEBOOK_TAB”. The notebook
    # will fill the selection with a GtkWidget** pointing to the child
    # widget that corresponds to the dropped tab.
    #
    # Note that you should use `Gtk::Notebook#detach_tab` instead
    # of `Gtk::Notebook#remove_page` if you want to remove the tab
    # from the source notebook as part of accepting a drop. Otherwise,
    # the source notebook will think that the dragged tab was removed
    # from underneath the ongoing drag operation, and will initiate a
    # drag cancel animation.
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # static void
    # on_drag_data_received (GtkWidget        *widget,
    #                        GdkDrop          *drop,
    #                        GtkSelectionData *data,
    #                        guint             time,
    #                        gpointer          user_data)
    # {
    #   GtkDrag *drag;
    #   GtkWidget *notebook;
    #   GtkWidget **child;
    #
    #   drag = gtk_drop_get_drag (drop);
    #   notebook = g_object_get_data (drag, "gtk-notebook-drag-origin");
    #   child = (void*) gtk_selection_data_get_data (data);
    #
    #   // process_widget (*child);
    #
    #   gtk_notebook_detach_tab (GTK_NOTEBOOK (notebook), *child);
    # }
    # ```
    #
    # If you want a notebook to accept drags from other widgets,
    # you will have to set your own DnD code to do it.
    def set_tab_detachable(child : Gtk::Widget, detachable : Bool) : Nil
      # gtk_notebook_set_tab_detachable: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_set_tab_detachable(@pointer, child, detachable)

      # Return value handling
    end

    # Changes the tab label for @child.
    #
    # If %NULL is specified for @tab_label, then the page will
    # have the label “page N”.
    def set_tab_label(child : Gtk::Widget, tab_label : Gtk::Widget?) : Nil
      # gtk_notebook_set_tab_label: (Method)
      # @tab_label: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      tab_label = if tab_label.nil?
                    Pointer(Void).null
                  else
                    tab_label.to_unsafe
                  end

      # C call
      LibGtk.gtk_notebook_set_tab_label(@pointer, child, tab_label)

      # Return value handling
    end

    # Creates a new label and sets it as the tab label for the page
    # containing @child.
    def set_tab_label_text(child : Gtk::Widget, tab_text : ::String) : Nil
      # gtk_notebook_set_tab_label_text: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_set_tab_label_text(@pointer, child, tab_text)

      # Return value handling
    end

    # Sets the edge at which the tabs are drawn.
    def tab_pos=(pos : Gtk::PositionType) : Nil
      # gtk_notebook_set_tab_pos: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_set_tab_pos(@pointer, pos)

      # Return value handling
    end

    # Sets whether the notebook tab can be reordered
    # via drag and drop or not.
    def set_tab_reorderable(child : Gtk::Widget, reorderable : Bool) : Nil
      # gtk_notebook_set_tab_reorderable: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_notebook_set_tab_reorderable(@pointer, child, reorderable)

      # Return value handling
    end

    struct ChangeCurrentPageSignal < GObject::Signal
      def name : String
        @detail ? "change-current-page::#{@detail}" : "change-current-page"
      end

      def connect(*, after : Bool = false, &block : Proc(Int32, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Int32, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : Int32, _lib_box : Pointer(Void)) {
          object = lib_object
          ::Box(Proc(Int32, Bool)).unbox(_lib_box).call(object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Notebook, Int32, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Notebook.new(_lib_sender, GICrystal::Transfer::None)
          object = lib_object
          ::Box(Proc(Gtk::Notebook, Int32, Bool)).unbox(_lib_box).call(_sender, object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(object : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "change-current-page", object)
      end
    end

    def change_current_page_signal
      ChangeCurrentPageSignal.new(self)
    end

    # The ::create-window signal is emitted when a detachable
    # tab is dropped on the root window.
    #
    # A handler for this signal can create a window containing
    # a notebook where the tab will be attached. It is also
    # responsible for moving/resizing the window and adding the
    # necessary properties to the notebook (e.g. the
    # `GtkNotebook`:group-name ).
    struct CreateWindowSignal < GObject::Signal
      def name : String
        @detail ? "create-window::#{@detail}" : "create-window"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::Widget, Gtk::Notebook)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::Widget, Gtk::Notebook), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          page = Gtk::Widget.new(lib_page, :none)
          ::Box(Proc(Gtk::Widget, Gtk::Notebook)).unbox(_lib_box).call(page)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Notebook, Gtk::Widget, Gtk::Notebook), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Notebook.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          page = Gtk::Widget.new(lib_page, :none)
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, Gtk::Notebook)).unbox(_lib_box).call(_sender, page)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(page : Gtk::Widget) : Nil
        LibGObject.g_signal_emit_by_name(@source, "create-window", page)
      end
    end

    def create_window_signal
      CreateWindowSignal.new(self)
    end

    struct FocusTabSignal < GObject::Signal
      def name : String
        @detail ? "focus-tab::#{@detail}" : "focus-tab"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::NotebookTab, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::NotebookTab, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          object = Gtk::NotebookTab.new(lib_object)
          ::Box(Proc(Gtk::NotebookTab, Bool)).unbox(_lib_box).call(object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Notebook, Gtk::NotebookTab, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Notebook.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          object = Gtk::NotebookTab.new(lib_object)
          ::Box(Proc(Gtk::Notebook, Gtk::NotebookTab, Bool)).unbox(_lib_box).call(_sender, object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(object : Gtk::NotebookTab) : Nil
        LibGObject.g_signal_emit_by_name(@source, "focus-tab", object)
      end
    end

    def focus_tab_signal
      FocusTabSignal.new(self)
    end

    struct MoveFocusOutSignal < GObject::Signal
      def name : String
        @detail ? "move-focus-out::#{@detail}" : "move-focus-out"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::DirectionType, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::DirectionType, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          object = Gtk::DirectionType.new(lib_object)
          ::Box(Proc(Gtk::DirectionType, Nil)).unbox(_lib_box).call(object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Notebook, Gtk::DirectionType, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Notebook.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          object = Gtk::DirectionType.new(lib_object)
          ::Box(Proc(Gtk::Notebook, Gtk::DirectionType, Nil)).unbox(_lib_box).call(_sender, object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(object : Gtk::DirectionType) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-focus-out", object)
      end
    end

    def move_focus_out_signal
      MoveFocusOutSignal.new(self)
    end

    # the ::page-added signal is emitted in the notebook
    # right after a page is added to the notebook.
    struct PageAddedSignal < GObject::Signal
      def name : String
        @detail ? "page-added::#{@detail}" : "page-added"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::Widget, UInt32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::Widget, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_child : Pointer(Void), lib_page_num : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          child = Gtk::Widget.new(lib_child, :none)
          page_num = lib_page_num
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(_lib_box).call(child, page_num)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_child : Pointer(Void), lib_page_num : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Notebook.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          child = Gtk::Widget.new(lib_child, :none)
          page_num = lib_page_num
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(_lib_box).call(_sender, child, page_num)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(child : Gtk::Widget, page_num : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-added", child, page_num)
      end
    end

    def page_added_signal
      PageAddedSignal.new(self)
    end

    # the ::page-removed signal is emitted in the notebook
    # right after a page is removed from the notebook.
    struct PageRemovedSignal < GObject::Signal
      def name : String
        @detail ? "page-removed::#{@detail}" : "page-removed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::Widget, UInt32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::Widget, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_child : Pointer(Void), lib_page_num : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          child = Gtk::Widget.new(lib_child, :none)
          page_num = lib_page_num
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(_lib_box).call(child, page_num)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_child : Pointer(Void), lib_page_num : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Notebook.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          child = Gtk::Widget.new(lib_child, :none)
          page_num = lib_page_num
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(_lib_box).call(_sender, child, page_num)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(child : Gtk::Widget, page_num : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-removed", child, page_num)
      end
    end

    def page_removed_signal
      PageRemovedSignal.new(self)
    end

    # the ::page-reordered signal is emitted in the notebook
    # right after a page has been reordered.
    struct PageReorderedSignal < GObject::Signal
      def name : String
        @detail ? "page-reordered::#{@detail}" : "page-reordered"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::Widget, UInt32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::Widget, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_child : Pointer(Void), lib_page_num : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          child = Gtk::Widget.new(lib_child, :none)
          page_num = lib_page_num
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(_lib_box).call(child, page_num)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_child : Pointer(Void), lib_page_num : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Notebook.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          child = Gtk::Widget.new(lib_child, :none)
          page_num = lib_page_num
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(_lib_box).call(_sender, child, page_num)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(child : Gtk::Widget, page_num : UInt32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "page-reordered", child, page_num)
      end
    end

    def page_reordered_signal
      PageReorderedSignal.new(self)
    end

    struct ReorderTabSignal < GObject::Signal
      def name : String
        @detail ? "reorder-tab::#{@detail}" : "reorder-tab"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::DirectionType, Bool, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::DirectionType, Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : UInt32, lib_p0 : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          object = Gtk::DirectionType.new(lib_object)
          p0 = lib_p0
          ::Box(Proc(Gtk::DirectionType, Bool, Bool)).unbox(_lib_box).call(object, p0)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Notebook, Gtk::DirectionType, Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : UInt32, lib_p0 : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::Notebook.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          object = Gtk::DirectionType.new(lib_object)
          p0 = lib_p0
          ::Box(Proc(Gtk::Notebook, Gtk::DirectionType, Bool, Bool)).unbox(_lib_box).call(_sender, object, p0)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(object : Gtk::DirectionType, p0 : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "reorder-tab", object, p0)
      end
    end

    def reorder_tab_signal
      ReorderTabSignal.new(self)
    end

    struct SelectPageSignal < GObject::Signal
      def name : String
        @detail ? "select-page::#{@detail}" : "select-page"
      end

      def connect(*, after : Bool = false, &block : Proc(Bool, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : LibC::Int, _lib_box : Pointer(Void)) {
          object = lib_object
          ::Box(Proc(Bool, Bool)).unbox(_lib_box).call(object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Notebook, Bool, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::Notebook.new(_lib_sender, GICrystal::Transfer::None)
          object = lib_object
          ::Box(Proc(Gtk::Notebook, Bool, Bool)).unbox(_lib_box).call(_sender, object)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(object : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "select-page", object)
      end
    end

    def select_page_signal
      SelectPageSignal.new(self)
    end

    # Emitted when the user or a function changes the current page.
    struct SwitchPageSignal < GObject::Signal
      def name : String
        @detail ? "switch-page::#{@detail}" : "switch-page"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::Widget, UInt32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::Widget, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_page_num : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          page = Gtk::Widget.new(lib_page, :none)
          page_num = lib_page_num
          ::Box(Proc(Gtk::Widget, UInt32, Nil)).unbox(_lib_box).call(page, page_num)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), lib_page_num : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Notebook.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          page = Gtk::Widget.new(lib_page, :none)
          page_num = lib_page_num
          ::Box(Proc(Gtk::Notebook, Gtk::Widget, UInt32, Nil)).unbox(_lib_box).call(_sender, page, page_num)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
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
