require "./window"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./native"

require "./root"

require "./shortcut_manager"

module Gtk
  # `GtkAssistant` is used to represent a complex as a series of steps.
  #
  # ![An example GtkAssistant](assistant.png)
  #
  # Each step consists of one or more pages. `GtkAssistant` guides the user
  # through the pages, and controls the page flow to collect the data needed
  # for the operation.
  #
  # `GtkAssistant` handles which buttons to show and to make sensitive based
  # on page sequence knowledge and the `Gtk#AssistantPageType` of each
  # page in addition to state information like the *completed* and *committed*
  # page statuses.
  #
  # If you have a case that doesn’t quite fit in `GtkAssistant`s way of
  # handling buttons, you can use the %GTK_ASSISTANT_PAGE_CUSTOM page
  # type and handle buttons yourself.
  #
  # `GtkAssistant` maintains a `GtkAssistantPage` object for each added
  # child, which holds additional per-child properties. You
  # obtain the `GtkAssistantPage` for a child with `Gtk::Assistant#page`.
  #
  # # GtkAssistant as GtkBuildable
  #
  # The `GtkAssistant` implementation of the `GtkBuildable` interface
  # exposes the @action_area as internal children with the name
  # “action_area”.
  #
  # To add pages to an assistant in `GtkBuilder`, simply add it as a
  # child to the `GtkAssistant` object. If you need to set per-object
  # properties, create a `GtkAssistantPage` object explicitly, and
  # set the child widget as a property on it.
  #
  # # CSS nodes
  #
  # `GtkAssistant` has a single CSS node with the name window and style
  # class .assistant.
  @[GObject::GeneratedWrapper]
  class Assistant < Window
    include Accessible
    include Buildable
    include ConstraintTarget
    include Native
    include Root
    include ShortcutManager

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::Assistant), instance_init, 0)
    end

    GICrystal.define_new_method(Assistant, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Assistant`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, application : Gtk::Application? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decorated : Bool? = nil, default_height : Int32? = nil, default_widget : Gtk::Widget? = nil, default_width : Int32? = nil, deletable : Bool? = nil, destroy_with_parent : Bool? = nil, display : Gdk::Display? = nil, focus_on_click : Bool? = nil, focus_visible : Bool? = nil, focus_widget : Gtk::Widget? = nil, focusable : Bool? = nil, fullscreened : Bool? = nil, halign : Gtk::Align? = nil, handle_menubar_accel : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hide_on_close : Bool? = nil, icon_name : ::String? = nil, is_active : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, maximized : Bool? = nil, mnemonics_visible : Bool? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, pages : Gio::ListModel? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, resizable : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, startup_id : ::String? = nil, title : ::String? = nil, titlebar : Gtk::Widget? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transient_for : Gtk::Window? = nil, use_header_bar : Int32? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[61]
      _values = StaticArray(LibGObject::Value, 61).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !application.nil?
        (_names.to_unsafe + _n).value = "application".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, application)
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
      if !decorated.nil?
        (_names.to_unsafe + _n).value = "decorated".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, decorated)
        _n += 1
      end
      if !default_height.nil?
        (_names.to_unsafe + _n).value = "default-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_height)
        _n += 1
      end
      if !default_widget.nil?
        (_names.to_unsafe + _n).value = "default-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_widget)
        _n += 1
      end
      if !default_width.nil?
        (_names.to_unsafe + _n).value = "default-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_width)
        _n += 1
      end
      if !deletable.nil?
        (_names.to_unsafe + _n).value = "deletable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, deletable)
        _n += 1
      end
      if !destroy_with_parent.nil?
        (_names.to_unsafe + _n).value = "destroy-with-parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, destroy_with_parent)
        _n += 1
      end
      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if !focus_on_click.nil?
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if !focus_visible.nil?
        (_names.to_unsafe + _n).value = "focus-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_visible)
        _n += 1
      end
      if !focus_widget.nil?
        (_names.to_unsafe + _n).value = "focus-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_widget)
        _n += 1
      end
      if !focusable.nil?
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if !fullscreened.nil?
        (_names.to_unsafe + _n).value = "fullscreened".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fullscreened)
        _n += 1
      end
      if !halign.nil?
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if !handle_menubar_accel.nil?
        (_names.to_unsafe + _n).value = "handle-menubar-accel".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, handle_menubar_accel)
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
      if !hide_on_close.nil?
        (_names.to_unsafe + _n).value = "hide-on-close".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hide_on_close)
        _n += 1
      end
      if !icon_name.nil?
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if !is_active.nil?
        (_names.to_unsafe + _n).value = "is-active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_active)
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
      if !maximized.nil?
        (_names.to_unsafe + _n).value = "maximized".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, maximized)
        _n += 1
      end
      if !mnemonics_visible.nil?
        (_names.to_unsafe + _n).value = "mnemonics-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonics_visible)
        _n += 1
      end
      if !modal.nil?
        (_names.to_unsafe + _n).value = "modal".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modal)
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
      if !resizable.nil?
        (_names.to_unsafe + _n).value = "resizable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resizable)
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
      if !startup_id.nil?
        (_names.to_unsafe + _n).value = "startup-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, startup_id)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if !titlebar.nil?
        (_names.to_unsafe + _n).value = "titlebar".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, titlebar)
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
      if !transient_for.nil?
        (_names.to_unsafe + _n).value = "transient-for".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transient_for)
        _n += 1
      end
      if !use_header_bar.nil?
        (_names.to_unsafe + _n).value = "use-header-bar".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_header_bar)
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

      @pointer = LibGObject.g_object_new_with_properties(Assistant.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_assistant_get_type
    end

    def pages : Gio::ListModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "pages", pointerof(value), Pointer(Void).null)
      Gio::AbstractListModel.new(value, GICrystal::Transfer::None) unless value.null?
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

    # Creates a new `GtkAssistant`.
    def initialize
      # gtk_assistant_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds a widget to the action area of a `GtkAssistant`.
    def add_action_widget(child : Gtk::Widget) : Nil
      # gtk_assistant_add_action_widget: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_assistant_add_action_widget(@pointer, child)

      # Return value handling
    end

    # Appends a page to the @assistant.
    def append_page(page : Gtk::Widget) : Int32
      # gtk_assistant_append_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_append_page(@pointer, page)

      # Return value handling

      _retval
    end

    # Erases the visited page history.
    #
    # GTK will then hide the back button on the current page,
    # and removes the cancel button from subsequent pages.
    #
    # Use this when the information provided up to the current
    # page is hereafter deemed permanent and cannot be modified
    # or undone. For example, showing a progress page to track
    # a long-running, unreversible operation after the user has
    # clicked apply on a confirmation page.
    def commit : Nil
      # gtk_assistant_commit: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_assistant_commit(@pointer)

      # Return value handling
    end

    # Returns the page number of the current page.
    def current_page : Int32
      # gtk_assistant_get_current_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_get_current_page(@pointer)

      # Return value handling

      _retval
    end

    # Returns the number of pages in the @assistant
    def n_pages : Int32
      # gtk_assistant_get_n_pages: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_get_n_pages(@pointer)

      # Return value handling

      _retval
    end

    # Returns the child widget contained in page number @page_num.
    def nth_page(page_num : Int32) : Gtk::Widget?
      # gtk_assistant_get_nth_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_get_nth_page(@pointer, page_num)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the `GtkAssistantPage` object for @child.
    def page(child : Gtk::Widget) : Gtk::AssistantPage
      # gtk_assistant_get_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_get_page(@pointer, child)

      # Return value handling

      Gtk::AssistantPage.new(_retval, GICrystal::Transfer::None)
    end

    # Gets whether @page is complete.
    def page_complete(page : Gtk::Widget) : Bool
      # gtk_assistant_get_page_complete: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_get_page_complete(@pointer, page)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the title for @page.
    def page_title(page : Gtk::Widget) : ::String
      # gtk_assistant_get_page_title: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_get_page_title(@pointer, page)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the page type of @page.
    def page_type(page : Gtk::Widget) : Gtk::AssistantPageType
      # gtk_assistant_get_page_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_get_page_type(@pointer, page)

      # Return value handling

      Gtk::AssistantPageType.new(_retval)
    end

    # Gets a list model of the assistant pages.
    def pages : Gio::ListModel
      # gtk_assistant_get_pages: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_assistant_get_pages(@pointer)

      # Return value handling

      Gio::AbstractListModel.new(_retval, GICrystal::Transfer::Full)
    end

    # Inserts a page in the @assistant at a given position.
    def insert_page(page : Gtk::Widget, position : Int32) : Int32
      # gtk_assistant_insert_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_insert_page(@pointer, page, position)

      # Return value handling

      _retval
    end

    # Navigate to the next page.
    #
    # It is a programming error to call this function when
    # there is no next page.
    #
    # This function is for use when creating pages of the
    # %GTK_ASSISTANT_PAGE_CUSTOM type.
    def next_page : Nil
      # gtk_assistant_next_page: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_assistant_next_page(@pointer)

      # Return value handling
    end

    # Prepends a page to the @assistant.
    def prepend_page(page : Gtk::Widget) : Int32
      # gtk_assistant_prepend_page: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_assistant_prepend_page(@pointer, page)

      # Return value handling

      _retval
    end

    # Navigate to the previous visited page.
    #
    # It is a programming error to call this function when
    # no previous page is available.
    #
    # This function is for use when creating pages of the
    # %GTK_ASSISTANT_PAGE_CUSTOM type.
    def previous_page : Nil
      # gtk_assistant_previous_page: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_assistant_previous_page(@pointer)

      # Return value handling
    end

    # Removes a widget from the action area of a `GtkAssistant`.
    def remove_action_widget(child : Gtk::Widget) : Nil
      # gtk_assistant_remove_action_widget: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_assistant_remove_action_widget(@pointer, child)

      # Return value handling
    end

    # Removes the @page_num’s page from @assistant.
    def remove_page(page_num : Int32) : Nil
      # gtk_assistant_remove_page: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_assistant_remove_page(@pointer, page_num)

      # Return value handling
    end

    # Switches the page to @page_num.
    #
    # Note that this will only be necessary in custom buttons,
    # as the @assistant flow can be set with
    # gtk_assistant_set_forward_page_func().
    def current_page=(page_num : Int32) : Nil
      # gtk_assistant_set_current_page: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_assistant_set_current_page(@pointer, page_num)

      # Return value handling
    end

    # Sets the page forwarding function to be @page_func.
    #
    # This function will be used to determine what will be
    # the next page when the user presses the forward button.
    # Setting @page_func to %NULL will make the assistant to
    # use the default forward function, which just goes to the
    # next visible page.
    def forward_page_func=(page_func : Gtk::AssistantPageFunc?) : Nil
      # gtk_assistant_set_forward_page_func: (Method)
      # @page_func: (nullable)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if page_func
        _box = ::Box.box(page_func)
        page_func = ->(lib_current_page : Int32, lib_data : Pointer(Void)) {
          current_page = lib_current_page
          ::Box(Proc(Int32, Int32)).unbox(lib_data).call(current_page)
        }.pointer
        data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        page_func = data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_assistant_set_forward_page_func(@pointer, page_func, data, destroy)

      # Return value handling
    end

    # Sets whether @page contents are complete.
    #
    # This will make @assistant update the buttons state
    # to be able to continue the task.
    def set_page_complete(page : Gtk::Widget, complete : Bool) : Nil
      # gtk_assistant_set_page_complete: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_assistant_set_page_complete(@pointer, page, complete)

      # Return value handling
    end

    # Sets a title for @page.
    #
    # The title is displayed in the header area of the assistant
    # when @page is the current page.
    def set_page_title(page : Gtk::Widget, title : ::String) : Nil
      # gtk_assistant_set_page_title: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_assistant_set_page_title(@pointer, page, title)

      # Return value handling
    end

    # Sets the page type for @page.
    #
    # The page type determines the page behavior in the @assistant.
    def set_page_type(page : Gtk::Widget, type : Gtk::AssistantPageType) : Nil
      # gtk_assistant_set_page_type: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_assistant_set_page_type(@pointer, page, type)

      # Return value handling
    end

    # Forces @assistant to recompute the buttons state.
    #
    # GTK automatically takes care of this in most situations,
    # e.g. when the user goes to a different page, or when the
    # visibility or completeness of a page changes.
    #
    # One situation where it can be necessary to call this
    # function is when changing a value on the current page
    # affects the future page flow of the assistant.
    def update_buttons_state : Nil
      # gtk_assistant_update_buttons_state: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_assistant_update_buttons_state(@pointer)

      # Return value handling
    end

    # Emitted when the apply button is clicked.
    #
    # The default behavior of the `GtkAssistant` is to switch to the page
    # after the current page, unless the current page is the last one.
    #
    # A handler for the ::apply signal should carry out the actions for
    # which the wizard has collected data. If the action takes a long time
    # to complete, you might consider putting a page of type
    # %GTK_ASSISTANT_PAGE_PROGRESS after the confirmation page and handle
    # this operation within the `Gtk::Assistant::#prepare` signal of
    # the progress page.
    struct ApplySignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "apply::#{@detail}" : "apply"
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

      def connect(handler : Proc(Gtk::Assistant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Assistant.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Assistant, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Assistant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Assistant.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Assistant, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "apply")
      end
    end

    def apply_signal
      ApplySignal.new(self)
    end

    # Emitted when then the cancel button is clicked.
    struct CancelSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "cancel::#{@detail}" : "cancel"
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

      def connect(handler : Proc(Gtk::Assistant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Assistant.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Assistant, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Assistant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Assistant.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Assistant, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "cancel")
      end
    end

    def cancel_signal
      CancelSignal.new(self)
    end

    # Emitted either when the close button of a summary page is clicked,
    # or when the apply button in the last page in the flow (of type
    # %GTK_ASSISTANT_PAGE_CONFIRM) is clicked.
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

      def connect(handler : Proc(Gtk::Assistant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Assistant.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Assistant, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Assistant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Assistant.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Assistant, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "close")
      end
    end

    def close_signal
      CloseSignal.new(self)
    end

    # The action signal for the Escape binding.
    struct EscapeSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "escape::#{@detail}" : "escape"
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

      def connect(handler : Proc(Gtk::Assistant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Assistant.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Assistant, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Assistant, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Assistant.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Assistant, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "escape")
      end
    end

    def escape_signal
      EscapeSignal.new(self)
    end

    # Emitted when a new page is set as the assistant's current page,
    # before making the new page visible.
    #
    # A handler for this signal can do any preparations which are
    # necessary before showing @page.
    struct PrepareSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "prepare::#{@detail}" : "prepare"
      end

      def connect(&block : Proc(Gtk::Widget, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Widget, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::Widget, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          page = Gtk::Widget.new(lib_page, :none)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(_lib_box).call(page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Widget, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          page = Gtk::Widget.new(lib_page, :none)
          ::Box(Proc(Gtk::Widget, Nil)).unbox(_lib_box).call(page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::Assistant, Gtk::Widget, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Assistant.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          page = Gtk::Widget.new(lib_page, :none)
          ::Box(Proc(Gtk::Assistant, Gtk::Widget, Nil)).unbox(_lib_box).call(_sender, page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Assistant, Gtk::Widget, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_page : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Assistant.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          page = Gtk::Widget.new(lib_page, :none)
          ::Box(Proc(Gtk::Assistant, Gtk::Widget, Nil)).unbox(_lib_box).call(_sender, page)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(page : Gtk::Widget) : Nil
        LibGObject.g_signal_emit_by_name(@source, "prepare", page)
      end
    end

    def prepare_signal
      PrepareSignal.new(self)
    end
  end
end
