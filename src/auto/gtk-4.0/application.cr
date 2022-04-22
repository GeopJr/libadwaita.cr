require "../gio-2.0/application"
require "../gio-2.0/action_group"

require "../gio-2.0/action_map"

module Gtk
  # `GtkApplication` is a high-level API for writing applications.
  #
  # It supports many aspects of writing a GTK application in a convenient
  # fashion, without enforcing a one-size-fits-all model.
  #
  # Currently, `GtkApplication` handles GTK initialization, application
  # uniqueness, session management, provides some basic scriptability and
  # desktop shell integration by exporting actions and menus and manages a
  # list of toplevel windows whose life-cycle is automatically tied to the
  # life-cycle of your application.
  #
  # While `GtkApplication` works fine with plain `Gtk#Window`s, it is
  # recommended to use it together with `Gtk#ApplicationWindow`.
  #
  # ## Automatic resources
  #
  # `GtkApplication` will automatically load menus from the `GtkBuilder`
  # resource located at "gtk/menus.ui", relative to the application's
  # resource base path (see `g_application_set_resource_base_path()`).
  # The menu with the ID "menubar" is taken as the application's
  # menubar. Additional menus (most interesting submenus) can be named
  # and accessed via `Gtk::Application#menu_by_id` which allows for
  # dynamic population of a part of the menu structure.
  #
  # It is also possible to provide the menubar manually using
  # `Gtk::Application#menubar=`.
  #
  # `GtkApplication` will also automatically setup an icon search path for
  # the default icon theme by appending "icons" to the resource base
  # path. This allows your application to easily store its icons as
  # resources. See `Gtk::IconTheme#add_resource_path` for more
  # information.
  #
  # If there is a resource located at "gtk/help-overlay.ui" which
  # defines a `Gtk#ShortcutsWindow` with ID "help_overlay" then
  # `GtkApplication` associates an instance of this shortcuts window with
  # each `Gtk#ApplicationWindow` and sets up the keyboard accelerator
  # <kbd>Control</kbd>+<kbd>?</kbd> to open it. To create a menu item that
  # displays the shortcuts window, associate the item with the action
  # `win.show-help-overlay`.
  #
  # ## A simple application
  #
  # [A simple example](https://gitlab.gnome.org/GNOME/gtk/tree/main/examples/bp/bloatpad.c)
  # is available in the GTK source code repository
  #
  # `GtkApplication` optionally registers with a session manager of the
  # users session (if you set the [property@Gtk.Application:register-session]
  # property) and offers various functionality related to the session
  # life-cycle.
  #
  # An application can block various ways to end the session with
  # the `Gtk::Application#inhibit` function. Typical use cases for
  # this kind of inhibiting are long-running, uninterruptible operations,
  # such as burning a CD or performing a disk backup. The session
  # manager may not honor the inhibitor, but it can be expected to
  # inform the user about the negative consequences of ending the
  # session while inhibitors are present.
  #
  # ## See Also
  #
  # [HowDoI: Using GtkApplication](https://wiki.gnome.org/HowDoI/GtkApplication),
  # [Getting Started with GTK: Basics](getting_started.html#basics)
  @[GObject::GeneratedWrapper]
  class Application < Gio::Application
    include Gio::ActionGroup
    include Gio::ActionMap

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ApplicationClass), class_init,
        sizeof(LibGtk::Application), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, action_group : Gio::ActionGroup? = nil, active_window : Gtk::Window? = nil, application_id : ::String? = nil, flags : Gio::ApplicationFlags? = nil, inactivity_timeout : UInt32? = nil, is_busy : Bool? = nil, is_registered : Bool? = nil, is_remote : Bool? = nil, menubar : Gio::MenuModel? = nil, register_session : Bool? = nil, resource_base_path : ::String? = nil, screensaver_active : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[12]
      _values = StaticArray(LibGObject::Value, 12).new(LibGObject::Value.new)
      _n = 0

      if !action_group.nil?
        (_names.to_unsafe + _n).value = "action-group".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_group)
        _n += 1
      end
      if !active_window.nil?
        (_names.to_unsafe + _n).value = "active-window".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active_window)
        _n += 1
      end
      if !application_id.nil?
        (_names.to_unsafe + _n).value = "application-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, application_id)
        _n += 1
      end
      if !flags.nil?
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if !inactivity_timeout.nil?
        (_names.to_unsafe + _n).value = "inactivity-timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inactivity_timeout)
        _n += 1
      end
      if !is_busy.nil?
        (_names.to_unsafe + _n).value = "is-busy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_busy)
        _n += 1
      end
      if !is_registered.nil?
        (_names.to_unsafe + _n).value = "is-registered".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_registered)
        _n += 1
      end
      if !is_remote.nil?
        (_names.to_unsafe + _n).value = "is-remote".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_remote)
        _n += 1
      end
      if !menubar.nil?
        (_names.to_unsafe + _n).value = "menubar".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, menubar)
        _n += 1
      end
      if !register_session.nil?
        (_names.to_unsafe + _n).value = "register-session".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, register_session)
        _n += 1
      end
      if !resource_base_path.nil?
        (_names.to_unsafe + _n).value = "resource-base-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resource_base_path)
        _n += 1
      end
      if !screensaver_active.nil?
        (_names.to_unsafe + _n).value = "screensaver-active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, screensaver_active)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Application.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_application_get_type
    end

    def active_window : Gtk::Window?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "active-window", pointerof(value), Pointer(Void).null)
      Gtk::Window.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def menubar=(value : Gio::MenuModel?) : Gio::MenuModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "menubar", unsafe_value, Pointer(Void).null)
      value
    end

    def menubar : Gio::MenuModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "menubar", pointerof(value), Pointer(Void).null)
      Gio::MenuModel.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def register_session=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "register-session", unsafe_value, Pointer(Void).null)
      value
    end

    def register_session? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "register-session", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def screensaver_active? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "screensaver-active", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new `GtkApplication` instance.
    #
    # When using `GtkApplication`, it is not necessary to call `Gtk#init`
    # manually. It is called as soon as the application gets registered as
    # the primary instance.
    #
    # Concretely, `Gtk#init` is called in the default handler for the
    # `GApplication::startup` signal. Therefore, `GtkApplication` subclasses should
    # always chain up in their `GApplication::startup` handler before using any GTK
    # API.
    #
    # Note that commandline arguments are not passed to `Gtk#init`.
    #
    # If `application_id` is not %NULL, then it must be valid. See
    # `g_application_id_is_valid()`.
    #
    # If no application ID is given then some features (most notably application
    # uniqueness) will be disabled.
    def initialize(application_id : ::String?, flags : Gio::ApplicationFlags)
      # gtk_application_new: (Constructor)
      # @application_id: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      application_id = if application_id.nil?
                         Pointer(LibC::Char).null
                       else
                         application_id.to_unsafe
                       end

      # C call
      _retval = LibGtk.gtk_application_new(application_id, flags)

      # Return value handling

      @pointer = _retval
    end

    # Adds a window to `application`.
    #
    # This call can only happen after the `application` has started;
    # typically, you should add new application windows in response
    # to the emission of the `GApplication::activate` signal.
    #
    # This call is equivalent to setting the `Gtk::Window#application`
    # property of `window` to `application`.
    #
    # Normally, the connection between the application and the window
    # will remain until the window is destroyed, but you can explicitly
    # remove it with `Gtk::Application#remove_window`.
    #
    # GTK will keep the `application` running as long as it has
    # any windows.
    def add_window(window : Gtk::Window) : Nil
      # gtk_application_add_window: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_application_add_window(self, window)

      # Return value handling
    end

    # Gets the accelerators that are currently associated with
    # the given action.
    def accels_for_action(detailed_action_name : ::String) : Enumerable(::String)
      # gtk_application_get_accels_for_action: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGtk.gtk_application_get_accels_for_action(self, detailed_action_name)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Returns the list of actions (possibly empty) that `accel` maps to.
    #
    # Each item in the list is a detailed action name in the usual form.
    #
    # This might be useful to discover if an accel already exists in
    # order to prevent installation of a conflicting accelerator (from
    # an accelerator editor or a plugin system, for example). Note that
    # having more than one action per accelerator may not be a bad thing
    # and might make sense in cases where the actions never appear in the
    # same context.
    #
    # In case there are no actions for a given accelerator, an empty array
    # is returned. `NULL` is never returned.
    #
    # It is a programmer error to pass an invalid accelerator string.
    #
    # If you are unsure, check it with `Gtk#accelerator_parse` first.
    def actions_for_accel(accel : ::String) : Enumerable(::String)
      # gtk_application_get_actions_for_accel: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGtk.gtk_application_get_actions_for_accel(self, accel)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Gets the “active” window for the application.
    #
    # The active window is the one that was most recently focused (within
    # the application).  This window may not have the focus at the moment
    # if another application has it — this is just the most
    # recently-focused window within this application.
    def active_window : Gtk::Window?
      # gtk_application_get_active_window: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_application_get_active_window(self)

      # Return value handling

      Gtk::Window.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets a menu from automatically loaded resources.
    #
    # See [the section on Automatic resources](class.Application.html#automatic-resources)
    # for more information.
    def menu_by_id(id : ::String) : Gio::Menu?
      # gtk_application_get_menu_by_id: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_application_get_menu_by_id(self, id)

      # Return value handling

      Gio::Menu.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the menu model that has been set with
    # `Gtk::Application#menubar=`.
    def menubar : Gio::MenuModel?
      # gtk_application_get_menubar: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_application_get_menubar(self)

      # Return value handling

      Gio::MenuModel.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns the `Gtk#ApplicationWindow` with the given ID.
    #
    # The ID of a `GtkApplicationWindow` can be retrieved with
    # `Gtk::ApplicationWindow#id`.
    def window_by_id(id : UInt32) : Gtk::Window?
      # gtk_application_get_window_by_id: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_application_get_window_by_id(self, id)

      # Return value handling

      Gtk::Window.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets a list of the `Gtk#Window` instances associated with `application`.
    #
    # The list is sorted by most recently focused window, such that the first
    # element is the currently focused window. (Useful for choosing a parent
    # for a transient window.)
    #
    # The list that is returned should not be modified in any way. It will
    # only remain valid until the next focus change or window creation or
    # deletion.
    def windows : GLib::List
      # gtk_application_get_windows: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_application_get_windows(self)

      # Return value handling

      GLib::List(Gtk::Window).new(_retval, GICrystal::Transfer::None)
    end

    # Inform the session manager that certain types of actions should be
    # inhibited.
    #
    # This is not guaranteed to work on all platforms and for all types of
    # actions.
    #
    # Applications should invoke this method when they begin an operation
    # that should not be interrupted, such as creating a CD or DVD. The
    # types of actions that may be blocked are specified by the `flags`
    # parameter. When the application completes the operation it should
    # call `Gtk::Application#uninhibit` to remove the inhibitor. Note
    # that an application can have multiple inhibitors, and all of them must
    # be individually removed. Inhibitors are also cleared when the
    # application exits.
    #
    # Applications should not expect that they will always be able to block
    # the action. In most cases, users will be given the option to force
    # the action to take place.
    #
    # The `reason` message should be short and to the point.
    #
    # If `window` is given, the session manager may point the user to
    # this window to find out more about why the action is inhibited.
    def inhibit(window : Gtk::Window?, flags : Gtk::ApplicationInhibitFlags, reason : ::String?) : UInt32
      # gtk_application_inhibit: (Method)
      # @window: (nullable)
      # @reason: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      window = if window.nil?
                 Pointer(Void).null
               else
                 window.to_unsafe
               end

      # Generator::NullableArrayPlan
      reason = if reason.nil?
                 Pointer(LibC::Char).null
               else
                 reason.to_unsafe
               end

      # C call
      _retval = LibGtk.gtk_application_inhibit(self, window, flags, reason)

      # Return value handling

      _retval
    end

    # Lists the detailed action names which have associated accelerators.
    #
    # See `Gtk::Application#accels_for_action=`.
    def list_action_descriptions : Enumerable(::String)
      # gtk_application_list_action_descriptions: (Method)
      # Returns: (transfer full) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGtk.gtk_application_list_action_descriptions(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::Full)
    end

    # Remove a window from `application`.
    #
    # If `window` belongs to `application` then this call is equivalent to
    # setting the `Gtk::Window#application` property of `window` to
    # `NULL`.
    #
    # The application may stop running as a result of a call to this
    # function, if `window` was the last window of the `application`.
    def remove_window(window : Gtk::Window) : Nil
      # gtk_application_remove_window: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_application_remove_window(self, window)

      # Return value handling
    end

    # Sets zero or more keyboard accelerators that will trigger the
    # given action.
    #
    # The first item in `accels` will be the primary accelerator, which may be
    # displayed in the UI.
    #
    # To remove all accelerators for an action, use an empty, zero-terminated
    # array for `accels`.
    #
    # For the `detailed_action_name`, see `g_action_parse_detailed_name()` and
    # `g_action_print_detailed_name()`.
    def set_accels_for_action(detailed_action_name : ::String, accels : Enumerable(::String)) : Nil
      # gtk_application_set_accels_for_action: (Method)
      # @accels: (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      accels = accels.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGtk.gtk_application_set_accels_for_action(self, detailed_action_name, accels)

      # Return value handling
    end

    # Sets or unsets the menubar for windows of `application`.
    #
    # This is a menubar in the traditional sense.
    #
    # This can only be done in the primary instance of the application,
    # after it has been registered. `GApplication::startup` is a good place
    # to call this.
    #
    # Depending on the desktop environment, this may appear at the top of
    # each window, or at the top of the screen.  In some environments, if
    # both the application menu and the menubar are set, the application
    # menu will be presented as if it were the first item of the menubar.
    # Other environments treat the two as completely separate — for example,
    # the application menu may be rendered by the desktop shell while the
    # menubar (if set) remains in each individual window.
    #
    # Use the base `GActionMap` interface to add actions, to respond to the
    # user selecting these menu items.
    def menubar=(menubar : Gio::MenuModel?) : Nil
      # gtk_application_set_menubar: (Method | Setter)
      # @menubar: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      menubar = if menubar.nil?
                  Pointer(Void).null
                else
                  menubar.to_unsafe
                end

      # C call
      LibGtk.gtk_application_set_menubar(self, menubar)

      # Return value handling
    end

    # Removes an inhibitor that has been previously established.
    #
    # See `Gtk::Application#inhibit`.
    #
    # Inhibitors are also cleared when the application exits.
    def uninhibit(cookie : UInt32) : Nil
      # gtk_application_uninhibit: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_application_uninhibit(self, cookie)

      # Return value handling
    end

    # Emitted when the session manager is about to end the session.
    #
    # This signal is only emitted if [property@Gtk.Application:register-session]
    # is `TRUE`. Applications can connect to this signal and call
    # `Gtk::Application#inhibit` with `GTK_APPLICATION_INHIBIT_LOGOUT`
    # to delay the end of the session until state has been saved.
    struct QueryEndSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "query-end::#{@detail}" : "query-end"
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

      def connect(block : Proc(Gtk::Application, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Application.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Application, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Application, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Application.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Application, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "query-end")
      end
    end

    def query_end_signal
      QueryEndSignal.new(self)
    end

    # Emitted when a `Gtk#Window` is added to `application` through
    # `Gtk::Application#add_window`.
    struct WindowAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "window-added::#{@detail}" : "window-added"
      end

      def connect(&block : Proc(Gtk::Window, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Window, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Window.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Window.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Application, Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Application.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Window.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Application, Gtk::Window, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Application, Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Application.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Window.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Application, Gtk::Window, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(window : Gtk::Window) : Nil
        LibGObject.g_signal_emit_by_name(@source, "window-added", window)
      end
    end

    def window_added_signal
      WindowAddedSignal.new(self)
    end

    # Emitted when a `Gtk#Window` is removed from `application`.
    #
    # This can happen as a side-effect of the window being destroyed
    # or explicitly through `Gtk::Application#remove_window`.
    struct WindowRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "window-removed::#{@detail}" : "window-removed"
      end

      def connect(&block : Proc(Gtk::Window, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::Window, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Window.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::Window.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Window, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Application, Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Application.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Window.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Application, Gtk::Window, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Application, Gtk::Window, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::Application.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::Window.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::Application, Gtk::Window, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(window : Gtk::Window) : Nil
        LibGObject.g_signal_emit_by_name(@source, "window-removed", window)
      end
    end

    def window_removed_signal
      WindowRemovedSignal.new(self)
    end
  end
end
