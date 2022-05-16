require "./widget"
require "./accessible"

require "./buildable"

require "./cell_editable"

require "./constraint_target"

require "./editable"

module Gtk
  # `GtkEntry` is a single line text entry widget.
  #
  # ![An example GtkEntry](entry.png)
  #
  # A fairly large set of key bindings are supported by default. If the
  # entered text is longer than the allocation of the widget, the widget
  # will scroll so that the cursor position is visible.
  #
  # When using an entry for passwords and other sensitive information, it
  # can be put into “password mode” using `Gtk::Entry#visibility=`.
  # In this mode, entered text is displayed using a “invisible” character.
  # By default, GTK picks the best invisible character that is available
  # in the current font, but it can be changed with
  # `Gtk::Entry#invisible_char=`.
  #
  # `GtkEntry` has the ability to display progress or activity
  # information behind the text. To make an entry display such information,
  # use `Gtk::Entry#progress_fraction=` or
  # `Gtk::Entry#progress_pulse_step=`.
  #
  # Additionally, `GtkEntry` can show icons at either side of the entry.
  # These icons can be activatable by clicking, can be set up as drag source
  # and can have tooltips. To add an icon, use
  # `Gtk::Entry#icon_from_gicon=` or one of the various other functions
  # that set an icon from an icon name or a paintable. To trigger an action when
  # the user clicks an icon, connect to the [signal@Gtk.Entry::icon-press] signal.
  # To allow DND operations from an icon, use
  # `Gtk::Entry#icon_drag_source=`. To set a tooltip on an icon, use
  # `Gtk::Entry#icon_tooltip_text=` or the corresponding function
  # for markup.
  #
  # Note that functionality or information that is only available by clicking
  # on an icon in an entry may not be accessible at all to users which are not
  # able to use a mouse or other pointing device. It is therefore recommended
  # that any such functionality should also be available by other means, e.g.
  # via the context menu of the entry.
  #
  # # CSS nodes
  #
  # ```
  # entry[.flat][.warning][.error]
  # ├── text[.readonly]
  # ├── image.left
  # ├── image.right
  # ╰── [progress[.pulse]]
  # ```
  #
  # `GtkEntry` has a main node with the name entry. Depending on the properties
  # of the entry, the style classes .read-only and .flat may appear. The style
  # classes .warning and .error may also be used with entries.
  #
  # When the entry shows icons, it adds subnodes with the name image and the
  # style class .left or .right, depending on where the icon appears.
  #
  # When the entry shows progress, it adds a subnode with the name progress.
  # The node has the style class .pulse when the shown progress is pulsing.
  #
  # For all the subnodes added to the text node in various situations,
  # see `Gtk#Text`.
  #
  # # GtkEntry as GtkBuildable
  #
  # The `GtkEntry` implementation of the `GtkBuildable` interface supports a
  # custom <attributes> element, which supports any number of <attribute>
  # elements. The <attribute> element has attributes named “name“, “value“,
  # “start“ and “end“ and allows you to specify `PangoAttribute` values for
  # this label.
  #
  # An example of a UI definition fragment specifying Pango attributes:
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkEntry">
  #   <attributes>
  #     <attribute name="weight" value="PANGO_WEIGHT_BOLD"/>
  #     <attribute name="background" value="red" start="5" end="10"/>
  #   </attributes>
  # </object>
  # ```
  #
  # The start and end attributes specify the range of characters to which the
  # Pango attribute applies. If start and end are not specified, the attribute
  # is applied to the whole text. Note that specifying ranges does not make much
  # sense with translatable attributes. Use markup embedded in the translatable
  # content instead.
  #
  # # Accessibility
  #
  # `GtkEntry` uses the %GTK_ACCESSIBLE_ROLE_TEXT_BOX role.
  @[GObject::GeneratedWrapper]
  class Entry < Widget
    include Accessible
    include Buildable
    include CellEditable
    include ConstraintTarget
    include Editable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::EntryClass), class_init,
        sizeof(LibGtk::Entry), instance_init, 0)
    end

    GICrystal.define_new_method(Entry, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Entry`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, activates_default : Bool? = nil, attributes : Pango::AttrList? = nil, buffer : Gtk::EntryBuffer? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, completion : Gtk::EntryCompletion? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, cursor_position : Int32? = nil, editable : Bool? = nil, editing_canceled : Bool? = nil, enable_emoji_completion : Bool? = nil, enable_undo : Bool? = nil, extra_menu : Gio::MenuModel? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_frame : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, im_module : ::String? = nil, input_hints : Gtk::InputHints? = nil, input_purpose : Gtk::InputPurpose? = nil, invisible_char : UInt32? = nil, invisible_char_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_length : Int32? = nil, max_width_chars : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, overwrite_mode : Bool? = nil, parent : Gtk::Widget? = nil, placeholder_text : ::String? = nil, primary_icon_activatable : Bool? = nil, primary_icon_gicon : Gio::Icon? = nil, primary_icon_name : ::String? = nil, primary_icon_paintable : Gdk::Paintable? = nil, primary_icon_sensitive : Bool? = nil, primary_icon_storage_type : Gtk::ImageType? = nil, primary_icon_tooltip_markup : ::String? = nil, primary_icon_tooltip_text : ::String? = nil, progress_fraction : Float64? = nil, progress_pulse_step : Float64? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, scroll_offset : Int32? = nil, secondary_icon_activatable : Bool? = nil, secondary_icon_gicon : Gio::Icon? = nil, secondary_icon_name : ::String? = nil, secondary_icon_paintable : Gdk::Paintable? = nil, secondary_icon_sensitive : Bool? = nil, secondary_icon_storage_type : Gtk::ImageType? = nil, secondary_icon_tooltip_markup : ::String? = nil, secondary_icon_tooltip_text : ::String? = nil, selection_bound : Int32? = nil, sensitive : Bool? = nil, show_emoji_icon : Bool? = nil, tabs : Pango::TabArray? = nil, text : ::String? = nil, text_length : UInt32? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, truncate_multiline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visibility : Bool? = nil, visible : Bool? = nil, width_chars : Int32? = nil, width_request : Int32? = nil, xalign : Float32? = nil)
      _names = uninitialized Pointer(LibC::Char)[83]
      _values = StaticArray(LibGObject::Value, 83).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !activates_default.nil?
        (_names.to_unsafe + _n).value = "activates-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activates_default)
        _n += 1
      end
      if !attributes.nil?
        (_names.to_unsafe + _n).value = "attributes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, attributes)
        _n += 1
      end
      if !buffer.nil?
        (_names.to_unsafe + _n).value = "buffer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, buffer)
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
      if !completion.nil?
        (_names.to_unsafe + _n).value = "completion".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, completion)
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
      if !cursor_position.nil?
        (_names.to_unsafe + _n).value = "cursor-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor_position)
        _n += 1
      end
      if !editable.nil?
        (_names.to_unsafe + _n).value = "editable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable)
        _n += 1
      end
      if !editing_canceled.nil?
        (_names.to_unsafe + _n).value = "editing-canceled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editing_canceled)
        _n += 1
      end
      if !enable_emoji_completion.nil?
        (_names.to_unsafe + _n).value = "enable-emoji-completion".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_emoji_completion)
        _n += 1
      end
      if !enable_undo.nil?
        (_names.to_unsafe + _n).value = "enable-undo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_undo)
        _n += 1
      end
      if !extra_menu.nil?
        (_names.to_unsafe + _n).value = "extra-menu".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, extra_menu)
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
      if !has_frame.nil?
        (_names.to_unsafe + _n).value = "has-frame".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_frame)
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
      if !im_module.nil?
        (_names.to_unsafe + _n).value = "im-module".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, im_module)
        _n += 1
      end
      if !input_hints.nil?
        (_names.to_unsafe + _n).value = "input-hints".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_hints)
        _n += 1
      end
      if !input_purpose.nil?
        (_names.to_unsafe + _n).value = "input-purpose".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_purpose)
        _n += 1
      end
      if !invisible_char.nil?
        (_names.to_unsafe + _n).value = "invisible-char".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, invisible_char)
        _n += 1
      end
      if !invisible_char_set.nil?
        (_names.to_unsafe + _n).value = "invisible-char-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, invisible_char_set)
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
      if !max_length.nil?
        (_names.to_unsafe + _n).value = "max-length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_length)
        _n += 1
      end
      if !max_width_chars.nil?
        (_names.to_unsafe + _n).value = "max-width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width_chars)
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
      if !overwrite_mode.nil?
        (_names.to_unsafe + _n).value = "overwrite-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overwrite_mode)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !placeholder_text.nil?
        (_names.to_unsafe + _n).value = "placeholder-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, placeholder_text)
        _n += 1
      end
      if !primary_icon_activatable.nil?
        (_names.to_unsafe + _n).value = "primary-icon-activatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_activatable)
        _n += 1
      end
      if !primary_icon_gicon.nil?
        (_names.to_unsafe + _n).value = "primary-icon-gicon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_gicon)
        _n += 1
      end
      if !primary_icon_name.nil?
        (_names.to_unsafe + _n).value = "primary-icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_name)
        _n += 1
      end
      if !primary_icon_paintable.nil?
        (_names.to_unsafe + _n).value = "primary-icon-paintable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_paintable)
        _n += 1
      end
      if !primary_icon_sensitive.nil?
        (_names.to_unsafe + _n).value = "primary-icon-sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_sensitive)
        _n += 1
      end
      if !primary_icon_storage_type.nil?
        (_names.to_unsafe + _n).value = "primary-icon-storage-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_storage_type)
        _n += 1
      end
      if !primary_icon_tooltip_markup.nil?
        (_names.to_unsafe + _n).value = "primary-icon-tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_tooltip_markup)
        _n += 1
      end
      if !primary_icon_tooltip_text.nil?
        (_names.to_unsafe + _n).value = "primary-icon-tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_tooltip_text)
        _n += 1
      end
      if !progress_fraction.nil?
        (_names.to_unsafe + _n).value = "progress-fraction".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, progress_fraction)
        _n += 1
      end
      if !progress_pulse_step.nil?
        (_names.to_unsafe + _n).value = "progress-pulse-step".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, progress_pulse_step)
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
      if !scroll_offset.nil?
        (_names.to_unsafe + _n).value = "scroll-offset".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scroll_offset)
        _n += 1
      end
      if !secondary_icon_activatable.nil?
        (_names.to_unsafe + _n).value = "secondary-icon-activatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_activatable)
        _n += 1
      end
      if !secondary_icon_gicon.nil?
        (_names.to_unsafe + _n).value = "secondary-icon-gicon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_gicon)
        _n += 1
      end
      if !secondary_icon_name.nil?
        (_names.to_unsafe + _n).value = "secondary-icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_name)
        _n += 1
      end
      if !secondary_icon_paintable.nil?
        (_names.to_unsafe + _n).value = "secondary-icon-paintable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_paintable)
        _n += 1
      end
      if !secondary_icon_sensitive.nil?
        (_names.to_unsafe + _n).value = "secondary-icon-sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_sensitive)
        _n += 1
      end
      if !secondary_icon_storage_type.nil?
        (_names.to_unsafe + _n).value = "secondary-icon-storage-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_storage_type)
        _n += 1
      end
      if !secondary_icon_tooltip_markup.nil?
        (_names.to_unsafe + _n).value = "secondary-icon-tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_tooltip_markup)
        _n += 1
      end
      if !secondary_icon_tooltip_text.nil?
        (_names.to_unsafe + _n).value = "secondary-icon-tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_tooltip_text)
        _n += 1
      end
      if !selection_bound.nil?
        (_names.to_unsafe + _n).value = "selection-bound".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selection_bound)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !show_emoji_icon.nil?
        (_names.to_unsafe + _n).value = "show-emoji-icon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_emoji_icon)
        _n += 1
      end
      if !tabs.nil?
        (_names.to_unsafe + _n).value = "tabs".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tabs)
        _n += 1
      end
      if !text.nil?
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end
      if !text_length.nil?
        (_names.to_unsafe + _n).value = "text-length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text_length)
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
      if !truncate_multiline.nil?
        (_names.to_unsafe + _n).value = "truncate-multiline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, truncate_multiline)
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
      if !visibility.nil?
        (_names.to_unsafe + _n).value = "visibility".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visibility)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !width_chars.nil?
        (_names.to_unsafe + _n).value = "width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_chars)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if !xalign.nil?
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Entry.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_entry_get_type
    end

    def activates_default=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "activates-default", unsafe_value, Pointer(Void).null)
      value
    end

    def activates_default? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "activates-default", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def attributes=(value : Pango::AttrList?) : Pango::AttrList?
      unsafe_value = value

      LibGObject.g_object_set(self, "attributes", unsafe_value, Pointer(Void).null)
      value
    end

    def attributes : Pango::AttrList?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "attributes", pointerof(value), Pointer(Void).null)
      Pango::AttrList.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def buffer=(value : Gtk::EntryBuffer?) : Gtk::EntryBuffer?
      unsafe_value = value

      LibGObject.g_object_set(self, "buffer", unsafe_value, Pointer(Void).null)
      value
    end

    def buffer : Gtk::EntryBuffer?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "buffer", pointerof(value), Pointer(Void).null)
      Gtk::EntryBuffer.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def completion=(value : Gtk::EntryCompletion?) : Gtk::EntryCompletion?
      unsafe_value = value

      LibGObject.g_object_set(self, "completion", unsafe_value, Pointer(Void).null)
      value
    end

    def completion : Gtk::EntryCompletion?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "completion", pointerof(value), Pointer(Void).null)
      Gtk::EntryCompletion.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def enable_emoji_completion=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-emoji-completion", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_emoji_completion? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-emoji-completion", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def extra_menu=(value : Gio::MenuModel?) : Gio::MenuModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "extra-menu", unsafe_value, Pointer(Void).null)
      value
    end

    def extra_menu : Gio::MenuModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "extra-menu", pointerof(value), Pointer(Void).null)
      Gio::MenuModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def has_frame=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "has-frame", unsafe_value, Pointer(Void).null)
      value
    end

    def has_frame? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-frame", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def im_module=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "im-module", unsafe_value, Pointer(Void).null)
      value
    end

    def im_module : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "im-module", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def input_hints=(value : Gtk::InputHints) : Gtk::InputHints
      unsafe_value = value

      LibGObject.g_object_set(self, "input-hints", unsafe_value, Pointer(Void).null)
      value
    end

    def input_hints : Gtk::InputHints
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "input-hints", pointerof(value), Pointer(Void).null)
      Gtk::InputHints.new(value)
    end

    def input_purpose=(value : Gtk::InputPurpose) : Gtk::InputPurpose
      unsafe_value = value

      LibGObject.g_object_set(self, "input-purpose", unsafe_value, Pointer(Void).null)
      value
    end

    def input_purpose : Gtk::InputPurpose
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "input-purpose", pointerof(value), Pointer(Void).null)
      Gtk::InputPurpose.new(value)
    end

    def invisible_char=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "invisible-char", unsafe_value, Pointer(Void).null)
      value
    end

    def invisible_char : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "invisible-char", pointerof(value), Pointer(Void).null)
      value
    end

    def invisible_char_set=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "invisible-char-set", unsafe_value, Pointer(Void).null)
      value
    end

    def invisible_char_set? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "invisible-char-set", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def max_length=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-length", unsafe_value, Pointer(Void).null)
      value
    end

    def max_length : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-length", pointerof(value), Pointer(Void).null)
      value
    end

    def overwrite_mode=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "overwrite-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def overwrite_mode? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "overwrite-mode", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def placeholder_text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "placeholder-text", unsafe_value, Pointer(Void).null)
      value
    end

    def placeholder_text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "placeholder-text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def primary_icon_activatable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "primary-icon-activatable", unsafe_value, Pointer(Void).null)
      value
    end

    def primary_icon_activatable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "primary-icon-activatable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def primary_icon_gicon=(value : Gio::Icon?) : Gio::Icon?
      unsafe_value = value

      LibGObject.g_object_set(self, "primary-icon-gicon", unsafe_value, Pointer(Void).null)
      value
    end

    def primary_icon_gicon : Gio::Icon?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "primary-icon-gicon", pointerof(value), Pointer(Void).null)
      Gio::AbstractIcon.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def primary_icon_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "primary-icon-name", unsafe_value, Pointer(Void).null)
      value
    end

    def primary_icon_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "primary-icon-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def primary_icon_paintable=(value : Gdk::Paintable?) : Gdk::Paintable?
      unsafe_value = value

      LibGObject.g_object_set(self, "primary-icon-paintable", unsafe_value, Pointer(Void).null)
      value
    end

    def primary_icon_paintable : Gdk::Paintable?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "primary-icon-paintable", pointerof(value), Pointer(Void).null)
      Gdk::AbstractPaintable.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def primary_icon_sensitive=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "primary-icon-sensitive", unsafe_value, Pointer(Void).null)
      value
    end

    def primary_icon_sensitive? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "primary-icon-sensitive", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def primary_icon_storage_type : Gtk::ImageType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "primary-icon-storage-type", pointerof(value), Pointer(Void).null)
      Gtk::ImageType.new(value)
    end

    def primary_icon_tooltip_markup=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "primary-icon-tooltip-markup", unsafe_value, Pointer(Void).null)
      value
    end

    def primary_icon_tooltip_markup : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "primary-icon-tooltip-markup", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def primary_icon_tooltip_text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "primary-icon-tooltip-text", unsafe_value, Pointer(Void).null)
      value
    end

    def primary_icon_tooltip_text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "primary-icon-tooltip-text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def progress_fraction=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "progress-fraction", unsafe_value, Pointer(Void).null)
      value
    end

    def progress_fraction : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "progress-fraction", pointerof(value), Pointer(Void).null)
      value
    end

    def progress_pulse_step=(value : Float64) : Float64
      unsafe_value = value

      LibGObject.g_object_set(self, "progress-pulse-step", unsafe_value, Pointer(Void).null)
      value
    end

    def progress_pulse_step : Float64
      # Returns: None

      value = uninitialized Float64
      LibGObject.g_object_get(self, "progress-pulse-step", pointerof(value), Pointer(Void).null)
      value
    end

    def scroll_offset : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "scroll-offset", pointerof(value), Pointer(Void).null)
      value
    end

    def secondary_icon_activatable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "secondary-icon-activatable", unsafe_value, Pointer(Void).null)
      value
    end

    def secondary_icon_activatable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "secondary-icon-activatable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def secondary_icon_gicon=(value : Gio::Icon?) : Gio::Icon?
      unsafe_value = value

      LibGObject.g_object_set(self, "secondary-icon-gicon", unsafe_value, Pointer(Void).null)
      value
    end

    def secondary_icon_gicon : Gio::Icon?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "secondary-icon-gicon", pointerof(value), Pointer(Void).null)
      Gio::AbstractIcon.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def secondary_icon_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "secondary-icon-name", unsafe_value, Pointer(Void).null)
      value
    end

    def secondary_icon_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "secondary-icon-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def secondary_icon_paintable=(value : Gdk::Paintable?) : Gdk::Paintable?
      unsafe_value = value

      LibGObject.g_object_set(self, "secondary-icon-paintable", unsafe_value, Pointer(Void).null)
      value
    end

    def secondary_icon_paintable : Gdk::Paintable?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "secondary-icon-paintable", pointerof(value), Pointer(Void).null)
      Gdk::AbstractPaintable.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def secondary_icon_sensitive=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "secondary-icon-sensitive", unsafe_value, Pointer(Void).null)
      value
    end

    def secondary_icon_sensitive? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "secondary-icon-sensitive", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def secondary_icon_storage_type : Gtk::ImageType
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "secondary-icon-storage-type", pointerof(value), Pointer(Void).null)
      Gtk::ImageType.new(value)
    end

    def secondary_icon_tooltip_markup=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "secondary-icon-tooltip-markup", unsafe_value, Pointer(Void).null)
      value
    end

    def secondary_icon_tooltip_markup : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "secondary-icon-tooltip-markup", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def secondary_icon_tooltip_text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "secondary-icon-tooltip-text", unsafe_value, Pointer(Void).null)
      value
    end

    def secondary_icon_tooltip_text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "secondary-icon-tooltip-text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def show_emoji_icon=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-emoji-icon", unsafe_value, Pointer(Void).null)
      value
    end

    def show_emoji_icon? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-emoji-icon", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def tabs=(value : Pango::TabArray?) : Pango::TabArray?
      unsafe_value = value

      LibGObject.g_object_set(self, "tabs", unsafe_value, Pointer(Void).null)
      value
    end

    def tabs : Pango::TabArray?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "tabs", pointerof(value), Pointer(Void).null)
      Pango::TabArray.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def text_length : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "text-length", pointerof(value), Pointer(Void).null)
      value
    end

    def truncate_multiline=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "truncate-multiline", unsafe_value, Pointer(Void).null)
      value
    end

    def truncate_multiline? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "truncate-multiline", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def visibility=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "visibility", unsafe_value, Pointer(Void).null)
      value
    end

    def visibility? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "visibility", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new entry.
    def initialize
      # gtk_entry_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new entry with the specified text buffer.
    def self.new_with_buffer(buffer : Gtk::EntryBuffer) : self
      # gtk_entry_new_with_buffer: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_new_with_buffer(buffer)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::Entry.new(_retval, GICrystal::Transfer::Full)
    end

    # Retrieves the value set by gtk_entry_set_activates_default().
    def activates_default : Bool
      # gtk_entry_get_activates_default: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_activates_default(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the value set by gtk_entry_set_alignment().
    #
    # See also: `Gtk::Editable#xalign`
    def alignment : Float32
      # gtk_entry_get_alignment: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_alignment(@pointer)

      # Return value handling

      _retval
    end

    # Gets the attribute list of the `GtkEntry`.
    #
    # See `Gtk::Entry#attributes=`.
    def attributes : Pango::AttrList?
      # gtk_entry_get_attributes: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_attributes(@pointer)

      # Return value handling

      Pango::AttrList.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Get the `GtkEntryBuffer` object which holds the text for
    # this widget.
    def buffer : Gtk::EntryBuffer
      # gtk_entry_get_buffer: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_buffer(@pointer)

      # Return value handling

      Gtk::EntryBuffer.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the auxiliary completion object currently
    # in use by @entry.
    def completion : Gtk::EntryCompletion?
      # gtk_entry_get_completion: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_completion(@pointer)

      # Return value handling

      Gtk::EntryCompletion.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the index of the icon which is the source of the
    # current  DND operation, or -1.
    def current_icon_drag_source : Int32
      # gtk_entry_get_current_icon_drag_source: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_current_icon_drag_source(@pointer)

      # Return value handling

      _retval
    end

    # Gets the menu model set with gtk_entry_set_extra_menu().
    def extra_menu : Gio::MenuModel?
      # gtk_entry_get_extra_menu: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_extra_menu(@pointer)

      # Return value handling

      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the value set by gtk_entry_set_has_frame().
    def has_frame : Bool
      # gtk_entry_get_has_frame: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_has_frame(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the icon is activatable.
    def icon_activatable(icon_pos : Gtk::EntryIconPosition) : Bool
      # gtk_entry_get_icon_activatable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_icon_activatable(@pointer, icon_pos)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the area where entry’s icon at @icon_pos is drawn.
    #
    # This function is useful when drawing something to the
    # entry in a draw callback.
    #
    # If the entry is not realized or has no icon at the given
    # position, @icon_area is filled with zeros. Otherwise,
    # @icon_area will be filled with the icon's allocation,
    # relative to @entry's allocation.
    def icon_area(icon_pos : Gtk::EntryIconPosition) : Gdk::Rectangle
      # gtk_entry_get_icon_area: (Method)
      # @icon_area: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      icon_area = Gdk::Rectangle.new
      # C call
      LibGtk.gtk_entry_get_icon_area(@pointer, icon_pos, icon_area)

      # Return value handling

      icon_area
    end

    # Finds the icon at the given position and return its index.
    #
    # The position’s coordinates are relative to the @entry’s
    # top left corner. If @x, @y doesn’t lie inside an icon,
    # -1 is returned. This function is intended for use in a
    #  [signal@Gtk.Widget::query-tooltip] signal handler.
    def icon_at_pos(x : Int32, y : Int32) : Int32
      # gtk_entry_get_icon_at_pos: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_icon_at_pos(@pointer, x, y)

      # Return value handling

      _retval
    end

    # Retrieves the `GIcon` used for the icon.
    #
    # %NULL will be returned if there is no icon or if the icon was
    # set by some other method (e.g., by `GdkPaintable` or icon name).
    def icon_gicon(icon_pos : Gtk::EntryIconPosition) : Gio::Icon?
      # gtk_entry_get_icon_gicon: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_icon_gicon(@pointer, icon_pos)

      # Return value handling

      Gio::AbstractIcon.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the icon name used for the icon.
    #
    # %NULL is returned if there is no icon or if the icon was set
    # by some other method (e.g., by `GdkPaintable` or gicon).
    def icon_name(icon_pos : Gtk::EntryIconPosition) : ::String?
      # gtk_entry_get_icon_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_icon_name(@pointer, icon_pos)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Retrieves the `GdkPaintable` used for the icon.
    #
    # If no `GdkPaintable` was used for the icon, %NULL is returned.
    def icon_paintable(icon_pos : Gtk::EntryIconPosition) : Gdk::Paintable?
      # gtk_entry_get_icon_paintable: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_icon_paintable(@pointer, icon_pos)

      # Return value handling

      Gdk::AbstractPaintable.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the icon appears sensitive or insensitive.
    def icon_sensitive(icon_pos : Gtk::EntryIconPosition) : Bool
      # gtk_entry_get_icon_sensitive: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_icon_sensitive(@pointer, icon_pos)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the type of representation being used by the icon
    # to store image data.
    #
    # If the icon has no image data, the return value will
    # be %GTK_IMAGE_EMPTY.
    def icon_storage_type(icon_pos : Gtk::EntryIconPosition) : Gtk::ImageType
      # gtk_entry_get_icon_storage_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_icon_storage_type(@pointer, icon_pos)

      # Return value handling

      Gtk::ImageType.new(_retval)
    end

    # Gets the contents of the tooltip on the icon at the specified
    # position in @entry.
    def icon_tooltip_markup(icon_pos : Gtk::EntryIconPosition) : ::String?
      # gtk_entry_get_icon_tooltip_markup: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_entry_get_icon_tooltip_markup(@pointer, icon_pos)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Gets the contents of the tooltip on the icon at the specified
    # position in @entry.
    def icon_tooltip_text(icon_pos : Gtk::EntryIconPosition) : ::String?
      # gtk_entry_get_icon_tooltip_text: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_entry_get_icon_tooltip_text(@pointer, icon_pos)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Gets the input hints of this `GtkEntry`.
    def input_hints : Gtk::InputHints
      # gtk_entry_get_input_hints: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_input_hints(@pointer)

      # Return value handling

      Gtk::InputHints.new(_retval)
    end

    # Gets the input purpose of the `GtkEntry`.
    def input_purpose : Gtk::InputPurpose
      # gtk_entry_get_input_purpose: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_input_purpose(@pointer)

      # Return value handling

      Gtk::InputPurpose.new(_retval)
    end

    # Retrieves the character displayed in place of the actual text
    # in “password mode”.
    def invisible_char : UInt32
      # gtk_entry_get_invisible_char: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_invisible_char(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the maximum allowed length of the text in @entry.
    #
    # See `Gtk::Entry#max_length=`.
    def max_length : Int32
      # gtk_entry_get_max_length: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_max_length(@pointer)

      # Return value handling

      _retval
    end

    # Gets whether the `GtkEntry` is in overwrite mode.
    def overwrite_mode : Bool
      # gtk_entry_get_overwrite_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_overwrite_mode(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the text that will be displayed when @entry
    # is empty and unfocused
    def placeholder_text : ::String?
      # gtk_entry_get_placeholder_text: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_placeholder_text(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the current fraction of the task that’s been completed.
    #
    # See `Gtk::Entry#progress_fraction=`.
    def progress_fraction : Float64
      # gtk_entry_get_progress_fraction: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_progress_fraction(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the pulse step set with
    # gtk_entry_set_progress_pulse_step().
    def progress_pulse_step : Float64
      # gtk_entry_get_progress_pulse_step: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_progress_pulse_step(@pointer)

      # Return value handling

      _retval
    end

    # Gets the tabstops of the `GtkEntry.
    #
    # See `Gtk::Entry#tabs=`.
    def tabs : Pango::TabArray?
      # gtk_entry_get_tabs: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_tabs(@pointer)

      # Return value handling

      Pango::TabArray.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Retrieves the current length of the text in @entry.
    #
    # This is equivalent to getting @entry's `GtkEntryBuffer`
    # and calling `Gtk::EntryBuffer#length` on it.
    def text_length : UInt16
      # gtk_entry_get_text_length: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_text_length(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves whether the text in @entry is visible.
    #
    # See `Gtk::Entry#visibility=`.
    def visibility : Bool
      # gtk_entry_get_visibility: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_get_visibility(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Causes @entry to have keyboard focus.
    #
    # It behaves like `Gtk::Widget#grab_focus`, except that it doesn't
    # select the contents of the entry. You only want to call this on some
    # special entries which the user usually doesn't want to replace all text
    # in, such as search-as-you-type entries.
    def grab_focus_without_selecting : Bool
      # gtk_entry_grab_focus_without_selecting: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_grab_focus_without_selecting(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Indicates that some progress is made, but you don’t
    # know how much.
    #
    # Causes the entry’s progress indicator to enter “activity
    # mode”, where a block bounces back and forth. Each call to
    # gtk_entry_progress_pulse() causes the block to move by a
    # little bit (the amount of movement per pulse is determined
    # by `Gtk::Entry#progress_pulse_step=`).
    def progress_pulse : Nil
      # gtk_entry_progress_pulse: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_progress_pulse(@pointer)

      # Return value handling
    end

    # Reset the input method context of the entry if needed.
    #
    # This can be necessary in the case where modifying the buffer
    # would confuse on-going input method behavior.
    def reset_im_context : Nil
      # gtk_entry_reset_im_context: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_reset_im_context(@pointer)

      # Return value handling
    end

    # Sets whether pressing Enter in the @entry will activate the default
    # widget for the window containing the entry.
    #
    # This usually means that the dialog containing the entry will be closed,
    # since the default widget is usually one of the dialog buttons.
    def activates_default=(setting : Bool) : Nil
      # gtk_entry_set_activates_default: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_activates_default(@pointer, setting)

      # Return value handling
    end

    # Sets the alignment for the contents of the entry.
    #
    # This controls the horizontal positioning of the contents when
    # the displayed text is shorter than the width of the entry.
    #
    # See also: `Gtk::Editable#xalign`
    def alignment=(xalign : Float32) : Nil
      # gtk_entry_set_alignment: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_alignment(@pointer, xalign)

      # Return value handling
    end

    # Sets a `PangoAttrList`.
    #
    # The attributes in the list are applied to the entry text.
    #
    # Since the attributes will be applies to text that changes
    # as the user types, it makes most sense to use attributes
    # with unlimited extent.
    def attributes=(attrs : Pango::AttrList) : Nil
      # gtk_entry_set_attributes: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_attributes(@pointer, attrs)

      # Return value handling
    end

    # Set the `GtkEntryBuffer` object which holds the text for
    # this widget.
    def buffer=(buffer : Gtk::EntryBuffer) : Nil
      # gtk_entry_set_buffer: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_buffer(@pointer, buffer)

      # Return value handling
    end

    # Sets @completion to be the auxiliary completion object
    # to use with @entry.
    #
    # All further configuration of the completion mechanism is
    # done on @completion using the `GtkEntryCompletion` API.
    # Completion is disabled if @completion is set to %NULL.
    def completion=(completion : Gtk::EntryCompletion?) : Nil
      # gtk_entry_set_completion: (Method | Setter)
      # @completion: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      completion = if completion.nil?
                     Pointer(Void).null
                   else
                     completion.to_unsafe
                   end

      # C call
      LibGtk.gtk_entry_set_completion(@pointer, completion)

      # Return value handling
    end

    # Sets a menu model to add when constructing
    # the context menu for @entry.
    def extra_menu=(model : Gio::MenuModel?) : Nil
      # gtk_entry_set_extra_menu: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_entry_set_extra_menu(@pointer, model)

      # Return value handling
    end

    # Sets whether the entry has a beveled frame around it.
    def has_frame=(setting : Bool) : Nil
      # gtk_entry_set_has_frame: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_has_frame(@pointer, setting)

      # Return value handling
    end

    # Sets whether the icon is activatable.
    def set_icon_activatable(icon_pos : Gtk::EntryIconPosition, activatable : Bool) : Nil
      # gtk_entry_set_icon_activatable: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_icon_activatable(@pointer, icon_pos, activatable)

      # Return value handling
    end

    # Sets up the icon at the given position as drag source.
    #
    # This makes it so that GTK will start a drag
    # operation when the user clicks and drags the icon.
    def set_icon_drag_source(icon_pos : Gtk::EntryIconPosition, provider : Gdk::ContentProvider, actions : Gdk::DragAction) : Nil
      # gtk_entry_set_icon_drag_source: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_icon_drag_source(@pointer, icon_pos, provider, actions)

      # Return value handling
    end

    # Sets the icon shown in the entry at the specified position
    # from the current icon theme.
    #
    # If the icon isn’t known, a “broken image” icon will be
    # displayed instead.
    #
    # If @icon is %NULL, no icon will be shown in the
    # specified position.
    def set_icon_from_gicon(icon_pos : Gtk::EntryIconPosition, icon : Gio::Icon?) : Nil
      # gtk_entry_set_icon_from_gicon: (Method)
      # @icon: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      icon = if icon.nil?
               Pointer(Void).null
             else
               icon.to_unsafe
             end

      # C call
      LibGtk.gtk_entry_set_icon_from_gicon(@pointer, icon_pos, icon)

      # Return value handling
    end

    # Sets the icon shown in the entry at the specified position
    # from the current icon theme.
    #
    # If the icon name isn’t known, a “broken image” icon will be
    # displayed instead.
    #
    # If @icon_name is %NULL, no icon will be shown in the
    # specified position.
    def set_icon_from_icon_name(icon_pos : Gtk::EntryIconPosition, icon_name : ::String?) : Nil
      # gtk_entry_set_icon_from_icon_name: (Method)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      # C call
      LibGtk.gtk_entry_set_icon_from_icon_name(@pointer, icon_pos, icon_name)

      # Return value handling
    end

    # Sets the icon shown in the specified position using a `GdkPaintable`.
    #
    # If @paintable is %NULL, no icon will be shown in the specified position.
    def set_icon_from_paintable(icon_pos : Gtk::EntryIconPosition, paintable : Gdk::Paintable?) : Nil
      # gtk_entry_set_icon_from_paintable: (Method)
      # @paintable: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      paintable = if paintable.nil?
                    Pointer(Void).null
                  else
                    paintable.to_unsafe
                  end

      # C call
      LibGtk.gtk_entry_set_icon_from_paintable(@pointer, icon_pos, paintable)

      # Return value handling
    end

    # Sets the sensitivity for the specified icon.
    def set_icon_sensitive(icon_pos : Gtk::EntryIconPosition, sensitive : Bool) : Nil
      # gtk_entry_set_icon_sensitive: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_icon_sensitive(@pointer, icon_pos, sensitive)

      # Return value handling
    end

    # Sets @tooltip as the contents of the tooltip for the icon at
    # the specified position.
    #
    # @tooltip is assumed to be marked up with Pango Markup.
    #
    # Use %NULL for @tooltip to remove an existing tooltip.
    #
    # See also `Gtk::Widget#tooltip_markup=` and
    # `Gtk::Entry#icon_tooltip_text=`.
    def set_icon_tooltip_markup(icon_pos : Gtk::EntryIconPosition, tooltip : ::String?) : Nil
      # gtk_entry_set_icon_tooltip_markup: (Method)
      # @tooltip: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      tooltip = if tooltip.nil?
                  Pointer(LibC::Char).null
                else
                  tooltip.to_unsafe
                end

      # C call
      LibGtk.gtk_entry_set_icon_tooltip_markup(@pointer, icon_pos, tooltip)

      # Return value handling
    end

    # Sets @tooltip as the contents of the tooltip for the icon
    # at the specified position.
    #
    # Use %NULL for @tooltip to remove an existing tooltip.
    #
    # See also `Gtk::Widget#tooltip_text=` and
    # `Gtk::Entry#icon_tooltip_markup=`.
    #
    # If you unset the widget tooltip via
    # `Gtk::Widget#tooltip_text=` or
    # `Gtk::Widget#tooltip_markup=`, this sets
    # [property@Gtk.Widget:has-tooltip] to %FALSE, which suppresses
    # icon tooltips too. You can resolve this by then calling
    # `Gtk::Widget#has_tooltip=` to set
    # [property@Gtk.Widget:has-tooltip] back to %TRUE, or
    # setting at least one non-empty tooltip on any icon
    # achieves the same result.
    def set_icon_tooltip_text(icon_pos : Gtk::EntryIconPosition, tooltip : ::String?) : Nil
      # gtk_entry_set_icon_tooltip_text: (Method)
      # @tooltip: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      tooltip = if tooltip.nil?
                  Pointer(LibC::Char).null
                else
                  tooltip.to_unsafe
                end

      # C call
      LibGtk.gtk_entry_set_icon_tooltip_text(@pointer, icon_pos, tooltip)

      # Return value handling
    end

    # Set additional hints which allow input methods to
    # fine-tune their behavior.
    def input_hints=(hints : Gtk::InputHints) : Nil
      # gtk_entry_set_input_hints: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_input_hints(@pointer, hints)

      # Return value handling
    end

    # Sets the input purpose which can be used by input methods
    # to adjust their behavior.
    def input_purpose=(purpose : Gtk::InputPurpose) : Nil
      # gtk_entry_set_input_purpose: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_input_purpose(@pointer, purpose)

      # Return value handling
    end

    # Sets the character to use in place of the actual text
    # in “password mode”.
    #
    # See `Gtk::Entry#visibility=` for how to enable
    # “password mode”.
    #
    # By default, GTK picks the best invisible char available in
    # the current font. If you set the invisible char to 0, then
    # the user will get no feedback at all; there will be no text
    # on the screen as they type.
    def invisible_char=(ch : UInt32) : Nil
      # gtk_entry_set_invisible_char: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_invisible_char(@pointer, ch)

      # Return value handling
    end

    # Sets the maximum allowed length of the contents of the widget.
    #
    # If the current contents are longer than the given length, then
    # they will be truncated to fit. The length is is in characters.
    #
    # This is equivalent to getting @entry's `GtkEntryBuffer` and
    # calling `Gtk::EntryBuffer#max_length=` on it.
    def max_length=(max : Int32) : Nil
      # gtk_entry_set_max_length: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_max_length(@pointer, max)

      # Return value handling
    end

    # Sets whether the text is overwritten when typing in the `GtkEntry`.
    def overwrite_mode=(overwrite : Bool) : Nil
      # gtk_entry_set_overwrite_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_overwrite_mode(@pointer, overwrite)

      # Return value handling
    end

    # Sets text to be displayed in @entry when it is empty.
    #
    # This can be used to give a visual hint of the expected
    # contents of the `GtkEntry`.
    def placeholder_text=(text : ::String?) : Nil
      # gtk_entry_set_placeholder_text: (Method | Setter)
      # @text: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      # C call
      LibGtk.gtk_entry_set_placeholder_text(@pointer, text)

      # Return value handling
    end

    # Causes the entry’s progress indicator to “fill in” the given
    # fraction of the bar.
    #
    # The fraction should be between 0.0 and 1.0, inclusive.
    def progress_fraction=(fraction : Float64) : Nil
      # gtk_entry_set_progress_fraction: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_progress_fraction(@pointer, fraction)

      # Return value handling
    end

    # Sets the fraction of total entry width to move the progress
    # bouncing block for each pulse.
    #
    # Use `Gtk::Entry#progress_pulse` to pulse
    # the progress.
    def progress_pulse_step=(fraction : Float64) : Nil
      # gtk_entry_set_progress_pulse_step: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_progress_pulse_step(@pointer, fraction)

      # Return value handling
    end

    # Sets a `PangoTabArray`.
    #
    # The tabstops in the array are applied to the entry text.
    def tabs=(tabs : Pango::TabArray?) : Nil
      # gtk_entry_set_tabs: (Method | Setter)
      # @tabs: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      tabs = if tabs.nil?
               Pointer(Void).null
             else
               tabs.to_unsafe
             end

      # C call
      LibGtk.gtk_entry_set_tabs(@pointer, tabs)

      # Return value handling
    end

    # Sets whether the contents of the entry are visible or not.
    #
    # When visibility is set to %FALSE, characters are displayed
    # as the invisible char, and will also appear that way when
    # the text in the entry widget is copied elsewhere.
    #
    # By default, GTK picks the best invisible character available
    # in the current font, but it can be changed with
    # `Gtk::Entry#invisible_char=`.
    #
    # Note that you probably want to set [property@Gtk.Entry:input-purpose]
    # to %GTK_INPUT_PURPOSE_PASSWORD or %GTK_INPUT_PURPOSE_PIN to
    # inform input methods about the purpose of this entry,
    # in addition to setting visibility to %FALSE.
    def visibility=(visible : Bool) : Nil
      # gtk_entry_set_visibility: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_set_visibility(@pointer, visible)

      # Return value handling
    end

    # Unsets the invisible char, so that the default invisible char
    # is used again. See `Gtk::Entry#invisible_char=`.
    def unset_invisible_char : Nil
      # gtk_entry_unset_invisible_char: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_unset_invisible_char(@pointer)

      # Return value handling
    end

    # Emitted when the entry is activated.
    #
    # The keybindings for this signal are all forms of the Enter key.
    struct ActivateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate::#{@detail}" : "activate"
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

      def connect(handler : Proc(Gtk::Entry, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Entry.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Entry, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Entry, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Entry.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Entry, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end

    # Emitted when an activatable icon is clicked.
    struct IconPressSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "icon-press::#{@detail}" : "icon-press"
      end

      def connect(&block : Proc(Gtk::EntryIconPosition, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::EntryIconPosition, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::EntryIconPosition, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_icon_pos : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          icon_pos = Gtk::EntryIconPosition.new(lib_icon_pos)
          ::Box(Proc(Gtk::EntryIconPosition, Nil)).unbox(_lib_box).call(icon_pos)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::EntryIconPosition, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_icon_pos : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          icon_pos = Gtk::EntryIconPosition.new(lib_icon_pos)
          ::Box(Proc(Gtk::EntryIconPosition, Nil)).unbox(_lib_box).call(icon_pos)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_icon_pos : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Entry.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          icon_pos = Gtk::EntryIconPosition.new(lib_icon_pos)
          ::Box(Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil)).unbox(_lib_box).call(_sender, icon_pos)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_icon_pos : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Entry.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          icon_pos = Gtk::EntryIconPosition.new(lib_icon_pos)
          ::Box(Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil)).unbox(_lib_box).call(_sender, icon_pos)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(icon_pos : Gtk::EntryIconPosition) : Nil
        LibGObject.g_signal_emit_by_name(@source, "icon-press", icon_pos)
      end
    end

    def icon_press_signal
      IconPressSignal.new(self)
    end

    # Emitted on the button release from a mouse click
    # over an activatable icon.
    struct IconReleaseSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "icon-release::#{@detail}" : "icon-release"
      end

      def connect(&block : Proc(Gtk::EntryIconPosition, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::EntryIconPosition, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::EntryIconPosition, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_icon_pos : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          icon_pos = Gtk::EntryIconPosition.new(lib_icon_pos)
          ::Box(Proc(Gtk::EntryIconPosition, Nil)).unbox(_lib_box).call(icon_pos)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::EntryIconPosition, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_icon_pos : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          icon_pos = Gtk::EntryIconPosition.new(lib_icon_pos)
          ::Box(Proc(Gtk::EntryIconPosition, Nil)).unbox(_lib_box).call(icon_pos)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_icon_pos : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Entry.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          icon_pos = Gtk::EntryIconPosition.new(lib_icon_pos)
          ::Box(Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil)).unbox(_lib_box).call(_sender, icon_pos)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_icon_pos : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gtk::Entry.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          icon_pos = Gtk::EntryIconPosition.new(lib_icon_pos)
          ::Box(Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil)).unbox(_lib_box).call(_sender, icon_pos)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(icon_pos : Gtk::EntryIconPosition) : Nil
        LibGObject.g_signal_emit_by_name(@source, "icon-release", icon_pos)
      end
    end

    def icon_release_signal
      IconReleaseSignal.new(self)
    end
  end
end
