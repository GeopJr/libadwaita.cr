require "../g_object-2.0/object"

module Gdk
  # A singleton object that offers notification when displays appear or
  # disappear.
  #
  # You can use `Gdk::DisplayManager#get` to obtain the `GdkDisplayManager`
  # singleton, but that should be rarely necessary. Typically, initializing
  # GTK opens a display that you can work with without ever accessing the
  # `GdkDisplayManager`.
  #
  # The GDK library can be built with support for multiple backends.
  # The `GdkDisplayManager` object determines which backend is used
  # at runtime.
  #
  # In the rare case that you need to influence which of the backends
  # is being used, you can use `Gdk#allowed_backends=`. Note
  # that you need to call this function before initializing GTK.
  #
  # ## Backend-specific code
  #
  # When writing backend-specific code that is supposed to work with
  # multiple GDK backends, you have to consider both compile time and
  # runtime. At compile time, use the `GDK_WINDOWING_X11`, `GDK_WINDOWING_WIN32`
  # macros, etc. to find out which backends are present in the GDK library
  # you are building your application against. At runtime, use type-check
  # macros like GDK_IS_X11_DISPLAY() to find out which backend is in use:
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # #ifdef GDK_WINDOWING_X11
  #   if (GDK_IS_X11_DISPLAY (display))
  #     {
  #       // make X11-specific calls here
  #     }
  #   else
  # #endif
  # #ifdef GDK_WINDOWING_MACOS
  #   if (GDK_IS_MACOS_DISPLAY (display))
  #     {
  #       // make Quartz-specific calls here
  #     }
  #   else
  # #endif
  #   g_error ("Unsupported GDK backend");
  # ```
  @[GObject::GeneratedWrapper]
  class DisplayManager < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::DisplayManager), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, default_display : Gdk::Display? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !default_display.nil?
        (_names.to_unsafe + _n).value = "default-display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_display)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DisplayManager.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_display_manager_get_type
    end

    def default_display=(value : Gdk::Display?) : Gdk::Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "default-display", unsafe_value, Pointer(Void).null)
      value
    end

    def default_display : Gdk::Display?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "default-display", pointerof(value), Pointer(Void).null)
      Gdk::Display.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Gets the singleton `GdkDisplayManager` object.
    #
    # When called for the first time, this function consults the
    # `GDK_BACKEND` environment variable to find out which of the
    # supported GDK backends to use (in case GDK has been compiled
    # with multiple backends).
    #
    # Applications can use `#allowed_backends=` to limit what
    # backends wil be used.
    def self.get : Gdk::DisplayManager
      # gdk_display_manager_get: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_manager_get

      # Return value handling

      Gdk::DisplayManager.new(_retval, GICrystal::Transfer::None)
    end

    # Gets the default `GdkDisplay`.
    def default_display : Gdk::Display?
      # gdk_display_manager_get_default_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_manager_get_default_display(self)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # List all currently open displays.
    def list_displays : GLib::SList
      # gdk_display_manager_list_displays: (Method)
      # Returns: (transfer container)

      # C call
      _retval = LibGdk.gdk_display_manager_list_displays(self)

      # Return value handling

      GLib::SList(Gdk::Display).new(_retval, GICrystal::Transfer::Container)
    end

    # Opens a display.
    def open_display(name : ::String) : Gdk::Display?
      # gdk_display_manager_open_display: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_display_manager_open_display(self, name)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets @display as the default display.
    def default_display=(display : Gdk::Display) : Nil
      # gdk_display_manager_set_default_display: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_display_manager_set_default_display(self, display)

      # Return value handling
    end

    # Emitted when a display is opened.
    struct DisplayOpenedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "display-opened::#{@detail}" : "display-opened"
      end

      def connect(&block : Proc(Gdk::Display, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Display, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gdk::Display, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_display : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          display = Gdk::Display.new(lib_display, :none)
          ::Box(Proc(Gdk::Display, Nil)).unbox(_lib_box).call(display)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::Display, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_display : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          display = Gdk::Display.new(lib_display, :none)
          ::Box(Proc(Gdk::Display, Nil)).unbox(_lib_box).call(display)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gdk::DisplayManager, Gdk::Display, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_display : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::DisplayManager.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          display = Gdk::Display.new(lib_display, :none)
          ::Box(Proc(Gdk::DisplayManager, Gdk::Display, Nil)).unbox(_lib_box).call(_sender, display)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::DisplayManager, Gdk::Display, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_display : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gdk::DisplayManager.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          display = Gdk::Display.new(lib_display, :none)
          ::Box(Proc(Gdk::DisplayManager, Gdk::Display, Nil)).unbox(_lib_box).call(_sender, display)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(display : Gdk::Display) : Nil
        LibGObject.g_signal_emit_by_name(@source, "display-opened", display)
      end
    end

    def display_opened_signal
      DisplayOpenedSignal.new(self)
    end
  end
end
