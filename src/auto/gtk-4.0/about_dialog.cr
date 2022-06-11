require "./window"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./native"

require "./root"

require "./shortcut_manager"

module Gtk
  # The `GtkAboutDialog` offers a simple way to display information about
  # a program.
  #
  # The shown information includes the programs' logo, name, copyright,
  # website and license. It is also possible to give credits to the authors,
  # documenters, translators and artists who have worked on the program.
  #
  # An about dialog is typically opened when the user selects the `About`
  # option from the `Help` menu. All parts of the dialog are optional.
  #
  # ![An example GtkAboutDialog](aboutdialog.png)
  #
  # About dialogs often contain links and email addresses. `GtkAboutDialog`
  # displays these as clickable links. By default, it calls `Gtk#show_uri`
  # when a user clicks one. The behaviour can be overridden with the
  # [signal@Gtk.AboutDialog::activate-link] signal.
  #
  # To specify a person with an email address, use a string like
  # `Edgar Allan Poe <edgar@poe.com>`. To specify a website with a title,
  # use a string like `GTK team https://www.gtk.org`.
  #
  # To make constructing a `GtkAboutDialog` as convenient as possible, you can
  # use the function `Gtk#show_about_dialog` which constructs and shows
  # a dialog and keeps it around so that it can be shown again.
  #
  # Note that GTK sets a default title of `_("About %s")` on the dialog
  # window (where `%s` is replaced by the name of the application, but in
  # order to ensure proper translation of the title, applications should
  # set the title property explicitly when constructing a `GtkAboutDialog`,
  # as shown in the following example:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GFile *logo_file = g_file_new_for_path ("./logo.png");
  # GdkTexture *example_logo = gdk_texture_new_from_file (logo_file, NULL);
  # g_object_unref (logo_file);
  #
  # gtk_show_about_dialog (NULL,
  #                        "program-name", "ExampleCode",
  #                        "logo", example_logo,
  #                        "title", _("About ExampleCode"),
  #                        NULL);
  # ```
  #
  # ## CSS nodes
  #
  # `GtkAboutDialog` has a single CSS node with the name `window` and style
  # class `.aboutdialog`.
  @[GObject::GeneratedWrapper]
  class AboutDialog < Window
    include Accessible
    include Buildable
    include ConstraintTarget
    include Native
    include Root
    include ShortcutManager

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(AboutDialog, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `AboutDialog`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, application : Gtk::Application? = nil, artists : Enumerable(::String)? = nil, authors : Enumerable(::String)? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, comments : ::String? = nil, copyright : ::String? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decorated : Bool? = nil, default_height : Int32? = nil, default_widget : Gtk::Widget? = nil, default_width : Int32? = nil, deletable : Bool? = nil, destroy_with_parent : Bool? = nil, display : Gdk::Display? = nil, documenters : Enumerable(::String)? = nil, focus_on_click : Bool? = nil, focus_visible : Bool? = nil, focus_widget : Gtk::Widget? = nil, focusable : Bool? = nil, fullscreened : Bool? = nil, halign : Gtk::Align? = nil, handle_menubar_accel : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hide_on_close : Bool? = nil, icon_name : ::String? = nil, is_active : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, license : ::String? = nil, license_type : Gtk::License? = nil, logo : Gdk::Paintable? = nil, logo_icon_name : ::String? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, maximized : Bool? = nil, mnemonics_visible : Bool? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, program_name : ::String? = nil, receives_default : Bool? = nil, resizable : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, startup_id : ::String? = nil, system_information : ::String? = nil, title : ::String? = nil, titlebar : Gtk::Widget? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transient_for : Gtk::Window? = nil, translator_credits : ::String? = nil, valign : Gtk::Align? = nil, version : ::String? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, website : ::String? = nil, website_label : ::String? = nil, width_request : Int32? = nil, wrap_license : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[75]
      _values = StaticArray(LibGObject::Value, 75).new(LibGObject::Value.new)
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
      if !artists.nil?
        (_names.to_unsafe + _n).value = "artists".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, artists)
        _n += 1
      end
      if !authors.nil?
        (_names.to_unsafe + _n).value = "authors".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, authors)
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
      if !comments.nil?
        (_names.to_unsafe + _n).value = "comments".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, comments)
        _n += 1
      end
      if !copyright.nil?
        (_names.to_unsafe + _n).value = "copyright".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, copyright)
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
      if !documenters.nil?
        (_names.to_unsafe + _n).value = "documenters".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, documenters)
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
      if !license.nil?
        (_names.to_unsafe + _n).value = "license".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, license)
        _n += 1
      end
      if !license_type.nil?
        (_names.to_unsafe + _n).value = "license-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, license_type)
        _n += 1
      end
      if !logo.nil?
        (_names.to_unsafe + _n).value = "logo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, logo)
        _n += 1
      end
      if !logo_icon_name.nil?
        (_names.to_unsafe + _n).value = "logo-icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, logo_icon_name)
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
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !program_name.nil?
        (_names.to_unsafe + _n).value = "program-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, program_name)
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
      if !system_information.nil?
        (_names.to_unsafe + _n).value = "system-information".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, system_information)
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
      if !translator_credits.nil?
        (_names.to_unsafe + _n).value = "translator-credits".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, translator_credits)
        _n += 1
      end
      if !valign.nil?
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if !version.nil?
        (_names.to_unsafe + _n).value = "version".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, version)
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
      if !website.nil?
        (_names.to_unsafe + _n).value = "website".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, website)
        _n += 1
      end
      if !website_label.nil?
        (_names.to_unsafe + _n).value = "website-label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, website_label)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if !wrap_license.nil?
        (_names.to_unsafe + _n).value = "wrap-license".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_license)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(AboutDialog.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_about_dialog_get_type
    end

    def artists=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "artists", unsafe_value, Pointer(Void).null)
      value
    end

    def artists : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "artists", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    def authors=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "authors", unsafe_value, Pointer(Void).null)
      value
    end

    def authors : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "authors", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    def comments=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "comments", unsafe_value, Pointer(Void).null)
      value
    end

    def comments : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "comments", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def copyright=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "copyright", unsafe_value, Pointer(Void).null)
      value
    end

    def copyright : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "copyright", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def documenters=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "documenters", unsafe_value, Pointer(Void).null)
      value
    end

    def documenters : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "documenters", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    def license=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "license", unsafe_value, Pointer(Void).null)
      value
    end

    def license : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "license", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def license_type=(value : Gtk::License) : Gtk::License
      unsafe_value = value

      LibGObject.g_object_set(self, "license-type", unsafe_value, Pointer(Void).null)
      value
    end

    def license_type : Gtk::License
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "license-type", pointerof(value), Pointer(Void).null)
      Gtk::License.new(value)
    end

    def logo=(value : Gdk::Paintable?) : Gdk::Paintable?
      unsafe_value = value

      LibGObject.g_object_set(self, "logo", unsafe_value, Pointer(Void).null)
      value
    end

    def logo : Gdk::Paintable?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "logo", pointerof(value), Pointer(Void).null)
      Gdk::AbstractPaintable.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def logo_icon_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "logo-icon-name", unsafe_value, Pointer(Void).null)
      value
    end

    def logo_icon_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "logo-icon-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def program_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "program-name", unsafe_value, Pointer(Void).null)
      value
    end

    def program_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "program-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def system_information=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "system-information", unsafe_value, Pointer(Void).null)
      value
    end

    def system_information : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "system-information", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def translator_credits=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "translator-credits", unsafe_value, Pointer(Void).null)
      value
    end

    def translator_credits : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "translator-credits", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def version=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "version", unsafe_value, Pointer(Void).null)
      value
    end

    def version : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "version", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def website=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "website", unsafe_value, Pointer(Void).null)
      value
    end

    def website : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "website", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def website_label=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "website-label", unsafe_value, Pointer(Void).null)
      value
    end

    def website_label : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "website-label", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def wrap_license=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "wrap-license", unsafe_value, Pointer(Void).null)
      value
    end

    def wrap_license? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "wrap-license", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new section in the "Credits" page.
    def add_credit_section(section_name : ::String, people : Enumerable(::String)) : Nil
      # gtk_about_dialog_add_credit_section: (Method)
      # @people: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      people = people.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_about_dialog_add_credit_section(@pointer, section_name, people)

      # Return value handling
    end

    # Returns the names of the artists which are displayed
    # in the credits page.
    def artists : Enumerable(::String)
      # gtk_about_dialog_get_artists: (Method | Getter)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_artists(@pointer)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    # Returns the names of the authors which are displayed
    # in the credits page.
    def authors : Enumerable(::String)
      # gtk_about_dialog_get_authors: (Method | Getter)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_authors(@pointer)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    # Returns the comments string.
    def comments : ::String?
      # gtk_about_dialog_get_comments: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_comments(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the copyright string.
    def copyright : ::String?
      # gtk_about_dialog_get_copyright: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_copyright(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the name of the documenters which are displayed
    # in the credits page.
    def documenters : Enumerable(::String)
      # gtk_about_dialog_get_documenters: (Method | Getter)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_documenters(@pointer)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    # Returns the license information.
    def license : ::String?
      # gtk_about_dialog_get_license: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_license(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Retrieves the license type.
    def license_type : Gtk::License
      # gtk_about_dialog_get_license_type: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_license_type(@pointer)

      # Return value handling

      Gtk::License.new(_retval)
    end

    # Returns the paintable displayed as logo in the about dialog.
    def logo : Gdk::Paintable?
      # gtk_about_dialog_get_logo: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_logo(@pointer)

      # Return value handling

      Gdk::AbstractPaintable.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the icon name displayed as logo in the about dialog.
    def logo_icon_name : ::String?
      # gtk_about_dialog_get_logo_icon_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_logo_icon_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the program name displayed in the about dialog.
    def program_name : ::String?
      # gtk_about_dialog_get_program_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_program_name(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the system information that is shown in the about dialog.
    def system_information : ::String?
      # gtk_about_dialog_get_system_information: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_system_information(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the translator credits string which is displayed
    # in the credits page.
    def translator_credits : ::String?
      # gtk_about_dialog_get_translator_credits: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_translator_credits(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the version string.
    def version : ::String?
      # gtk_about_dialog_get_version: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_version(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the website URL.
    def website : ::String?
      # gtk_about_dialog_get_website: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_website(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns the label used for the website link.
    def website_label : ::String?
      # gtk_about_dialog_get_website_label: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_website_label(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns whether the license text in the about dialog is
    # automatically wrapped.
    def wrap_license : Bool
      # gtk_about_dialog_get_wrap_license: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_about_dialog_get_wrap_license(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets the names of the artists to be displayed
    # in the "Credits" page.
    def artists=(artists : Enumerable(::String)) : Nil
      # gtk_about_dialog_set_artists: (Method | Setter)
      # @artists: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      artists = artists.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_about_dialog_set_artists(@pointer, artists)

      # Return value handling
    end

    # Sets the names of the authors which are displayed
    # in the "Credits" page of the about dialog.
    def authors=(authors : Enumerable(::String)) : Nil
      # gtk_about_dialog_set_authors: (Method | Setter)
      # @authors: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      authors = authors.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_about_dialog_set_authors(@pointer, authors)

      # Return value handling
    end

    # Sets the comments string to display in the about dialog.
    #
    # This should be a short string of one or two lines.
    def comments=(comments : ::String?) : Nil
      # gtk_about_dialog_set_comments: (Method | Setter)
      # @comments: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      comments = if comments.nil?
                   Pointer(LibC::Char).null
                 else
                   comments.to_unsafe
                 end

      # C call
      LibGtk.gtk_about_dialog_set_comments(@pointer, comments)

      # Return value handling
    end

    # Sets the copyright string to display in the about dialog.
    #
    # This should be a short string of one or two lines.
    def copyright=(copyright : ::String?) : Nil
      # gtk_about_dialog_set_copyright: (Method | Setter)
      # @copyright: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      copyright = if copyright.nil?
                    Pointer(LibC::Char).null
                  else
                    copyright.to_unsafe
                  end

      # C call
      LibGtk.gtk_about_dialog_set_copyright(@pointer, copyright)

      # Return value handling
    end

    # Sets the names of the documenters which are displayed
    # in the "Credits" page.
    def documenters=(documenters : Enumerable(::String)) : Nil
      # gtk_about_dialog_set_documenters: (Method | Setter)
      # @documenters: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      documenters = documenters.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_about_dialog_set_documenters(@pointer, documenters)

      # Return value handling
    end

    # Sets the license information to be displayed in the
    # about dialog.
    #
    # If `license` is `NULL`, the license page is hidden.
    def license=(license : ::String?) : Nil
      # gtk_about_dialog_set_license: (Method | Setter)
      # @license: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      license = if license.nil?
                  Pointer(LibC::Char).null
                else
                  license.to_unsafe
                end

      # C call
      LibGtk.gtk_about_dialog_set_license(@pointer, license)

      # Return value handling
    end

    # Sets the license of the application showing the about dialog from a
    # list of known licenses.
    #
    # This function overrides the license set using
    # `Gtk::AboutDialog#license=`.
    def license_type=(license_type : Gtk::License) : Nil
      # gtk_about_dialog_set_license_type: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_about_dialog_set_license_type(@pointer, license_type)

      # Return value handling
    end

    # Sets the logo in the about dialog.
    def logo=(logo : Gdk::Paintable?) : Nil
      # gtk_about_dialog_set_logo: (Method | Setter)
      # @logo: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      logo = if logo.nil?
               Pointer(Void).null
             else
               logo.to_unsafe
             end

      # C call
      LibGtk.gtk_about_dialog_set_logo(@pointer, logo)

      # Return value handling
    end

    # Sets the icon name to be displayed as logo in the about dialog.
    def logo_icon_name=(icon_name : ::String?) : Nil
      # gtk_about_dialog_set_logo_icon_name: (Method | Setter)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      # C call
      LibGtk.gtk_about_dialog_set_logo_icon_name(@pointer, icon_name)

      # Return value handling
    end

    # Sets the name to display in the about dialog.
    #
    # If `name` is not set, the string returned
    # by `g_get_application_name()` is used.
    def program_name=(name : ::String?) : Nil
      # gtk_about_dialog_set_program_name: (Method | Setter)
      # @name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      LibGtk.gtk_about_dialog_set_program_name(@pointer, name)

      # Return value handling
    end

    # Sets the system information to be displayed in the about
    # dialog.
    #
    # If `system_information` is `NULL`, the system information
    # page is hidden.
    #
    # See [property@Gtk.AboutDialog:system-information].
    def system_information=(system_information : ::String?) : Nil
      # gtk_about_dialog_set_system_information: (Method | Setter)
      # @system_information: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      system_information = if system_information.nil?
                             Pointer(LibC::Char).null
                           else
                             system_information.to_unsafe
                           end

      # C call
      LibGtk.gtk_about_dialog_set_system_information(@pointer, system_information)

      # Return value handling
    end

    # Sets the translator credits string which is displayed in
    # the credits page.
    #
    # The intended use for this string is to display the translator
    # of the language which is currently used in the user interface.
    # Using `gettext()`, a simple way to achieve that is to mark the
    # string for translation:
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # GtkWidget *about = gtk_about_dialog_new ();
    #  gtk_about_dialog_set_translator_credits (GTK_ABOUT_DIALOG (about),
    #                                           _("translator-credits"));
    # ```
    #
    # It is a good idea to use the customary `msgid` “translator-credits”
    # for this purpose, since translators will already know the purpose of
    # that `msgid`, and since `GtkAboutDialog` will detect if “translator-credits”
    # is untranslated and omit translator credits.
    def translator_credits=(translator_credits : ::String?) : Nil
      # gtk_about_dialog_set_translator_credits: (Method | Setter)
      # @translator_credits: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      translator_credits = if translator_credits.nil?
                             Pointer(LibC::Char).null
                           else
                             translator_credits.to_unsafe
                           end

      # C call
      LibGtk.gtk_about_dialog_set_translator_credits(@pointer, translator_credits)

      # Return value handling
    end

    # Sets the version string to display in the about dialog.
    def version=(version : ::String?) : Nil
      # gtk_about_dialog_set_version: (Method | Setter)
      # @version: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      version = if version.nil?
                  Pointer(LibC::Char).null
                else
                  version.to_unsafe
                end

      # C call
      LibGtk.gtk_about_dialog_set_version(@pointer, version)

      # Return value handling
    end

    # Sets the URL to use for the website link.
    def website=(website : ::String?) : Nil
      # gtk_about_dialog_set_website: (Method | Setter)
      # @website: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      website = if website.nil?
                  Pointer(LibC::Char).null
                else
                  website.to_unsafe
                end

      # C call
      LibGtk.gtk_about_dialog_set_website(@pointer, website)

      # Return value handling
    end

    # Sets the label to be used for the website link.
    def website_label=(website_label : ::String) : Nil
      # gtk_about_dialog_set_website_label: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_about_dialog_set_website_label(@pointer, website_label)

      # Return value handling
    end

    # Sets whether the license text in the about dialog should be
    # automatically wrapped.
    def wrap_license=(wrap_license : Bool) : Nil
      # gtk_about_dialog_set_wrap_license: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_about_dialog_set_wrap_license(@pointer, wrap_license)

      # Return value handling
    end

    # Emitted every time a URL is activated.
    #
    # Applications may connect to it to override the default behaviour,
    # which is to call `Gtk#show_uri`.
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

      def connect(handler : Proc(Gtk::AboutDialog, ::String, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_uri : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::AboutDialog.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          uri = ::String.new(lib_uri)
          ::Box(Proc(Gtk::AboutDialog, ::String, Bool)).unbox(_lib_box).call(_sender, uri)
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
  end
end
