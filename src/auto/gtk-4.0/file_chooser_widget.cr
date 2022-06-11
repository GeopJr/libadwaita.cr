require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./file_chooser"

module Gtk
  # `GtkFileChooserWidget` is a widget for choosing files.
  #
  # It exposes the `Gtk#FileChooser` interface, and you should
  # use the methods of this interface to interact with the
  # widget.
  #
  # # CSS nodes
  #
  # `GtkFileChooserWidget` has a single CSS node with name filechooser.
  @[GObject::GeneratedWrapper]
  class FileChooserWidget < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include FileChooser

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(FileChooserWidget, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `FileChooserWidget`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, action : Gtk::FileChooserAction? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, create_folders : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, filter : Gtk::FileFilter? = nil, filters : Gio::ListModel? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, layout_manager : Gtk::LayoutManager? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, search_mode : Bool? = nil, select_multiple : Bool? = nil, sensitive : Bool? = nil, shortcut_folders : Gio::ListModel? = nil, subtitle : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[43]
      _values = StaticArray(LibGObject::Value, 43).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !action.nil?
        (_names.to_unsafe + _n).value = "action".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action)
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
      if !create_folders.nil?
        (_names.to_unsafe + _n).value = "create-folders".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, create_folders)
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
      if !filter.nil?
        (_names.to_unsafe + _n).value = "filter".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, filter)
        _n += 1
      end
      if !filters.nil?
        (_names.to_unsafe + _n).value = "filters".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, filters)
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
      if !search_mode.nil?
        (_names.to_unsafe + _n).value = "search-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, search_mode)
        _n += 1
      end
      if !select_multiple.nil?
        (_names.to_unsafe + _n).value = "select-multiple".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, select_multiple)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !shortcut_folders.nil?
        (_names.to_unsafe + _n).value = "shortcut-folders".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, shortcut_folders)
        _n += 1
      end
      if !subtitle.nil?
        (_names.to_unsafe + _n).value = "subtitle".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, subtitle)
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

      @pointer = LibGObject.g_object_new_with_properties(FileChooserWidget.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_file_chooser_widget_get_type
    end

    def search_mode=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "search-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def search_mode? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "search-mode", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def subtitle : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "subtitle", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new `GtkFileChooserWidget`.
    #
    # This is a file chooser widget that can be embedded in custom
    # windows, and it is the same widget that is used by
    # `GtkFileChooserDialog`.
    def self.new(action : Gtk::FileChooserAction) : self
      # gtk_file_chooser_widget_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_file_chooser_widget_new(action)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::FileChooserWidget.new(_retval, GICrystal::Transfer::Full)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to make the file chooser show the user's Desktop
    # folder in the file list.
    #
    # The default binding for this signal is <kbd>Alt</kbd>-<kbd>D</kbd>.
    struct DesktopFolderSignal < GObject::Signal
      def name : String
        @detail ? "desktop-folder::#{@detail}" : "desktop-folder"
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

      def connect(handler : Proc(Gtk::FileChooserWidget, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FileChooserWidget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "desktop-folder")
      end
    end

    def desktop_folder_signal
      DesktopFolderSignal.new(self)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to make the file chooser go to a child of the
    # current folder in the file hierarchy. The subfolder that will
    # be used is displayed in the path bar widget of the file chooser.
    # For example, if the path bar is showing "/foo/bar/baz", with bar
    # currently displayed, then this will cause the file chooser to
    # switch to the "baz" subfolder.
    #
    # The default binding for this signal is <kbd>Alt</kbd>-<kbd>Down</kbd>.
    struct DownFolderSignal < GObject::Signal
      def name : String
        @detail ? "down-folder::#{@detail}" : "down-folder"
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

      def connect(handler : Proc(Gtk::FileChooserWidget, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FileChooserWidget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "down-folder")
      end
    end

    def down_folder_signal
      DownFolderSignal.new(self)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to make the file chooser show the user's home
    # folder in the file list.
    #
    # The default binding for this signal is <kbd>Alt</kbd>-<kbd>Home</kbd>.
    struct HomeFolderSignal < GObject::Signal
      def name : String
        @detail ? "home-folder::#{@detail}" : "home-folder"
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

      def connect(handler : Proc(Gtk::FileChooserWidget, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FileChooserWidget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "home-folder")
      end
    end

    def home_folder_signal
      HomeFolderSignal.new(self)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to make the file chooser show a "Location" prompt which
    # the user can use to manually type the name of the file he wishes to select.
    #
    # The default bindings for this signal are <kbd>Control</kbd>-<kbd>L</kbd>
    # with a @path string of "" (the empty string). It is also bound to
    # <kbd>/</kbd> with a @path string of "`/`" (a slash):  this lets you
    # type `/` and immediately type a path name. On Unix systems, this is
    # bound to <kbd>~</kbd> (tilde) with a @path string of "~" itself for
    # access to home directories.
    struct LocationPopupSignal < GObject::Signal
      def name : String
        @detail ? "location-popup::#{@detail}" : "location-popup"
      end

      def connect(*, after : Bool = false, &block : Proc(::String, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(::String, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(path)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::FileChooserWidget, ::String, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_path : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          path = ::String.new(lib_path)
          ::Box(Proc(Gtk::FileChooserWidget, ::String, Nil)).unbox(_lib_box).call(_sender, path)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(path : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "location-popup", path)
      end
    end

    def location_popup_signal
      LocationPopupSignal.new(self)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to make the file chooser show a "Location" prompt
    # when the user pastes into a `GtkFileChooserWidget`.
    #
    # The default binding for this signal is <kbd>Control</kbd>-<kbd>V</kbd>.
    struct LocationPopupOnPasteSignal < GObject::Signal
      def name : String
        @detail ? "location-popup-on-paste::#{@detail}" : "location-popup-on-paste"
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

      def connect(handler : Proc(Gtk::FileChooserWidget, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FileChooserWidget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "location-popup-on-paste")
      end
    end

    def location_popup_on_paste_signal
      LocationPopupOnPasteSignal.new(self)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to toggle the visibility of a "Location" prompt
    # which the user can use to manually type the name of the file
    # he wishes to select.
    #
    # The default binding for this signal is <kbd>Control</kbd>-<kbd>L</kbd>.
    struct LocationTogglePopupSignal < GObject::Signal
      def name : String
        @detail ? "location-toggle-popup::#{@detail}" : "location-toggle-popup"
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

      def connect(handler : Proc(Gtk::FileChooserWidget, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FileChooserWidget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "location-toggle-popup")
      end
    end

    def location_toggle_popup_signal
      LocationTogglePopupSignal.new(self)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to move the focus to the places sidebar.
    #
    # The default binding for this signal is <kbd>Alt</kbd>-<kbd>P</kbd>.
    struct PlacesShortcutSignal < GObject::Signal
      def name : String
        @detail ? "places-shortcut::#{@detail}" : "places-shortcut"
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

      def connect(handler : Proc(Gtk::FileChooserWidget, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FileChooserWidget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "places-shortcut")
      end
    end

    def places_shortcut_signal
      PlacesShortcutSignal.new(self)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to make the file chooser switch to the bookmark
    # specified in the @bookmark_index parameter. For example, if
    # you have three bookmarks, you can pass 0, 1, 2 to this signal
    # to switch to each of them, respectively.
    #
    # The default binding for this signal is <kbd>Alt</kbd>-<kbd>1</kbd>,
    # <kbd>Alt</kbd>-<kbd>2</kbd>, etc. until <kbd>Alt</kbd>-<kbd>0</kbd>.
    # Note that in the default binding, that <kbd>Alt</kbd>-<kbd>1</kbd> is
    # actually defined to switch to the bookmark at index 0, and so on
    # successively.
    struct QuickBookmarkSignal < GObject::Signal
      def name : String
        @detail ? "quick-bookmark::#{@detail}" : "quick-bookmark"
      end

      def connect(*, after : Bool = false, &block : Proc(Int32, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Int32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_bookmark_index : Int32, _lib_box : Pointer(Void)) {
          bookmark_index = lib_bookmark_index
          ::Box(Proc(Int32, Nil)).unbox(_lib_box).call(bookmark_index)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::FileChooserWidget, Int32, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_bookmark_index : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          bookmark_index = lib_bookmark_index
          ::Box(Proc(Gtk::FileChooserWidget, Int32, Nil)).unbox(_lib_box).call(_sender, bookmark_index)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(bookmark_index : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "quick-bookmark", bookmark_index)
      end
    end

    def quick_bookmark_signal
      QuickBookmarkSignal.new(self)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to make the file chooser show the Recent location.
    #
    # The default binding for this signal is <kbd>Alt</kbd>-<kbd>R</kbd>.
    struct RecentShortcutSignal < GObject::Signal
      def name : String
        @detail ? "recent-shortcut::#{@detail}" : "recent-shortcut"
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

      def connect(handler : Proc(Gtk::FileChooserWidget, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FileChooserWidget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "recent-shortcut")
      end
    end

    def recent_shortcut_signal
      RecentShortcutSignal.new(self)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to make the file chooser show the search entry.
    #
    # The default binding for this signal is <kbd>Alt</kbd>-<kbd>S</kbd>.
    struct SearchShortcutSignal < GObject::Signal
      def name : String
        @detail ? "search-shortcut::#{@detail}" : "search-shortcut"
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

      def connect(handler : Proc(Gtk::FileChooserWidget, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FileChooserWidget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "search-shortcut")
      end
    end

    def search_shortcut_signal
      SearchShortcutSignal.new(self)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to make the file chooser display hidden files.
    #
    # The default binding for this signal is <kbd>Control</kbd>-<kbd>H</kbd>.
    struct ShowHiddenSignal < GObject::Signal
      def name : String
        @detail ? "show-hidden::#{@detail}" : "show-hidden"
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

      def connect(handler : Proc(Gtk::FileChooserWidget, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FileChooserWidget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "show-hidden")
      end
    end

    def show_hidden_signal
      ShowHiddenSignal.new(self)
    end

    # Emitted when the user asks for it.
    #
    # This is a [keybinding signal](class.SignalAction.html).
    #
    # This is used to make the file chooser go to the parent
    # of the current folder in the file hierarchy.
    #
    # The default binding for this signal is <kbd>Alt</kbd>-<kbd>Up</kbd>.
    struct UpFolderSignal < GObject::Signal
      def name : String
        @detail ? "up-folder::#{@detail}" : "up-folder"
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

      def connect(handler : Proc(Gtk::FileChooserWidget, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FileChooserWidget.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FileChooserWidget, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "up-folder")
      end
    end

    def up_folder_signal
      UpFolderSignal.new(self)
    end
  end
end
