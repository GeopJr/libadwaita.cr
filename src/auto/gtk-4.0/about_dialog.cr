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
  # displays these as clickable links. By default, it calls [func@Gtk.show_uri]
  # when a user clicks one. The behaviour can be overridden with the
  # [signal@Gtk.AboutDialog::activate-link] signal.
  #
  # To specify a person with an email address, use a string like
  # `Edgar Allan Poe <edgar@poe.com>`. To specify a website with a title,
  # use a string like `GTK team https://www.gtk.org`.
  #
  # To make constructing a `GtkAboutDialog` as convenient as possible, you can
  # use the function [func@Gtk.show_about_dialog] which constructs and shows
  # a dialog and keeps it around so that it can be shown again.
  #
  # Note that GTK sets a default title of `_("About %s")` on the dialog
  # window (where `%s` is replaced by the name of the application, but in
  # order to ensure proper translation of the title, applications should
  # set the title property explicitly when constructing a `GtkAboutDialog`,
  # as shown in the following example:
  #
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
  class AboutDialog < Window
    include Accessible
    include Buildable
    include ConstraintTarget
    include Native
    include Root
    include ShortcutManager

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, application : Gtk::Application? = nil, artists : Enumerable(::String)? = nil, authors : Enumerable(::String)? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, child : Gtk::Widget? = nil, comments : ::String? = nil, copyright : ::String? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, decorated : Bool? = nil, default_height : Int32? = nil, default_widget : Gtk::Widget? = nil, default_width : Int32? = nil, deletable : Bool? = nil, destroy_with_parent : Bool? = nil, display : Gdk::Display? = nil, documenters : Enumerable(::String)? = nil, focus_on_click : Bool? = nil, focus_visible : Bool? = nil, focus_widget : Gtk::Widget? = nil, focusable : Bool? = nil, fullscreened : Bool? = nil, halign : Gtk::Align? = nil, handle_menubar_accel : Bool? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, hide_on_close : Bool? = nil, icon_name : ::String? = nil, is_active : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, license : ::String? = nil, license_type : Gtk::License? = nil, logo : Gdk::Paintable? = nil, logo_icon_name : ::String? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, maximized : Bool? = nil, mnemonics_visible : Bool? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, program_name : ::String? = nil, receives_default : Bool? = nil, resizable : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, startup_id : ::String? = nil, system_information : ::String? = nil, title : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, transient_for : Gtk::Window? = nil, translator_credits : ::String? = nil, valign : Gtk::Align? = nil, version : ::String? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, website : ::String? = nil, website_label : ::String? = nil, width_request : Int32? = nil, wrap_license : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[74]
      _values = StaticArray(LibGObject::Value, 74).new(LibGObject::Value.new)
      _n = 0

      if accessible_role
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if application
        (_names.to_unsafe + _n).value = "application".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, application)
        _n += 1
      end
      if artists
        (_names.to_unsafe + _n).value = "artists".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, artists)
        _n += 1
      end
      if authors
        (_names.to_unsafe + _n).value = "authors".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, authors)
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
      if child
        (_names.to_unsafe + _n).value = "child".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, child)
        _n += 1
      end
      if comments
        (_names.to_unsafe + _n).value = "comments".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, comments)
        _n += 1
      end
      if copyright
        (_names.to_unsafe + _n).value = "copyright".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, copyright)
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
      if decorated
        (_names.to_unsafe + _n).value = "decorated".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, decorated)
        _n += 1
      end
      if default_height
        (_names.to_unsafe + _n).value = "default-height".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_height)
        _n += 1
      end
      if default_widget
        (_names.to_unsafe + _n).value = "default-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_widget)
        _n += 1
      end
      if default_width
        (_names.to_unsafe + _n).value = "default-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_width)
        _n += 1
      end
      if deletable
        (_names.to_unsafe + _n).value = "deletable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, deletable)
        _n += 1
      end
      if destroy_with_parent
        (_names.to_unsafe + _n).value = "destroy-with-parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, destroy_with_parent)
        _n += 1
      end
      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end
      if documenters
        (_names.to_unsafe + _n).value = "documenters".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, documenters)
        _n += 1
      end
      if focus_on_click
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if focus_visible
        (_names.to_unsafe + _n).value = "focus-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_visible)
        _n += 1
      end
      if focus_widget
        (_names.to_unsafe + _n).value = "focus-widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_widget)
        _n += 1
      end
      if focusable
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if fullscreened
        (_names.to_unsafe + _n).value = "fullscreened".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, fullscreened)
        _n += 1
      end
      if halign
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if handle_menubar_accel
        (_names.to_unsafe + _n).value = "handle-menubar-accel".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, handle_menubar_accel)
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
      if hide_on_close
        (_names.to_unsafe + _n).value = "hide-on-close".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hide_on_close)
        _n += 1
      end
      if icon_name
        (_names.to_unsafe + _n).value = "icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, icon_name)
        _n += 1
      end
      if is_active
        (_names.to_unsafe + _n).value = "is-active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_active)
        _n += 1
      end
      if layout_manager
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if license
        (_names.to_unsafe + _n).value = "license".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, license)
        _n += 1
      end
      if license_type
        (_names.to_unsafe + _n).value = "license-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, license_type)
        _n += 1
      end
      if logo
        (_names.to_unsafe + _n).value = "logo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, logo)
        _n += 1
      end
      if logo_icon_name
        (_names.to_unsafe + _n).value = "logo-icon-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, logo_icon_name)
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
      if maximized
        (_names.to_unsafe + _n).value = "maximized".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, maximized)
        _n += 1
      end
      if mnemonics_visible
        (_names.to_unsafe + _n).value = "mnemonics-visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, mnemonics_visible)
        _n += 1
      end
      if modal
        (_names.to_unsafe + _n).value = "modal".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modal)
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
      if program_name
        (_names.to_unsafe + _n).value = "program-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, program_name)
        _n += 1
      end
      if receives_default
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if resizable
        (_names.to_unsafe + _n).value = "resizable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resizable)
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
      if sensitive
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if startup_id
        (_names.to_unsafe + _n).value = "startup-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, startup_id)
        _n += 1
      end
      if system_information
        (_names.to_unsafe + _n).value = "system-information".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, system_information)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
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
      if transient_for
        (_names.to_unsafe + _n).value = "transient-for".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, transient_for)
        _n += 1
      end
      if translator_credits
        (_names.to_unsafe + _n).value = "translator-credits".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, translator_credits)
        _n += 1
      end
      if valign
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if version
        (_names.to_unsafe + _n).value = "version".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, version)
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
      if website
        (_names.to_unsafe + _n).value = "website".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, website)
        _n += 1
      end
      if website_label
        (_names.to_unsafe + _n).value = "website-label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, website_label)
        _n += 1
      end
      if width_request
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end
      if wrap_license
        (_names.to_unsafe + _n).value = "wrap-license".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, wrap_license)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(AboutDialog.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_about_dialog_get_type
    end

    def initialize
      # gtk_about_dialog_new: (Constructor)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_new
      @pointer = _retval
    end

    def add_credit_section(section_name : ::String, people : Enumerable(::String)) : Nil
      # gtk_about_dialog_add_credit_section: (Method)
      # @people: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      people = people.to_a.map(&.to_unsafe).to_unsafe

      LibGtk.gtk_about_dialog_add_credit_section(self, section_name, people)
    end

    def artists : Enumerable(::String)
      # gtk_about_dialog_get_artists: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_artists(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def authors : Enumerable(::String)
      # gtk_about_dialog_get_authors: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_authors(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def comments : ::String?
      # gtk_about_dialog_get_comments: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_comments(self)
      ::String.new(_retval) unless _retval.null?
    end

    def copyright : ::String?
      # gtk_about_dialog_get_copyright: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_copyright(self)
      ::String.new(_retval) unless _retval.null?
    end

    def documenters : Enumerable(::String)
      # gtk_about_dialog_get_documenters: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_documenters(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def license : ::String?
      # gtk_about_dialog_get_license: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_license(self)
      ::String.new(_retval) unless _retval.null?
    end

    def license_type : Gtk::License
      # gtk_about_dialog_get_license_type: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_license_type(self)
      Gtk::License.from_value(_retval)
    end

    def logo : Gdk::Paintable?
      # gtk_about_dialog_get_logo: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_logo(self)
      Gdk::Paintable__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def logo_icon_name : ::String?
      # gtk_about_dialog_get_logo_icon_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_logo_icon_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def program_name : ::String?
      # gtk_about_dialog_get_program_name: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_program_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def system_information : ::String?
      # gtk_about_dialog_get_system_information: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_system_information(self)
      ::String.new(_retval) unless _retval.null?
    end

    def translator_credits : ::String?
      # gtk_about_dialog_get_translator_credits: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_translator_credits(self)
      ::String.new(_retval) unless _retval.null?
    end

    def version : ::String?
      # gtk_about_dialog_get_version: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_version(self)
      ::String.new(_retval) unless _retval.null?
    end

    def website : ::String?
      # gtk_about_dialog_get_website: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_website(self)
      ::String.new(_retval) unless _retval.null?
    end

    def website_label : ::String?
      # gtk_about_dialog_get_website_label: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_website_label(self)
      ::String.new(_retval) unless _retval.null?
    end

    def wrap_license? : Bool
      # gtk_about_dialog_get_wrap_license: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_about_dialog_get_wrap_license(self)
      GICrystal.to_bool(_retval)
    end

    def artists=(artists : Enumerable(::String)) : Nil
      # gtk_about_dialog_set_artists: (Method)
      # @artists: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      artists = artists.to_a.map(&.to_unsafe).to_unsafe

      LibGtk.gtk_about_dialog_set_artists(self, artists)
    end

    def authors=(authors : Enumerable(::String)) : Nil
      # gtk_about_dialog_set_authors: (Method)
      # @authors: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      authors = authors.to_a.map(&.to_unsafe).to_unsafe

      LibGtk.gtk_about_dialog_set_authors(self, authors)
    end

    def comments=(comments : ::String?) : Nil
      # gtk_about_dialog_set_comments: (Method)
      # @comments: (nullable)
      # Returns: (transfer none)

      comments = if comments.nil?
                   Pointer(LibC::Char).null
                 else
                   comments.to_unsafe
                 end

      LibGtk.gtk_about_dialog_set_comments(self, comments)
    end

    def copyright=(copyright : ::String?) : Nil
      # gtk_about_dialog_set_copyright: (Method)
      # @copyright: (nullable)
      # Returns: (transfer none)

      copyright = if copyright.nil?
                    Pointer(LibC::Char).null
                  else
                    copyright.to_unsafe
                  end

      LibGtk.gtk_about_dialog_set_copyright(self, copyright)
    end

    def documenters=(documenters : Enumerable(::String)) : Nil
      # gtk_about_dialog_set_documenters: (Method)
      # @documenters: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      documenters = documenters.to_a.map(&.to_unsafe).to_unsafe

      LibGtk.gtk_about_dialog_set_documenters(self, documenters)
    end

    def license=(license : ::String?) : Nil
      # gtk_about_dialog_set_license: (Method)
      # @license: (nullable)
      # Returns: (transfer none)

      license = if license.nil?
                  Pointer(LibC::Char).null
                else
                  license.to_unsafe
                end

      LibGtk.gtk_about_dialog_set_license(self, license)
    end

    def license_type=(license_type : Gtk::License) : Nil
      # gtk_about_dialog_set_license_type: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_about_dialog_set_license_type(self, license_type)
    end

    def logo=(logo : Gdk::Paintable?) : Nil
      # gtk_about_dialog_set_logo: (Method)
      # @logo: (nullable)
      # Returns: (transfer none)

      logo = if logo.nil?
               Pointer(Void).null
             else
               logo.to_unsafe
             end

      LibGtk.gtk_about_dialog_set_logo(self, logo)
    end

    def logo_icon_name=(icon_name : ::String?) : Nil
      # gtk_about_dialog_set_logo_icon_name: (Method)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      LibGtk.gtk_about_dialog_set_logo_icon_name(self, icon_name)
    end

    def program_name=(name : ::String?) : Nil
      # gtk_about_dialog_set_program_name: (Method)
      # @name: (nullable)
      # Returns: (transfer none)

      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      LibGtk.gtk_about_dialog_set_program_name(self, name)
    end

    def system_information=(system_information : ::String?) : Nil
      # gtk_about_dialog_set_system_information: (Method)
      # @system_information: (nullable)
      # Returns: (transfer none)

      system_information = if system_information.nil?
                             Pointer(LibC::Char).null
                           else
                             system_information.to_unsafe
                           end

      LibGtk.gtk_about_dialog_set_system_information(self, system_information)
    end

    def translator_credits=(translator_credits : ::String?) : Nil
      # gtk_about_dialog_set_translator_credits: (Method)
      # @translator_credits: (nullable)
      # Returns: (transfer none)

      translator_credits = if translator_credits.nil?
                             Pointer(LibC::Char).null
                           else
                             translator_credits.to_unsafe
                           end

      LibGtk.gtk_about_dialog_set_translator_credits(self, translator_credits)
    end

    def version=(version : ::String?) : Nil
      # gtk_about_dialog_set_version: (Method)
      # @version: (nullable)
      # Returns: (transfer none)

      version = if version.nil?
                  Pointer(LibC::Char).null
                else
                  version.to_unsafe
                end

      LibGtk.gtk_about_dialog_set_version(self, version)
    end

    def website=(website : ::String?) : Nil
      # gtk_about_dialog_set_website: (Method)
      # @website: (nullable)
      # Returns: (transfer none)

      website = if website.nil?
                  Pointer(LibC::Char).null
                else
                  website.to_unsafe
                end

      LibGtk.gtk_about_dialog_set_website(self, website)
    end

    def website_label=(website_label : ::String) : Nil
      # gtk_about_dialog_set_website_label: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_about_dialog_set_website_label(self, website_label)
    end

    def wrap_license=(wrap_license : Bool) : Nil
      # gtk_about_dialog_set_wrap_license: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_about_dialog_set_wrap_license(self, wrap_license)
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

      def connect(block : Proc(Gtk::AboutDialog, ::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::AboutDialog.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::AboutDialog, ::String, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::AboutDialog, ::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::AboutDialog.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::AboutDialog, ::String, Bool)).unbox(box).call(sender, arg0).to_unsafe
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
  end
end
