require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

module Gtk
  # The `GtkLabel` widget displays a small amount of text.
  #
  # As the name implies, most labels are used to label another widget
  # such as a `#Button`.
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
  # “start“ and “end“ and allows you to specify `Pango#Attribute`
  # values for this label.
  #
  # An example of a UI definition fragment specifying Pango attributes:
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
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
  # to the functions `Gtk::Label#new_with_mnemonic` or
  # `Gtk::Label#text_with_mnemonic=`.
  #
  # Mnemonics automatically activate any activatable widget the label is
  # inside, such as a `Gtk#Button`; if the label is not inside the
  # mnemonic’s target widget, you have to tell the label about the target
  # using `Gtk::Label#mnemonic_widget=`. Here’s a simple example where
  # the label is inside a button:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # // Pressing Alt+H will activate this button
  # GtkWidget *button = gtk_button_new_with_mnemonic ("_Hello");
  # ```
  #
  # To create a mnemonic for a widget alongside the label, such as a
  # `Gtk#Entry`, you have to point the label at the entry with
  # `Gtk::Label#mnemonic_widget=`:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GtkWidget *label = gtk_label_new (NULL);
  # gtk_label_set_markup (GTK_LABEL (label), "<small>Small text</small>");
  # ```
  #
  # (See the Pango manual for complete documentation] of available
  # tags, `Pango#parse_markup`)
  #
  # The markup passed to gtk_label_set_markup() must be valid; for example,
  # literal <, > and & characters must be escaped as &lt;, &gt;, and &amp;.
  # If you pass text obtained from the user, file, or a network to
  # `Gtk::Label#markup=`, you’ll want to escape it with
  # g_markup_escape_text() or g_markup_printf_escaped().
  #
  # Markup strings are just a convenient way to set the `Pango#AttrList`
  # on a label; `Gtk::Label#attributes=` may be a simpler way to set
  # attributes in some cases. Be careful though; `Pango#AttrList` tends
  # to cause internationalization problems, unless you’re applying attributes
  # to the entire string (i.e. unless you set the range of each attribute
  # to [0, %G_MAXINT)). The reason is that specifying the start_index and
  # end_index for a `Pango#Attribute` requires knowledge of the exact
  # string being displayed, so translations will cause problems.
  #
  # # Selectable labels
  #
  # Labels can be made selectable with `Gtk::Label#selectable=`.
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
  # Labels can automatically wrap text if you call `Gtk::Label#wrap=`.
  #
  # `Gtk::Label#justify=` sets how the lines in a label align
  # with one another. If you want to set how the label as a whole aligns
  # in its available space, see the `Gtk::Widget#halign` and
  # `Gtk::Widget#valign` properties.
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
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
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
  # `Gtk::Label#current_uri` function.
  @[GObject::GeneratedWrapper]
  class Label < Widget
    include Accessible
    include Buildable
    include ConstraintTarget

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Label, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Label`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, attributes : Pango::AttrList? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, ellipsize : Pango::EllipsizeMode? = nil, extra_menu : Gio::MenuModel? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, justify : Gtk::Justification? = nil, label : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, lines : Int32? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, max_width_chars : Int32? = nil, mnemonic_keyval : UInt32? = nil, mnemonic_widget : Gtk::Widget? = nil, name : ::String? = nil, natural_wrap_mode : Gtk::NaturalWrapMode? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, selectable : Bool? = nil, sensitive : Bool? = nil, single_line_mode : Bool? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_markup : Bool? = nil, use_underline : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_chars : Int32? = nil, width_request : Int32? = nil, wrap : Bool? = nil, wrap_mode : Pango::WrapMode? = nil, xalign : Float32? = nil, yalign : Float32? = nil)
      _names = uninitialized Pointer(LibC::Char)[54]
      _values = StaticArray(LibGObject::Value, 54).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !attributes.nil?
        (_names.to_unsafe + _n).value = "attributes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, attributes)
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
      if !ellipsize.nil?
        (_names.to_unsafe + _n).value = "ellipsize".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ellipsize)
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
      if !justify.nil?
        (_names.to_unsafe + _n).value = "justify".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, justify)
        _n += 1
      end
      if !label.nil?
        (_names.to_unsafe + _n).value = "label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, label)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !lines.nil?
        (_names.to_unsafe + _n).value = "lines".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, lines)
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
      if !max_width_chars.nil?
        (_names.to_unsafe + _n).value = "max-width-chars".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, max_width_chars)
        _n += 1
      end
      if !mnemonic_keyval.nil?
        (_names.to_unsafe + _n).value = "mnemonic-keyval".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonic_keyval)
        _n += 1
      end
      if !mnemonic_widget.nil?
        (_names.to_unsafe + _n).value = "mnemonic-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonic_widget)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !natural_wrap_mode.nil?
        (_names.to_unsafe + _n).value = "natural-wrap-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, natural_wrap_mode)
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
      if !single_line_mode.nil?
        (_names.to_unsafe + _n).value = "single-line-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, single_line_mode)
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
      if !use_markup.nil?
        (_names.to_unsafe + _n).value = "use-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_markup)
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
      if !wrap.nil?
        (_names.to_unsafe + _n).value = "wrap".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap)
        _n += 1
      end
      if !wrap_mode.nil?
        (_names.to_unsafe + _n).value = "wrap-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_mode)
        _n += 1
      end
      if !xalign.nil?
        (_names.to_unsafe + _n).value = "xalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, xalign)
        _n += 1
      end
      if !yalign.nil?
        (_names.to_unsafe + _n).value = "yalign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, yalign)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Label.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_label_get_type
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

    def ellipsize=(value : Pango::EllipsizeMode) : Pango::EllipsizeMode
      unsafe_value = value

      LibGObject.g_object_set(self, "ellipsize", unsafe_value, Pointer(Void).null)
      value
    end

    def ellipsize : Pango::EllipsizeMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "ellipsize", pointerof(value), Pointer(Void).null)
      Pango::EllipsizeMode.new(value)
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

    def justify=(value : Gtk::Justification) : Gtk::Justification
      unsafe_value = value

      LibGObject.g_object_set(self, "justify", unsafe_value, Pointer(Void).null)
      value
    end

    def justify : Gtk::Justification
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "justify", pointerof(value), Pointer(Void).null)
      Gtk::Justification.new(value)
    end

    def label=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "label", unsafe_value, Pointer(Void).null)
      value
    end

    def label : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "label", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def lines=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "lines", unsafe_value, Pointer(Void).null)
      value
    end

    def lines : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "lines", pointerof(value), Pointer(Void).null)
      value
    end

    def max_width_chars=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "max-width-chars", unsafe_value, Pointer(Void).null)
      value
    end

    def max_width_chars : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "max-width-chars", pointerof(value), Pointer(Void).null)
      value
    end

    def mnemonic_keyval : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "mnemonic-keyval", pointerof(value), Pointer(Void).null)
      value
    end

    def mnemonic_widget=(value : Gtk::Widget?) : Gtk::Widget?
      unsafe_value = value

      LibGObject.g_object_set(self, "mnemonic-widget", unsafe_value, Pointer(Void).null)
      value
    end

    def mnemonic_widget : Gtk::Widget?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "mnemonic-widget", pointerof(value), Pointer(Void).null)
      Gtk::Widget.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def natural_wrap_mode=(value : Gtk::NaturalWrapMode) : Gtk::NaturalWrapMode
      unsafe_value = value

      LibGObject.g_object_set(self, "natural-wrap-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def natural_wrap_mode : Gtk::NaturalWrapMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "natural-wrap-mode", pointerof(value), Pointer(Void).null)
      Gtk::NaturalWrapMode.new(value)
    end

    def selectable=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "selectable", unsafe_value, Pointer(Void).null)
      value
    end

    def selectable? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "selectable", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def single_line_mode=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "single-line-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def single_line_mode? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "single-line-mode", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def use_markup=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-markup", unsafe_value, Pointer(Void).null)
      value
    end

    def use_markup? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-markup", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def use_underline=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-underline", unsafe_value, Pointer(Void).null)
      value
    end

    def use_underline? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-underline", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def width_chars=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "width-chars", unsafe_value, Pointer(Void).null)
      value
    end

    def width_chars : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "width-chars", pointerof(value), Pointer(Void).null)
      value
    end

    def wrap=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "wrap", unsafe_value, Pointer(Void).null)
      value
    end

    def wrap? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "wrap", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def wrap_mode=(value : Pango::WrapMode) : Pango::WrapMode
      unsafe_value = value

      LibGObject.g_object_set(self, "wrap-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def wrap_mode : Pango::WrapMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "wrap-mode", pointerof(value), Pointer(Void).null)
      Pango::WrapMode.new(value)
    end

    def xalign=(value : Float32) : Float32
      unsafe_value = value

      LibGObject.g_object_set(self, "xalign", unsafe_value, Pointer(Void).null)
      value
    end

    def xalign : Float32
      # Returns: None

      value = uninitialized Float32
      LibGObject.g_object_get(self, "xalign", pointerof(value), Pointer(Void).null)
      value
    end

    def yalign=(value : Float32) : Float32
      unsafe_value = value

      LibGObject.g_object_set(self, "yalign", unsafe_value, Pointer(Void).null)
      value
    end

    def yalign : Float32
      # Returns: None

      value = uninitialized Float32
      LibGObject.g_object_get(self, "yalign", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new label with the given text inside it.
    #
    # You can pass %NULL to get an empty label widget.
    def self.new(str : ::String?) : self
      # gtk_label_new: (Constructor)
      # @str: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      str = if str.nil?
              Pointer(LibC::Char).null
            else
              str.to_unsafe
            end

      # C call
      _retval = LibGtk.gtk_label_new(str)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::Label.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `GtkLabel`, containing the text in @str.
    #
    # If characters in @str are preceded by an underscore, they are
    # underlined. If you need a literal underscore character in a label, use
    # '__' (two underscores). The first underlined character represents a
    # keyboard accelerator called a mnemonic. The mnemonic key can be used
    # to activate another widget, chosen automatically, or explicitly using
    # `Gtk::Label#mnemonic_widget=`.
    #
    # If `Gtk::Label#mnemonic_widget=` is not called, then the first
    # activatable ancestor of the `GtkLabel` will be chosen as the mnemonic
    # widget. For instance, if the label is inside a button or menu item,
    # the button or menu item will automatically become the mnemonic widget
    # and be activated by the mnemonic.
    def self.new_with_mnemonic(str : ::String?) : self
      # gtk_label_new_with_mnemonic: (Constructor)
      # @str: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      str = if str.nil?
              Pointer(LibC::Char).null
            else
              str.to_unsafe
            end

      # C call
      _retval = LibGtk.gtk_label_new_with_mnemonic(str)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::Label.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the labels attribute list.
    #
    # This is the `Pango#AttrList` that was set on the label using
    # `Gtk::Label#attributes=`, if any. This function does not
    # reflect attributes that come from the labels markup (see
    # `Gtk::Label#markup=`). If you want to get the effective
    # attributes for the label, use
    # `pango_layout_get_attribute (gtk_label_get_layout (self))`.
    def attributes : Pango::AttrList?
      # gtk_label_get_attributes: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_attributes(@pointer)

      # Return value handling

      Pango::AttrList.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the URI for the currently active link in the label.
    #
    # The active link is the one under the mouse pointer or, in a
    # selectable label, the link in which the text cursor is currently
    # positioned.
    #
    # This function is intended for use in a [signal@Gtk.Label::activate-link]
    # handler or for use in a [signal@Gtk.Widget::query-tooltip] handler.
    def current_uri : ::String?
      # gtk_label_get_current_uri: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_current_uri(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the ellipsizing position of the label.
    #
    # See `Gtk::Label#ellipsize=`.
    def ellipsize : Pango::EllipsizeMode
      # gtk_label_get_ellipsize: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_ellipsize(@pointer)

      # Return value handling

      Pango::EllipsizeMode.new(_retval)
    end

    # Gets the extra menu model of @label.
    #
    # See `Gtk::Label#extra_menu=`.
    def extra_menu : Gio::MenuModel?
      # gtk_label_get_extra_menu: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_extra_menu(@pointer)

      # Return value handling

      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the justification of the label.
    #
    # See `Gtk::Label#justify=`.
    def justify : Gtk::Justification
      # gtk_label_get_justify: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_justify(@pointer)

      # Return value handling

      Gtk::Justification.new(_retval)
    end

    # Fetches the text from a label.
    #
    # The returned text includes any embedded underlines indicating
    # mnemonics and Pango markup. (See `Gtk::Label#text`).
    def label : ::String
      # gtk_label_get_label: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_label(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the `PangoLayout` used to display the label.
    #
    # The layout is useful to e.g. convert text positions to pixel
    # positions, in combination with `Gtk::Label#layout_offsets`.
    # The returned layout is owned by the @label so need not be
    # freed by the caller. The @label is free to recreate its layout
    # at any time, so it should be considered read-only.
    def layout : Pango::Layout
      # gtk_label_get_layout: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_layout(@pointer)

      # Return value handling

      Pango::Layout.new(_retval, GICrystal::Transfer::None)
    end

    # Obtains the coordinates where the label will draw its `PangoLayout`.
    #
    # The coordinates are useful to convert mouse events into coordinates
    # inside the `Pango#Layout`, e.g. to take some action if some part
    # of the label is clicked. Remember when using the `Pango#Layout`
    # functions you need to convert to and from pixels using PANGO_PIXELS()
    # or `Pango#SCALE`.
    def layout_offsets : Nil
      # gtk_label_get_layout_offsets: (Method)
      # @x: (out) (transfer full) (optional)
      # @y: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      x = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      y = Pointer(Int32).null
      # C call
      LibGtk.gtk_label_get_layout_offsets(@pointer, x, y)

      # Return value handling
    end

    # Gets the number of lines to which an ellipsized, wrapping
    # label should be limited.
    #
    # See `Gtk::Label#lines=`.
    def lines : Int32
      # gtk_label_get_lines: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_lines(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the desired maximum width of @label, in characters.
    #
    # See `Gtk::Label#width_chars=`.
    def max_width_chars : Int32
      # gtk_label_get_max_width_chars: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_max_width_chars(@pointer)

      # Return value handling

      _retval
    end

    # Return the mnemonic accelerator.
    #
    # If the label has been set so that it has a mnemonic key this function
    # returns the keyval used for the mnemonic accelerator. If there is no
    # mnemonic set up it returns `GDK_KEY_VoidSymbol`.
    def mnemonic_keyval : UInt32
      # gtk_label_get_mnemonic_keyval: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_mnemonic_keyval(@pointer)

      # Return value handling

      _retval
    end

    # Retrieves the target of the mnemonic (keyboard shortcut) of this
    # label.
    #
    # See `Gtk::Label#mnemonic_widget=`.
    def mnemonic_widget : Gtk::Widget?
      # gtk_label_get_mnemonic_widget: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_mnemonic_widget(@pointer)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns line wrap mode used by the label.
    #
    # See `Gtk::Label#natural_wrap_mode=`.
    def natural_wrap_mode : Gtk::NaturalWrapMode
      # gtk_label_get_natural_wrap_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_natural_wrap_mode(@pointer)

      # Return value handling

      Gtk::NaturalWrapMode.new(_retval)
    end

    # Returns whether the label is selectable.
    def selectable : Bool
      # gtk_label_get_selectable: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_selectable(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the selected range of characters in the label.
    def selection_bounds : Bool
      # gtk_label_get_selection_bounds: (Method)
      # @start: (out) (transfer full) (optional)
      # @end: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      start = Pointer(Int32).null # Generator::OutArgUsedInReturnPlan
      _end = Pointer(Int32).null
      # C call
      _retval = LibGtk.gtk_label_get_selection_bounds(@pointer, start, _end)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the label is in single line mode.
    def single_line_mode : Bool
      # gtk_label_get_single_line_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_single_line_mode(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Fetches the text from a label.
    #
    # The returned text is as it appears on screen. This does not include
    # any embedded underlines indicating mnemonics or Pango markup. (See
    # `Gtk::Label#label`)
    def text : ::String
      # gtk_label_get_text: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_text(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Returns whether the label’s text is interpreted as Pango markup.
    #
    # See `Gtk::Label#use_markup=`.
    def use_markup : Bool
      # gtk_label_get_use_markup: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_use_markup(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether an embedded underlines in the label indicate mnemonics.
    #
    # See `Gtk::Label#use_underline=`.
    def use_underline : Bool
      # gtk_label_get_use_underline: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_use_underline(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the desired width of @label, in characters.
    #
    # See `Gtk::Label#width_chars=`.
    def width_chars : Int32
      # gtk_label_get_width_chars: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_width_chars(@pointer)

      # Return value handling

      _retval
    end

    # Returns whether lines in the label are automatically wrapped.
    #
    # See `Gtk::Label#wrap=`.
    def wrap : Bool
      # gtk_label_get_wrap: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_wrap(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns line wrap mode used by the label.
    #
    # See `Gtk::Label#wrap_mode=`.
    def wrap_mode : Pango::WrapMode
      # gtk_label_get_wrap_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_wrap_mode(@pointer)

      # Return value handling

      Pango::WrapMode.new(_retval)
    end

    # Gets the `xalign` of the label.
    #
    # See the `Gtk::Label#xalign` property.
    def xalign : Float32
      # gtk_label_get_xalign: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_xalign(@pointer)

      # Return value handling

      _retval
    end

    # Gets the `yalign` of the label.
    #
    # See the `Gtk::Label#yalign` property.
    def yalign : Float32
      # gtk_label_get_yalign: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_label_get_yalign(@pointer)

      # Return value handling

      _retval
    end

    # Selects a range of characters in the label, if the label is selectable.
    #
    # See `Gtk::Label#selectable=`. If the label is not selectable,
    # this function has no effect. If @start_offset or
    # @end_offset are -1, then the end of the label will be substituted.
    def select_region(start_offset : Int32, end_offset : Int32) : Nil
      # gtk_label_select_region: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_select_region(@pointer, start_offset, end_offset)

      # Return value handling
    end

    # Apply attributes to the label text.
    #
    # The attributes set with this function will be applied and merged with
    # any other attributes previously effected by way of the
    # [property@Gtk.Label:use-underline] or [property@Gtk.Label:use-markup]
    # properties. While it is not recommended to mix markup strings with
    # manually set attributes, if you must; know that the attributes will
    # be applied to the label after the markup string is parsed.
    def attributes=(attrs : Pango::AttrList?) : Nil
      # gtk_label_set_attributes: (Method | Setter)
      # @attrs: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      attrs = if attrs.nil?
                Pointer(Void).null
              else
                attrs.to_unsafe
              end

      # C call
      LibGtk.gtk_label_set_attributes(@pointer, attrs)

      # Return value handling
    end

    # Sets the mode used to ellipsizei the text.
    #
    # The text will be ellipsized if there is not enough space
    # to render the entire string.
    def ellipsize=(mode : Pango::EllipsizeMode) : Nil
      # gtk_label_set_ellipsize: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_ellipsize(@pointer, mode)

      # Return value handling
    end

    # Sets a menu model to add when constructing
    # the context menu for @label.
    def extra_menu=(model : Gio::MenuModel?) : Nil
      # gtk_label_set_extra_menu: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_label_set_extra_menu(@pointer, model)

      # Return value handling
    end

    # Sets the alignment of the lines in the text of the label relative to
    # each other.
    #
    # %GTK_JUSTIFY_LEFT is the default value when the widget is first created
    # with `Gtk::Label.new`. If you instead want to set the alignment of
    # the label as a whole, use `Gtk::Widget#halign=` instead.
    # `Gtk::Label#justify=` has no effect on labels containing
    # only a single line.
    def justify=(jtype : Gtk::Justification) : Nil
      # gtk_label_set_justify: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_justify(@pointer, jtype)

      # Return value handling
    end

    # Sets the text of the label.
    #
    # The label is interpreted as including embedded underlines and/or Pango
    # markup depending on the values of the [property@Gtk.Label:use-underline]
    # and [property@Gtk.Label:use-markup] properties.
    def label=(str : ::String) : Nil
      # gtk_label_set_label: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_label(@pointer, str)

      # Return value handling
    end

    # Sets the number of lines to which an ellipsized, wrapping label
    # should be limited.
    #
    # This has no effect if the label is not wrapping or ellipsized.
    # Set this to -1 if you don’t want to limit the number of lines.
    def lines=(lines : Int32) : Nil
      # gtk_label_set_lines: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_lines(@pointer, lines)

      # Return value handling
    end

    # Sets the labels text and attributes from markup.
    #
    # The string must be marked up with Pango markup
    # (see `Pango#parse_markup`).
    #
    # If the @str is external data, you may need to escape it
    # with g_markup_escape_text() or g_markup_printf_escaped():
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # GtkWidget *self = gtk_label_new (NULL);
    # const char *str = "...";
    # const char *format = "<span style=\"italic\">\%s</span>";
    # char *markup;
    #
    # markup = g_markup_printf_escaped (format, str);
    # gtk_label_set_markup (GTK_LABEL (self), markup);
    # g_free (markup);
    # ```
    #
    # This function will set the [property@Gtk.Label:use-markup] property
    # to %TRUE as a side effect.
    #
    # If you set the label contents using the `Gtk::Label#label`
    # property you should also ensure that you set the
    # [property@Gtk.Label:use-markup] property accordingly.
    #
    # See also: `Gtk::Label#text=`
    def markup=(str : ::String) : Nil
      # gtk_label_set_markup: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_markup(@pointer, str)

      # Return value handling
    end

    # Sets the labels text, attributes and mnemonic from markup.
    #
    # Parses @str which is marked up with Pango markup (see `Pango#parse_markup`),
    # setting the label’s text and attribute list based on the parse results.
    # If characters in @str are preceded by an underscore, they are underlined
    # indicating that they represent a keyboard accelerator called a mnemonic.
    #
    # The mnemonic key can be used to activate another widget, chosen
    # automatically, or explicitly using `Gtk::Label#mnemonic_widget=`.
    def markup_with_mnemonic=(str : ::String) : Nil
      # gtk_label_set_markup_with_mnemonic: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_markup_with_mnemonic(@pointer, str)

      # Return value handling
    end

    # Sets the desired maximum width in characters of @label to @n_chars.
    def max_width_chars=(n_chars : Int32) : Nil
      # gtk_label_set_max_width_chars: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_max_width_chars(@pointer, n_chars)

      # Return value handling
    end

    # Associate the label with its mnemonic target.
    #
    # If the label has been set so that it has a mnemonic key (using
    # i.e. `Gtk::Label#markup_with_mnemonic=`,
    # `Gtk::Label#text_with_mnemonic=`,
    # `Gtk::Label#new_with_mnemonic`
    # or the `Gtk::Label#use_underline` property) the label can be
    # associated with a widget that is the target of the mnemonic. When the
    # label is inside a widget (like a `Gtk#Button` or a
    # `Gtk#Notebook` tab) it is automatically associated with the correct
    # widget, but sometimes (i.e. when the target is a `Gtk#Entry` next to
    # the label) you need to set it explicitly using this function.
    #
    # The target widget will be accelerated by emitting the
    # [signal@GtkWidget::mnemonic-activate] signal on it. The default handler for
    # this signal will activate the widget if there are no mnemonic collisions
    # and toggle focus between the colliding widgets otherwise.
    def mnemonic_widget=(widget : Gtk::Widget?) : Nil
      # gtk_label_set_mnemonic_widget: (Method | Setter)
      # @widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      widget = if widget.nil?
                 Pointer(Void).null
               else
                 widget.to_unsafe
               end

      # C call
      LibGtk.gtk_label_set_mnemonic_widget(@pointer, widget)

      # Return value handling
    end

    # Select the line wrapping for the natural size request.
    #
    # This only affects the natural size requested, for the actual wrapping used,
    # see the [property@Gtk.Label:wrap-mode] property.
    def natural_wrap_mode=(wrap_mode : Gtk::NaturalWrapMode) : Nil
      # gtk_label_set_natural_wrap_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_natural_wrap_mode(@pointer, wrap_mode)

      # Return value handling
    end

    # Makes text in the label selectable.
    #
    # Selectable labels allow the user to select text from the label,
    # for copy-and-paste.
    def selectable=(setting : Bool) : Nil
      # gtk_label_set_selectable: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_selectable(@pointer, setting)

      # Return value handling
    end

    # Sets whether the label is in single line mode.
    def single_line_mode=(single_line_mode : Bool) : Nil
      # gtk_label_set_single_line_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_single_line_mode(@pointer, single_line_mode)

      # Return value handling
    end

    # Sets the text within the `GtkLabel` widget.
    #
    # It overwrites any text that was there before.
    #
    # This function will clear any previously set mnemonic accelerators,
    # and set the [property@Gtk.Label:use-underline property] to %FALSE as
    # a side effect.
    #
    # This function will set the [property@Gtk.Label:use-markup] property
    # to %FALSE as a side effect.
    #
    # See also: `Gtk::Label#markup=`
    def text=(str : ::String) : Nil
      # gtk_label_set_text: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_text(@pointer, str)

      # Return value handling
    end

    # Sets the label’s text from the string @str.
    #
    # If characters in @str are preceded by an underscore, they are underlined
    # indicating that they represent a keyboard accelerator called a mnemonic.
    # The mnemonic key can be used to activate another widget, chosen
    # automatically, or explicitly using `Gtk::Label#mnemonic_widget=`.
    def text_with_mnemonic=(str : ::String) : Nil
      # gtk_label_set_text_with_mnemonic: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_text_with_mnemonic(@pointer, str)

      # Return value handling
    end

    # Sets whether the text of the label contains markup.
    #
    # See `Gtk::Label#markup=`.
    def use_markup=(setting : Bool) : Nil
      # gtk_label_set_use_markup: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_use_markup(@pointer, setting)

      # Return value handling
    end

    # Sets whether underlines in the text indicate mnemonics.
    def use_underline=(setting : Bool) : Nil
      # gtk_label_set_use_underline: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_use_underline(@pointer, setting)

      # Return value handling
    end

    # Sets the desired width in characters of @label to @n_chars.
    def width_chars=(n_chars : Int32) : Nil
      # gtk_label_set_width_chars: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_width_chars(@pointer, n_chars)

      # Return value handling
    end

    # Toggles line wrapping within the `GtkLabel` widget.
    #
    # %TRUE makes it break lines if text exceeds the widget’s size.
    # %FALSE lets the text get cut off by the edge of the widget if
    # it exceeds the widget size.
    #
    # Note that setting line wrapping to %TRUE does not make the label
    # wrap at its parent container’s width, because GTK widgets
    # conceptually can’t make their requisition depend on the parent
    # container’s size. For a label that wraps at a specific position,
    # set the label’s width using `Gtk::Widget#size_request=`.
    def wrap=(wrap : Bool) : Nil
      # gtk_label_set_wrap: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_wrap(@pointer, wrap)

      # Return value handling
    end

    # Controls how line wrapping is done.
    #
    # This only affects the label if line wrapping is on. (See
    # `Gtk::Label#wrap=`) The default is %PANGO_WRAP_WORD
    # which means wrap on word boundaries.
    #
    # For sizing behavior, also consider the [property@Gtk.Label:natural-wrap-mode]
    # property.
    def wrap_mode=(wrap_mode : Pango::WrapMode) : Nil
      # gtk_label_set_wrap_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_wrap_mode(@pointer, wrap_mode)

      # Return value handling
    end

    # Sets the `xalign` of the label.
    #
    # See the `Gtk::Label#xalign` property.
    def xalign=(xalign : Float32) : Nil
      # gtk_label_set_xalign: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_xalign(@pointer, xalign)

      # Return value handling
    end

    # Sets the `yalign` of the label.
    #
    # See the `Gtk::Label#yalign` property.
    def yalign=(yalign : Float32) : Nil
      # gtk_label_set_yalign: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_label_set_yalign(@pointer, yalign)

      # Return value handling
    end

    # Gets emitted when the user activates a link in the label.
    #
    # The ::activate-current-link is a [keybinding signal](class.SignalAction.html).
    #
    # Applications may also emit the signal with g_signal_emit_by_name()
    # if they need to control activation of URIs programmatically.
    #
    # The default bindings for this signal are all forms of the Enter key.
    struct ActivateCurrentLinkSignal < GObject::Signal
      def name : String
        @detail ? "activate-current-link::#{@detail}" : "activate-current-link"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Label, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Label.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Label, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-current-link")
      end
    end

    def activate_current_link_signal
      ActivateCurrentLinkSignal.new(self)
    end

    # Gets emitted to activate a URI.
    #
    # Applications may connect to it to override the default behaviour,
    # which is to call gtk_show_uri().
    struct ActivateLinkSignal < GObject::Signal
      def name : String
        @detail ? "activate-link::#{@detail}" : "activate-link"
      end

      def connect(*, after : Bool = false, &block : Proc(::String, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(::String, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_uri : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          uri = ::String.new(lib_uri)
          ::Box(Proc(::String, Bool)).unbox(_lib_box).call(uri)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Label, ::String, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_uri : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::Label.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          uri = ::String.new(lib_uri)
          ::Box(Proc(Gtk::Label, ::String, Bool)).unbox(_lib_box).call(_sender, uri)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(uri : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate-link", uri)
      end
    end

    def activate_link_signal
      ActivateLinkSignal.new(self)
    end

    # Gets emitted to copy the slection to the clipboard.
    #
    # The ::copy-clipboard signal is a [keybinding signal](class.SignalAction.html).
    #
    # The default binding for this signal is Ctrl-c.
    struct CopyClipboardSignal < GObject::Signal
      def name : String
        @detail ? "copy-clipboard::#{@detail}" : "copy-clipboard"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Label, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::Label.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Label, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "copy-clipboard")
      end
    end

    def copy_clipboard_signal
      CopyClipboardSignal.new(self)
    end

    # Gets emitted when the user initiates a cursor movement.
    #
    # The ::move-cursor signal is a [keybinding signal](class.SignalAction.html).
    # If the cursor is not visible in @entry, this signal causes the viewport to
    # be moved instead.
    #
    # Applications should not connect to it, but may emit it with
    # g_signal_emit_by_name() if they need to control the cursor
    # programmatically.
    #
    # The default bindings for this signal come in two variants,
    # the variant with the Shift modifier extends the selection,
    # the variant without the Shift modifier does not.
    # There are too many key combinations to list them all here.
    # - Arrow keys move by individual characters/lines
    # - Ctrl-arrow key combinations move by words/paragraphs
    # - Home/End keys move to the ends of the buffer
    struct MoveCursorSignal < GObject::Signal
      def name : String
        @detail ? "move-cursor::#{@detail}" : "move-cursor"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::MovementStep, Int32, Bool, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::MovementStep, Int32, Bool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib_extend_selection : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          count = lib_count
          extend_selection = lib_extend_selection
          ::Box(Proc(Gtk::MovementStep, Int32, Bool, Nil)).unbox(_lib_box).call(step, count, extend_selection)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::Label, Gtk::MovementStep, Int32, Bool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_step : UInt32, lib_count : Int32, lib_extend_selection : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::Label.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          step = Gtk::MovementStep.new(lib_step)
          count = lib_count
          extend_selection = lib_extend_selection
          ::Box(Proc(Gtk::Label, Gtk::MovementStep, Int32, Bool, Nil)).unbox(_lib_box).call(_sender, step, count, extend_selection)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
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
