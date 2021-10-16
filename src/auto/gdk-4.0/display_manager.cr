require "../g_object-2.0/object"

module Gdk
  # A singleton object that offers notification when displays appear or
  # disappear.
  #
  # You can use [func@Gdk.DisplayManager.get] to obtain the `GdkDisplayManager`
  # singleton, but that should be rarely necessary. Typically, initializing
  # GTK opens a display that you can work with without ever accessing the
  # `GdkDisplayManager`.
  #
  # The GDK library can be built with support for multiple backends.
  # The `GdkDisplayManager` object determines which backend is used
  # at runtime.
  #
  # In the rare case that you need to influence which of the backends
  # is being used, you can use [func@Gdk.set_allowed_backends]. Note
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
  class DisplayManager < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, default_display : Gdk::Display? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if default_display
        (_names.to_unsafe + _n).value = "default-display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, default_display)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DisplayManager.g_type, _n, _names, _values)
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

    def self.get : Gdk::DisplayManager
      # gdk_display_manager_get: (None)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_manager_get
      Gdk::DisplayManager.new(_retval, GICrystal::Transfer::None)
    end

    def default_display : Gdk::Display?
      # gdk_display_manager_get_default_display: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_manager_get_default_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def list_displays : GLib::SList
      # gdk_display_manager_list_displays: (Method)
      # Returns: (transfer container)

      _retval = LibGdk.gdk_display_manager_list_displays(self)
      GLib::SList(Gdk::Display).new(_retval, GICrystal::Transfer::Container)
    end

    def open_display(name : ::String) : Gdk::Display?
      # gdk_display_manager_open_display: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_display_manager_open_display(self, name)
      Gdk::Display.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def default_display=(display : Gdk::Display) : Nil
      # gdk_display_manager_set_default_display: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_display_manager_set_default_display(self, display)
    end

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

      def connect(block : Proc(Gdk::Display, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Display.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Display, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Display.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Display, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gdk::DisplayManager, Gdk::Display, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::DisplayManager.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Display.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::DisplayManager, Gdk::Display, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::DisplayManager, Gdk::Display, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gdk::DisplayManager.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Display.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::DisplayManager, Gdk::Display, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
