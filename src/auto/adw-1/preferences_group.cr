require "../gtk-4.0/widget"
require "../gtk-4.0/accessible"

require "../gtk-4.0/buildable"

require "../gtk-4.0/constraint_target"

module Adw
  # A group of preference rows.
  #
  # <picture>
  #   <source srcset="preferences-group-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="preferences-group.png" alt="preferences-group">
  # </picture>
  #
  # An `AdwPreferencesGroup` represents a group or tightly related preferences,
  # which in turn are represented by `#PreferencesRow`.
  #
  # To summarize the role of the preferences it gathers, a group can have both a
  # title and a description. The title will be used by `#PreferencesWindow`
  # to let the user look for a preference.
  #
  # ## AdwPreferencesGroup as GtkBuildable
  #
  # The `AdwPreferencesGroup` implementation of the `Gtk#Buildable` interface
  # supports adding `#PreferencesRow`s to the list by omitting "type". If "type"
  # is omitted and the widget isn't a `#PreferencesRow` the child is added to
  # a box below the list.
  #
  # When the "type" attribute of a child is `header-suffix`, the child
  # is set as the suffix on the end of the title and description.
  #
  # ## CSS nodes
  #
  # `AdwPreferencesGroup` has a single CSS node with name `preferencesgroup`.
  #
  # ## Accessibility
  #
  # `AdwPreferencesGroup` uses the `GTK_ACCESSIBLE_ROLE_GROUP` role.
  @[GObject::GeneratedWrapper]
  class PreferencesGroup < Gtk::Widget
    include Gtk::Accessible
    include Gtk::Buildable
    include Gtk::ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::PreferencesGroupClass), class_init,
        sizeof(LibAdw::PreferencesGroup), instance_init, 0)
    end

    GICrystal.define_new_method(PreferencesGroup, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `PreferencesGroup`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, description : ::String? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, header_suffix : Gtk::Widget? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, title : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[38]
      _values = StaticArray(LibGObject::Value, 38).new(LibGObject::Value.new)
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
      if !description.nil?
        (_names.to_unsafe + _n).value = "description".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, description)
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
      if !header_suffix.nil?
        (_names.to_unsafe + _n).value = "header-suffix".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, header_suffix)
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
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
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

      @pointer = LibGObject.g_object_new_with_properties(PreferencesGroup.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_preferences_group_get_type
    end

    def description=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "description", unsafe_value, Pointer(Void).null)
      value
    end

    def description : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "description", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def header_suffix=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "header-suffix", unsafe_value, Pointer(Void).null)
      value
    end

    def header_suffix : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "header-suffix", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def title=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "title", unsafe_value, Pointer(Void).null)
      value
    end

    def title : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "title", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new `AdwPreferencesGroup`.
    def initialize
      # adw_preferences_group_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_preferences_group_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds a child to @self.
    def add(child : Gtk::Widget) : Nil
      # adw_preferences_group_add: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_preferences_group_add(@pointer, child)

      # Return value handling
    end

    # Gets the description of @self.
    def description : ::String?
      # adw_preferences_group_get_description: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_preferences_group_get_description(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the suffix for @self's header.
    def header_suffix : Gtk::Widget?
      # adw_preferences_group_get_header_suffix: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_preferences_group_get_header_suffix(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the title of @self.
    def title : ::String
      # adw_preferences_group_get_title: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_preferences_group_get_title(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Removes a child from @self.
    def remove(child : Gtk::Widget) : Nil
      # adw_preferences_group_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_preferences_group_remove(@pointer, child)

      # Return value handling
    end

    # Sets the description for @self.
    def description=(description : ::String?) : Nil
      # adw_preferences_group_set_description: (Method | Setter)
      # @description: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      description = if description.nil?
                      Pointer(LibC::Char).null
                    else
                      description.to_unsafe
                    end

      # C call
      LibAdw.adw_preferences_group_set_description(@pointer, description)

      # Return value handling
    end

    # Sets the suffix for @self's header.
    def header_suffix=(suffix : Gtk::Widget?) : Nil
      # adw_preferences_group_set_header_suffix: (Method | Setter)
      # @suffix: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      suffix = if suffix.nil?
                 Pointer(Void).null
               else
                 suffix.to_unsafe
               end

      # C call
      LibAdw.adw_preferences_group_set_header_suffix(@pointer, suffix)

      # Return value handling
    end

    # Sets the title for @self.
    def title=(title : ::String) : Nil
      # adw_preferences_group_set_title: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibAdw.adw_preferences_group_set_title(@pointer, title)

      # Return value handling
    end
  end
end
