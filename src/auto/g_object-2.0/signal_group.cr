require "./object"

module GObject
  # #GSignalGroup manages to simplify the process of connecting
  # many signals to a #GObject as a group. As such there is no API
  # to disconnect a signal from the group.
  #
  # In particular, this allows you to:
  #
  #  - Change the target instance, which automatically causes disconnection
  #    of the signals from the old instance and connecting to the new instance.
  #  - Block and unblock signals as a group
  #  - Ensuring that blocked state transfers across target instances.
  #
  # One place you might want to use such a structure is with #GtkTextView and
  # #GtkTextBuffer. Often times, you'll need to connect to many signals on
  # #GtkTextBuffer from a #GtkTextView subclass. This allows you to create a
  # signal group during instance construction, simply bind the
  # #GtkTextView:buffer property to #GSignalGroup:target and connect
  # all the signals you need. When the #GtkTextView:buffer property changes
  # all of the signals will be transitioned correctly.
  class SignalGroup < Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, target : GObject::Object? = nil, target_type : UInt64? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if target
        (_names.to_unsafe + _n).value = "target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target)
        _n += 1
      end
      if target_type
        (_names.to_unsafe + _n).value = "target-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SignalGroup.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_signal_group_get_type
    end

    def target=(value : GObject::Object?) : GObject::Object?
      unsafe_value = value

      LibGObject.g_object_set(self, "target", unsafe_value, Pointer(Void).null)
      value
    end

    def target : GObject::Object?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "target", pointerof(value), Pointer(Void).null)
      GObject::Object.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def target_type=(value : UInt64) : UInt64
      unsafe_value = value

      LibGObject.g_object_set(self, "target-type", unsafe_value, Pointer(Void).null)
      value
    end

    def target_type : UInt64
      # Returns: None

      value = uninitialized UInt64
      LibGObject.g_object_get(self, "target-type", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize(target_type : UInt64)
      # g_signal_group_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGObject.g_signal_group_new(target_type)

      # Return value handling
      @pointer = _retval
    end

    def block : Nil
      # g_signal_group_block: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_signal_group_block(self)

      # Return value handling
    end

    def connect_data(detailed_signal : ::String, c_handler : Pointer(Void), data : Pointer(Void)?, notify : Pointer(Void), flags : GObject::ConnectFlags) : Nil
      # g_signal_group_connect_data: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGObject.g_signal_group_connect_data(self, detailed_signal, c_handler, data, notify, flags)

      # Return value handling
    end

    def connect_swapped(detailed_signal : ::String, c_handler : Pointer(Void), data : Pointer(Void)?) : Nil
      # g_signal_group_connect_swapped: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGObject.g_signal_group_connect_swapped(self, detailed_signal, c_handler, data)

      # Return value handling
    end

    def dup_target : GObject::Object?
      # g_signal_group_dup_target: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGObject.g_signal_group_dup_target(self)

      # Return value handling
      GObject::Object.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def target=(target : GObject::Object?) : Nil
      # g_signal_group_set_target: (Method | Setter)
      # @target: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      target = if target.nil?
                 Pointer(Void).null
               else
                 target.to_unsafe
               end

      # C call
      LibGObject.g_signal_group_set_target(self, target)

      # Return value handling
    end

    def unblock : Nil
      # g_signal_group_unblock: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGObject.g_signal_group_unblock(self)

      # Return value handling
    end

    struct BindSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "bind::#{@detail}" : "bind"
      end

      def connect(&block : Proc(GObject::Object, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(GObject::Object, Nil))
        connect(block)
      end

      def connect(block : Proc(GObject::Object, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = GObject::Object.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(GObject::Object, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GObject::Object, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = GObject::Object.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(GObject::Object, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(GObject::SignalGroup, GObject::Object, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = GObject::SignalGroup.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GObject::Object.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(GObject::SignalGroup, GObject::Object, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GObject::SignalGroup, GObject::Object, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = GObject::SignalGroup.new(lib_sender, GICrystal::Transfer::None)
          arg0 = GObject::Object.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(GObject::SignalGroup, GObject::Object, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(instance : GObject::Object) : Nil
        LibGObject.g_signal_emit_by_name(@source, "bind", instance)
      end
    end

    def bind_signal
      BindSignal.new(self)
    end

    struct UnbindSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "unbind::#{@detail}" : "unbind"
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

      def connect(block : Proc(GObject::SignalGroup, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = GObject::SignalGroup.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GObject::SignalGroup, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(GObject::SignalGroup, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = GObject::SignalGroup.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GObject::SignalGroup, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "unbind")
      end
    end

    def unbind_signal
      UnbindSignal.new(self)
    end
  end
end
