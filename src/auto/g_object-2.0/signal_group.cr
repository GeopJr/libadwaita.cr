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
  @[GObject::GeneratedWrapper]
  class SignalGroup < Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGObject::SignalGroup), instance_init, 0)
    end

    GICrystal.define_new_method(SignalGroup, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SignalGroup`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, target : GObject::Object? = nil, target_type : UInt64? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !target.nil?
        (_names.to_unsafe + _n).value = "target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target)
        _n += 1
      end
      if !target_type.nil?
        (_names.to_unsafe + _n).value = "target-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, target_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SignalGroup.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new #GSignalGroup for target instances of @target_type.
    def initialize(target_type : UInt64)
      # g_signal_group_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGObject.g_signal_group_new(target_type)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Blocks all signal handlers managed by @self so they will not
    # be called during any signal emissions. Must be unblocked exactly
    # the same number of times it has been blocked to become active again.
    #
    # This blocked state will be kept across changes of the target instance.
    def block : Nil
      # g_signal_group_block: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_signal_group_block(@pointer)

      # Return value handling
    end

    # Connects @c_handler to the signal @detailed_signal
    # on the target instance of @self.
    #
    # You cannot connect a signal handler after #GSignalGroup:target has been set.
    def connect_data(detailed_signal : ::String, c_handler : GObject::Callback, data : Pointer(Void)?, notify : GObject::ClosureNotify, flags : GObject::ConnectFlags) : Nil
      # g_signal_group_connect_data: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGObject.g_signal_group_connect_data(@pointer, detailed_signal, c_handler, data, notify, flags)

      # Return value handling
    end

    # Connects @c_handler to the signal @detailed_signal
    # on the target instance of @self.
    #
    # The instance on which the signal is emitted and @data
    # will be swapped when calling @c_handler.
    #
    # You cannot connect a signal handler after #GSignalGroup:target has been set.
    def connect_swapped(detailed_signal : ::String, c_handler : GObject::Callback, data : Pointer(Void)?) : Nil
      # g_signal_group_connect_swapped: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGObject.g_signal_group_connect_swapped(@pointer, detailed_signal, c_handler, data)

      # Return value handling
    end

    # Gets the target instance used when connecting signals.
    def dup_target : GObject::Object?
      # g_signal_group_dup_target: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGObject.g_signal_group_dup_target(@pointer)

      # Return value handling

      GObject::Object.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Sets the target instance used when connecting signals. Any signal
    # that has been registered with g_signal_group_connect_object() or
    # similar functions will be connected to this object.
    #
    # If the target instance was previously set, signals will be
    # disconnected from that object prior to connecting to @target.
    def target=(target : GObject::Object?) : Nil
      # g_signal_group_set_target: (Method | Setter)
      # @target: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      target = if target.nil?
                 Pointer(Void).null
               else
                 target.to_unsafe
               end

      # C call
      LibGObject.g_signal_group_set_target(@pointer, target)

      # Return value handling
    end

    # Unblocks all signal handlers managed by @self so they will be
    # called again during any signal emissions unless it is blocked
    # again. Must be unblocked exactly the same number of times it
    # has been blocked to become active again.
    def unblock : Nil
      # g_signal_group_unblock: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_signal_group_unblock(@pointer)

      # Return value handling
    end

    # This signal is emitted when #GSignalGroup:target is set to a new value
    # other than %NULL. It is similar to #GObject::notify on `target` except it
    # will not emit when #GSignalGroup:target is %NULL and also allows for
    # receiving the #GObject without a data-race.
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

      def connect(handler : Proc(GObject::Object, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_instance : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          instance = GObject::Object.new(lib_instance, :none)
          ::Box(Proc(GObject::Object, Nil)).unbox(_lib_box).call(instance)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(GObject::Object, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_instance : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          instance = GObject::Object.new(lib_instance, :none)
          ::Box(Proc(GObject::Object, Nil)).unbox(_lib_box).call(instance)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(GObject::SignalGroup, GObject::Object, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_instance : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = GObject::SignalGroup.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          instance = GObject::Object.new(lib_instance, :none)
          ::Box(Proc(GObject::SignalGroup, GObject::Object, Nil)).unbox(_lib_box).call(_sender, instance)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(GObject::SignalGroup, GObject::Object, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_instance : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = GObject::SignalGroup.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          instance = GObject::Object.new(lib_instance, :none)
          ::Box(Proc(GObject::SignalGroup, GObject::Object, Nil)).unbox(_lib_box).call(_sender, instance)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(instance : GObject::Object) : Nil
        LibGObject.g_signal_emit_by_name(@source, "bind", instance)
      end
    end

    def bind_signal
      BindSignal.new(self)
    end

    # This signal is emitted when the target instance of @self is set to a
    # new #GObject.
    #
    # This signal will only be emitted if the previous target of @self is
    # non-%NULL.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(GObject::SignalGroup, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = GObject::SignalGroup.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GObject::SignalGroup, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(GObject::SignalGroup, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = GObject::SignalGroup.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(GObject::SignalGroup, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
