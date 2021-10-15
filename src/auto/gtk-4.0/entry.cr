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
  # can be put into “password mode” using [method@Gtk.Entry.set_visibility].
  # In this mode, entered text is displayed using a “invisible” character.
  # By default, GTK picks the best invisible character that is available
  # in the current font, but it can be changed with
  # [method@Gtk.Entry.set_invisible_char].
  #
  # `GtkEntry` has the ability to display progress or activity
  # information behind the text. To make an entry display such information,
  # use [method@Gtk.Entry.set_progress_fraction] or
  # [method@Gtk.Entry.set_progress_pulse_step].
  #
  # Additionally, `GtkEntry` can show icons at either side of the entry.
  # These icons can be activatable by clicking, can be set up as drag source
  # and can have tooltips. To add an icon, use
  # [method@Gtk.Entry.set_icon_from_gicon] or one of the various other functions
  # that set an icon from an icon name or a paintable. To trigger an action when
  # the user clicks an icon, connect to the [signal@Gtk.Entry::icon-press] signal.
  # To allow DND operations from an icon, use
  # [method@Gtk.Entry.set_icon_drag_source]. To set a tooltip on an icon, use
  # [method@Gtk.Entry.set_icon_tooltip_text] or the corresponding function
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
  # see [class@Gtk.Text].
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
  class Entry < Widget
    include Accessible
    include Buildable
    include CellEditable
    include ConstraintTarget
    include Editable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, activates_default : Bool? = nil, attributes : Pango::AttrList? = nil, buffer : Gtk::EntryBuffer? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, completion : Gtk::EntryCompletion? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, cursor_position : Int32? = nil, editable : Bool? = nil, editing_canceled : Bool? = nil, enable_emoji_completion : Bool? = nil, enable_undo : Bool? = nil, extra_menu : Gio::MenuModel? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_frame : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, im_module : ::String? = nil, input_hints : Gtk::InputHints? = nil, input_purpose : Gtk::InputPurpose? = nil, invisible_char : UInt32? = nil, invisible_char_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_length : Int32? = nil, max_width_chars : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, overwrite_mode : Bool? = nil, parent : Gtk::Widget? = nil, placeholder_text : ::String? = nil, primary_icon_activatable : Bool? = nil, primary_icon_gicon : Gio::Icon? = nil, primary_icon_name : ::String? = nil, primary_icon_paintable : Gdk::Paintable? = nil, primary_icon_sensitive : Bool? = nil, primary_icon_storage_type : Gtk::ImageType? = nil, primary_icon_tooltip_markup : ::String? = nil, primary_icon_tooltip_text : ::String? = nil, progress_fraction : Float64? = nil, progress_pulse_step : Float64? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, scroll_offset : Int32? = nil, secondary_icon_activatable : Bool? = nil, secondary_icon_gicon : Gio::Icon? = nil, secondary_icon_name : ::String? = nil, secondary_icon_paintable : Gdk::Paintable? = nil, secondary_icon_sensitive : Bool? = nil, secondary_icon_storage_type : Gtk::ImageType? = nil, secondary_icon_tooltip_markup : ::String? = nil, secondary_icon_tooltip_text : ::String? = nil, selection_bound : Int32? = nil, sensitive : Bool? = nil, show_emoji_icon : Bool? = nil, tabs : Pango::TabArray? = nil, text : ::String? = nil, text_length : UInt32? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, truncate_multiline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visibility : Bool? = nil, visible : Bool? = nil, width_chars : Int32? = nil, width_request : Int32? = nil, xalign : Float32? = nil)
      _names = uninitialized Pointer(LibC::Char)[83]
      _values = StaticArray(LibGObject::Value, 83).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if activates_default
        (_names.to_unsafe + _n).value = "activates-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, activates_default)
        _n += 1
      end
      if attributes
        (_names.to_unsafe + _n).value = "attributes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, attributes)
        _n += 1
      end
      if buffer
        (_names.to_unsafe + _n).value = "buffer".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, buffer)
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
      if completion
        (_names.to_unsafe + _n).value = "completion".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, completion)
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
      if cursor_position
        (_names.to_unsafe + _n).value = "cursor-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor_position)
        _n += 1
      end
      if editable
        (_names.to_unsafe + _n).value = "editable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editable)
        _n += 1
      end
      if editing_canceled
        (_names.to_unsafe + _n).value = "editing-canceled".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, editing_canceled)
        _n += 1
      end
      if enable_emoji_completion
        (_names.to_unsafe + _n).value = "enable-emoji-completion".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_emoji_completion)
        _n += 1
      end
      if enable_undo
        (_names.to_unsafe + _n).value = "enable-undo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_undo)
        _n += 1
      end
      if extra_menu
        (_names.to_unsafe + _n).value = "extra-menu".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, extra_menu)
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
      if has_frame
        (_names.to_unsafe + _n).value = "has-frame".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_frame)
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
      if im_module
        (_names.to_unsafe + _n).value = "im-module".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, im_module)
        _n += 1
      end
      if input_hints
        (_names.to_unsafe + _n).value = "input-hints".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_hints)
        _n += 1
      end
      if input_purpose
        (_names.to_unsafe + _n).value = "input-purpose".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_purpose)
        _n += 1
      end
      if invisible_char
        (_names.to_unsafe + _n).value = "invisible-char".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, invisible_char)
        _n += 1
      end
      if invisible_char_set
        (_names.to_unsafe + _n).value = "invisible-char-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, invisible_char_set)
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
      if max_length
        (_names.to_unsafe + _n).value = "max-length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_length)
        _n += 1
      end
      if max_width_chars
        (_names.to_unsafe + _n).value = "max-width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width_chars)
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
      if overwrite_mode
        (_names.to_unsafe + _n).value = "overwrite-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overwrite_mode)
        _n += 1
      end
      if parent
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if placeholder_text
        (_names.to_unsafe + _n).value = "placeholder-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, placeholder_text)
        _n += 1
      end
      if primary_icon_activatable
        (_names.to_unsafe + _n).value = "primary-icon-activatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_activatable)
        _n += 1
      end
      if primary_icon_gicon
        (_names.to_unsafe + _n).value = "primary-icon-gicon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_gicon)
        _n += 1
      end
      if primary_icon_name
        (_names.to_unsafe + _n).value = "primary-icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_name)
        _n += 1
      end
      if primary_icon_paintable
        (_names.to_unsafe + _n).value = "primary-icon-paintable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_paintable)
        _n += 1
      end
      if primary_icon_sensitive
        (_names.to_unsafe + _n).value = "primary-icon-sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_sensitive)
        _n += 1
      end
      if primary_icon_storage_type
        (_names.to_unsafe + _n).value = "primary-icon-storage-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_storage_type)
        _n += 1
      end
      if primary_icon_tooltip_markup
        (_names.to_unsafe + _n).value = "primary-icon-tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_tooltip_markup)
        _n += 1
      end
      if primary_icon_tooltip_text
        (_names.to_unsafe + _n).value = "primary-icon-tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, primary_icon_tooltip_text)
        _n += 1
      end
      if progress_fraction
        (_names.to_unsafe + _n).value = "progress-fraction".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, progress_fraction)
        _n += 1
      end
      if progress_pulse_step
        (_names.to_unsafe + _n).value = "progress-pulse-step".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, progress_pulse_step)
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
      if scroll_offset
        (_names.to_unsafe + _n).value = "scroll-offset".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scroll_offset)
        _n += 1
      end
      if secondary_icon_activatable
        (_names.to_unsafe + _n).value = "secondary-icon-activatable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_activatable)
        _n += 1
      end
      if secondary_icon_gicon
        (_names.to_unsafe + _n).value = "secondary-icon-gicon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_gicon)
        _n += 1
      end
      if secondary_icon_name
        (_names.to_unsafe + _n).value = "secondary-icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_name)
        _n += 1
      end
      if secondary_icon_paintable
        (_names.to_unsafe + _n).value = "secondary-icon-paintable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_paintable)
        _n += 1
      end
      if secondary_icon_sensitive
        (_names.to_unsafe + _n).value = "secondary-icon-sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_sensitive)
        _n += 1
      end
      if secondary_icon_storage_type
        (_names.to_unsafe + _n).value = "secondary-icon-storage-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_storage_type)
        _n += 1
      end
      if secondary_icon_tooltip_markup
        (_names.to_unsafe + _n).value = "secondary-icon-tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_tooltip_markup)
        _n += 1
      end
      if secondary_icon_tooltip_text
        (_names.to_unsafe + _n).value = "secondary-icon-tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, secondary_icon_tooltip_text)
        _n += 1
      end
      if selection_bound
        (_names.to_unsafe + _n).value = "selection-bound".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selection_bound)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if show_emoji_icon
        (_names.to_unsafe + _n).value = "show-emoji-icon".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_emoji_icon)
        _n += 1
      end
      if tabs
        (_names.to_unsafe + _n).value = "tabs".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tabs)
        _n += 1
      end
      if text
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end
      if text_length
        (_names.to_unsafe + _n).value = "text-length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text_length)
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
      if truncate_multiline
        (_names.to_unsafe + _n).value = "truncate-multiline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, truncate_multiline)
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
      if visibility
        (_names.to_unsafe + _n).value = "visibility".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visibility)
        _n += 1
      end
      if visible
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if width_chars
        (_names.to_unsafe + _n).value = "width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_chars)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if xalign
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Entry.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_entry_get_type
    end

    def initialize
      # gtk_entry_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_new
      @pointer = _retval
    end

    def self.new_with_buffer(buffer : Gtk::EntryBuffer) : Gtk::Widget
      # gtk_entry_new_with_buffer: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_new_with_buffer(buffer)
      Gtk::Entry.new(_retval, GICrystal::Transfer::Full)
    end

    def activates_default? : Bool
      # gtk_entry_get_activates_default: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_activates_default(self)
      GICrystal.to_bool(_retval)
    end

    def alignment : Float32
      # gtk_entry_get_alignment: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_alignment(self)
      _retval
    end

    def attributes : Pango::AttrList?
      # gtk_entry_get_attributes: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_attributes(self)
      Pango::AttrList.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def buffer : Gtk::EntryBuffer
      # gtk_entry_get_buffer: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_buffer(self)
      Gtk::EntryBuffer.new(_retval, GICrystal::Transfer::None)
    end

    def completion : Gtk::EntryCompletion?
      # gtk_entry_get_completion: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_completion(self)
      Gtk::EntryCompletion.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def current_icon_drag_source : Int32
      # gtk_entry_get_current_icon_drag_source: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_current_icon_drag_source(self)
      _retval
    end

    def extra_menu : Gio::MenuModel?
      # gtk_entry_get_extra_menu: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_extra_menu(self)
      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def has_frame? : Bool
      # gtk_entry_get_has_frame: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_has_frame(self)
      GICrystal.to_bool(_retval)
    end

    def icon_activatable(icon_pos : Gtk::EntryIconPosition) : Bool
      # gtk_entry_get_icon_activatable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_icon_activatable(self, icon_pos)
      GICrystal.to_bool(_retval)
    end

    def icon_area(icon_pos : Gtk::EntryIconPosition) : Gdk::Rectangle
      # gtk_entry_get_icon_area: (Method)
      # @icon_area: (out) (caller-allocates)
      # Returns: (transfer none)

      icon_area = Gdk::Rectangle.new

      LibGtk.gtk_entry_get_icon_area(self, icon_pos, icon_area)
      icon_area
    end

    def icon_at_pos(x : Int32, y : Int32) : Int32
      # gtk_entry_get_icon_at_pos: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_icon_at_pos(self, x, y)
      _retval
    end

    def icon_gicon(icon_pos : Gtk::EntryIconPosition) : Gio::Icon?
      # gtk_entry_get_icon_gicon: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_icon_gicon(self, icon_pos)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def icon_name(icon_pos : Gtk::EntryIconPosition) : ::String?
      # gtk_entry_get_icon_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_icon_name(self, icon_pos)
      ::String.new(_retval) unless _retval.null?
    end

    def icon_paintable(icon_pos : Gtk::EntryIconPosition) : Gdk::Paintable?
      # gtk_entry_get_icon_paintable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_icon_paintable(self, icon_pos)
      Gdk::Paintable__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def icon_sensitive(icon_pos : Gtk::EntryIconPosition) : Bool
      # gtk_entry_get_icon_sensitive: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_icon_sensitive(self, icon_pos)
      GICrystal.to_bool(_retval)
    end

    def icon_storage_type(icon_pos : Gtk::EntryIconPosition) : Gtk::ImageType
      # gtk_entry_get_icon_storage_type: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_icon_storage_type(self, icon_pos)
      Gtk::ImageType.from_value(_retval)
    end

    def icon_tooltip_markup(icon_pos : Gtk::EntryIconPosition) : ::String?
      # gtk_entry_get_icon_tooltip_markup: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_entry_get_icon_tooltip_markup(self, icon_pos)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def icon_tooltip_text(icon_pos : Gtk::EntryIconPosition) : ::String?
      # gtk_entry_get_icon_tooltip_text: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_entry_get_icon_tooltip_text(self, icon_pos)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def input_hints : Gtk::InputHints
      # gtk_entry_get_input_hints: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_input_hints(self)
      Gtk::InputHints.from_value(_retval)
    end

    def input_purpose : Gtk::InputPurpose
      # gtk_entry_get_input_purpose: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_input_purpose(self)
      Gtk::InputPurpose.from_value(_retval)
    end

    def invisible_char : UInt32
      # gtk_entry_get_invisible_char: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_invisible_char(self)
      _retval
    end

    def max_length : Int32
      # gtk_entry_get_max_length: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_max_length(self)
      _retval
    end

    def overwrite_mode? : Bool
      # gtk_entry_get_overwrite_mode: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_overwrite_mode(self)
      GICrystal.to_bool(_retval)
    end

    def placeholder_text : ::String?
      # gtk_entry_get_placeholder_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_placeholder_text(self)
      ::String.new(_retval) unless _retval.null?
    end

    def progress_fraction : Float64
      # gtk_entry_get_progress_fraction: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_progress_fraction(self)
      _retval
    end

    def progress_pulse_step : Float64
      # gtk_entry_get_progress_pulse_step: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_progress_pulse_step(self)
      _retval
    end

    def tabs : Pango::TabArray?
      # gtk_entry_get_tabs: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_tabs(self)
      Pango::TabArray.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def text_length : UInt16
      # gtk_entry_get_text_length: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_text_length(self)
      _retval
    end

    def visibility? : Bool
      # gtk_entry_get_visibility: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_get_visibility(self)
      GICrystal.to_bool(_retval)
    end

    def grab_focus_without_selecting : Bool
      # gtk_entry_grab_focus_without_selecting: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_entry_grab_focus_without_selecting(self)
      GICrystal.to_bool(_retval)
    end

    def progress_pulse : Nil
      # gtk_entry_progress_pulse: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_progress_pulse(self)
    end

    def reset_im_context : Nil
      # gtk_entry_reset_im_context: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_reset_im_context(self)
    end

    def activates_default=(setting : Bool) : Nil
      # gtk_entry_set_activates_default: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_activates_default(self, setting)
    end

    def alignment=(xalign : Float32) : Nil
      # gtk_entry_set_alignment: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_alignment(self, xalign)
    end

    def attributes=(attrs : Pango::AttrList) : Nil
      # gtk_entry_set_attributes: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_attributes(self, attrs)
    end

    def buffer=(buffer : Gtk::EntryBuffer) : Nil
      # gtk_entry_set_buffer: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_buffer(self, buffer)
    end

    def completion=(completion : Gtk::EntryCompletion?) : Nil
      # gtk_entry_set_completion: (Method)
      # @completion: (nullable)
      # Returns: (transfer none)

      completion = if completion.nil?
                     Pointer(Void).null
                   else
                     completion.to_unsafe
                   end

      LibGtk.gtk_entry_set_completion(self, completion)
    end

    def extra_menu=(model : Gio::MenuModel?) : Nil
      # gtk_entry_set_extra_menu: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_entry_set_extra_menu(self, model)
    end

    def has_frame=(setting : Bool) : Nil
      # gtk_entry_set_has_frame: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_has_frame(self, setting)
    end

    def set_icon_activatable(icon_pos : Gtk::EntryIconPosition, activatable : Bool) : Nil
      # gtk_entry_set_icon_activatable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_icon_activatable(self, icon_pos, activatable)
    end

    def set_icon_drag_source(icon_pos : Gtk::EntryIconPosition, provider : Gdk::ContentProvider, actions : Gdk::DragAction) : Nil
      # gtk_entry_set_icon_drag_source: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_icon_drag_source(self, icon_pos, provider, actions)
    end

    def set_icon_from_gicon(icon_pos : Gtk::EntryIconPosition, icon : Gio::Icon?) : Nil
      # gtk_entry_set_icon_from_gicon: (Method)
      # @icon: (nullable)
      # Returns: (transfer none)

      icon = if icon.nil?
               Pointer(Void).null
             else
               icon.to_unsafe
             end

      LibGtk.gtk_entry_set_icon_from_gicon(self, icon_pos, icon)
    end

    def set_icon_from_icon_name(icon_pos : Gtk::EntryIconPosition, icon_name : ::String?) : Nil
      # gtk_entry_set_icon_from_icon_name: (Method)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      LibGtk.gtk_entry_set_icon_from_icon_name(self, icon_pos, icon_name)
    end

    def set_icon_from_paintable(icon_pos : Gtk::EntryIconPosition, paintable : Gdk::Paintable?) : Nil
      # gtk_entry_set_icon_from_paintable: (Method)
      # @paintable: (nullable)
      # Returns: (transfer none)

      paintable = if paintable.nil?
                    Pointer(Void).null
                  else
                    paintable.to_unsafe
                  end

      LibGtk.gtk_entry_set_icon_from_paintable(self, icon_pos, paintable)
    end

    def set_icon_sensitive(icon_pos : Gtk::EntryIconPosition, sensitive : Bool) : Nil
      # gtk_entry_set_icon_sensitive: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_icon_sensitive(self, icon_pos, sensitive)
    end

    def set_icon_tooltip_markup(icon_pos : Gtk::EntryIconPosition, tooltip : ::String?) : Nil
      # gtk_entry_set_icon_tooltip_markup: (Method)
      # @tooltip: (nullable)
      # Returns: (transfer none)

      tooltip = if tooltip.nil?
                  Pointer(LibC::Char).null
                else
                  tooltip.to_unsafe
                end

      LibGtk.gtk_entry_set_icon_tooltip_markup(self, icon_pos, tooltip)
    end

    def set_icon_tooltip_text(icon_pos : Gtk::EntryIconPosition, tooltip : ::String?) : Nil
      # gtk_entry_set_icon_tooltip_text: (Method)
      # @tooltip: (nullable)
      # Returns: (transfer none)

      tooltip = if tooltip.nil?
                  Pointer(LibC::Char).null
                else
                  tooltip.to_unsafe
                end

      LibGtk.gtk_entry_set_icon_tooltip_text(self, icon_pos, tooltip)
    end

    def input_hints=(hints : Gtk::InputHints) : Nil
      # gtk_entry_set_input_hints: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_input_hints(self, hints)
    end

    def input_purpose=(purpose : Gtk::InputPurpose) : Nil
      # gtk_entry_set_input_purpose: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_input_purpose(self, purpose)
    end

    def invisible_char=(ch : UInt32) : Nil
      # gtk_entry_set_invisible_char: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_invisible_char(self, ch)
    end

    def max_length=(max : Int32) : Nil
      # gtk_entry_set_max_length: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_max_length(self, max)
    end

    def overwrite_mode=(overwrite : Bool) : Nil
      # gtk_entry_set_overwrite_mode: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_overwrite_mode(self, overwrite)
    end

    def placeholder_text=(text : ::String?) : Nil
      # gtk_entry_set_placeholder_text: (Method)
      # @text: (nullable)
      # Returns: (transfer none)

      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      LibGtk.gtk_entry_set_placeholder_text(self, text)
    end

    def progress_fraction=(fraction : Float64) : Nil
      # gtk_entry_set_progress_fraction: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_progress_fraction(self, fraction)
    end

    def progress_pulse_step=(fraction : Float64) : Nil
      # gtk_entry_set_progress_pulse_step: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_progress_pulse_step(self, fraction)
    end

    def tabs=(tabs : Pango::TabArray?) : Nil
      # gtk_entry_set_tabs: (Method)
      # @tabs: (nullable)
      # Returns: (transfer none)

      tabs = if tabs.nil?
               Pointer(Void).null
             else
               tabs.to_unsafe
             end

      LibGtk.gtk_entry_set_tabs(self, tabs)
    end

    def visibility=(visible : Bool) : Nil
      # gtk_entry_set_visibility: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_set_visibility(self, visible)
    end

    def unset_invisible_char : Nil
      # gtk_entry_unset_invisible_char: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_entry_unset_invisible_char(self)
    end

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

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Entry, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Entry.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Entry, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Entry, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Entry.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Entry, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end

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

      def connect(block : Proc(Gtk::EntryIconPosition, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::EntryIconPosition.from_value(lib_arg0)
          ::Box(Proc(Gtk::EntryIconPosition, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EntryIconPosition, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::EntryIconPosition.from_value(lib_arg0)
          ::Box(Proc(Gtk::EntryIconPosition, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Entry.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::EntryIconPosition.from_value(lib_arg0)
          ::Box(Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Entry.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::EntryIconPosition.from_value(lib_arg0)
          ::Box(Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(icon_pos : Gtk::EntryIconPosition) : Nil
        LibGObject.g_signal_emit_by_name(@source, "icon-press", icon_pos)
      end
    end

    def icon_press_signal
      IconPressSignal.new(self)
    end

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

      def connect(block : Proc(Gtk::EntryIconPosition, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::EntryIconPosition.from_value(lib_arg0)
          ::Box(Proc(Gtk::EntryIconPosition, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EntryIconPosition, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::EntryIconPosition.from_value(lib_arg0)
          ::Box(Proc(Gtk::EntryIconPosition, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Entry.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::EntryIconPosition.from_value(lib_arg0)
          ::Box(Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Entry.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::EntryIconPosition.from_value(lib_arg0)
          ::Box(Proc(Gtk::Entry, Gtk::EntryIconPosition, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
