require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # `GtkSearchBar` is a container made to have a search entry.
  #
  # ![An example GtkSearchBar](search-bar.png)
  #
  # It can also contain additional widgets, such as drop-down menus,
  # or buttons.  The search bar would appear when a search is started
  # through typing on the keyboard, or the application’s search mode
  # is toggled on.
  #
  # For keyboard presses to start a search, the search bar must be told
  # of a widget to capture key events from through
  # `Gtk::SearchBar#key_capture_widget=`. This widget will
  # typically be the top-level window, or a parent container of the
  # search bar. Common shortcuts such as Ctrl+F should be handled as an
  # application action, or through the menu items.
  #
  # You will also need to tell the search bar about which entry you
  # are using as your search entry using `Gtk::SearchBar#connect_entry`.
  #
  # ## Creating a search bar
  #
  # The following example shows you how to create a more complex search
  # entry.
  #
  # [A simple example](https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/search-bar.c)
  #
  # # CSS nodes
  #
  # ```
  # searchbar
  # ╰── revealer
  # ╰── box
  # ├── [child]
  # ╰── [button.close]
  # ```
  #
  # `GtkSearchBar` has a main CSS node with name searchbar. It has a child
  # node with name revealer that contains a node with name box. The box node
  # contains both the CSS node of the child widget as well as an optional button
  # node which gets the .close style class applied.
  #
  # # Accessibility
  #
  # `GtkSearchBar` uses the %GTK_ACCESSIBLE_ROLE_SEARCH role.
  @[GObject::GeneratedWrapper]
  class SearchBar < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::SearchBar), instance_init, 0)
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, key_capture_widget : Gtk::Widget? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, search_mode_enabled : Bool? = nil, sensitive : Bool? = nil, show_close_button : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[39]
      _values = StaticArray(LibGObject::Value, 39).new(LibGObject::Value.new)
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
      if !key_capture_widget.nil?
        (_names.to_unsafe + _n).value = "key-capture-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, key_capture_widget)
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
      if !search_mode_enabled.nil?
        (_names.to_unsafe + _n).value = "search-mode-enabled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, search_mode_enabled)
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

      @pointer = LibGObject.g_object_new_with_properties(SearchBar.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_search_bar_get_type
    end

    def child=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "child", unsafe_value, Pointer(Void).null)
      value
    end

    def child : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "child", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def key_capture_widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "key-capture-widget", unsafe_value, Pointer(Void).null)
      value
    end

    def key_capture_widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "key-capture-widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def search_mode_enabled=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "search-mode-enabled", unsafe_value, Pointer(Void).null)
      value
    end

    def search_mode_enabled? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "search-mode-enabled", pointerof(value), Pointer(Void).null)
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

    # Creates a `GtkSearchBar`.
    #
    # You will need to tell it about which widget is going to be your text
    # entry using `Gtk::SearchBar#connect_entry`.
    def initialize
      # gtk_search_bar_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_search_bar_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Connects the `GtkEditable widget passed as the one to be used in
    # this search bar.
    #
    # The entry should be a descendant of the search bar. Calling this
    # function manually is only required if the entry isn’t the direct
    # child of the search bar (as in our main example).
    def connect_entry(entry : Gtk::Editable) : Nil
      # gtk_search_bar_connect_entry: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_search_bar_connect_entry(self, entry)

      # Return value handling
    end

    # Gets the child widget of @bar.
    def child : Gtk::Widget?
      # gtk_search_bar_get_child: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_search_bar_get_child(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the widget that @bar is capturing key events from.
    def key_capture_widget : Gtk::Widget?
      # gtk_search_bar_get_key_capture_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_search_bar_get_key_capture_widget(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the search mode is on or off.
    def search_mode : Bool
      # gtk_search_bar_get_search_mode: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_search_bar_get_search_mode(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the close button is shown.
    def show_close_button : Bool
      # gtk_search_bar_get_show_close_button: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_search_bar_get_show_close_button(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the child widget of @bar.
    def child=(child : Gtk::Widget?) : Nil
      # gtk_search_bar_set_child: (Method | Setter)
      # @child: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      child = if child.nil?
                Pointer(Void).null
              else
                child.to_unsafe
              end

      # C call
      LibGtk.gtk_search_bar_set_child(self, child)

      # Return value handling
    end

    # Sets @widget as the widget that @bar will capture key events
    # from.
    #
    # If key events are handled by the search bar, the bar will
    # be shown, and the entry populated with the entered text.
    #
    # Note that despite the name of this function, the events
    # are only 'captured' in the bubble phase, which means that
    # editable child widgets of @widget will receive text input
    # before it gets captured. If that is not desired, you can
    # capture and forward the events yourself with
    # `Gtk::EventControllerKey#forward`.
    def key_capture_widget=(widget : Gtk::Widget?) : Nil
      # gtk_search_bar_set_key_capture_widget: (Method | Setter)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_search_bar_set_key_capture_widget(self, widget)

      # Return value handling
    end

    # Switches the search mode on or off.
    def search_mode=(search_mode : Bool) : Nil
      # gtk_search_bar_set_search_mode: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_search_bar_set_search_mode(self, search_mode)

      # Return value handling
    end

    # Shows or hides the close button.
    #
    # Applications that already have a “search” toggle button should not
    # show a close button in their search bar, as it duplicates the role
    # of the toggle button.
    def show_close_button=(visible : Bool) : Nil
      # gtk_search_bar_set_show_close_button: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_search_bar_set_show_close_button(self, visible)

      # Return value handling
    end
  end
end
