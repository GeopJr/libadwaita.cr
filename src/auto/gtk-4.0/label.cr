require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # The `GtkLabel` widget displays a small amount of text.
  #
  # As the name implies, most labels are used to label another widget
  # such as a [class@Button].
  #
  # ![An example GtkLabel](label.png)
  #
  # # CSS nodes
  #
  # ```
  # label
  # ├── [selection]
  # ├── [link]
  # ┊
  # ╰── [link]
  # ```
  #
  # `GtkLabel` has a single CSS node with the name label. A wide variety
  # of style classes may be applied to labels, such as .title, .subtitle,
  # .dim-label, etc. In the `GtkShortcutsWindow`, labels are used with the
  # .keycap style class.
  #
  # If the label has a selection, it gets a subnode with name selection.
  #
  # If the label has links, there is one subnode per link. These subnodes
  # carry the link or visited state depending on whether they have been
  # visited. In this case, label node also gets a .link style class.
  #
  # # GtkLabel as GtkBuildable
  #
  # The GtkLabel implementation of the GtkBuildable interface supports a
  # custom <attributes> element, which supports any number of <attribute>
  # elements. The <attribute> element has attributes named “name“, “value“,
  # “start“ and “end“ and allows you to specify [struct@Pango.Attribute]
  # values for this label.
  #
  # An example of a UI definition fragment specifying Pango attributes:
  # ```xml
  # <object class="GtkLabel">
  #   <attributes>
  #     <attribute name="weight" value="PANGO_WEIGHT_BOLD"/>
  #     <attribute name="background" value="red" start="5" end="10"/>
  #   </attributes>
  # </object>
  # ```
  #
  # The start and end attributes specify the range of characters to which the
  # Pango attribute applies. If start and end are not specified, the attribute is
  # applied to the whole text. Note that specifying ranges does not make much
  # sense with translatable attributes. Use markup embedded in the translatable
  # content instead.
  #
  # # Accessibility
  #
  # `GtkLabel` uses the %GTK_ACCESSIBLE_ROLE_LABEL role.
  #
  # # Mnemonics
  #
  # Labels may contain “mnemonics”. Mnemonics are underlined characters in the
  # label, used for keyboard navigation. Mnemonics are created by providing a
  # string with an underscore before the mnemonic character, such as `"_File"`,
  # to the functions [ctor@Gtk.Label.new_with_mnemonic] or
  # [method@Gtk.Label.set_text_with_mnemonic].
  #
  # Mnemonics automatically activate any activatable widget the label is
  # inside, such as a [class@Gtk.Button]; if the label is not inside the
  # mnemonic’s target widget, you have to tell the label about the target
  # using [class@Gtk.Label.set_mnemonic_widget]. Here’s a simple example where
  # the label is inside a button:
  #
  # ```c
  # // Pressing Alt+H will activate this button
  # GtkWidget *button = gtk_button_new ();
  # GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
  # gtk_button_set_child (GTK_BUTTON (button), label);
  # ```
  #
  # There’s a convenience function to create buttons with a mnemonic label
  # already inside:
  #
  # ```c
  # // Pressing Alt+H will activate this button
  # GtkWidget *button = gtk_button_new_with_mnemonic ("_Hello");
  # ```
  #
  # To create a mnemonic for a widget alongside the label, such as a
  # [class@Gtk.Entry], you have to point the label at the entry with
  # [method@Gtk.Label.set_mnemonic_widget]:
  #
  # ```c
  # // Pressing Alt+H will focus the entry
  # GtkWidget *entry = gtk_entry_new ();
  # GtkWidget *label = gtk_label_new_with_mnemonic ("_Hello");
  # gtk_label_set_mnemonic_widget (GTK_LABEL (label), entry);
  # ```
  #
  # # Markup (styled text)
  #
  # To make it easy to format text in a label (changing colors,
  # fonts, etc.), label text can be provided in a simple
  # markup format:
  #
  # Here’s how to create a label with a small font:
  # ```c
  # GtkWidget *label = gtk_label_new (NULL);
  # gtk_label_set_markup (GTK_LABEL (label), "<small>Small text</small>");
  # ```
  #
  # (See the Pango manual for complete documentation] of available
  # tags, [func@Pango.parse_markup])
  #
  # The markup passed to gtk_label_set_markup() must be valid; for example,
  # literal <, > and & characters must be escaped as &lt;, &gt;, and &amp;.
  # If you pass text obtained from the user, file, or a network to
  # [method@Gtk.Label.set_markup], you’ll want to escape it with
  # g_markup_escape_text() or g_markup_printf_escaped().
  #
  # Markup strings are just a convenient way to set the [struct@Pango.AttrList]
  # on a label; [method@Gtk.Label.set_attributes] may be a simpler way to set
  # attributes in some cases. Be careful though; [struct@Pango.AttrList] tends
  # to cause internationalization problems, unless you’re applying attributes
  # to the entire string (i.e. unless you set the range of each attribute
  # to [0, %G_MAXINT)). The reason is that specifying the start_index and
  # end_index for a [struct@Pango.Attribute] requires knowledge of the exact
  # string being displayed, so translations will cause problems.
  #
  # # Selectable labels
  #
  # Labels can be made selectable with [method@Gtk.Label.set_selectable].
  # Selectable labels allow the user to copy the label contents to
  # the clipboard. Only labels that contain useful-to-copy information
  # — such as error messages — should be made selectable.
  #
  # # Text layout
  #
  # A label can contain any number of paragraphs, but will have
  # performance problems if it contains more than a small number.
  # Paragraphs are separated by newlines or other paragraph separators
  # understood by Pango.
  #
  # Labels can automatically wrap text if you call [method@Gtk.Label.set_wrap].
  #
  # [method@Gtk.Label.set_justify] sets how the lines in a label align
  # with one another. If you want to set how the label as a whole aligns
  # in its available space, see the [property@Gtk.Widget:halign] and
  # [property@Gtk.Widget:valign] properties.
  #
  # The [property@Gtk.Label:width-chars] and [property@Gtk.Label:max-width-chars]
  # properties can be used to control the size allocation of ellipsized or
  # wrapped labels. For ellipsizing labels, if either is specified (and less
  # than the actual text size), it is used as the minimum width, and the actual
  # text size is used as the natural width of the label. For wrapping labels,
  # width-chars is used as the minimum width, if specified, and max-width-chars
  # is used as the natural width. Even if max-width-chars specified, wrapping
  # labels will be rewrapped to use all of the available width.
  #
  # # Links
  #
  # GTK supports markup for clickable hyperlinks in addition to regular Pango
  # markup. The markup for links is borrowed from HTML, using the `<a>` with
  # “href“, “title“ and “class“ attributes. GTK renders links similar to the
  # way they appear in web browsers, with colored, underlined text. The “title“
  # attribute is displayed as a tooltip on the link. The “class“ attribute is
  # used as style class on the CSS node for the link.
  #
  # An example looks like this:
  #
  # ```c
  # const char *text =
  # "Go to the"
  # "<a href=\"http://www.gtk.org title=\"&lt;i&gt;Our&lt;/i&gt; website\">"
  # "GTK website</a> for more...";
  # GtkWidget *label = gtk_label_new (NULL);
  # gtk_label_set_markup (GTK_LABEL (label), text);
  # ```
  #
  # It is possible to implement custom handling for links and their tooltips
  # with the [signal@Gtk.Label::activate-link] signal and the
  # [method@Gtk.Label.get_current_uri] function.
  class Label < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, attributes : Pango::AttrList? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, ellipsize : Pango::EllipsizeMode? = nil, extra_menu : Gio::MenuModel? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, justify : Gtk::Justification? = nil, label : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, lines : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_width_chars : Int32? = nil, mnemonic_keyval : UInt32? = nil, mnemonic_widget : Gtk::Widget? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selectable : Bool? = nil, sensitive : Bool? = nil, single_line_mode : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_markup : Bool? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_chars : Int32? = nil, width_request : Int32? = nil, wrap : Bool? = nil, wrap_mode : Pango::WrapMode? = nil, xalign : Float32? = nil, yalign : Float32? = nil)
      _names = uninitialized Pointer(LibC::Char)[53]
      _values = StaticArray(LibGObject::Value, 53).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if attributes
        (_names.to_unsafe + _n).value = "attributes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, attributes)
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
      if ellipsize
        (_names.to_unsafe + _n).value = "ellipsize".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ellipsize)
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
      if justify
        (_names.to_unsafe + _n).value = "justify".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, justify)
        _n += 1
      end
      if label
        (_names.to_unsafe + _n).value = "label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, label)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if lines
        (_names.to_unsafe + _n).value = "lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, lines)
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
      if max_width_chars
        (_names.to_unsafe + _n).value = "max-width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width_chars)
        _n += 1
      end
      if mnemonic_keyval
        (_names.to_unsafe + _n).value = "mnemonic-keyval".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonic_keyval)
        _n += 1
      end
      if mnemonic_widget
        (_names.to_unsafe + _n).value = "mnemonic-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonic_widget)
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
      if selectable
        (_names.to_unsafe + _n).value = "selectable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, selectable)
        _n += 1
      end
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if single_line_mode
        (_names.to_unsafe + _n).value = "single-line-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, single_line_mode)
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
      if use_markup
        (_names.to_unsafe + _n).value = "use-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_markup)
        _n += 1
      end
      if use_underline
        (_names.to_unsafe + _n).value = "use-underline".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_underline)
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
      if wrap
        (_names.to_unsafe + _n).value = "wrap".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap)
        _n += 1
      end
      if wrap_mode
        (_names.to_unsafe + _n).value = "wrap-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_mode)
        _n += 1
      end
      if xalign
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end
      if yalign
        (_names.to_unsafe + _n).value = "yalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, yalign)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Label.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_label_get_type
    end

    def initialize(str : ::String?)
      # gtk_label_new: (Constructor)
      # @str: (nullable)
      # Returns: (transfer none)

      str = if str.nil?
              Pointer(LibC::Char).null
            else
              str.to_unsafe
            end

      _retval = LibGtk.gtk_label_new(str)
      @pointer = _retval
    end

    def self.new_with_mnemonic(str : ::String?) : Gtk::Widget
      # gtk_label_new_with_mnemonic: (Constructor)
      # @str: (nullable)
      # Returns: (transfer none)

      str = if str.nil?
              Pointer(LibC::Char).null
            else
              str.to_unsafe
            end

      _retval = LibGtk.gtk_label_new_with_mnemonic(str)
      Gtk::Label.new(_retval, GICrystal::Transfer::Full)
    end

    def attributes : Pango::AttrList?
      # gtk_label_get_attributes: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_attributes(self)
      Pango::AttrList.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def current_uri : ::String?
      # gtk_label_get_current_uri: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_current_uri(self)
      ::String.new(_retval) unless _retval.null?
    end

    def ellipsize : Pango::EllipsizeMode
      # gtk_label_get_ellipsize: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_ellipsize(self)
      Pango::EllipsizeMode.from_value(_retval)
    end

    def extra_menu : Gio::MenuModel?
      # gtk_label_get_extra_menu: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_extra_menu(self)
      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def justify : Gtk::Justification
      # gtk_label_get_justify: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_justify(self)
      Gtk::Justification.from_value(_retval)
    end

    def label : ::String
      # gtk_label_get_label: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_label(self)
      ::String.new(_retval)
    end

    def layout : Pango::Layout
      # gtk_label_get_layout: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_layout(self)
      Pango::Layout.new(_retval, GICrystal::Transfer::None)
    end

    def layout_offsets : Nil
      # gtk_label_get_layout_offsets: (Method)
      # @x: (out) (transfer full) (optional)
      # @y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      x = Pointer(Int32).null
      y = Pointer(Int32).null

      LibGtk.gtk_label_get_layout_offsets(self, x, y)
    end

    def lines : Int32
      # gtk_label_get_lines: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_lines(self)
      _retval
    end

    def max_width_chars : Int32
      # gtk_label_get_max_width_chars: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_max_width_chars(self)
      _retval
    end

    def mnemonic_keyval : UInt32
      # gtk_label_get_mnemonic_keyval: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_mnemonic_keyval(self)
      _retval
    end

    def mnemonic_widget : Gtk::Widget?
      # gtk_label_get_mnemonic_widget: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_mnemonic_widget(self)
      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def selectable? : Bool
      # gtk_label_get_selectable: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_selectable(self)
      GICrystal.to_bool(_retval)
    end

    def selection_bounds(start : Int32, end _end : Int32) : Bool
      # gtk_label_get_selection_bounds: (Method)
      # @start: (out) (transfer full)
      # @end: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_selection_bounds(self, start, _end)
      GICrystal.to_bool(_retval)
    end

    def single_line_mode? : Bool
      # gtk_label_get_single_line_mode: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_single_line_mode(self)
      GICrystal.to_bool(_retval)
    end

    def text : ::String
      # gtk_label_get_text: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_text(self)
      ::String.new(_retval)
    end

    def use_markup? : Bool
      # gtk_label_get_use_markup: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_use_markup(self)
      GICrystal.to_bool(_retval)
    end

    def use_underline? : Bool
      # gtk_label_get_use_underline: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_use_underline(self)
      GICrystal.to_bool(_retval)
    end

    def width_chars : Int32
      # gtk_label_get_width_chars: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_width_chars(self)
      _retval
    end

    def wrap? : Bool
      # gtk_label_get_wrap: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_wrap(self)
      GICrystal.to_bool(_retval)
    end

    def wrap_mode : Pango::WrapMode
      # gtk_label_get_wrap_mode: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_wrap_mode(self)
      Pango::WrapMode.from_value(_retval)
    end

    def xalign : Float32
      # gtk_label_get_xalign: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_xalign(self)
      _retval
    end

    def yalign : Float32
      # gtk_label_get_yalign: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_label_get_yalign(self)
      _retval
    end

    def select_region(start_offset : Int32, end_offset : Int32) : Nil
      # gtk_label_select_region: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_select_region(self, start_offset, end_offset)
    end

    def attributes=(attrs : Pango::AttrList?) : Nil
      # gtk_label_set_attributes: (Method)
      # @attrs: (nullable)
      # Returns: (transfer none)

      attrs = if attrs.nil?
                Pointer(Void).null
              else
                attrs.to_unsafe
              end

      LibGtk.gtk_label_set_attributes(self, attrs)
    end

    def ellipsize=(mode : Pango::EllipsizeMode) : Nil
      # gtk_label_set_ellipsize: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_ellipsize(self, mode)
    end

    def extra_menu=(model : Gio::MenuModel?) : Nil
      # gtk_label_set_extra_menu: (Method)
      # @model: (nullable)
      # Returns: (transfer none)

      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      LibGtk.gtk_label_set_extra_menu(self, model)
    end

    def justify=(jtype : Gtk::Justification) : Nil
      # gtk_label_set_justify: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_justify(self, jtype)
    end

    def label=(str : ::String) : Nil
      # gtk_label_set_label: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_label(self, str)
    end

    def lines=(lines : Int32) : Nil
      # gtk_label_set_lines: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_lines(self, lines)
    end

    def markup=(str : ::String) : Nil
      # gtk_label_set_markup: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_markup(self, str)
    end

    def markup_with_mnemonic=(str : ::String) : Nil
      # gtk_label_set_markup_with_mnemonic: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_markup_with_mnemonic(self, str)
    end

    def max_width_chars=(n_chars : Int32) : Nil
      # gtk_label_set_max_width_chars: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_max_width_chars(self, n_chars)
    end

    def mnemonic_widget=(widget : Gtk::Widget?) : Nil
      # gtk_label_set_mnemonic_widget: (Method)
      # @widget: (nullable)
      # Returns: (transfer none)

      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      LibGtk.gtk_label_set_mnemonic_widget(self, widget)
    end

    def selectable=(setting : Bool) : Nil
      # gtk_label_set_selectable: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_selectable(self, setting)
    end

    def single_line_mode=(single_line_mode : Bool) : Nil
      # gtk_label_set_single_line_mode: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_single_line_mode(self, single_line_mode)
    end

    def text=(str : ::String) : Nil
      # gtk_label_set_text: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_text(self, str)
    end

    def text_with_mnemonic=(str : ::String) : Nil
      # gtk_label_set_text_with_mnemonic: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_text_with_mnemonic(self, str)
    end

    def use_markup=(setting : Bool) : Nil
      # gtk_label_set_use_markup: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_use_markup(self, setting)
    end

    def use_underline=(setting : Bool) : Nil
      # gtk_label_set_use_underline: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_use_underline(self, setting)
    end

    def width_chars=(n_chars : Int32) : Nil
      # gtk_label_set_width_chars: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_width_chars(self, n_chars)
    end

    def wrap=(wrap : Bool) : Nil
      # gtk_label_set_wrap: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_wrap(self, wrap)
    end

    def wrap_mode=(wrap_mode : Pango::WrapMode) : Nil
      # gtk_label_set_wrap_mode: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_wrap_mode(self, wrap_mode)
    end

    def xalign=(xalign : Float32) : Nil
      # gtk_label_set_xalign: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_xalign(self, xalign)
    end

    def yalign=(yalign : Float32) : Nil
      # gtk_label_set_yalign: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_label_set_yalign(self, yalign)
    end

    struct ActivateCurrentLinkSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate-current-link::#{@detail}" : "activate-current-link"
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

      def connect(block : Proc(Gtk::Label, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Label.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Label, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Label, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Label.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Label, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-current-link")
      end
    end

    def activate_current_link_signal
      ActivateCurrentLinkSignal.new(self)
    end

    struct ActivateLinkSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate-link::#{@detail}" : "activate-link"
      end

      def connect(&block : Proc(::String, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Bool))
        connect(block)
      end

      def connect(block : Proc(::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Bool)).unbox(box).call(arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Label, ::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::Label.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::Label, ::String, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Label, ::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::Label.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::Label, ::String, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(uri : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-link", uri)
      end
    end

    def activate_link_signal
      ActivateLinkSignal.new(self)
    end

    struct CopyClipboardSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "copy-clipboard::#{@detail}" : "copy-clipboard"
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

      def connect(block : Proc(Gtk::Label, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Label.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Label, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Label, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Label.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Label, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "copy-clipboard")
      end
    end

    def copy_clipboard_signal
      CopyClipboardSignal.new(self)
    end

    struct MoveCursorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "move-cursor::#{@detail}" : "move-cursor"
      end

      def connect(&block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Label, Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Label.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::Label, Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Label, Gtk::MovementStep, Int32, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, lib_arg1 : Int32, lib_arg2 : LibC::Int, box : Pointer(Void)) {
          sender = Gtk::Label.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::MovementStep.from_value(lib_arg0)
          arg1 = lib_arg1
          arg2 = GICrystal.to_bool(lib_arg2)
          ::Box(Proc(Gtk::Label, Gtk::MovementStep, Int32, Bool, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(step : Gtk::MovementStep, count : Int32, extend_selection : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "move-cursor", step, count, extend_selection)
      end
    end

    def move_cursor_signal
      MoveCursorSignal.new(self)
    end
  end
end
