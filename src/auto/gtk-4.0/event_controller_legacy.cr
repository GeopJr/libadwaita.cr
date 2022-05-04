require "./event_controller"

module Gtk
  # `GtkEventControllerLegacy` is an event controller that provides raw
  # access to the event stream.
  #
  # It should only be used as a last resort if none of the other event
  # controllers or gestures do the job.
  @[GObject::GeneratedWrapper]
  class EventControllerLegacy < EventController
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::EventControllerLegacyClass), class_init,
        sizeof(LibGtk::EventControllerLegacy), instance_init, 0)
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

    def initialize(*, name : ::String? = nil, propagation_limit : Gtk::PropagationLimit? = nil, propagation_phase : Gtk::PropagationPhase? = nil, widget : Gtk::Widget? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !propagation_limit.nil?
        (_names.to_unsafe + _n).value = "propagation-limit".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_limit)
        _n += 1
      end
      if !propagation_phase.nil?
        (_names.to_unsafe + _n).value = "propagation-phase".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, propagation_phase)
        _n += 1
      end
      if !widget.nil?
        (_names.to_unsafe + _n).value = "widget".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, widget)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EventControllerLegacy.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_event_controller_legacy_get_type
    end

    # Creates a new legacy event controller.
    def initialize
      # gtk_event_controller_legacy_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_event_controller_legacy_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Emitted for each GDK event delivered to @controller.
    struct EventSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "event::#{@detail}" : "event"
      end

      def connect(&block : Proc(Gdk::Event, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Event, Bool))
        connect(block)
      end

      def connect(handler : Proc(Gdk::Event, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          event = Gdk::Event.new(lib_event, :none)
          ::Box(Proc(Gdk::Event, Bool)).unbox(_lib_box).call(event)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::Event, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          event = Gdk::Event.new(lib_event, :none)
          ::Box(Proc(Gdk::Event, Bool)).unbox(_lib_box).call(event)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::EventControllerLegacy, Gdk::Event, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerLegacy.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          event = Gdk::Event.new(lib_event, :none)
          ::Box(Proc(Gtk::EventControllerLegacy, Gdk::Event, Bool)).unbox(_lib_box).call(_sender, event)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::EventControllerLegacy, Gdk::Event, Bool))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_event : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::EventControllerLegacy.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          event = Gdk::Event.new(lib_event, :none)
          ::Box(Proc(Gtk::EventControllerLegacy, Gdk::Event, Bool)).unbox(_lib_box).call(_sender, event)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(event : Gdk::Event) : Nil
        LibGObject.g_signal_emit_by_name(@source, "event", event)
      end
    end

    def event_signal
      EventSignal.new(self)
    end
  end
end
