require "./preferences_row"
require "../gtk-4.0/accessible"

require "../gtk-4.0/actionable"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A `Gtk#ListBoxRow` used to present actions.
  #
  # <picture>
  #   <source srcset="action-row-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="action-row.png" alt="action-row">
  # </picture>
  #
  # The `AdwActionRow` widget can have a title, a subtitle and an icon. The row
  # can receive additional widgets at its end, or prefix widgets at its start.
  #
  # It is convenient to present a preference and its related actions.
  #
  # `AdwActionRow` is unactivatable by default, giving it an activatable widget
  # will automatically make it activatable, but unsetting it won't change the
  # row's activatability.
  #
  # ## AdwActionRow as GtkBuildable
  #
  # The `AdwActionRow` implementation of the `Gtk#Buildable` interface
  # supports adding a child at its end by specifying “suffix” or omitting the
  # “type” attribute of a <child> element.
  #
  # It also supports adding a child as a prefix widget by specifying “prefix” as
  # the “type” attribute of a <child> element.
  #
  # ## CSS nodes
  #
  # `AdwActionRow` has a main CSS node with name `row`.
  #
  # It contains the subnode `box.header` for its main horizontal box, and
  # `box.title` for the vertical box containing the title and subtitle labels.
  #
  # It contains subnodes `label.title` and `label.subtitle` representing
  # respectively the title label and subtitle label.
  @[GObject::GeneratedWrapper]
  class ActionRow < PreferencesRow
    include Gtk::Accessible
    include Gtk::Actionable
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::ActionRowClass), class_init,
        sizeof(LibAdw::ActionRow), instance_init, 0)
    end

    GICrystal.define_new_method(ActionRow, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ActionRow`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, action_name : ::String? = nil, action_target : GLib::Variant? = nil, activatable : Bool? = nil, activatable_widget : Gtk::Widget? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, icon_name : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selectable : Bool? = nil, sensitive : Bool? = nil, subtitle : ::String? = nil, subtitle_lines : Int32? = nil, title : ::String? = nil, title_lines : Int32? = nil, title_selectable : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[48]
      _values = StaticArray(LibGObject::Value, 48).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !action_name.nil?
        (_names.to_unsafe + _n).value = "action-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_name)
        _n += 1
      end
      if !action_target.nil?
        (_names.to_unsafe + _n).value = "action-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_target)
        _n += 1
      end
      if !activatable.nil?
        (_names.to_unsafe + _n).value = "activatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activatable)
        _n += 1
      end
      if !activatable_widget.nil?
        (_names.to_unsafe + _n).value = "activatable-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activatable_widget)
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
      if !icon_name.nil?
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
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
      if !selectable.nil?
        (_names.to_unsafe + _n).value = "selectable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selectable)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !subtitle.nil?
        (_names.to_unsafe + _n).value = "subtitle".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, subtitle)
        _n += 1
      end
      if !subtitle_lines.nil?
        (_names.to_unsafe + _n).value = "subtitle-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, subtitle_lines)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if !title_lines.nil?
        (_names.to_unsafe + _n).value = "title-lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title_lines)
        _n += 1
      end
      if !title_selectable.nil?
        (_names.to_unsafe + _n).value = "title-selectable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title_selectable)
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
      if !use_underline.nil?
        (_names.to_unsafe + _n).value = "use-underline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_underline)
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

      @pointer = LibGObject.g_object_new_with_properties(ActionRow.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_action_row_get_type
    end

    def activatable_widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "activatable-widget", unsafe_value, Pointer(Void).null)
      value
    end

    def activatable_widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "activatable-widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def icon_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "icon-name", unsafe_value, Pointer(Void).null)
      value
    end

    def icon_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "icon-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def subtitle=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "subtitle", unsafe_value, Pointer(Void).null)
      value
    end

    def subtitle : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "subtitle", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def subtitle_lines=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "subtitle-lines", unsafe_value, Pointer(Void).null)
      value
    end

    def subtitle_lines : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "subtitle-lines", pointerof(value), Pointer(Void).null)
      value
    end

    def title_lines=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "title-lines", unsafe_value, Pointer(Void).null)
      value
    end

    def title_lines : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "title-lines", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new `AdwActionRow`.
    def initialize
      # adw_action_row_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_action_row_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Activates @self.
    def activate : Nil
      # adw_action_row_activate: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_action_row_activate(@pointer)

      # Return value handling
    end

    # Adds a prefix widget to @self.
    def add_prefix(widget : Gtk::Widget) : Nil
      # adw_action_row_add_prefix: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_action_row_add_prefix(@pointer, widget)

      # Return value handling
    end

    # Adds a suffix widget to @self.
    def add_suffix(widget : Gtk::Widget) : Nil
      # adw_action_row_add_suffix: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_action_row_add_suffix(@pointer, widget)

      # Return value handling
    end

    # Gets the widget activated when @self is activated.
    def activatable_widget : Gtk::Widget?
      # adw_action_row_get_activatable_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_action_row_get_activatable_widget(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the icon name for @self.
    def icon_name : ::String?
      # adw_action_row_get_icon_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_action_row_get_icon_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the subtitle for @self.
    def subtitle : ::String?
      # adw_action_row_get_subtitle: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_action_row_get_subtitle(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the number of lines at the end of which the subtitle label will be
    # ellipsized.
    #
    # If the value is 0, the number of lines won't be limited.
    def subtitle_lines : Int32
      # adw_action_row_get_subtitle_lines: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_action_row_get_subtitle_lines(@pointer)

      # Return value handling

      _retval
    end

    # Gets the number of lines at the end of which the title label will be
    # ellipsized.
    #
    # If the value is 0, the number of lines won't be limited.
    def title_lines : Int32
      # adw_action_row_get_title_lines: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_action_row_get_title_lines(@pointer)

      # Return value handling

      _retval
    end

    # Removes a child from @self.
    def remove(widget : Gtk::Widget) : Nil
      # adw_action_row_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_action_row_remove(@pointer, widget)

      # Return value handling
    end

    # Sets the widget to activate when @self is activated.
    def activatable_widget=(widget : Gtk::Widget?) : Nil
      # adw_action_row_set_activatable_widget: (Method | Setter)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibAdw.adw_action_row_set_activatable_widget(@pointer, widget)

      # Return value handling
    end

    # Sets the icon name for @self.
    def icon_name=(icon_name : ::String?) : Nil
      # adw_action_row_set_icon_name: (Method | Setter)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      # C call
      LibAdw.adw_action_row_set_icon_name(@pointer, icon_name)

      # Return value handling
    end

    # Sets the subtitle for @self.
    def subtitle=(subtitle : ::String) : Nil
      # adw_action_row_set_subtitle: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_action_row_set_subtitle(@pointer, subtitle)

      # Return value handling
    end

    # Sets the number of lines at the end of which the subtitle label will be
    # ellipsized.
    #
    # If the value is 0, the number of lines won't be limited.
    def subtitle_lines=(subtitle_lines : Int32) : Nil
      # adw_action_row_set_subtitle_lines: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_action_row_set_subtitle_lines(@pointer, subtitle_lines)

      # Return value handling
    end

    # Sets the number of lines at the end of which the title label will be
    # ellipsized.
    #
    # If the value is 0, the number of lines won't be limited.
    def title_lines=(title_lines : Int32) : Nil
      # adw_action_row_set_title_lines: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_action_row_set_title_lines(@pointer, title_lines)

      # Return value handling
    end

    # This signal is emitted after the row has been activated.
    struct ActivatedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activated::#{@detail}" : "activated"
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

      def connect(handler : Proc(Adw::ActionRow, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::ActionRow.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::ActionRow, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Adw::ActionRow, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Adw::ActionRow.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::ActionRow, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activated")
      end
    end

    def activated_signal
      ActivatedSignal.new(self)
    end
  end
end
