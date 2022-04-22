require "../g_object-2.0/object"

module Gdk
  # `GdkDisplay` objects are the GDK representation of a workstation.
  #
  # Their purpose are two-fold:
  #
  # - To manage and provide information about input devices (pointers, keyboards, etc)
  # - To manage and provide information about output devices (monitors, projectors, etc)
  #
  # Most of the input device handling has been factored out into separate
  # `Gdk#Seat` objects. Every display has a one or more seats, which
  # can be accessed with `Gdk::Display#default_seat` and
  # `Gdk::Display#list_seats`.
  #
  # Output devices are represented by `Gdk#Monitor` objects, which can
  # be accessed with `Gdk::Display#monitor_at_surface` and similar APIs.
  @[GObject::GeneratedWrapper]
  class Display < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::Display), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, composited : Bool? = nil, input_shapes : Bool? = nil, rgba : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !composited.nil?
        (_names.to_unsafe + _n).value = "composited".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, composited)
        _n += 1
      end
      if !input_shapes.nil?
        (_names.to_unsafe + _n).value = "input-shapes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, input_shapes)
        _n += 1
      end
      if !rgba.nil?
        (_names.to_unsafe + _n).value = "rgba".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, rgba)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Display.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_display_get_type
    end

    def composited? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "composited", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def input_shapes? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "input-shapes", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def rgba? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "rgba", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Gets the default `GdkDisplay`.
    #
    # This is a convenience function for:
    #
    #     gdk_display_manager_get_default_display (gdk_display_manager_get ())
    def self.default : Gdk::Display?
      # gdk_display_get_default: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_get_default

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Opens a display.
    #
    # If opening the display fails, `NULL` is returned.
    def self.open(display_name : ::String) : Gdk::Display?
      # gdk_display_open: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_open(display_name)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Emits a short beep on @display
    def beep : Nil
      # gdk_display_beep: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_display_beep(self)

      # Return value handling
    end

    # Closes the connection to the windowing system for the given display.
    #
    # This cleans up associated resources.
    def close : Nil
      # gdk_display_close: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_display_close(self)

      # Return value handling
    end

    # Creates a new `GdkGLContext` for the `GdkDisplay`.
    #
    # The context is disconnected from any particular surface or surface
    # and cannot be used to draw to any surface. It can only be used to
    # draw to non-surface framebuffers like textures.
    #
    # If the creation of the `GdkGLContext` failed, @error will be set.
    # Before using the returned `GdkGLContext`, you will need to
    # call `Gdk::GLContext#make_current` or `Gdk::GLContext#realize`.
    def create_gl_context : Gdk::GLContext
      # gdk_display_create_gl_context: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_display_create_gl_context(self, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      Gdk::GLContext.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns %TRUE if there is an ongoing grab on @device for @display.
    def device_is_grabbed(device : Gdk::Device) : Bool
      # gdk_display_device_is_grabbed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_device_is_grabbed(self, device)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Flushes any requests queued for the windowing system.
    #
    # This happens automatically when the main loop blocks waiting for new events,
    # but if your application is drawing without returning control to the main loop,
    # you may need to call this function explicitly. A common case where this function
    # needs to be called is when an application is executing drawing commands
    # from a thread other than the thread where the main loop is running.
    #
    # This is most useful for X11. On windowing systems where requests are
    # handled synchronously, this function will do nothing.
    def flush : Nil
      # gdk_display_flush: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_display_flush(self)

      # Return value handling
    end

    # Returns a `GdkAppLaunchContext` suitable for launching
    # applications on the given display.
    def app_launch_context : Gdk::AppLaunchContext
      # gdk_display_get_app_launch_context: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_display_get_app_launch_context(self)

      # Return value handling

      Gdk::AppLaunchContext.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the clipboard used for copy/paste operations.
    def clipboard : Gdk::Clipboard
      # gdk_display_get_clipboard: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_get_clipboard(self)

      # Return value handling

      Gdk::Clipboard.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the default `GdkSeat` for this display.
    #
    # Note that a display may not have a seat. In this case,
    # this function will return %NULL.
    def default_seat : Gdk::Seat?
      # gdk_display_get_default_seat: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_get_default_seat(self)

      # Return value handling

      Gdk::Seat.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the monitor in which the largest area of @surface
    # resides.
    #
    # Returns a monitor close to @surface if it is outside
    # of all monitors.
    def monitor_at_surface(surface : Gdk::Surface) : Gdk::Monitor
      # gdk_display_get_monitor_at_surface: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_get_monitor_at_surface(self, surface)

      # Return value handling

      Gdk::Monitor.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the list of monitors associated with this display.
    #
    # Subsequent calls to this function will always return the
    # same list for the same display.
    #
    # You can listen to the GListModel::items-changed signal on
    # this list to monitor changes to the monitor of this display.
    def monitors : Gio::ListModel
      # gdk_display_get_monitors: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_get_monitors(self)

      # Return value handling

      Gio::ListModel__Impl.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the name of the display.
    def name : ::String
      # gdk_display_get_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_get_name(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the clipboard used for the primary selection.
    #
    # On backends where the primary clipboard is not supported natively,
    # GDK emulates this clipboard locally.
    def primary_clipboard : Gdk::Clipboard
      # gdk_display_get_primary_clipboard: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_get_primary_clipboard(self)

      # Return value handling

      Gdk::Clipboard.new(_retval, GICrystal::Transfer::None)
    end

    # Retrieves a desktop-wide setting such as double-click time
    # for the @display.
    def setting(name : ::String, value : _) : Bool
      # gdk_display_get_setting: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if !value.is_a?(GObject::Value)
                GObject::Value.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      _retval = LibGdk.gdk_display_get_setting(self, name, value)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the startup notification ID for a Wayland display, or %NULL
    # if no ID has been defined.
    def startup_notification_id : ::String?
      # gdk_display_get_startup_notification_id: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_get_startup_notification_id(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Finds out if the display has been closed.
    def is_closed : Bool
      # gdk_display_is_closed: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_is_closed(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether surfaces can reasonably be expected to have
    # their alpha channel drawn correctly on the screen.
    #
    # Check `Gdk::Display#is_rgba?` for whether the display
    # supports an alpha channel.
    #
    # On X11 this function returns whether a compositing manager is
    # compositing on @display.
    #
    # On modern displays, this value is always %TRUE.
    def is_composited : Bool
      # gdk_display_is_composited: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_is_composited(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether surfaces on this @display are created with an
    # alpha channel.
    #
    # Even if a %TRUE is returned, it is possible that the
    # surface’s alpha channel won’t be honored when displaying the
    # surface on the screen: in particular, for X an appropriate
    # windowing manager and compositing manager must be running to
    # provide appropriate display. Use `Gdk::Display#is_composited?`
    # to check if that is the case.
    #
    # On modern displays, this value is always %TRUE.
    def is_rgba : Bool
      # gdk_display_is_rgba: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_is_rgba(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the list of seats known to @display.
    def list_seats : GLib::List
      # gdk_display_list_seats: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGdk.gdk_display_list_seats(self)

      # Return value handling

      GLib::List(Gdk::Seat).new(_retval, GICrystal::Transfer::Container)
    end

    # Returns the keyvals bound to @keycode.
    #
    # The Nth `GdkKeymapKey` in @keys is bound to the Nth keyval in @keyvals.
    #
    # When a keycode is pressed by the user, the keyval from
    # this list of entries is selected by considering the effective
    # keyboard group and level.
    #
    # Free the returned arrays with g_free().
    def map_keycode(keycode : UInt32) : Bool
      # gdk_display_map_keycode: (Method)
      # @keys: (out) (transfer full) (optional) (array length=n_entries element-type Interface)
      # @keyvals: (out) (transfer full) (optional) (array length=n_entries element-type UInt32)
      # @n_entries: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_entries = keys.size
      # Generator::OutArgUsedInReturnPlan
      keys = Pointer(Pointer(Void)).null
      # Generator::ArrayArgPlan
      keys = keys.to_a.map(&.to_unsafe).to_unsafe

      # Generator::ArrayLengthArgPlan
      n_entries = keyvals.size
      # Generator::OutArgUsedInReturnPlan
      keyvals = Pointer(Pointer(UInt32)).null
      # Generator::ArrayArgPlan
      keyvals = keyvals.to_a.to_unsafe

      # C call
      _retval = LibGdk.gdk_display_map_keycode(self, keycode, keys, keyvals, n_entries)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Obtains a list of keycode/group/level combinations that will
    # generate @keyval.
    #
    # Groups and levels are two kinds of keyboard mode; in general, the level
    # determines whether the top or bottom symbol on a key is used, and the
    # group determines whether the left or right symbol is used.
    #
    # On US keyboards, the shift key changes the keyboard level, and there
    # are no groups. A group switch key might convert a keyboard between
    # Hebrew to English modes, for example.
    #
    # `GdkEventKey` contains a %group field that indicates the active
    # keyboard group. The level is computed from the modifier mask.
    #
    # The returned array should be freed with g_free().
    def map_keyval(keyval : UInt32, keys : Enumerable(Gdk::KeymapKey)) : Bool
      # gdk_display_map_keyval: (Method)
      # @keys: (out) (transfer full) (array length=n_keys element-type Interface)
      # @n_keys: (out) (transfer full)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_keys = keys.size
      # Generator::ArrayArgPlan
      keys = keys.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGdk.gdk_display_map_keyval(self, keyval, keys, n_keys)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Indicates to the GUI environment that the application has
    # finished loading, using a given identifier.
    #
    # GTK will call this function automatically for `Gtk#Window`
    # with custom startup-notification identifier unless
    # `Gtk::Window#auto_startup_notification=`
    # is called to disable that feature.
    def notify_startup_complete(startup_id : ::String) : Nil
      # gdk_display_notify_startup_complete: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_display_notify_startup_complete(self, startup_id)

      # Return value handling
    end

    # Checks that OpenGL is available for @self and ensures that it is
    # properly initialized.
    # When this fails, an @error will be set describing the error and this
    # function returns %FALSE.
    #
    # Note that even if this function succeeds, creating a `GdkGLContext`
    # may still fail.
    #
    # This function is idempotent. Calling it multiple times will just
    # return the same value or error.
    #
    # You never need to call this function, GDK will call it automatically
    # as needed. But you can use it as a check when setting up code that
    # might make use of OpenGL.
    def prepare_gl : Bool
      # gdk_display_prepare_gl: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGdk.gdk_display_prepare_gl(self, pointerof(_error))

      # Error check
      Gdk.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Appends the given event onto the front of the event
    # queue for @display.
    #
    # This function is only useful in very special situations
    # and should not be used by applications.
    def put_event(event : Gdk::Event) : Nil
      # gdk_display_put_event: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_display_put_event(self, event)

      # Return value handling
    end

    # Returns %TRUE if the display supports input shapes.
    #
    # This means that `Gdk::Surface#input_region=` can
    # be used to modify the input shape of surfaces on @display.
    #
    # On modern displays, this value is always %TRUE.
    def supports_input_shapes : Bool
      # gdk_display_supports_input_shapes: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_supports_input_shapes(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Flushes any requests queued for the windowing system and waits until all
    # requests have been handled.
    #
    # This is often used for making sure that the display is synchronized
    # with the current state of the program. Calling `Gdk::Display#sync`
    # before [method@GdkX11.Display.error_trap_pop] makes sure that any errors
    # generated from earlier requests are handled before the error trap is removed.
    #
    # This is most useful for X11. On windowing systems where requests are
    # handled synchronously, this function will do nothing.
    def sync : Nil
      # gdk_display_sync: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_display_sync(self)

      # Return value handling
    end

    # Translates the contents of a `GdkEventKey` into a keyval, effective group,
    # and level.
    #
    # Modifiers that affected the translation and are thus unavailable for
    # application use are returned in @consumed_modifiers.
    #
    # The @effective_group is the group that was actually used for the
    # translation; some keys such as Enter are not affected by the active
    # keyboard group. The @level is derived from @state.
    #
    # @consumed_modifiers gives modifiers that should be masked out
    # from @state when comparing this key press to a keyboard shortcut.
    # For instance, on a US keyboard, the `plus` symbol is shifted, so
    # when comparing a key press to a `<Control>plus` accelerator `<Shift>`
    # should be masked out.
    #
    # This function should rarely be needed, since `GdkEventKey` already
    # contains the translated keyval. It is exported for the benefit of
    # virtualized test environments.
    def translate_key(keycode : UInt32, state : Gdk::ModifierType, group : Int32) : Bool
      # gdk_display_translate_key: (Method)
      # @keyval: (out) (transfer full) (optional)
      # @effective_group: (out) (transfer full) (optional)
      # @level: (out) (transfer full) (optional)
      # @consumed: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      keyval = Pointer(UInt32).null
      # Generator::OutArgUsedInReturnPlan
      effective_group = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      level = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      consumed = Pointer(UInt32).null

      # C call
      _retval = LibGdk.gdk_display_translate_key(self, keycode, state, group, keyval, effective_group, level, consumed)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted when the connection to the windowing system for @display is closed.
    struct ClosedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "closed::#{@detail}" : "closed"
      end

      def connect(&block : Proc(Bool, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Bool, Nil))
        connect(block)
      end

      def connect(block : Proc(Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Bool, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Display, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gdk::Display, Bool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Display, Bool, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : LibC::Int, box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GICrystal.to_bool(lib_arg0)
          ::Box(Proc(Gdk::Display, Bool, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(is_error : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "closed", is_error)
      end
    end

    def closed_signal
      ClosedSignal.new(self)
    end

    # Emitted when the connection to the windowing system for @display is opened.
    struct OpenedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "opened::#{@detail}" : "opened"
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

      def connect(block : Proc(Gdk::Display, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Display, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "opened")
      end
    end

    def opened_signal
      OpenedSignal.new(self)
    end

    # Emitted whenever a new seat is made known to the windowing system.
    struct SeatAddedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "seat-added::#{@detail}" : "seat-added"
      end

      def connect(&block : Proc(Gdk::Seat, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Seat, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Display, Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Gdk::Seat, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Display, Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Gdk::Seat, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(seat : Gdk::Seat) : Nil
        LibGObject.g_signal_emit_by_name(@source, "seat-added", seat)
      end
    end

    def seat_added_signal
      SeatAddedSignal.new(self)
    end

    # Emitted whenever a seat is removed by the windowing system.
    struct SeatRemovedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "seat-removed::#{@detail}" : "seat-removed"
      end

      def connect(&block : Proc(Gdk::Seat, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Seat, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Seat, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Display, Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Gdk::Seat, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Display, Gdk::Seat, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Seat.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Gdk::Seat, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(seat : Gdk::Seat) : Nil
        LibGObject.g_signal_emit_by_name(@source, "seat-removed", seat)
      end
    end

    def seat_removed_signal
      SeatRemovedSignal.new(self)
    end

    # Emitted whenever a setting changes its value.
    struct SettingChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "setting-changed::#{@detail}" : "setting-changed"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(::String, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::Display, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gdk::Display, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Display, ::String, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gdk::Display.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gdk::Display, ::String, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(setting : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "setting-changed", setting)
      end
    end

    def setting_changed_signal
      SettingChangedSignal.new(self)
    end
  end
end
